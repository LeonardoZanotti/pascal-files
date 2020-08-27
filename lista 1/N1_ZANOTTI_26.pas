Program N1_ZANOTTI_26;
// Leonardo José Zanotti

var i, n, a, b, c: integer;

Begin
i:=0;
a:=0;
b:=1;

repeat
	begin
		writeln('Quantos números da sequência de Fibonacci você quer ver?');
		readln(n);
		
		clrscr;
		
		if (n>=2) then
			i:=1;  
  end;
until i=1;

writeln('Os ', n, ' primeiros termos da sequência de Fibonacci:');
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