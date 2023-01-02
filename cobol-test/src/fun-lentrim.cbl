      ******************************************************************
      *
       IDENTIFICATION DIVISION.
       FUNCTION-ID. fun-lentrim AS "lentrim".
      ******************************************************************
      *
       ENVIRONMENT DIVISION.
      ******************************************************************
      *
       DATA DIVISION.
      *----------------------------------------------------------------- 
       WORKING-STORAGE SECTION.
      *----------------------------------------------------------------- 
       LOCAL-STORAGE SECTION.
      *----------------------------------------------------------------- 
       LINKAGE SECTION.
       77 param-message         PIC X(80).
       77 return-lentrim        PIC 999.
      ******************************************************************
      *
       PROCEDURE DIVISION
            USING       param-message
            RETURNING   return-lentrim.
      *----------------------------------------------------------------- 
            MOVE 
                FUNCTION LENGTH(FUNCTION TRIM(param-message)) 
                TO return-lentrim.
      *---------------------------------------------------------------- 
            EXIT FUNCTION.
       END FUNCTION fun-lentrim.
