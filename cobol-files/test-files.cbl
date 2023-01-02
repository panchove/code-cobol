      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. test-files.
      ****************************************************************** 
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
        SPECIAL-NAMES.
            CONSOLE IS CRT.
            CRT STATUS IS crt-status.
            CURSOR IS pos-cursor.
            DECIMAL-POINT IS COMMA.
            LOCALE spanish IS "es_VE".
        REPOSITORY.
            FUNCTION ALL INTRINSIC.
       INPUT-OUTPUT SECTION. 
      ****************************************************************** 
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
        77 pos-cursor       PIC 9(6).
        77 crt-status       PIC 9999    VALUE ZEROS.
      ****************************************************************** 
       PROCEDURE DIVISION.
            DISPLAY "HoLa Mundo!!!"
            DISPLAY crt-status.
            EXIT PROGRAM.
       END PROGRAM test-files.
