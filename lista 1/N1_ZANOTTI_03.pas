Program N1_ZANOTTI_03;
// Leonardo José Zanotti

var menor, meio, maior, n1, n2, n3: real;
var a: integer;

Begin
a:=0;
while (a=0) do
	begin
		writeln('Número 1: ');
		readln(n1);  
		
		writeln('Número 2: ');
		readln(n2);  
		
			if (n1>n2) then
				begin
				maior:=n1;
				menor:=n2
				end
			else
				begin
				maior:=n2;
				menor:=n1;
				end;
			
		writeln('Número 3: ');
		readln(n3);
		
			if (n3>=maior) then
				begin
		  	meio:=maior;
				maior:=n3
				end
			else if (n3<=menor) then
				begin
				meio:=menor;
				menor:=n3
				end
			else
				meio:=n3;
				
		writeln('');
		writeln(maior:8:2, ', ', meio:8:2, ', ', menor:8:2);
		readln()
	end
End.