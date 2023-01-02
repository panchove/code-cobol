      ******************************************************************
      *
       IDENTIFICATION DIVISION.
       FUNCTION-ID. fun-centerpos AS "centerpos".
      ******************************************************************
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       COPY env-special-names.
       COPY env-repository.
      ******************************************************************
      *
       DATA DIVISION.
      *----------------------------------------------------------------- 
       WORKING-STORAGE SECTION.
      *----------------------------------------------------------------- 
       LOCAL-STORAGE SECTION.
       77 screen-center         PIC 999 VALUE ZEROS.
       77 screen-width          PIC 999 VALUE ZEROS.
      *----------------------------------------------------------------- 
       LINKAGE SECTION.
       77 param-width           PIC 99 VALUE ZEROS.
       77 param-message         PIC X(80).
       77 return-centerpos      PIC 999 VALUE ZEROS.
      ******************************************************************
      *
       PROCEDURE DIVISION
            USING       param-width, param-message
            RETURNING   return-centerpos.
      *----------------------------------------------------------------- 
            MOVE param-width TO screen-width.
            COMPUTE screen-center ROUNDED = screen-width / 2.
            COMPUTE return-centerpos = screen-center -
                (FUNCTION LENTRIM(param-message)/2).
            EXIT FUNCTION.
       END FUNCTION fun-centerpos.
       