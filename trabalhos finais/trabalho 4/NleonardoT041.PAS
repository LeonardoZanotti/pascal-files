program NleonardoT041;
// Leonardo José Zanotti

USES BIBLIOTN;

const ini: array[1..6] of integer = (1,21,41,1,26,51);	
			fim: array[1..6] of integer = (20,40,60,25,50,60);	
			tot: array[1..6] of integer = (20,20,20,25,25,10);
					
var reg2:regis;
		reg3: array[1..2000] of regis;
    arq2:file of regis;
    i,t,total,PAG:integer;
		certo, errado, branco, nota, a, b, start, finish, comp: integer;	
		gabarito: string[60];
		soma:array[1..6] of real;
		media:array[1..3] of real;
		arq:text;
		reg:string[64];
		key:boolean;
		cabecalho,numeroTxt:string;
		vet:vetor;
		notas: array[1..2000, 1..6] of integer;         		
		
//============================
PROCEDURE CABECA;{MODULO ESPECIFICO PARA ESTE PROGRAMA}
BEGIN
 write('enter para continuar');
 readln;
 
 CLRSCR ;
 PAG:=PAG+1;
 WRITELN('                         RELATORIO GERAL - NOTAS             PAGINA:',PAG:3);
 WRITELN;
 writeln(cabecalho);
 writeln('INSC NOME                                  |   CER   ERR  BRAN  NOTA   |   CER   ERR  BRAN  NOTA   |   CER   ERR  BRAN  NOTA   |');
END;
//===========================


//===========================
begin
	repeat
		key:=true;
		writeln('                   111111111122222222223333333333444444444455555555556666666666');
		write('Digite o gabarito: ');
		readln(gabarito);
		gabarito:=upcase(gabarito);
		for i:=1 to 60 do
			if (gabarito[i]<>'A') and (gabarito[i]<>'B') and (gabarito[i]<>'C') and (gabarito[i]<>'D') and (gabarito[i]<>'E') then
				key:=false;	
		clrscr;
	until key;
// gabarito:='AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';

 assign(arq2,'CAND.ind');	 
 reset(arq2);
 
 writeln('Ordenando o vetor...');
	while not eof(arq2) do
		begin		
			t:=t+1;	
			read(arq2,reg2);
		  vet[t].pf:=t-1;
		  reg2.num:=reg2.num+1000;
		  str(reg2.num,numeroTxt);
			vet[t].cc:=numeroTxt;
		end;
	
	total:=t;	
	ordem(vet,t);
	clrscr;
	t:=0;
		
for b:=1 to 2 do
	begin
	 PAG:=0;		
	 t:=0;     
	
	 	if (b=1) then
	 		begin
				cabecalho:='                                                       L.E.M                      MATEMÁTICA                    LÓGICA'; 
				start:=1;
	 			finish:=3;
	 			assign(arq, 'prova1.txt');
			end
		else
			begin
				cabecalho:='                                                CONHEC. ESPECÍFICOS             INFORMÁTICA                  ATUALIDADES';
				start:=4;
				finish:=6;
				assign(arq, 'prova2.txt');
			end;
			
		reset(arq);
		clrscr;
			
	 CABECA;
	 while not eof(arq) do
	 	begin 		
	 		t:=t+1;
	 		readln(arq,reg);
	 		seek(arq2,vet[t].pf);
	 		read(arq2,reg2);
	 		write(copy(reg,1,4), ' ', reg2.nome, '   |');
	 		for i:=start to finish do
	 			begin
	 				certo:=0;
			 		errado:=0;
			 		branco:=0;
	 			  for a:=ini[i] to fim[i] do
	 			  	begin   			  	
						 	if (reg[a+4]=gabarito[a]) then					  			  	
			 					certo:=certo+1
			 				else if (reg[a+4]=' ') then
			 					branco:=branco+1
			 				else
			 					errado:=errado+1;
	 			  	end;
		 		    		  
					nota:=trunc(certo*100/tot[i]);
					soma[i]:=soma[i]+nota;
					write(certo:6,errado:6,branco:6,nota:6, '   |');	
				  notas[t][i]:=nota;				  
				end;
							
			writeln;
			
			if (t mod 40 = 0) then
				CABECA;	 	
	  end;
	  
	  writeln('enter para continuar');
	  readln();
	  clrscr;
	  
	  if (b=1) then
	  	begin
	  		media[1]:=soma[1]/t;
			  media[2]:=soma[2]/t;
			  media[3]:=soma[3]/t;
			  writeln('Média da prova de L.E.M: ', media[1]:3:2);
			  writeln('Média da prova de Matemática: ', media[2]:3:2);
			  writeln('Média da prova de Lógica: ', media[3]:3:2);
	  	end
	  else
	  	begin
	  		media[1]:=soma[4]/t;
			  media[2]:=soma[5]/t;
			  media[3]:=soma[6]/t;
			  writeln('Média da prova de Conhecimentos Específicos: ', media[1]:3:2);
			  writeln('Média da prova de Informática: ', media[2]:3:2);
			  writeln('Média da prova de Atualidades: ', media[3]:3:2);
			end;
		
		close(arq);
	  writeln('Registros lidos: ',t);
	  readln;
  end; 
  
  for i:=1 to total do
  	begin
  		seek(arq2,vet[i].pf);
  		read(arq2,reg2);
			reg2.som:=0;
			for t:=1 to 6 do
	  		begin
					reg2.notas[t]:=notas[i][t];
	  		  reg2.som:=reg2.som+reg2.notas[t];
	  		end;
	  	reg3[i]:=reg2;	
	  end;
			  
	close(arq2);
	assign(arq2, 'CAND.ind');
	rewrite(arq2);
		for i:=1 to total do
			write(arq2, reg3[i]);
	close(arq2); 
end.