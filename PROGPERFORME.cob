      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGPERFORME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-NOME PIC X(20) VALUE SPACES.
       77 WS-RESPOSTA PIC X(20) VALUE SPACES.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           PERFORM PTESTE THRU PTESTE-FIM.
           PERFORM PTESTE2 THRU PTESTE2-FIM.
           PERFORM PTESTEE THRU PTESTEE-FIM.

       PTESTE2.

           DISPLAY 'E UMA TESTE SIMPLES, GOSTOU? '.
           ACCEPT WS-RESPOSTA FROM CONSOLE.
           DISPLAY 'OBRIGADO POR PARTICIPAR.'.

       PTESTE2-FIM.

       PTESTE.

           DISPLAY 'QUAL E O SEU NOME?'.
           ACCEPT WS-NOME FROM CONSOLE.
           DISPLAY 'OLA ' WS-NOME 'BEM-VINDO AO MEU TESTE.'.

       PTESTE-FIM.

       PTESTEE.

            STOP RUN.

       PTESTEE-FIM.
