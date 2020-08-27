Program N1_ZANOTTI_14;
// Leonardo José Zanotti

var i, nota, storage, total: integer;
var media: real;

Begin
i:=0;
total:=0;
storage:=0;

repeat
	begin
		write('Escreva a ', total+1,'° nota: ');
		readln(nota);
		
		if (0<=nota) and (nota<=100) then 	
	  	begin
			storage:=storage+nota;
	  	total:=total+1;
	    end
	    
	  else if (nota<0) then
	  	i:=1;
		clrscr;
	end;
until i=1;

media:=storage/total;

writeln('');
writeln('O total de notas informadas é ', total, ' e a média das notas é ', media:3:2);  
End.