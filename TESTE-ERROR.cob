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
       77 WS-NUMERO1      PIC 9(02) VALUE ZEROS.
       77 WS-NUMERO2      PIC 9(02) VALUE ZEROS.
       77 WS-RESULT       PIC 9(02) VALUE ZEROS.
       77 WS-ERRO         PIC A(30) VALUE SPACE.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM P200.
           PERFORM P300.

       P200.
           DISPLAY "DIGITE O PRIMEIRO NUMERO:"
           ACCEPT WS-NUMERO1.

           DISPLAY "DIGITE O SEGUNDO NUMERO:"
           ACCEPT WS-NUMERO2.

           COMPUTE WS-RESULT = WS-NUMERO1 * WS-NUMERO2
                  ON SIZE ERROR PERFORM P100.

           DISPLAY 'O RESULTADO E: ' WS-RESULT.

       P100.
           MOVE 'ERRO DE PROCESSAMENTO ' TO WS-ERRO.
           DISPLAY WS-ERRO.

       P300.
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
