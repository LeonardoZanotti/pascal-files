unit biblioteca_zanotti;
// Leonardo Jos� Zanotti

interface
	function resto(a, b: integer): integer;
  procedure test(rest: integer; var mu, nmu: integer);
  procedure exit(var n, p1, p2: integer);
  
implementation
//======================================================================================================================================================================

// pega 2 n�meros e devolve o resto da divis�o do primeiro pelo segundo
function resto(a, b: integer): integer;
	begin
		resto:=a mod b;
	end;

//======================================================================================================================================================================

// testa se o resto � 0, se for, mu conta mais 1, se n, nmu conta mais 1
procedure test(rest: integer; var mu, nmu: integer);
	begin
		if (rest=0) then
			mu:=mu+1
		else
			nmu:=nmu+1;
	end;
	
//======================================================================================================================================================================

// procedimento de sa�da, para mostrar quantos n�meros s�o m�ltiplos e quantos n�o s�o
procedure exit(var n, p1, p2: integer);
	begin
		writeln('O total de n�meros m�ltiplos de ', n, ' �: ', p1);
		writeln('O total de n�meros n�o m�ltiplos de ', n, ' �: ', p2);
		readln();
		clrscr;
	end;
	
//======================================================================================================================================================================

End.