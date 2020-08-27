Program N2_ZANOTTI_08_v2;
// Leonardo José Zanotti
                  
// para uma escola com 5 cursos, cada curso com 5 alunos tirando notas de 0 a 100 
var alunos: array[1..20] of integer;
var curso, nota, u: integer;
var media: array[1..20] of real;
var a: string;
var key: boolean;

Begin
key:=false;
	repeat	
		begin	
			repeat
				begin
					write('Escreva o código do curso: ');
					readln(curso);
				end;
			until (curso<21);
			
			if (curso>0) then
				alunos[curso]:=alunos[curso]+1
			else
				key:=true;
			
			write('Escreva a matrícula do aluno: ');		
			readln(a);
			
			repeat
				begin
					write('Escreva a nota do aluno: ');	
					readln(nota);
				end;
			until (nota>=0) and (nota<101);			
			
			if (not(key)) then	
				media[curso]:=media[curso]+nota;
			
			clrscr;	
		end;
	until (key);

	for u:=1 to 20 do
		if (alunos[u]<>0) then
			begin
				media[u]:=(media[u]/alunos[u]);	
      	writeln('Média das notas do curso ', u, ': ', media[u]:3:2);
			end
		else
			  writeln('O curso ', u, ' não teve notas cadastradas');	

	readln();
End.