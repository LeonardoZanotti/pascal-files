unit biblioteca_zanotti;
// Leonardo José Zanotti

interface
	function resto(a, b: integer): integer;
  procedure test(rest: integer; var mu, nmu: integer);
  procedure exit(var n, p1, p2: integer);
  
implementation
//======================================================================================================================================================================

// pega 2 números e devolve o resto da divisão do primeiro pelo segundo
function resto(a, b: integer): integer;
	begin
		resto:=a mod b;
	end;

//======================================================================================================================================================================

// testa se o resto é 0, se for, mu conta mais 1, se n, nmu conta mais 1
procedure test(rest: integer; var mu, nmu: integer);
	begin
		if (rest=0) then
			mu:=mu+1
		else
			nmu:=nmu+1;
	end;
	
//======================================================================================================================================================================

// procedimento de saída, para mostrar quantos números são múltiplos e quantos não são
procedure exit(var n, p1, p2: integer);
	begin
		writeln('O total de números múltiplos de ', n, ' é: ', p1);
		writeln('O total de números não múltiplos de ', n, ' é: ', p2);
		readln();
		clrscr;
	end;
	
//======================================================================================================================================================================

End.