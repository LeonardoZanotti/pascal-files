Program buscaBinaria;

var lim, num, tentativa, min, max, media: integer;

Begin
	repeat
		begin
			writeln('Qual o limite?');
			readln(lim);
		end;
	until (lim<1836311903) and (lim>1);
	
	repeat
		begin
			write('Escreva um número entre 1 e ', lim,': ');
			readln(num);
	  end;
	until (num>0) and (num<lim);
	
	min:=1;
	max:=lim;		
	repeat
		begin
			tentativa:=tentativa+1;
			media:=(min+max) div 2;
			writeln('min: ', min, '; media: ', media, '; max: ', max);
			if (num>media) then
				min:=media
			else
				max:=media; 		
		end;						
	until (num=min) or (num=max);

writeln();
writeln('Seu número ', num, ' foi encontrado após ', tentativa, ' tentativas');
  
End.