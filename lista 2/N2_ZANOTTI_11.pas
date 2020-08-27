Program N2_ZANOTTI_11;
// Leonardo José Zanotti

var nome: string[50];
var i, a: integer;
var key: boolean;

Begin
	repeat
	key:=true;
		for i:=1 to 50 do
			nome[i]:=chr(0);
			
		write('Escreva o nome: ');
		readln(nome);
		
		for i:=length(nome) downto 1 do
			begin
				if (nome[i]=' ') and key then
					begin
						a:=i;
						key:=false;
					end;
			end;
		
		for i:=a+1 to length(nome) do
			write(nome[i]);
			
		write(', ');
		
		for i:=1 to a do
			write(nome[i]);
		
		writeln();
		writeln();		
	until(nome='fim');  
End.