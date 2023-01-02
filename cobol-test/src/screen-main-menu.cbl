      ******************************************************************
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. screen-main-menu.
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
       COPY screenio.
      *-----------------------------------------------------------------
       LINKAGE SECTION.
       77 color-fore PIC 9 VALUE 0.
       77 color-back PIC 9 VALUE 0.
       SCREEN SECTION.
        01 main-menu
            BLANK SCREEN.
            05 LINE 01 COL 01 VALUE " *** MENU PRINCIPAL *** "
                FOREGROUND-COLOR color-fore
                BACKGROUND-COLOR color-back.
            05 LINE 03 COL 01 VALUE " 1.- Archivos           ".
            05 LINE 04 COL 01 VALUE " 2.- Gestion            ".
            05 LINE 05 COL 01 VALUE " 3.- Consultar          ".
            05 LINE 06 COL 01 VALUE " 4.- Mantenimiento      ".
            05 LINE 07 COL 01 VALUE " 5.- Salir              ".
            05 LINE 13 COL 01 VALUE " Seleccione su opcion:".
      ******************************************************************
      *
       PROCEDURE DIVISION
            USING 
                color-fore,
                color-back.
      *-----------------------------------------------------------------
            CALL "cls".
            DISPLAY main-menu.
            EXIT PROGRAM.
       END PROGRAM screen-main-menu.
