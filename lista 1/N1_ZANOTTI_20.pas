Program N1_ZANOTTI_20;
// Leonardo José Zanotti

var num, vi, vf, i: integer;
var key: boolean;

Begin
i:=1;

repeat
	begin
	key:=true;
		write('Escreva o número: ');
		readln(num);
		
		vi:=2;
		vf:=num div 2;
		             		
		repeat
			begin
				if ((num)mod(vi)=0) and (num<>vi) then
					key:=false;
				vi:=vi+1;	
			end;
		until (key=false) or (vi>vf);
		
		if (key) then
			writeln('É primo!')
		else
			writeln('not primo');	
	end;
until (num=0);  
End.