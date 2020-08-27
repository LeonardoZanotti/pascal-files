Program NleonardoT051;
// Leonardo José Zanotti

uses bibliotn;

var reg2: regis;
		reg3: array[1..2000] of regis;
		arq2: file of regis;
		vet: vetor;
		t,tot,i,a,err,vagaVagasInt,contador, data: integer;
		nota1,nota2,nota3,nota4,nota5,nota6,soma,cargo,aTxt: string[3];
		classGeral:string[4];
		arq: text;
		vagaVagas:string[2];
		reg, newData: string;  

procedure strNotas();
	begin
		str(reg2.notas[1]+100,nota1);
		str(reg2.notas[2]+100,nota2);
		str(reg2.notas[3]+100,nota3);
		str(reg2.notas[4]+100,nota4);
		str(reg2.notas[5]+100,nota5);
		str(reg2.notas[6]+100,nota6);
		str(reg2.som+100,soma);
	end;

procedure insertNotas();
	begin
		insert(reg2.data,vet[t].cc,1);		// desse modo quem é mais novo fica com a vaga
		insert(nota1,vet[t].cc,1); 		                        
		insert(nota6,vet[t].cc,1);
		insert(nota2,vet[t].cc,1);
		insert(nota3,vet[t].cc,1);
		insert(nota5,vet[t].cc,1);
		insert(nota4,vet[t].cc,1);
		insert(soma,vet[t].cc,1);
	end;
	
Begin
// abrir o CAND.ind
assign(arq2, 'CAND.ind');
reset(arq2);

// abrir o VAGAS.TXT
assign(arq, 'VAGAS.TXT');
reset(arq);

// classificação geral
writeln('Gerando classificação geral');
while not(eof(arq2)) do
	begin
		read(arq2,reg2);
	  t:=t+1;
		vet[t].pf:=t-1;
		
		strNotas();
		
		insertNotas();		
	end;

tot:=t;
writeln('Ordenando vetor com a classificação geral...');
ordem(vet,t);
t:=0;

// salvando a classificação em outro vetor
for i:=1 to tot do
	begin             
		seek(arq2,vet[i].pf);
		read(arq2,reg2);
		reg2.clg:=tot+1-i;
		reg3[i]:=reg2;
	end;
writeln('Classificação geral finalizada');

writeln('Salvando os dados...');
// salvar a classificação geral
close(arq2);
assign(arq2, 'CAND.ind');
rewrite(arq2);
	for i:=1 to tot do
		write(arq2, reg3[i]);

writeln('Dados salvos, reabrindo arquivo...');		
// reabrir arq2
close(arq2);
assign(arq2, 'CAND.ind');
reset(arq2);

writeln('Gerando classificação por cargo');
// classificação por cargo
while not(eof(arq2)) do
	begin
		read(arq2,reg2);
	  t:=t+1;
	  vet[t].pf:=t-1;	  
		vet[t].cc:='';
		str(reg2.car+10,cargo);
		str(reg2.clg+1000,classGeral);
		insert(classGeral,vet[t].cc,1);
		insert(cargo,vet[t].cc,1);
	end;
	
writeln('Ordenando vetor com os cargos...');
ordem(vet,t);
t:=0;

// reescrevendo os dados em reg2
for i:=1 to tot do
	begin
		seek(arq2,vet[i].pf);
		read(arq2,reg2);
		reg3[i]:=reg2;
		//writeln(vet[i].cc);
		//writeln(reg3[i].car:5,reg3[i].clg:5);
	end;
	
writeln('Finalizando a classificação...');
for a:=11 to 22 do	
	begin
		contador:=0;
		i:=0;
		readln(arq,reg);
		vagaVagas:=copy(reg,30,2);
		val(vagaVagas,vagaVagasInt,err);
		str(a,aTxt);
		repeat
			begin
				i:=i+1;	     		  
				if (copy(vet[i].cc,1,2)=aTxt) then
					begin
						contador:=contador+1;						   					
						reg3[i].clc:=contador;
						if (contador<=vagaVagasInt) then
							reg3[i].ccl:=a-10;
						//writeln(reg3[i].nome, ' - ', reg3[i].clg:5, reg3[i].clc:5, reg3[i].ccl:5, reg3[i].car:5);
					end;
			end;
		until (i=tot);
	end;
writeln('Classificação por cargo finalizada');

writeln('Salvando os dados...');
// salvar a classificação por cargo
close(arq);
close(arq2);
assign(arq2, 'CAND.ind');
rewrite(arq2);
	for i:=1 to tot do
		write(arq2, reg3[i]); 
close(arq2);
writeln('Dados salvos!');
writeln('Processo concluído com sucesso!');
writeln();
writeln('Enter para encerrar');
readln(); 
End.