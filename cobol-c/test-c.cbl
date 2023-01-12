      ******************************************************************
      * CALL FUNCTIONS IN C
       IDENTIFICATION DIVISION.
       PROGRAM-ID. test-c.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
        77 str-message PIC X(30) VALUE SPACES.
        77 ptr-message POINTER VALUE NULL.
       PROCEDURE DIVISION.
       MOVE "Hola mundo!" TO str-message.
        *> guardamos la direccion de str-message en ptr-message.
        SET ptr-message TO ADDRESS str-message.
        *> pasamos el puntero a la rutina
        DISPLAY "Antes de llamada -> " ptr-message
        CALL "c_display_ptr" USING BY VALUE ptr-message.
        DISPLAY "Retorna -> " str-message.
       END PROGRAM test-c.

