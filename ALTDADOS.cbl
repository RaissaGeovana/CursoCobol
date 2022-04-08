      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * TRANSFORMANDO EM SUB-PROGRAMA
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
              SELECT DADOS ASSIGN TO
              'C:/Users/raissa.ribeiro/Desktop/Curso/DADOS.DAT'
              ORGANISATION IS INDEXED
              ACCESS MODE IS  RANDOM
              RECORD KEY IS COD-DADOS
              FILE STATUS IS WS-ST.
       DATA DIVISION.
       FILE SECTION.
       FD DADOS.
       COPY FD_CRUD.
       WORKING-STORAGE SECTION.
       01 WS-DADOS          PIC X(23) VALUE SPACES.
       01 FILLER REDEFINES WS-DADOS.
          02 WS-COD-DADOS   PIC 9(03).
          02 WS-NM-DADOS    PIC X(20).
       77 WS-CONFIRMA       PIC X     VALUE SPACES.
       77 WS-ST             PIC 99.
         88 ST-OK                     VALUE 0.
       77 WS-FIM            PIC X.
         88 FIM-OK                    VALUE 'S' FALSE 'N'.
       77 WS-EXIT           PIC X.
         88 WS-EXIT-OK                VALUE 'F' FALSE 'N'.

       LINKAGE SECTION.
       01 LK-COM-AREA.
           02 LK-MENSAGEM  PIC X(20).

       PROCEDURE DIVISION USING LK-COM-AREA.
       MAIN-PROCEDURE.

       0100-INICIO.
           DISPLAY '******** ALTERAR DADOS ***********'
           SET WS-EXIT-OK     TO FALSE.
           PERFORM 0200-ALTERAR THRU 0200-FIM
                   UNTIL WS-EXIT-OK.
           PERFORM 0500-FIM.
       0200-ALTERAR.
           SET FIM-OK  TO FALSE.
           SET ST-OK   TO TRUE.
           MOVE SPACES TO WS-CONFIRMA.

           OPEN I-O DADOS.

           IF ST-OK THEN
               DISPLAY 'INFORME O CODIGO DO DADO: '
               ACCEPT COD-DADOS

               READ DADOS INTO WS-DADOS
               KEY IS COD-DADOS
               INVALID KEY
                  DISPLAY 'CODIGO PARA DADO NAO EXISTE.'
               NOT INVALID KEY

                  DISPLAY 'NOME ATUAL:   ' WS-NM-DADOS
                  DISPLAY 'INFORME UM NOVO NOME: '
                  ACCEPT NOM-DADOS
                  DISPLAY 'CONFIRMA A ALTERACAO? '
                          ' <S> PARA CONFIRMAR OU <QUALQUER TECLA>'
                          ' PARA MANTER O NOME ATUAL.'
                  ACCEPT WS-CONFIRMA
           IF WS-CONFIRMA = 'S' THEN
                  REWRITE RG-DADOS
                  DISPLAY 'DADO ATUALIZADO COM SUCESSO. '
           ELSE
                  DISPLAY 'DADO NAO ALTERADO'
           END-IF
               END-READ
           ELSE
               DISPLAY 'ERRO AO LOCALIZAR DADOS.'
               DISPLAY 'FILE STATUS: ' WS-ST
           END-IF.
               CLOSE DADOS.

           DISPLAY
           'APERTE QUALQUER TECLA PARA ALTERAR MAIS DADOS '
           ' OU <F> PARA SAIR'.
           ACCEPT WS-EXIT.

       0200-FIM.
       0500-FIM.
            GOBACK.
