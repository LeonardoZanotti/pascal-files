Program N3_ZANOTTI_04;
// Leonardo José Zanotti

var vetor: array[1..100] of integer;
var a, i, car: integer;
var key: boolean;

Begin
i:=0;
	repeat	
		begin
			i:=i+1;
			write('Escreva o ', i, '° número: ');
	  	readln(vetor[i]);
		end;
	until (vetor[i]<0) or (i=100);
i:=i-1;

repeat
	begin
		key:=false;
		for a:=1 to i-1 do
			if (vetor[a]>vetor[a+1]) then
				begin
					key:=true;
					car:=vetor[a];
					vetor[a]:=vetor[a+1];
					vetor[a+1]:=car;
				end; 
	end;
until not(key);

clrscr;

writeln('Pares:');
for a:=1 to i do
	if(vetor[a] mod 2 = 0) then
		writeln(vetor[a]);

writeln();

writeln('Ímpares:');
for a:=i downto 1 do
	if(vetor[a] mod 2 <> 0) then
		writeln(vetor[a]);
End.