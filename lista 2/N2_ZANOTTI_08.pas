Program N2_ZANOTTI_08;
// Leonardo José Zanotti
                  
// para uma escola com 5 cursos, cada curso com 5 alunos tirando notas de 0 a 100 
var alunos: array[1..5, 1..5] of integer;
var curso, aluno: integer;
var media: array[1..5] of real;

Begin
for curso:=1 to 5 do	
	begin
		for aluno:=1 to 5 do
			begin
				write('Escreva a nota do aluno ', aluno, ' do curso ', curso,': ');		
				readln(alunos[curso, aluno]);
				media[curso]:=media[curso]+((alunos[curso, aluno])/5);
			end;
			
		writeln('');
		writeln('Média das notas do curso ', curso, ': ', media[curso]:3:2);
		writeln('');
		writeln('');
	end;
readln();
End.