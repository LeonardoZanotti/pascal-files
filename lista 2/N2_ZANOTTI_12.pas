Program N2_ZANOTTI_12;
// Leonardo José Zanotti

uses n2_zanotti_biblioteca;

var gabarito, candidato, correcao: array[1..25] of string[1];
var i, inscricao, certas, erradas, branco, candidatos: integer;
var media, resultado: real;

Begin
writeln('Cadastro do gabarito');
leRespostas(gabarito);

repeat
	begin
	certas:=0;
	erradas:=0;
	branco:=0;
		write('Escreva o número de inscrição: ');
		readln(inscricao);
		if (inscricao<>0) then
			begin
				candidatos:=candidatos+1;
				leRespostas(candidato);
		
				for i:=1 to 25 do
					begin
						if (candidato[i]=gabarito[i]) then
							begin
								correcao[i]:='C';		
								certas:=certas+1
							end
						else if (candidato[i]=' ') then
							begin
								correcao[i]:='E';
								branco:=branco+1;
							end
						else
							begin
								correcao[i]:='E';
								erradas:=erradas+1;
							end;
						writeln('Questão ', i, ' => Resposta: ', gabarito[i], ' / Marcado: ', candidato[i], ' => Resultado: ', correcao[i]);
					end;
				writeln();
				writeln('Candidato: ', inscricao);
				writeln('Acertos: ', certas);
				writeln('Erros: ', erradas);
				writeln('Em branco: ', branco);
				writeln('Nota final: ', certas*4);
				media:=media+certas*4;
				readln();
			end;	
	clrscr;
	end;	
until (inscricao=0);

resultado:=media/candidatos;
writeln('A média de todas as provas corrigidas é: ', resultado:3:2);
readln();  
End.