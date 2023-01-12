      ******************************************************************
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. test-pointers.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
        77 var-num   PIC 999 VALUE 100.
        77 ptr-var   POINTER VALUE NULL.
       PROCEDURE DIVISION.
       A0100-MAIN.
        DISPLAY "Value var-num = " var-num.
        DISPLAY "Value Pointer = " ptr-var.
        SET ptr-var TO ADDRESS var-num.
        DISPLAY "Value Pointer to var-num = " ptr-var.
        STOP RUN.
       END PROGRAM test-pointers.
