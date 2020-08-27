Program N1_ZANOTTI_10;
// Leonardo José Zanotti

var a, b: integer;

Begin
for a:=1 to 10 do
	begin
	writeln('Tabuada do ',a);
	for b:=1 to 10 do
		begin
		writeln(a, ' x ', b, ' = ', a*b)
		end;
	writeln('')
	end  
End.