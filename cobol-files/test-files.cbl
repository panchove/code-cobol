      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. test-files.
      ****************************************************************** 
       ENVIRONMENT DIVISION.
      *----------------------------------------------------------------- 
       CONFIGURATION SECTION.
        SPECIAL-NAMES.
            DECIMAL-POINT IS COMMA.
            LOCALE spanish IS "es_VE".
        REPOSITORY.
            FUNCTION ALL INTRINSIC.
      *----------------------------------------------------------------- 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT file-names-female
                ASSIGN TO "data/res_names_female.txt"
                ORGANIZATION IS LINE SEQUENTIAL.

            SELECT file-names-male
                ASSIGN TO "data/res_names_male.txt"
                ORGANIZATION IS LINE SEQUENTIAL.
      ****************************************************************** 
       DATA DIVISION.
      *----------------------------------------------------------------- 
       FILE SECTION.
       FD file-names-female.
        01 rec-name-female.
            05 name             PIC X(50).
        88 EOF-names-female     VALUE HIGH-VALUES.

       FD file-names-male.
        01 rec-name-male.
            05 name             PIC X(50).
        88 EOF-names-male       VALUE HIGH-VALUES.
      *----------------------------------------------------------------- 
       LOCAL-STORAGE SECTION.
      ****************************************************************** 
       PROCEDURE DIVISION.
      *----------------------------------------------------------------- 
       A00100-MAIN.
            PERFORM A00800-OPEN.
            DISPLAY "Read Females" AT 0101.
            PERFORM A00500-LIST-NAMES-FEMALES.
            DISPLAY "Read Males" AT 0201.
            PERFORM A00500-LIST-NAMES-MALES.

            PERFORM A00850-CLOSE.
            PERFORM A00999-EXIT.
      *----------------------------------------------------------------- 
       A00500-LIST-NAMES-FEMALES.
            READ file-names-female
                AT END SET EOF-names-female TO TRUE.
            PERFORM UNTIL EOF-names-female
                DISPLAY rec-name-female UPON STDOUT
                READ file-names-female
                    AT END SET EOF-names-female TO TRUE
            END-PERFORM.
            EXIT.
      *----------------------------------------------------------------- 
       A00500-LIST-NAMES-MALES.
            READ file-names-male
                AT END SET EOF-names-male TO TRUE.
            PERFORM UNTIL EOF-names-male
                DISPLAY rec-name-male UPON STDOUT
                READ file-names-male
                    AT END SET EOF-names-male TO TRUE
            END-PERFORM.
            EXIT.
      *----------------------------------------------------------------- 
       A00800-OPEN.
            DISPLAY "Abriendo archivos..." AT 0201.
            OPEN INPUT file-names-female.
            OPEN INPUT file-names-male.
            EXIT.
      *----------------------------------------------------------------- 
       A00850-CLOSE.
            DISPLAY "Cerrando archivos..." AT 0201.
            CLOSE file-names-female.
            CLOSE file-names-male.
            EXIT.
      *----------------------------------------------------------------- 
       A00999-EXIT.
            STOP RUN.
       END PROGRAM test-files.
