program NleonardoT031;
//le arquivo de acesso indexado ou acesso direto (basta mudar o nome do arquivo)
//EXEXUTAR ESTE PROGRAMA TODA VEZ QUE ALTERAR OS REGISTRO DE CAND.IND
USES BIBLIOTN;

type newRegis = record
		  	nome: a35;
		  	cargo: integer;
		  	pf: integer;
			end;
			
var reg2:regis;
    arq2:file of regis;
    a,AA,b,c,p,e,t,PAG,TOT:integer;
    vet:vetor;//nao é possivel array como parametro
		ordenar, comp, i, carAnt, contador, cont, w, registros, registros1: integer;
		ordemTxt, numeroTxt: string;  		
		nomeCargo, nomePf: array[1..2000] of newRegis;
		key:boolean;
		carro:newRegis;
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
ordemTxt:='Opção';
	repeat
		clrscr;
		writeln('Escolha como quer organizar a listagem');
		writeln('[1] Por ordem de inscrição');
		writeln('[2] Por ordem alfabética');
		writeln('[3] Por ordem de cpf');
		writeln('[4] Por ordem de cargo');
		leia1(ordemTxt, ordenar);
	until (ordenar>0) and (ordenar<5);
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
   	if (ordenar=1) then
   	 	begin
			 	str(reg2.num, numeroTxt);
   			comp:=length(numeroTxt);
   			for i:=1 to comp do
   				insert('a', numeroTxt,1);
   			insert(numeroTxt, vet[t].cc, 1);
   	 	end
   	 else if (ordenar=2) then
   		insert(reg2.nome,vet[t].cc,1)
   	else if (ordenar=3) then
			 insert(reg2.cpf,vet[t].cc,1)
		else
			begin                 
				nomeCargo[t].nome:=reg2.nome;
				nomeCargo[t].cargo:=reg2.car;
				nomeCargo[t].pf:=t-1;
			end;
  end;
  
 WRITELN('FIM DA LEITURA',T:5,' REGISTROS LIDOS');
 TOT:=T;
 writeln('Inicio da ordenacao do vetor');
	if (ordenar<>4) then
  	ordem(vet,t)     	
 	else         // Ordenar alfabeticamente dentro do cargo
 		begin
 			registros:=0;
 			for i:=1 to 12 do
	 			begin
	 				cont:=0;
	 				contador:=0;
	 				registros1:=registros+1;
					for AA:=1 to TOT do
		 				begin
		 				 	if (nomeCargo[AA].cargo=i) then
		 				 		begin
		 				 			cont:=cont+1;
			 				 		nomePf[cont].nome:=nomeCargo[AA].nome;
			 				 		nomePf[cont].cargo:=i;
			 				 		nomePf[cont].pf:=nomeCargo[AA].pf;	
		 				 		end;
		 				end;
		 			 
			 		repeat
			 			begin
							key:=true;
						 	for w:=1 to cont-1 do
				 				begin
				 					if (nomePf[w].nome>nomePf[w+1].nome) then
				 						begin
										 	key:=false;
					 						carro:=nomePf[w];
					 						nomePf[w]:=nomePf[w+1];
					 						nomePf[w+1]:=carro;	
										end;		 						
				 				end;
				 		end;
			 		until key;
					  
					registros:=registros+cont;
			 		for cont:=registros1 to registros do
			 			begin
			 				contador:=contador+1;
			 				vet[cont].cc:=nomePf[contador].nome;
			 				vet[cont].pf:=nomePf[contador].pf;
			 			end;
				end; 			
 		end;
 writeln('Fim da ordenacao');

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
    	if ((ordenar=4) and (carAnt<>reg2.car)) or (contador MOD 25 = 0) THEN
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
    END;
  end;
  close(arq2);
  writeln('lidos=',t:5);
  readln;
end.