unit UnitMenu;
interface
procedure MenuPrincipal;
procedure DestinosLAM;
procedure DestinosNacionais;
procedure DestinosInter;

procedure CargoLAM;

implementation

    procedure MenuPrincipal;
    begin
         writeln('+===================================+');
         writeln('|    M E N U    P R I N C I P A L   |');
         writeln('+===================================+');
         writeln('| [1] - DESTINOS LAM                |');
         writeln('| [2] - RESERVAS LAM                |');
         writeln('| [3] - CARGO LAM                   |');
         writeln('| [4] - CHECK-IN RESRVAS            |');
         writeln('+===================================+');
    end;

              { Menu dos Voos}
	procedure DestinosLAM;
	begin
	  write('+==============================+');writeln('       ll        AA        MM    MM  ');
	  write('|   D E S T I N O S    L A M   |');writeln('      ll        A A       M M   M M  ');
	  write('+==============================+');writeln('     ll        A  A      M  M  M  M  ');
    write('| [1] - Destinos Nacionais     |');writeln('    ll        AAAAA     M   M M   M  ');
    write('+------------------------------+');writeln('   ll        A    A    M    MM    M  ');
    write('| [2] - Destinos Internacionais|');writeln('  ll        A     A   M           M  ');      
		write('+==============================+');writeln(' lllllllll A      A  M            M  ');
	end;

     {Voos Nacionais}
    Procedure DestinosNacionais;
    begin
	  writeln('+=======================================================================================+');
	  writeln('|                     D E S T I N O S       N A C I O N A I S                           |');
	  writeln('+=======================================================================================+');
      writeln('| AVIÃO  |   DE   |   PARA   |    VOO    | PARTIDA | CHEGADA | DIAS  DE  VOO  |  PRECO  |');
      writeln('+--------+--------+----------+-----------+---------+---------+----------------+---------+');
      writeln('| Q400   | Maputo | Beira    |   TM2144  |  11:45  |  12:55  |  2F            | 6860MZN |');
      writeln('| Q400   | Maputo | Nampula  |   TM2132  |  13:25  |  14:45  |  2F / 4F       | 5158MZN |');
      writeln('| EMB145 | Maputo | Tete     |   TM2131  |  07:00  |  08:10  |  3F / 5F       | 4786MZN |');
      writeln('| EMB120 | Maputo | Quelimane|   TM2135  |  18:30  |  19:40  |  3F / 5F       | 3046MZN |');
      writeln('| EMB145 | Maputo | Chimoio  |   TM2147  |  09:15  |  12:05  |  4F / SAB      | 1913MZN |');
      writeln('| EMB145 | Maputo | Inhambane|   TM2153  |  12:25  |  15:30  |  5F / SAB      | 3196MZN |');
      writeln('| Q400   | Maputo | Nacala   |   TM2159  |  15:15  |  17:00  |  6F            | 5491MZN |');
      writeln('| EMB190 | Maputo | Pemba    |   TM2152  |  17:20  |  19:05  |  SAB / DOM     | 4522MZN |');
      writeln('| EMB120 | maputo | Vilankulo|   TM2139  |  15:15  |  16:25  |  5F            | 5041MZN |');
      writeln('| EMB145 | maputo | Nampula  |   TM2140  |  17:20  |  18:30  |  DOM           | 5313MZN |');
      writeln('| EMB145 | maputo | Niassa   |   TM2156  |  11:30  |  13:15  |  SAB e DOM     | 1757MZN |');
      writeln('| EMB190 | Beira  | Tete     |   TM2171  |  08:00  |  09:20  |  3F / 4F / 6F  | 2360MZN |');
      writeln('| B772-5 | Chimoio| Quelimane|   TM2173  |  07:30  |  08:40  |  4F / SAB      | 3490MZN |');
      writeln('| B737-9 | Pemba  | Maputo   |   TM2179  |  12:10  |  15:15  |  2F / 3F       | 4160MZN |');
      writeln('| Q400   | Beira  | Niassa   |   TM2106  |  14:50  |  16:00  |  3F / 5F       | 7000MZN |');
      writeln('| EMB190 | Niassa | Inhambane|   TM2130  |  19:30  |  21:15  |  5F / 6F       | 2367MZN |');
      writeln('| EMB120 | Tete   | Niassa   |   TM2126  |  15:00  |  17:00  |  6F /SAB /DOM  | 4567MZN |');
      writeln('+========+========+==========+===========+=========+=========+================+=========+');
	end;

    procedure DestinosInter;
    begin
      writeln('+======================================================================================================+');
	    writeln('|                         D E S T I N O S         I N T E R N A C I O N A I S                          |');
	    writeln('+======================================================================================================+');
      writeln('| AVIÃO  |       DE     |        PARA       |    VOO    | PARTIDA | CHEGADA | DIAS  DE  VOO  |  PRECO  |');
      writeln('+--------+--------------+-------------------+-----------+---------+---------+----------------+---------');
      writeln('| Q400   | Beira  - BRA | Nairobi     - NBO |   BM4044  |  10:45  |  17:50  |  2F            | 6860MZN |');
      writeln('| Q400   | Maputo - MPT | Joanesburgo - JNB |   MJ7070  |  13:00  |  16:45  |  2F / 4F       | 5158MZN |');
      writeln('| EMB145 | Nacala - NCL | Harare      - HRA |   NH3100  |  07:00  |  12:10  |  3F / 5F       | 4786MZN |');
      writeln('| EMB120 | Nacala - NCL | Lusaka      - LUN |   NL2135  |  18:30  |  21:40  |  3F / 5F       | 1046MZN |');
      writeln('| EMB145 | Beira  - BRA | Luanda      - LAD |   BL8987  |  09:15  |  12:05  |  4F / SAB      | 1913MZN |');
      writeln('| EMB145 | Maputo - MPT | Mumbai      - BOM |   MM2153  |  12:25  |  15:30  |  5F / SAB      | 3196MZN |');
      writeln('| Q400   | Maputo - MPT | Dubai       - DXB |   MD4015  |  15:15  |  21:00  |  6F            | 5491MZN |');
      writeln('| EMB190 | Beira  - BRA | Guangzhou   - CAN |   BG6754  |  17:20  |  19:05  |  SAB / DOM     | 4522MZN |');
      writeln('| EMB120 | Maputo - MPT | Bangkok     - BKK |   MB3456  |  15:15  |  20:25  |  5F            | 5041MZN |');
      writeln('| EMB145 | Maputo - MPT | Nairobi     - NBO |   MN9087  |  18:30  |  22:34  |  DOM           | 5313MZN |');
      writeln('| EMB145 | Beira  - BRA | Harare      - HRA |   BH4738  |  11:30  |  14:15  |  SAB e DOM     | 1757MZN |');
      writeln('| EMB190 | Beira  - BRA | Joanesburgo - JNB |   BJ3485  |  10:20  |  14:15  |  3F / 4F / 6F  | 2360MZN |');
      writeln('+========+==============+===================+===========+=========+=========+================+=========+');
	end;

    procedure CargoLAM;
    begin
         writeln('+=================================================+');
         writeln('|         C  A  R  G  O        L  A  M            |');
         WRITELN('+=================================================+');
         writeln('| AVIOES DE CARGA | DESTINOS | DIAS DE VOO | TAXA |');
         writeln('+-----------------+----------+-------------+------+');
         writeln('| Boeng-00734-MA  | Nampula  | 4F /5F /SAB | 1000 |');
         writeln('| Boeng-10634-AN  | Beira    | 3F /9F      | 1000 |');
         writeln('| Boeng-00734-PA  | Tete     | 5F          | 1000 |');
         writeln('| Boeng-00734-TF  | Niassa   | 2F /6F      | 1000 |');
         writeln('| Boeng-00734-Mw  | Pemba    | DOM /4F     | 1000 |');
         WRITELN('+=================+==========+=============+======+');

    end;


end.

