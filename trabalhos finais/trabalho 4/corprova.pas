Program N2PROFE02 ;
//LUIZ ANTONIO PASSOS CARDOSO
//este programa le soh 50 provas
USES BIBLIOTN;
const ini :array[1..6] of integer = ( 1,21,41, 1,26,51);//questao onde começam as disciplinas
      fim :array[1..6] of integer = (20,40,60,25,50,60);//questão onde terminam as disciplinas
			totqd :array[1..6] of integer =(20,20,20,25,25,10);//total de questoes por disciplina
			ARQNOM:ARRAY[1..2] OF STRING[15] =('PROVA1.TXT','PROVA2.TXT');
VAR GABA : STRING[60];
    resp:string[64];
		NOTA,CONT,CE,ER,SR,A,TOT,opc,x,e,disc:INTEGER;
    MED:REAL;
    SOMA:ARRAY[1..6] OF INTEGER;
    arq:text;
    reg:string[64];
Begin
  repeat
   leia1('QUAL PROVA, 1 OU 2',OPC);
  until(opc>=1) and (opc<=2);
//MONTAR VETOR NUM+PF
//ORDENAR
//TOT:=T;
// LE E VALIDA O GABARITO
 REPEAT
  WRITEln('DIGITE O GABARITO DA PROVA',OPC:3);
  writeln('000000000111111111122222222223333333333344444444445555555550');
  writeln('123456789012345678901234567890123456789012345678901234567890');
  READLN(GABA);
  gaba:=upcase(gaba);
  TOT:=LENGTH(GABA);
  A:=0 ;
  REPEAT
   A:=A+1;
  UNTIL(GABA[A]<'A') OR (GABA[A]>'E') OR (A=60) ;
  IF(A<60) OR (TOT <60) THEN
   WRITELN('ILEGAL');                                               //        m.p.
 UNTIL(A=60) AND (TOT=60);
//fim da validação do gabarito
 assign(arq,ARQNOM[OPC]);                         //  reg=0001AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
 reset(arq);
 WRITE('ENTER PARA CONTINUAR');
 READLN;
 CLRSCR;
//CABECALHO
 IF(OPC=1)THEN
  BEGIN
   WRITELN('NUM.  DISCILINA1        DISCIPLINA2       DISCIPLINA3');
   WRITELN('INSC  CER ERR SRE NOTA  CER ERR SRE NOTA  CER ERR SRE NOTA');
  END
 ELSE
  BEGIN
   WRITELN('NUM.  DISCILINA4        DISCIPLINA5       DISCIPLINA6');
   WRITELN('INSC  CER ERR SRE NOTA  CER ERR SRE NOTA  CER ERR SRE NOTA');
  END; 
for x:=1 to 50 do //vai ler só 50 registros de prova1.txt
 begin
  cont:=cont+1;
  readln(arq,reg);
//PBIN ACHAR O NUM NO VETOR
//SEEK(ARQ2,VET[????].PF)<<<<POSICIONAR
//LE REG TIPO REGIS (reg1)
  write(copy(reg,1,4));       //   0001 ja mostrar o reg1.nome
//INICIO CORRECAO
  disc:=0;
  if(OPC=2)then
   disc:=3;
  for e:=1+disc to 3+disc do //corrigir por disciplina (3)
	 begin
	  CE:=0;
    ER:=0;
    SR:=0;
	  for a:= ini[e] to fim[e] do
	   begin
	    if(gaba[a]=reg[a+4]) then
		   ce:=ce+1
		  else
		   if(reg[a+4]=' ')then
		    sr:=sr+1
		   else
		    er:=er+1;
	  end;
//fim da correcao
    nota:=ce*(100 div totqd[e]);   //5, 5, 5, 4, 4, 10
	  soma[E]:=soma[E]+nota;
//atualiza o campo de nota correspondente reg1.notas[e]:=nota
    write(ce:5,er:4,sr:4,nota:5);
   end;
//ver se é segunda prova, se sim atualizar o campo reg1.soma... reg1.soma:=reg1.soma+reg1.notas[indice]
//GRAVA O REG1 ATUALIZADO EM CAND.IND
//  SEEK(ARQ2,VET[????].PF  E EPOIS SIM, WRITE(ARQ2,REG1
    writeln;
  	if(cont mod 20 = 0 )then
	 begin
	   write('enter para continuar');
	   readln;
	   clrscr;
    IF(OPC=1)THEN
     BEGIN
      WRITELN('NUM.  DISCILINA1        DISCIPLINA2       DISCIPLINA3');
      WRITELN('INSC  CER ERR SRE NOTA  CER ERR SRE NOTA  CER ERR SRE NOTA');
     END
    ELSE
     BEGIN
      WRITELN('NUM.  DISCILINA4        DISCIPLINA5       DISCIPLINA6');
      WRITELN('INSC  CER ERR SRE NOTA  CER ERR SRE NOTA  CER ERR SRE NOTA');
     END; 
	 end;
   
 END;
	write('enter para continuar');
	readln;
	clrscr;
//CALCULO DA MEDIA
  FOR E := 1+disc TO 3+disc DO
	BEGIN
   MED:=SOMA[E]/cont;
   WRITELN('MEDIA DA DISCIPLINA ',e:3,' =',MED:10:2);
  END;
 WRITE('ENTER PARA ENCERRAR');
 READLN; 
 CLOSE(ARQ);
End.
{
1234aaaaaaaaaaaaaaaaaaaaaaaa
2345bbbbbbbbbbbbbbbbbbbbbbbbb
1111cccccccccccccccccccccccc
0000  }