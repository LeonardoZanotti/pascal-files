Program N1_ZANOTTI_04;
// Leonardo José Zanotti

var maior, meio, menor, nome1, nome2, nome3: string[30];
var a: integer;

Begin
a:=0;
while a=a do
	begin
		writeln('Nome1');
		readln(nome1);
		writeln('');
		
		writeln('Nome2');
		readln(nome2);
		writeln('');
		
		if (upcase(nome1)<upcase(nome2)) then
			begin
			menor:=nome1;
			maior:=nome2
			end
		else
			begin
			menor:=nome2;
			maior:=nome1;
		  end;
		  
		writeln('Nome3');
		readln(nome3);
		writeln('');
		
		if (upcase(nome3)<=upcase(menor)) then
			begin
			meio:=menor;
			menor:=nome3
			end
		else if (upcase(nome3)>=upcase(maior)) then
			begin
			meio:=maior;
			maior:=nome3
			end
		else
			meio:=nome3;
			
		writeln('');
		writeln(menor, ', ', meio, ', ', maior);
		readln();
	end  
End.