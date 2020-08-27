program LEIND;
//le arquivo de acesso indexado ou acesso direto (basta mudar o nome do arquivo)
//EXEXUTAR ESTE PROGRAMA TODA VEZ QUE ALTERAR OS REGISTRO DE CAND.IND
USES BIBLIOTN;
var reg2:regis;
    arq2:file of regis;
    a,b,c,p,e,t,PAG:integer;
//============================
PROCEDURE CABECA;{MODULO ESPECIFICO PARA ESTE PROGRAMA}
BEGIN
 write('enter para continuar');
 readln;
 CLRSCR ;
 PAG:=PAG+1;
 WRITELN('                         RELATORIO GERAL - ORDEM GRAVACAO             PAGINA:',PAG:3);
 WRITELN;
 write('  ORD  NUM N O M E                             ===C P F=== NASCIMENTO CA  N1');
 WRITELN('  N2  N3  N4  N5  N6  SO   CG  CC CV');
END;
//===========================
begin
 clrscr;
 assign(arq2,'CAND.ind');
 CABECA;
 reset(arq2);
  while not(eof(arq2)) do
  begin
   read(arq2,reg2);
    begin
     t:=t+1;
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