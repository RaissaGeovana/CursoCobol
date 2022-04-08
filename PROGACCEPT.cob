      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGACCEPT.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-DATA     PIC X(13) VALUE ZERO.
       77 WS-CONTAGEM PIC 99 VALUE ZERO.

       01 WS-DATA-ED.
           02 WS-DIA PIC 9(02) VALUE ZEROS.
           02 WS-MES PIC 9(02) VALUE ZEROS.
           02 WS-ANO PIC 9(04) VALUE ZEROS.

       01 WS-TIME.
           02 WS-HORA          PIC 9(02) VALUE ZEROS.
           02 WS-MINUTOS       PIC 9(02) VALUE ZEROS.
           02 WS-SEGUNDOS      PIC 9(02) VALUE ZEROS.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           ACCEPT WS-DATA FROM DATE YYYYMMDD.
           MOVE WS-DATA(01:04) TO WS-ANO
           MOVE WS-DATA(05:02) TO WS-MES
           MOVE WS-DATA(07:02) TO WS-DIA
           DISPLAY 'HOJE E DIA ' WS-DIA ' DO MES ' WS-MES
                            ' DO ANO ' WS-ANO.
           SET WS-MES TO WS-DIA
           DISPLAY 'SET EM ACAO ' WS-MES

           ACCEPT WS-DATA FROM TIME.
           MOVE WS-DATA(01:02) TO WS-HORA
           MOVE WS-DATA(03:02) TO WS-MINUTOS.
           MOVE WS-DATA(06:02) TO WS-SEGUNDOS
           DISPLAY 'AGORA E ' WS-HORA ' HORAS E ' WS-MINUTOS
                      ' MINUTOS E ' WS-SEGUNDOS ' SEGUNDOS.'
           SET WS-HORA TO WS-MINUTOS
           DISPLAY 'SET EM ACAO ' WS-HORA

           ACCEPT WS-DATA FROM DAY-OF-WEEK.

           IF WS-DATA = 1
               DISPLAY 'HOJE E SEGUNDA-FEIRA'
           END-IF
           IF WS-DATA = 2
               DISPLAY 'HOJE E TERCA-FEIRA'
           END-IF
           IF WS-DATA = 3
               DISPLAY 'HOJE E QUARTA-FEIRA'
           END-IF
           IF WS-DATA = 4
               DISPLAY 'HOJE E QUINTA-FEIRA'
           END-IF
           IF WS-DATA = 5
                DISPLAY 'HOJE E SEXTA-FEIRA'
                END-IF
           IF WS-DATA = 6
               DISPLAY 'HOJE E SABADO'
           END-IF
           IF WS-DATA = 7
               DISPLAY 'HOJE E DOMINGO'
           END-IF.

      *     INSPECT WS-MES TALLYING WS-CONTAGEM FOR ALL 3 .
     **  ****   ***BEFORE INITIAL '22' .
           DISPLAY 'TEM ' WS-CONTAGEM ' NUMERO 0 EM MES.'

            STOP RUN.
