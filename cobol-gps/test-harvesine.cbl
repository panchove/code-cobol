      ******************************************************************
      * Calculate the distance between two points on Earth using 
      * the Harvesine formula
      *
      * Autor:
      * Francisco Prado
      * fpradove@gmail.com
      *
      * Compiler:
      * (GnuCOBOL) 3.2-preview.0 under C
      * (Debian 10.2.1-6) 10.2.1 20210110
      * 
      * Compiler and Run using
      * cobc -std=mf -x test-harvesine.cbl version MicroFocus
      * cobc -std=rm -x test-harvesine.cbl version Ryan McFarland
      * ./test-harvesine

      * Source Code Original:
      * https://community.esri.com/t5/coordinate-reference-systems-blog/
      * distance-on-a-sphere-the-haversine-formula/ba-p/902128
      * 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. test-harvesine.
      *-----------------------------------------------------------------  
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
        FUNCTION ALL INTRINSIC
        FUNCTION deg2rad
        FUNCTION harvesine.
      *-----------------------------------------------------------------  
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 coord-a.
        05 laty             COMP-2    VALUE ZERO.
        05 lonx             COMP-2    VALUE ZERO.
       01 coord-b.
        05 laty             COMP-2    VALUE ZERO.
        05 lonx             COMP-2    VALUE ZERO.
       01 distance.
        05 meters           COMP-2    VALUE ZERO. 
        05 kms              COMP-2    VALUE ZERO. 
      *-----------------------------------------------------------------
       PROCEDURE DIVISION.
       A0100-MAIN SECTION.
      *-----------------------------------------------------------------
      * GEO Sao Paulo
            MOVE -23.550519 TO laty OF coord-a.
            MOVE -46.633309 TO lonx OF coord-a.
      *-----------------------------------------------------------------
      * GEO New York
            MOVE 40.7127837 TO laty OF coord-b.
            MOVE -74.005941 TO lonx OF coord-b.
      *-----------------------------------------------------------------
      * CALC Distance
            MOVE FUNCTION harvesine(coord-a, coord-b) TO distance.
      *-----------------------------------------------------------------
      * RESULT
            DISPLAY "Distance from Sao Paulo to New York City.".
            DISPLAY "-----------------------------------------"
            DISPLAY "Distance Meters = " meters OF distance.
            DISPLAY "   Distance Kms = " kms OF distance.
            STOP RUN.
       END PROGRAM test-harvesine.
      *-----------------------------------------------------------------
      * SUB-ROUTINE
      *-----------------------------------------------------------------  
       IDENTIFICATION DIVISION.
       FUNCTION-ID. fun-harvesine AS "harvesine".
      *-----------------------------------------------------------------  
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
            FUNCTION ALL INTRINSIC
            FUNCTION deg2rad.
      *-----------------------------------------------------------------  
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       77 a                 COMP-2    VALUE ZERO.
       77 c                 COMP-2    VALUE ZERO.
       77 phi-1             COMP-2    VALUE ZERO.
       77 phi-2             COMP-2    VALUE ZERO.
       77 delta-phi         COMP-2    VALUE ZERO.
       77 delta-lambda      COMP-2    VALUE ZERO.
      *-----------------------------------------------------------------
      * to facilitate the calculations 
       77 lat1              COMP-2    VALUE ZERO.
       77 lon1              COMP-2    VALUE ZERO.
       77 lat2              COMP-2    VALUE ZERO.
       77 lon2              COMP-2    VALUE ZERO.
      *-----------------------------------------------------------------
      * radius of the earth in meters 
       77 r-earth           COMP-2    VALUE 6371000.
       77 m                 COMP-2    VALUE ZERO.
       77 k                 COMP-2    VALUE ZERO.
       77 delta-lat         COMP-2    VALUE ZERO.
       77 delta-lon         COMP-2    VALUE ZERO.
      *-----------------------------------------------------------------
       LINKAGE SECTION.
       01 coord-a.
        05 laty             COMP-2    VALUE ZERO.
        05 lonx             COMP-2    VALUE ZERO.
       01 coord-b.
        05 laty             COMP-2    VALUE ZERO.
        05 lonx             COMP-2    VALUE ZERO.
      *-----------------------------------------------------------------  
       01 return-distance.
        05 meters           COMP-2    VALUE ZERO. 
        05 kms              COMP-2    VALUE ZERO. 
      *-----------------------------------------------------------------  
       PROCEDURE DIVISION
            USING coord-a, coord-b
            RETURNING return-distance.
      *-----------------------------------------------------------------
      * CALC
            MOVE laty OF coord-a TO lat1.
            MOVE lonx OF coord-a TO lon1.
            MOVE laty OF coord-b TO lat2.
            MOVE lonx OF coord-b TO lon2.
            
            COMPUTE delta-lat = lat2 - lat1.
            COMPUTE delta-lon = lon2 - lon1.

            COMPUTE phi-1 = deg2rad(lat1).
            COMPUTE phi-2 = FUNCTION deg2rad(lat2).
            COMPUTE delta-phi = FUNCTION deg2rad(delta-lat).
            COMPUTE delta-lambda = FUNCTION deg2rad(delta-lon).
            COMPUTE a = (FUNCTION SIN(delta-phi / 2.0) ** 2) 
                    + (FUNCTION SIN(delta-lambda / 2.0) ** 2)   
                    * FUNCTION COS(phi-1) 
                    * FUNCTION COS(phi-2).
            COMPUTE c = 2 * FUNCTION ASIN(FUNCTION SQRT(a)).
      * output distance in meter
            COMPUTE m = r-earth * c.
      * output distance in kilometers 
            COMPUTE k = m / 1000.
      * return result
            MOVE m TO meters OF return-distance.
            MOVE k TO kms OF return-distance.         
            EXIT .
       END FUNCTION fun-harvesine.
      *-----------------------------------------------------------------
      * SUB-ROUTINE
      *-----------------------------------------------------------------  
       IDENTIFICATION DIVISION.
       FUNCTION-ID. fun-deg2rad AS "deg2rad".
      *-----------------------------------------------------------------  
       ENVIRONMENT DIVISION.
      *-----------------------------------------------------------------  
       DATA DIVISION.
       LINKAGE SECTION.
       01 value-degree     COMP-2  VALUE ZERO.
       01 return-radian    COMP-2  VALUE ZERO.
      *-----------------------------------------------------------------  
       PROCEDURE DIVISION
            USING value-degree
            RETURNING return-radian.
            COMPUTE return-radian = value-degree * FUNCTION PI()/180.
            EXIT FUNCTION.
       END FUNCTION fun-deg2rad.
       