Program N1_ZANOTTI_01;
// Leonardo Jos� Zanotti

var a, b, c, x1, x2, delta, i:real;
//Calcular as ra�zes de segundo grau e classific�-las

Begin
	i:= 0;
	repeat

		write('Digite o valor de a: ');
		read(a);
		write('Digite o valor de b: ');
		read(b);
		write('Digite o valor de c: ');
		read(c);
 
		delta:= b*b-4*a*c;
		if(a<>0)then
			Begin
			if(delta=0)then
				Begin
					writeln('Ra�z real �nica');
					x1:= -b/2*a;
					writeln('x1 = x2 = ', x1:10:3);
				end
			else
			if(delta<0)then
				writeln('Ra�zes imagin�rias')
			else
				Begin
					writeln('Ra�zes reais distintas');
					x1:= (-b - sqrt(delta))/(2*a);
					x2:= (-b + sqrt(delta))/(2*a);
					writeln('Valor de x1 = ', x1:10:3);
					writeln('Valor de x2 = ', x2:10:3);
				end;
				writeln('');
			end
		else
			Begin
				writeln('');
				writeln('a n�o pode ser igual a 0');
				writeln('');
			end;
	readln;
	until(i = 1);
end.