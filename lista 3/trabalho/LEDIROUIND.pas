Program LEDIOUIND ;
{FUP QUE LEIA E MOSTRE O CONTEUDO DO ARQUIVO SAI.DIR OU SAI.IND}
TYPE DAT=RECORD
     AA:STRING[4];
     MM:STRING[2];
     DD:STRING[2];
     END;
TYPE REG=RECORD
     NUM:INTEGER;
     NOME:STRING[35];
     CPF:STRING[11];
     DATA:DAT;
     CAR:INTEGER;
     END;
VAR ARQD:FILE OF REG;
    REGD:REG;
    A,B,E,NUM:INTEGER;
    narq:string[30];
Begin
  write('entre com o nome do arquivo que deseja listar=>');
  readln(narq);
  ASSIGN(ARQD,narq);
  RESET(ARQD);
  WHILE NOT EOF(ARQD) DO
   BEGIN
    READ(ARQD,REGD);//RETIRA DO ARQ E LEVA PARA MP AS INFORMA�OES DE UM REGISTRO
//MONTA O REGISTRO QUE IR� PARA ARQD
    A:=A+1;
		WRITELN(A:5,' ',REGD.NUM:5,' ',REGD.NOME,' ',COPY(REGD.CPF,1,3),'.',COPY(REGD.CPF,4,3),'.',COPY(REGD.CPF,7,3),'-',
		        COPY(REGD.CPF,10,2),' ',REGD.DATA.DD,'/',REGD.DATA.MM,'/',REGD.DATA.AA,' ',REGD.CAR:4);
		IF(A MOD 20 = 0)THEN
		 BEGIN
		  WRITELN('ENTER PARA CONTINUAR OU CTRL C PARA INTERROMPER');
		  READLN;
		 END;
	 END;
	 WRITELN('GRAVADOS=>',A:5,' REGISTROS--VEJA O TAMANHO DO ARQUIVO  -',NARQ,'- (ENTER PARA ENCERRAR)');
	 READLN;
	 CLOSE(ARQD);  
End.