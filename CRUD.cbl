      ******************************************************************
      * Author:
      * Date:
      * Purpose:
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
              'C:/Users/raissa.ribeiro/Desktop/Curso/DADOS.TXT'
              ORGANISATION IS SEQUENTIAL
              ACCESS MODE IS  SEQUENTIAL
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
       77 WS-ST             PIC 99.
         88 ST-OK           VALUE 0.
       77 WS-FIM            PIC X.
         88 FIM-OK          VALUE 'S' FALSE 'N'.
       77 WS-EXIT           PIC X.
         88 WS-EXIT-OK      VALUE 'F' 'f' FALSE 'N'.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

       0100-INICIO.
           DISPLAY '******** CADASTRAR DADOS ***********'
           SET WS-EXIT-OK     TO FALSE.
           PERFORM 0200-CADASTRAR THRU 0200-CADASTRAR-FIM
                   UNTIL WS-EXIT-OK.
           PERFORM 0500-FIM.
       0200-CADASTRAR.
           SET FIM-OK  TO FALSE.
           SET ST-OK   TO TRUE.

           DISPLAY 'CADATRE OS DADOS'
           DISPLAY 'Digite um codigo para o dado:'
           ACCEPT WS-COD-DADOS.
           DISPLAY 'Digite o nome para o dado:'
           ACCEPT WS-NM-DADOS.

           OPEN EXTEND DADOS.

           IF WS-ST EQUAL 35 THEN
               OPEN OUTPUT DADOS
           END-IF.

           IF ST-OK THEN
               MOVE WS-COD-DADOS TO COD-DADOS
               MOVE WS-NM-DADOS TO NOM-DADOS
               WRITE RG-DADOS
               DISPLAY 'DADOS CADASTRADO COM SUCESSO.'
           ELSE
               DISPLAY 'ERRO AO CADASTRAR DADOS.'
               DISPLAY 'FILE STATUS: ' WS-ST
           END-IF.
               CLOSE DADOS.

           DISPLAY
           'APERTE QUALQUER TECLA PARA CADASTRAR MAIS DADOS'
           'OU <F> PARA SAIR'.
           ACCEPT WS-EXIT.

       0200-CADASTRAR-FIM.
       0500-FIM.
            STOP RUN.
