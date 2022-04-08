       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTE2.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           77 WRK-VALOR1 PIC 9(06)V99 VALUE ZEROS.
           77 WRK-VALOR2 PIC 9(06)V99 VALUE ZEROS.
           77 WRK-VALOR1-ED PIC $ZZZ.ZZ9,99 VALUE ZEROS.
           77 WRK-VALOR2-ED PIC $ZZZ.ZZ9,99 VALUE ZEROS.
           77 WRK-RESULT PIC S9(07)V99 VALUE ZEROS.
           77 WRK-RESULT-ED PIC $ZZZ.ZZ9,99 VALUE ZEROS.
           77 WRK-RESULTSUB-ED PIC -$ZZ9 VALUES ZEROS.
           77 WRK-OPCAO PIC A(01).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "DIGITE O VALOR1"
            ACCEPT WRK-VALOR1 FROM CONSOLE.
            MOVE WRK-VALOR1 TO WRK-VALOR1-ED.

            DISPLAY "DIGITE O VALOR2"
            ACCEPT WRK-VALOR2 FROM CONSOLE.
            MOVE WRK-VALOR2 TO WRK-VALOR2-ED.

            DISPLAY 'ESCOLHA A OPERACAO'.
            DISPLAY '- PARA SUBTRACAO'
            DISPLAY '+ PARA SOMA'
            DISPLAY '/ PARA DIVISAO'
            DISPLAY '* PARA MULTIPLICACAO'
            DISPLAY 'M PARA MEDIA'
            ACCEPT WRK-OPCAO FROM CONSOLE.


             IF WRK-OPCAO = '+'
               ADD WRK-VALOR1 WRK-VALOR2 TO WRK-RESULT
               MOVE WRK-RESULT TO WRK-RESULT-ED
               DISPLAY ' A SOMA DO VALOR1 E DO VALOR2 E ' WRK-RESULT-ED
             END-IF

             IF WRK-OPCAO = '-'
               SUBTRACT WRK-VALOR2 FROM WRK-VALOR1 GIVING WRK-RESULT
               MOVE WRK-RESULT TO WRK-RESULTSUB-ED
               DISPLAY ' A SUBTRACAO DOS VALORES E ' WRK-RESULTSUB-ED
             END-IF

             IF WRK-OPCAO = '/'
               DIVIDE WRK-VALOR1 BY WRK-VALOR2 GIVING WRK-RESULT
               MOVE WRK-RESULT TO WRK-RESULT-ED
               DISPLAY ' A DIVISAO DOS VALORES E ' WRK-RESULT-ED
             END-IF

             IF WRK-OPCAO = '*'
               MULTIPLY WRK-VALOR1 BY WRK-VALOR2 GIVING WRK-RESULT
               MOVE WRK-RESULT TO WRK-RESULT-ED
               DISPLAY ' A MULTIPLICACAO DOS VALORES E ' WRK-RESULT-ED
             END-IF

             IF WRK-OPCAO = 'M'
               COMPUTE WRK-RESULT = (WRK-VALOR1 + WRK-VALOR2)/2
               MOVE WRK-RESULT TO WRK-RESULT-ED
               DISPLAY ' A MEDIA DOS VALORES E ' WRK-RESULT-ED


             ELSE
                 DISPLAY 'OPCAO INVALIDA'
             END-IF.



            STOP RUN.