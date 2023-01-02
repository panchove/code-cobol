      ******************************************************************
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. teclado.
      ******************************************************************
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
        COPY "cpy/env-config".
      ******************************************************************
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY screenio.
       77 total                 PIC 9(5)V99.
       LOCAL-STORAGE SECTION.
       77 SYS-COLOR-BLACK       PIC 99 VALUE 00.
       77 SYS-COLOR-BLUE        PIC 99 VALUE 01.
       77 SYS-COLOR-GREEN       PIC 99 VALUE 02.
       77 SYS-COLOR-CYAN        PIC 99 VALUE 03.
       77 SYS-COLOR-RED         PIC 99 VALUE 04.
       77 SYS-COLOR-MAGENTA     PIC 99 VALUE 05.
       77 SYS-COLOR-YELLOW      PIC 99 VALUE 06.
       77 SYS-COLOR-WHITE       PIC 99 VALUE 07.
      ******************************************************************
      *
       PROCEDURE DIVISION.
      * CALL "utils-clean-screen".
        DISPLAY " " WITH ERASE SCREEN.
        DISPLAY "Hola mundo..." AT LINE 01 COL 10 WITH HIGHLIGHT.
        DISPLAY "Hola mundo..." AT LINE 02 COL 12 WITH LOWLIGHT.
        DISPLAY "Hola mundo..." AT LINE 03 COL 14 WITH OVERLINE.
        DISPLAY "Hola mundo..." AT LINE 04 COL 16 WITH UNDERLINE.
        DISPLAY "Hola mundo..." AT LINE 05 COL 18 WITH REVERSE-VIDEO.
        DISPLAY "Hola mundo..." AT LINE 06 COL 20 
            WITH
                FOREGROUND-COLOR COB-COLOR-YELLOW
                BACKGROUND-COLOR COB-COLOR-BLUE.
        MOVE 0 TO total.
        COMPUTE total = 9999999999 
            ON SIZE ERROR
                DISPLAY "Se produjo un error en el calculo xx"
                AT LINE 24 COL 01
                WITH 
                    REVERSE-VIDEO.
        STOP RUN.
       END PROGRAM teclado.
