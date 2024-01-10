unit Menus;
interface 
procedure Menu;
procedure VooNacional;

implementation
              { Menu dos Voos}
	procedure Menu;
	begin
	  writeln('+==============================+');
	  writeln('|    M E N U   D E   V O O S   |');
	  writeln('+==============================+');
      writeln('| [1] - viagens Nacionais      |');
      writeln('+------------------------------+');
      writeln('| [2] - viajens Internacionais |');
      writeln('+==============================+');
	end;

     {Voos Nacionais}
    Procedure VooNacional;
    begin
      clrscr;
	  writeln('+=============================================================|');
	  writeln('|               V O O S       N A C I O N A I S               |');
	  writeln('+=============================================================+');
      writeln('|  DESTINO  | DURACAO | DISTANCIA | HORA DE PARTIDA |  PRECO  |');
      writeln('+-----------+---------+-----------+-----------------+---------+');
      writeln('| Inhambane | 10 min  |   239 km  | 9h:30 - 10h:30  | 1000MT  |');
      writeln('| Vilankulo | 20 min  |   239 km  | 8h:00 - 9h:00   | 2000MT  |');
      writeln('|   Beira   | 45 min  |   239 km  | 12h:00 - 13h:00 | 4500MT  |');
      writeln('|  Chimoio  | 39 min  |   239 km  | 7h:20 - 8h:20   | 3000MT  |');
      writeln('| Quelimane | 50 min  |   239 km  | 16h:30 - 17h:30 | 6000MT  |');
      writeln('|    Tete   | 55 min  |   239 km  | 11h:10 - 12h:10 | 6500MT  |');
      writeln('|  Nampula  | 1h:10min|   239 km  | 14h:30 - 15h:00 | 7000MT  |');
      writeln('|   Pemba   | 1h:20min|   239 km  | 18h:45 - 19h:45 | 8000MT  |');
      writeln('| Lichinga  | 1h:40min|   239 km  | 20h:00 - 21h:00 | 9000MT  |');
      writeln('+===========+=========+===========+=================+=========+');
	end;
end.

