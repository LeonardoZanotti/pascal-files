Program N1_ZANOTTI_26;
// Leonardo Jos� Zanotti

var i, n, a, b, c: integer;

Begin
i:=0;
a:=0;
b:=1;

repeat
	begin
		writeln('Quantos n�meros da sequ�ncia de Fibonacci voc� quer ver?');
		readln(n);
		
		clrscr;
		
		if (n>=2) then
			i:=1;  
  end;
until i=1;

writeln('Os ', n, ' primeiros termos da sequ�ncia de Fibonacci:');
writeln(a);
writeln(b);

for i:=3 to n do
	begin
		c:=a+b;
		a:=b;
		b:=c;
		writeln(c);	
	end;               
readln();
End.