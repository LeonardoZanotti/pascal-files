Program N3_ZANOTTI_01;
// Leonardo José Zanotti

var vetor: array[1..250] of integer;
var i, car: integer;
var key: boolean;

Begin
for i:=1 to 250 do
	begin
		vetor[i]:=random(101);
		writeln(vetor[i]);
	end;
		
repeat
	begin
		key:=false;
		for i:=1 to 249 do
			if (vetor[i]>vetor[i+1]) then
				begin
					key:=true;
					car:=vetor[i];
					vetor[i]:=vetor[i+1];
					vetor[i+1]:=car;
				end; 
	end;
until not(key);

readln();

clrscr;
for i:=1 to 250 do
	writeln(vetor[i]);

writeln();
	
for i:=250 downto 1 do
	writeln(vetor[i])		
End.