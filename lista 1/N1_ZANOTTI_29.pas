Program N1_ZANOTTI_29;
// Leonardo Jos� Zanotti

var num, divisor, i: integer;

Begin
repeat
	begin
		write('Escreva um n�mero: ');
		readln(num);
		
		clrscr;
		write('Divisores de ', num, ': ');
		
		for i:=1 to num do
			begin
			if ((num)mod(i)=0) then
				if (i=num) then
					write(i)
				else
					write(i, ', ');
			end;
			
		writeln('');
	end;
until num=0;  
End.