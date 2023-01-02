      ******************************************************************
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. saludar IS INITIAL.
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
       COPY screenio.
      ******************************************************************
      *
       PROCEDURE DIVISION.
            CALL "screen-main-menu"
                USING 
                    cob-color-white, 
                    cob-color-green.
            ACCEPT OMITTED.
            STOP RUN.
       END PROGRAM saludar.
       