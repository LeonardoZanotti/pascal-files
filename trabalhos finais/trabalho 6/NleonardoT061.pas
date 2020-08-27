Program NleonardoT061;
// Leonardo José Zanotti

uses bibliotn;

var reg2: regis;
		arq2: file of regis;
		ordemTxt, classCargo, classGeral: string[5];
		cargoTxt: string[2];
		ordenar, t, PAG, TOT, A, AA, carAnt, contador, cont: integer;
		vet: vetor;

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

Begin
ordemTxt:='Opção';
	repeat
		clrscr;
		writeln('Escolha como quer organizar a listagem');
		writeln('[1] Candidatos classificados por ordem alfabética');
		writeln('[2] Candidatos por ordem de classificação nos cargos');
		writeln('[3] Classificação geral');
		leia1(ordemTxt, ordenar);
	until (ordenar>0) and (ordenar<4);
clrscr;

assign(arq2,'CAND.ind');
reset(arq2);
t:=0;
cont:=0;
 
WRITELN('LENDO OS REGISTROS PARA MONTAR O VETOR DE INDICES');
while not (eof(arq2)) do
  begin
  	read(arq2,reg2);
  	cont:=cont+1;  			
		
  	if (ordenar=1) then     // alfabética
  		begin
				if (reg2.ccl<>0) then
	  			begin
						t:=t+1;
						vet[t].pf:=cont-1;
	  				insert(reg2.nome, vet[t].cc, 1);   				
	  			end;
  		end
		else if (ordenar=3) then  	// classificação geral
  		begin
  			t:=t+1;
  			vet[cont].pf:=cont-1;
				str(reg2.clg+1000, classGeral);
				insert(classGeral, vet[cont].cc, 1);
			end
		else      	// cargo
			begin     // apenas mantém -> CAND.ind já está organizado desse modo
				t:=t+1;        
				vet[cont].pf:=cont-1;
				str(reg2.clc+1000, classCargo);
				str(reg2.car+10, cargoTxt);
				insert(classCargo, vet[cont].cc, 1);
				insert(cargoTxt, vet[cont].cc, 1);						           		
			end;			
  end;   
  
WRITELN('FIM DA LEITURA',T:5,' REGISTROS LIDOS');
TOT:=T;
writeln('Inicio da ordenacao do vetor');
ordem(vet,t);
writeln('Fim da ordenação');
  
carAnt:=1;
CABECA;
t:=0;
contador:=0;
FOR AA:=1 TO TOT DO
	begin
		t:=t+1;
		contador:=contador+1;
		seek(arq2,vet[AA].pf);
		read(arq2,reg2);
			begin
				if ((ordenar=2) and (carAnt<>reg2.car)) or (contador MOD 25 = 0) THEN
					begin
						contador:=0;
						CABECA;
					end;
				write(t:5,reg2.num:5,' ',REG2.NOME,' ',reg2.cpf,' ',copy(reg2.data,7,2),'/'
				,copy(REG2.DATA,5,2),'/',copy(reg2.data,1,4),reg2.car:3);
				FOR A:=1 TO 6 DO
					WRITE(REG2.NOTAS[A]:4);
				WRITELN(reg2.som:4,reg2.clg:5,reg2.clc:4,reg2.ccl:3 );     
				carAnt:=reg2.car;
			end;
	end;
	
close(arq2);
writeln('lidos=',t:5);
readln;
End.