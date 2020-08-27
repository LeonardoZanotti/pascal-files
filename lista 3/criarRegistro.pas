Program criarRegistro;

uses n3_zanotti_biblioteca;

type data = record
							ano, mes, dia: integer;
						end;
type alunosReg = record
							numero: integer;
							nome: string;
							nascimento: data;
							curso: integer;
							filiacao: string;
						end;
var aluno: alunosReg;
var arquivo: file of alunosReg;
var num, dd, mm, aa: integer;
var numTxt: string;

Begin
assign(arquivo, 'alunos.seq');      
rewrite(arquivo);

numTxt:='Escreva o número: ';
num:=leiaNum(numTxt);
while (num<>0) do    
	begin              		
		aluno.numero:=num;
		write('Nome: ');
		readln(aluno.nome);
		repeat
			clrscr;
			write('Dia de nascimento: ');
			readln(dd);
			write('Mês de nascimento: ');
			readln(mm);	 
			write('Ano de nascimento: ');
		 	readln(aa);
		until (validaData(dd, mm, aa));
		aluno.nascimento.dia:=dd;
		aluno.nascimento.mes:=mm;
	 	aluno.nascimento.ano:=aa;
	 	numTxt:='Código de curso: ';
		aluno.curso:=leiaNum(numTxt);
	 	write('Nome do pai e da mãe: ');
	 	readln(aluno.filiacao);
	  
		write(arquivo, aluno);
		
		clrscr;
		numTxt:='Escreva o número: ';
		num:=leiaNum(numTxt);
	end;
close(arquivo);  
End.