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
       77 WS-NOMECOMPLETO      PIC X(30) VALUE SPACES.
       01 WS-NOME.
           02 PRIMEIRO-NOME    PIC X(10) VALUE SPACES.
           02 SEGUNDO-NOME     PIC X(10) VALUE SPACES.
           02 TERCEIRO-NOME    PIC X(10) VALUE SPACES.
       01 WS-CONTADOR.
           02 CONT1            PIC 9(02) VALUE ZEROS.
           02 CONT2            PIC 9(02) VALUE ZEROS.
           02 CONT3            PIC 9(02) VALUE ZEROS.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           INITIALISE WS-NOMECOMPLETO WS-NOME.

            MOVE 'RAISSA GEOVANA PEREIRA' TO WS-NOMECOMPLETO.

            UNSTRING WS-NOMECOMPLETO
                DELIMITED BY SPACE INTO PRIMEIRO-NOME COUNT IN CONT1
                SEGUNDO-NOME  COUNT IN CONT2
                TERCEIRO-NOME COUNT IN CONT3
            END-UNSTRING.

                DISPLAY 'PRIMEIRO NOME:' PRIMEIRO-NOME "TEM "
                CONT1 ' CARACTERES'
                DISPLAY 'SEGUNDO NOME: ' SEGUNDO-NOME " TEM "
                CONT2 ' CARACTERES'
                DISPLAY 'TERCEIRO NOME:' TERCEIRO-NOME "TEM "
                CONT3 ' CARACTERES'

                DISPLAY 'O TAMANHO MAXIMO DO NOME E: '
                LENGTH OF WS-NOMECOMPLETO ' CARACTERES'.

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
