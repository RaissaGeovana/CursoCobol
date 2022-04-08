      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-VARIAVEIS.
           02 WS-NUMERO1       PIC 99 VALUES ZEROS.
           02 WS-NUMERO2       PIC 99 VALUES ZEROS.
           02 WS-NUMERO3       PIC 99 VALUES ZEROS.
           02 WS-MULTIPLY      PIC 99 VALUES ZEROS.
           02 WS-RESULT        PIC Z99 VALUES ZEROS.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

       100-INICIO.
           PERFORM 200-LOOP  THRU 200-LOOP-FIM 10 TIMES.
           PERFORM 300-LOOP2 THRU 300-LOOP2-FIM WITH TEST BEFORE UNTIL
           WS-NUMERO2 = 4.
           PERFORM 400-LOOP3 THRU 400-LOOP3-FIM.
           PERFORM 500-FIM.

       200-LOOP.
           MOVE 8 TO WS-NUMERO1
           ADD 1  TO WS-MULTIPLY
           COMPUTE WS-RESULT = WS-NUMERO1 * WS-MULTIPLY.
           DISPLAY WS-NUMERO1 ' X ' WS-MULTIPLY ' = ' WS-RESULT.
       200-LOOP-FIM.

       300-LOOP2.
           ADD 1  TO WS-NUMERO2.
           DISPLAY 'NUMERO 2 = ' WS-NUMERO2.
       300-LOOP2-FIM.

       400-LOOP3.
           PERFORM VARYING WS-NUMERO3 FROM 2 BY 2 UNTIL WS-NUMERO3 = 10
                DISPLAY 'NUMERO 3 = ' WS-NUMERO3
           END-PERFORM.
       400-LOOP3-FIM.

       500-FIM.
            STOP RUN.
