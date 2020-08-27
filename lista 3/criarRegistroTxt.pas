Program criarRegistroTxt;

uses n3_zanotti_biblioteca;

var	numero: integer;
var	nome: string[30];
var arquivo: text;
var curso, num, comprimento, i: integer;
var comprimentoTxt, numTxt, cursoTxt, aluno: string;

Begin
assign(arquivo, 'alunos.txt');      	
rewrite(arquivo);

repeat
	numTxt:='Escreva o número: ';
	num:=leiaNum(numTxt);
until (num>=0) and (num<=999999999);

while (num<>0) do    
	begin              	
		write('Nome: ');
		readln(nome);
	 	numTxt:='Código de curso: ';
		curso:=leiaNum(numTxt);
	  
	  str(num, numTxt);
	  str(curso, cursoTxt);
	  
	  insert(numTxt, aluno, 1);
		
		comprimento:=12-length(numTxt);
		for i:=1 to comprimento do
			insert(' ', comprimentoTxt, 1);
		insert(comprimentoTxt, aluno, 12);
		comprimentoTxt:='';
		
		insert(nome, aluno, 13);   
		
		comprimento:=50-length(nome);
		for i:=1 to comprimento do
			insert(' ', comprimentoTxt, 1);
		insert(comprimentoTxt, aluno, 50);
		comprimentoTxt:='';
		
		insert(cursoTxt, aluno, 51);
		
		writeln(arquivo, aluno);
		
		clrscr;
		aluno:='';
		
		repeat
			numTxt:='Escreva o número: ';
			num:=leiaNum(numTxt);
		until (num>=0) and (num<=999999999);
	end;
close(arquivo);  
End.