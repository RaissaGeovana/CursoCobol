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
       01 WS-COM-AREA.
           03 WS-MENSAGEM              PIC X(20).
       77 WS-OPCAO                     PIC X.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           MOVE SPACES                 TO WS-OPCAO.
           DISPLAY 'SELECIONE UMA OPCAO:'
           DISPLAY '01_CADASTRAR DADOS.'
           DISPLAY '02_ALTERAR DADOS.'
           DISPLAY '03_DELETAR DADOS.'
           DISPLAY '04_CONSULTAR DADOS.'
           DISPLAY '05_LISTAR DADOS.'
           ACCEPT WS-OPCAO.

           EVALUATE WS-OPCAO
            WHEN '1'
              CALL 'C:\Users\raissa.ribeiro\Desktop\Curso\teste'
               USING WS-COM-AREA

            WHEN '2'
              CALL 'C:\Users\raissa.ribeiro\Desktop\Curso\bin\ALTDADOS'
               USING WS-COM-AREA

            WHEN '3'
              CALL 'C:/Users/raissa.ribeiro/Desktop/Curso/DELDADOS'
                USING WS-COM-AREA

            WHEN '4'
              CALL 'C:/Users/raissa.ribeiro/Desktop/Curso/CONSCRUD'
               USING WS-COM-AREA

            WHEN '5'
              CALL 'C:/Users/raissa.ribeiro/Desktop/Curso/LISTCRUD'
               USING WS-COM-AREA

            WHEN OTHER
              DISPLAY'OPCAO INVALIDA.'
           END-EVALUATE.

            STOP RUN.
