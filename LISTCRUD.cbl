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
              'C:/Users/raissa.ribeiro/Desktop/Curso/DADOSR.DAT'
              ORGANISATION IS INDEXED
              ACCESS MODE IS  SEQUENTIAL
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
       77 WS-ST             PIC 99.
         88 ST-OK           VALUE 0.
       77 WS-FIM            PIC X.
         88 FIM-OK          VALUE 'S' FALSE 'N'.
       77 WS-EXIT           PIC X.
         88 WS-EXIT-OK      VALUE 'F' 'f' FALSE 'N'.
       77 WS-CONT           PIC 9(03) VALUE ZEROS.

      * LINKAGE SECTION.
      * 01 LK-COM-AREA.
      *     02 LK-MENSAGEM  PIC X(20).

       PROCEDURE DIVISION.
      * USING LK-COM-AREA.
       MAIN-PROCEDURE.

       0100-INICIO.
           DISPLAY '******** LISTAR DADOSR ***********'
           SET WS-EXIT-OK     TO FALSE.
           PERFORM 0200-LISTAR THRU 0200-LISTAR-FIM.
           PERFORM 0500-FIM.
       0200-LISTAR.
           SET FIM-OK  TO FALSE.
           SET ST-OK   TO TRUE.
           SET WS-CONT TO 0.

           OPEN INPUT DADOS.
             IF ST-OK
           PERFORM UNTIL FIM-OK

                 READ DADOS INTO WS-DADOS
                  AT END
                   SET FIM-OK TO TRUE
                  NOT AT END
                   ADD 1 TO WS-CONT
                   DISPLAY 'REGISTRO ' WS-CONT ': '
                   WS-COD-DADOS '-' WS-NM-DADOS
                  END-READ
           END-PERFORM
           ELSE
                DISPLAY 'ERRO AO MOSTRAR DADOS'
                DISPLAY 'FILE STATUS: ' WS-ST
           END-IF

           CLOSE DADOS.
       0200-LISTAR-FIM.
       0500-FIM.
           STOP RUN.
      *      GOBACK.
