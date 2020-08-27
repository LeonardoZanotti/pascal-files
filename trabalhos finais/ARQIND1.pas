Program TRAB02 ;
//le arquivo texto acesso sequencial SAI.SEQ e gera arquivo formatado (record) de acesso indexado CAND.IND.
uses bibliotn;
var arqa: file of regis; //TIPO REGIS, VER BIBLIOTN
    rega:regis;
    arqb:text;
    regb:string[60];
    a,b,c,E:integer;
    
Begin
  assign(arqa,'CAND.IND');    //LIGA NOME LÓGICO 'ARQA',AO FÍSICO cand.IND
	assign(arqb,'SAI.SEQ');    //LIGA NOME LÓGICO 'ARQB',AO FÍSICO ARQ.SEQ
	reset(arqb);               //ABRE PARA LEITURA ARQ.SEQ E POSICIONA nO INICIO DO ARQUIVO
	rewrite(arqa);             //ABRE PARA GRAVACAO cand.IND E POSICIONA NO INICIO DO ARQUIVO
  REPEAT
		a:=A+1;
		READLN(ARQB,REGB);      //LE REGISTROS DE .SEQ E POSICIONA NO PROXIMO (RETIRA DO ARQ.SEQ E LEVA PARA m.p. em REGB)
		VAL(COPY(REGB,1,4),REGA.NUM,E);   //RETIRA INSCRICAO DE .SEQ E JOGA PARA O CAMPO INS (INTEGER) DE .ind
		                                  //VER APOSTILA PASCALZIM FUNCIONAMENTO FUNCTIN COPY<====
		REGA.NOME:=COPY(REGB,5,35);       //RETIRA NOME DE .SEQ E JOGA PARA O CAMPO NOME DE .ind
		REGA.CPF:=COPY(REGB,40,11);       //IDEM CPF
		insert(COPY(REGB,51,2),rega.data,1);   //RETIRA DIA DE .SEQ E INSERE EM .ind (EX 27------)
		insert(COPY(REGB,53,2),rega.data,1);   //RETIRA MES DE .SEQ E INSERE EM .ind (EX 1027----)
		insert(COPY(REGB,55,4),rega.data,1);   //RETIRA ANO DE .SEQ E INSERE EM .ind (EX 19981027)
		VAL(COPY(REGB,59,2),REGA.CAR,E);  //RETIRA CODIGO DE .SEQ E JOGA PARA O CAMPO COD (INTEGER) DE .ind 
		WRITE(ARQA,REGA);      //GRAVA EM .IND E POSICIONA NO PROXIMO (PEGA DA m.p. REGA E GRAVA NO ARQ.IND)
	UNTIL EOF(ARQB);
	CLOSE(ARQA);
	CLOSE(ARQB);
	WRITELN('LIDOS=',A:5);
	READLN;	 
End. 