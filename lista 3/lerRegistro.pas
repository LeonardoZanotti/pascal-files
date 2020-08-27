Program lerRegistro;

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
var alunos: alunosReg;
var arquivo: file of alunosReg;
var i: integer;
var arqAbrir: string;

Begin
writeln('Escreva o nome do arquivo que quer visualizar: ');
readln(arqAbrir);
assign(arquivo, arqAbrir);      	
reset(arquivo);

clrscr;

i:=0;
while not(eof(arquivo)) do
	begin
		i:=i+1;
		read(arquivo, alunos);
		
		writeln('Número: ', alunos.numero);
		writeln('Nome: ', alunos.nome);
		writeln('Nascimento: ', alunos.nascimento.dia, '/', alunos.nascimento.mes, '/', alunos.nascimento.ano);
		writeln('Curso: ', alunos.curso);
		writeln('Filiação: ', alunos.filiacao);
		
		writeln();
	end;

writeln('Total de alunos: ', i);                   
End.