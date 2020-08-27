program BUSCA;
USES BIBLIOTN;
var reg2:regis;
    NO:STRING[15];
    VV:Vetor;
    arq2:file of regis;
    CAR:STRING[2];
    a,b,c,p,e,OO,t,ant,PP,ini,fim,TCA:integer;
    OOA:STRING[1];
    TOTC:ARRAY[1..12] OF INTEGER;
    ENT,aux:STRING[35];
PROCEDURE pebin(vet:vetor;ext:tipo;t:integer;VAR posi:INTEGER);//vet, ext, t por valor e posi por referencia, parametros formais
														 // o resultado da tarefa eh devolvido em posi
														 // vet possui duas informações por posicao o campo chave e a posicao fisica
var ini,fim,meio,XX,TCE:integer; //variaveis locais
    achou:boolean;
    PARTE:STRING[35];
begin
 TCE:=LENGTH(EXT);
 achou:=false;
 XX:=0;
 ini:=1;
 fim:=t;
 repeat
  meio:=(ini+fim) div 2;
  PARTE:=COPY(VET[MEIO].CC,1,TCE);
  if(ext = PARTE)then
	  achou:=true
  else
   if(ext > PARTE)then
    ini:=meio+1
   else
    fim:=meio-1;
 until ((achou) OR (ini > fim));
 if( achou ) then
  posi := meio
 else
  posi := 0;
end;
//==============================================================================
begin
 clrscr;
 assign(arq2,'CAND.IND');
 reset(arq2);
 REPEAT
  writeln('DESEJA FAZER A BUSCA POR?');
  WRITE('1-INSCRICAO, 2-NOME, OU 3-CPF ===> ');
  READLN(OOa);
 UNTIL (OOA >= '1') and (OOA <= '3');
 val(ooa,oo,e);
 T:=0;
 REPEAT
  READ(ARQ2,REG2);
    T:=T+1;
    VV[T].Pf:=T-1;
    IF(OO=1)THEN
     STR(REG2.NUM:4,VV[T].CC)
    ELSE
     if(oo=2)then
       VV[T].CC:=REG2.NOME
     else
       VV[T].CC:=REG2.CPF
 UNTIL EOF(ARQ2);
 WRITELN('ORDENANDO...');
 ORDEM(VV,T);
 WRITELN('     ...FIM DA ORDENACAO.');
 WRITE('DIGITE QUEM QUER PROCURAR, FIM PARA ENCERRAR=>');
 READLN(ENT);
 ENT:=UPCASE(ENT);
 WHILE(ENT<>'FIM') DO
  BEGIN
//AJUSTA A ENTRADA DIGITADA
   IF(OO=1)THEN
    BEGIN
     VAL(ENT,A,E);
     STR(A:4,ENT);
    END
   ELSE
    IF(OO=2)then
     begin
      a:=0;
      b:=length(ent);
      repeat
       a:=a+1;
      until (ent[a]=' ') or (a=b);
      if(a=b)then
			 aux:=ent
			else
			 aux:=copy (ent,1,a-1);
			INSERT(' ',AUX,B+1);
      ent:=aux;
     end;
   PEBIN(VV,ENT,T,PP);
   IF(PP>0)THEN
    begin
     ini:=pp;
     fim:=pp;
     if(oo=2)then
      begin
       TCA:=LENGTH(ENT);
       repeat
        ini:=ini-1;
        if(ini<1)then
         ini:=1;
       until(COPY(vv[ini].cc,1,TCA)<>ent) or (ini=1);
       repeat
        fim:=fim+1;
        if(fim>t)then
         fim:=t;
       until(COPY(vv[FIM].cc,1,TCA)<>ent) or (fim=t);
      end;  
     for b:=ini to fim do
      begin
		   SEEK(ARQ2,VV[b].Pf);
       read(arq2,reg2);
       write(reg2.num:5,' ',reg2.nome,' ',REG2.CPF,' ',COPY(reg2.data,7,2),'/',COPY(reg2.data,5,2),'/',COPY(reg2.data,1,4),reg2.car:3);
		   FOR E:=1 TO 6 DO
		    WRITE(REG2.NOTAS[E]:4);
		   WRITELN(reg2.soM:4,reg2.clG:5,reg2.clC:4,reg2.cCL:3);
		  end;
    END
   ELSE
    WRITELN(ENT,' NAO ENCONTRADO');
   WRITE('DIGITE QUEM QUER PROCURAR, FIM PARA ENCERRAR=>');
   READLN(ENT);
   ENT:=UPCASE(ENT);
  end;
  close(arq2);
  WRITELN('ENTER PARA CONTINUAR');
  READLN;
end.