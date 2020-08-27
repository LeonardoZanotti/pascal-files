Program N1_PROFESSOR_30;
{leia uma serie de num, terminadda por 5555. comece mostrando, toda vez que ler 5000,
muda a apresentcao,se mostrando leu 5000 = para de mostrar. se NAO mostrando, leu 5000=
volta a mostrar}
VAR NUM:INTEGER;
    CHAVE:BOOLEAN;
Begin
  WRITE('NUM=');
  READLN(NUM);
  CHAVE:=TRUE;
  WHILE(NUM<>5555) DO
   BEGIN
    IF(chave)then
		 WRITELN(NUM:20);
    IF(NUM=5000)THEN
     CHAVE:=NOT CHAVE;
    WRITE('NUM=');
    READLN(NUM);
   END;
	WRITE('ENTER PARA ENCERRR');
	READLN; 
End.