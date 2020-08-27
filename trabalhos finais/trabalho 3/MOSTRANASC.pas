program MOSTRANASC;
 uses BIBLIOTN;
//MOSTRA OS REGISTROS DE CAND.IND EM ORDEM DE DATA DE NASCIMENTO
var reg2:regis;
    arq2:file of regis;
    xx:string[8];
    a,AA,b,c,p,e,t,PAG,TOT:integer;
    vet:vetor;//nao é possivel array como parametro
//============================
PROCEDURE CABECA;{MODULO ESPECIFICO PARA ESTE PROGRAMA}
BEGIN
 write('enter para continuar');
 readln;
 CLRSCR ;
 PAG:=PAG+1;
 WRITELN('                         RELATORIO GERAL - ORDEM DATA NASCIMENTO       PAGINA:',PAG:3);
 WRITELN;
 write('  ORD  NUM N O M E                             ===C P F=== NASCIMENTO CA  N1');
 WRITELN('  N2  N3  N4  N5  N6  SO   CG  CC CV');
END;
//===========================
begin
 clrscr;
 assign(arq2,'CAND.ind');
//gera vetor de indices cc+pf (NO CASO, CAMPO CHAVE - CC = DATA DE NASCIMENTO)
 t:=0;
 reset(arq2);
 WRITELN('LENDO OS REGISTROS PARA MONTAR O VETOR DE INDICES');
 while not (eof(arq2)) do
  begin
   read(arq2,reg2);  //LE OS REGISTROS SEQUENCIALMENTE
   t:=t+1;
	 vet[t].pf:=t-1; //POSIÇÃO FISICA COMEÇA COM 0(ZERO);
   insert(REG2.DATA,vet[t].cc,1);
  end;
 WRITELN('FIM DA LEITURA',T:5,' REGISTROS LIDOS');
 TOT:=T;
 writeln('Inicio da ordenacao do vetor');
  ordem(vet,t);
 writeln('Fim da ordenacao');
 CABECA;
 t:=0;
 FOR AA:=1 TO TOT DO
  begin
   t:=t+1;
   seek(arq2,vet[AA].pf);
	 read(arq2,reg2);
    begin
     write(t:5,reg2.num:5,' ',REG2.NOME,' ',reg2.cpf,' ',copy(reg2.data,7,2),'/'
		 ,copy(REG2.DATA,5,2),'/',copy(reg2.data,1,4),reg2.car:3);
		 FOR A:=1 TO 6 DO
		  WRITE(REG2.NOTAS[A]:4);
     WRITELN(reg2.som:4,reg2.clg:5,reg2.clc:4,reg2.ccl:3 );
     if(t MOD 25 = 0)THEN
       CABECA;
    END;
  end;
  close(arq2);
  writeln('lidos=',t:5);
  readln;
end.