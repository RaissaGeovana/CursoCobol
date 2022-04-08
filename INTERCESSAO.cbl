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
              'C:/Users/raissa.ribeiro/Desktop/Curso/DADOS.DAT'
              ORGANISATION IS INDEXED
              ACCESS MODE  IS SEQUENTIAL
              RECORD KEY   IS COD-DADOS
              FILE STATUS  IS WS-ST.

              SELECT DADOS1 ASSIGN TO
              'C:/Users/raissa.ribeiro/Desktop/Curso/DADOS1.DAT'
              ORGANISATION IS INDEXED
              ACCESS MODE  IS SEQUENTIAL
              RECORD KEY   IS COD-DADOS-1
              FILE STATUS  IS WS-ST.

              SELECT DADOSF ASSIGN TO
              'C:/Users/raissa.ribeiro/Desktop/Curso/DADOSF.DAT'
              ORGANISATION IS INDEXED
              ACCESS MODE  IS RANDOM
              RECORD KEY   IS COD-DADOS-F
              FILE STATUS  IS WS-ST.

       DATA DIVISION.
       FILE SECTION.
       FD DADOS.
        COPY FD_CRUD.

       FD DADOS1.
       01 RG-DADOS-1.
          02 COD-DADOS-1    PIC 999.
          02 NOM-DADOS-1    PIC X(20).

       FD DADOSF.
       01 RG-DADOS-F.
          02 COD-DADOS-F    PIC 999.
          02 NOM-DADOS-F    PIC X(20).

       WORKING-STORAGE SECTION.

       77 WS-ST             PIC 99.
         88 ST-OK           VALUE 0.
       77 WS-FIM            PIC X.
         88 FIM-OK          VALUE 'S' FALSE 'N'.
       77 WS-FIM-1            PIC X.
         88 FIM-OK-1          VALUE 'S' FALSE 'N'.
       77 WS-EXIT           PIC X.
         88 WS-EXIT-OK      VALUE 'F' 'f' FALSE 'N'.
       01 WS-CONTADORES.
          02 WS-CONTADOR-1  PIC 99.
          02 WS-CONTADOR-2  PIC 99.
          02 WS-CONTADOR-3  PIC 99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           PERFORM P0100-INICIO   THRU P0100-FIM.
           PERFORM P0200-PROCESSA THRU P0200-PROCESSA-FIM
           PERFORM P0500-FINALIZA THRU P0500-FIM.

       P0100-INICIO.

           INITIALISE  WS-CONTADORES.
      ***********ARQUIVO DE DADOS **************
           OPEN INPUT DADOS.

           IF WS-ST NOT EQUAL ZEROS
               DISPLAY 'ERRO AO ABRIR O ARQUIVO DE DADOS.'
               DISPLAY 'FILE STATUS: ' WS-ST
               PERFORM P0500-FINALIZA THRU P0500-FIM
           END-IF.

      ***********ARQUIVO DE DADOS1 **************
           OPEN INPUT DADOS1.

           IF WS-ST NOT EQUAL ZEROS
               DISPLAY 'ERRO AO ABRIR O ARQUIVO DE DADOS1.'
               DISPLAY 'FILE STATUS: ' WS-ST
               PERFORM P0500-FINALIZA THRU P0500-FIM
           END-IF.

      ***********ARQUIVO DE DADOSF **************
           OPEN OUTPUT DADOSF.

           IF WS-ST NOT EQUAL ZEROS
               DISPLAY 'ERRO AO ABRIR O ARQUIVO DE DADOSF.'
               DISPLAY 'FILE STATUS: ' WS-ST
               PERFORM P0500-FINALIZA THRU P0500-FIM
           END-IF.

       P0100-FIM.

       P0200-PROCESSA.

           INITIALISE RG-DADOS-F REPLACING ALPHANUMERIC BY SPACES
                                           NUMERIC      BY ZEROES.

           PERFORM P0201-LER-DADOS   THRU P0201-FIM.
           PERFORM P0202-LER-DADOS1  THRU P0202-FIM.

           SET FIM-OK FIM-OK-1      TO FALSE.

           PERFORM UNTIL FIM-OK AND FIM-OK-1
            EVALUATE TRUE
              WHEN COD-DADOS < COD-DADOS-1
                   PERFORM P0201-LER-DADOS    THRU P0201-FIM
              WHEN COD-DADOS = COD-DADOS-1
                   MOVE RG-DADOS-1 TO RG-DADOS-F
                   PERFORM P0203-GRAVA-DADOSF THRU P0203-FIM
                   PERFORM P0201-LER-DADOS    THRU P0201-FIM
                   PERFORM P0202-LER-DADOS1   THRU P0202-FIM
              WHEN COD-DADOS > COD-DADOS-1
                   PERFORM P0202-LER-DADOS1   THRU P0202-FIM
            END-EVALUATE
           END-PERFORM.

       P0200-PROCESSA-FIM.
       P0201-LER-DADOS.
           SET ST-OK             TO TRUE.

           READ DADOS
                AT END
                  SET FIM-OK       TO TRUE
                  MOVE 99          TO COD-DADOS
                NOT AT END
                  IF ST-OK
                      ADD 1        TO WS-CONTADOR-1
                  ELSE
                      DISPLAY 'ERRO AO LER ARQUIVO DE DADOS'
                      DISPLAY 'FLIE STATUS: 'WS-ST
                  END-IF
           END-READ.
       P0201-FIM.

       P0202-LER-DADOS1.
           SET ST-OK             TO TRUE.

           READ DADOS1
                AT END
                  SET FIM-OK-1       TO TRUE
                  MOVE 99          TO COD-DADOS-1
                NOT AT END
                  IF ST-OK
                      ADD 1        TO WS-CONTADOR-2
                  ELSE
                      DISPLAY 'ERRO AO LER ARQUIVO DE DADOS1'
                      DISPLAY 'FLIE STATUS: 'WS-ST
                  END-IF
           END-READ.
       P0202-FIM.

       P0203-GRAVA-DADOSF.
           SET ST-OK             TO TRUE.

           WRITE RG-DADOS-F
                 INVALID KEY
                    DISPLAY 'REGISTRO JA EXISTE NO BALANCELINE'
                 NOT INVALID KEY
                    ADD 1        TO WS-CONTADOR-3
           END-WRITE.

       P0203-FIM.
       P0500-FINALIZA.
           CLOSE DADOS DADOS1 DADOSF.
           DISPLAY '                INTERCESAO                         '
           DISPLAY '***************************************************'
           DISPLAY 'QUANTIDADE DE DADOS NO ARQUIVO DADOS ' WS-CONTADOR-1
           DISPLAY '***************************************************'
           DISPLAY 'QUANTIDADE DE DADOS NO ARQUIVO DADOS1 'WS-CONTADOR-2
           DISPLAY '***************************************************'
           DISPLAY 'QUANTIDADE DE DADOS NO ARQUIVO DADOSF 'WS-CONTADOR-3
           DISPLAY '***************************************************'
           STOP RUN.
       P0500-FIM.
.
