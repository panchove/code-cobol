      ******************************************************************
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. utils-clean-screen.
      ******************************************************************
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
        COPY "cpy/env-config".
      *******************************************************************
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       LOCAL-STORAGE SECTION.
      *******************************************************************
      *
       PROCEDURE DIVISION.
        CALL "system" USING "clear".
        EXIT PROGRAM.
       END PROGRAM utils-clean-screen.
