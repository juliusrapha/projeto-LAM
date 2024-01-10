Program ProjectoLAM;
{````````````````````````UNITS`````````````````````}
uses UnitMenu, Crt;

{-------------------Label---------------------------}
label DeadEnd, Start,MainMenu,Destiny;

{````````````````````````TYPE``````````````````````}
Type
		BilheteVOO = Record
		  //ID do bilhete
		  Indice: Integer;
		  Referencia: Integer;
		  Entidade: String;
		  
		  //dados Pesssoais
		  Viajante: String[30];
		  idade: Integer;
		  Sexo: char;
		  
		  //dados da viagem
		  aviao:string;
		  HoraPartida : String;
		  HoraChegada : String;
  		TipoViajem: String[12];
  		VooID: String[6];
  		Partida: String[15];
  		Chegada: String[15];
  		DiaPartida: String[7];
  		PassagerAdulto: Integer;
  		PassagerCrianca: Integer;
  		PassagerBebes: Integer;
  		PrecoBilhete: Integer;
  		BilheteID: String[10];
  		Status: String[10];
		end;
		
		BilheteCargo = Record
  		DonoCarga: String[20];
  		TipoBagagem: String[10];
  		PesoCarga: Real;
  		CategoriaPeso: String[10];
  		TipoCarga: String[30];
  		PrecoCarga: Real;
  		CargaID: String[10];
		end;


{````````````````````````VARIAVEIS`````````````````}
var
		Tiket: file of BilheteVOO;
		Bilhete: BilheteVOO;
		Carga: BilheteCargo;
		TiketCargo: File of BilheteCargo;
		controle: integer;
		resposta,a,n: char;
		NomeBilhete: String;
		bilhetePrinter: text;
		CargoPrinter: Text;




{````````````````````````PROCEDIMENTOS`````````````}

{------------------Porcedimento abrir arquivo-----------}
procedure OpenFile;
begin
  assign(tiket,'Passageiros.uni');
	{$I-}
	   reset(tiket);
  {$I+}
  if (IOResult <> 0) then rewrite(tiket);
end;

{```````````````````````Abrir arquivo de cargas`````````````````}
procedure OpenCargo;
begin
	close(tiket);
	
  assign(tiketCargo,'Cargas.uni');
	{$I-}
	   reset(tiketCargo);
  {$I+}
  if (IOResult <> 0) then rewrite(tiketcargo);
end;

{------------------------------Gravando cargas----------------}
Procedure GravarCargas;
var 
   extensao: string;
begin
	OpenCargo;
  reset(tiketCargo);
  
	//Vai para o final do arquivo para gravar novos dados
	seek(tiketCargo, filesize(tiketCargo));
  
  writeln;
  //gravando dados no arquivo;
	write(tiketCargo,Carga);
  
  close(tiketCargo);
  writeln('Dados de Carga Gravados!');
end;


{------------------------------}
procedure CargoVoo; //Procedimento Dos Voos de Carga
begin
		writeln('+===========================================+');
		write('|  Responsavel pela carga: '); readln(Carga.DonoCarga);
  	writeln('+===========================================+');
  	writeln('|   P R O D U T O S   D E   C A R G A       |');
  	writeln('+===========================================+');
  	writeln('| Bagagem      | [1] - DE CABINE            |');
  	writeln('|              | [2] - DE PORAO             |');
  	writeln('+-------------------+-----------------------+');
  	readln(n);
  	
  	while(n<>'1')and(n<>'2') do begin
  	  textcolor(yellow);
  		writeln('Opcao Invalida! Tente novamente: ');
  		readln(n);
  		textcolor(white);
  	end;
  	
		case (n) of
    	'1': Carga.TipoBagagem := 'Bagagem de Cabine';
    	'2': Carga.TipoBagagem := 'Bagagem de Porao';
  	end;
  
 		writeln('+---------------+-------------------------------+');
  	writeln('|               | [1] - Animais Vivos           |');
  	writeln('|               | [2] - Bens Perigosos          |');
  	writeln('|   T I P O     | [3] - Equipamentos Desportivos|');
  	writeln('|     D E       | [4] - Armas e Municoes        |');
  	writeln('|  C A R G A    | [5] - Objectos de Alto valor  |');
  	writeln('|               | [6] - Produtos Alimenticios   |');
  	writeln('|               | [7] - Equipamentos Electricos |');
  	writeln('|               | [8] - Equipamentos Medicinais |');
  	writeln('+---------------+-------------------------------+');
  	write('| Escolha o tipo de Carga: ');readln(n);
  	
  	while (n<>'1')and(n<>'2')and(n<>'3')and(n<>'4')and(n<>'5')and(n<>'6')and(n<>'7')and(n<>'8') do 
  	begin
  		textcolor(yellow);
  		write('Opcao Invalida! Tente Novamente: ');
  		readln(n);
  		textcolor(yellow);
  	end;
  	
  	case (n) of
    	'1': Carga.TipoCarga := 'Animais Vivos';
    	'2': Carga.TipoCarga := 'Bens Perigosos';
    	'3': Carga.TipoCarga := 'Equipamentos Desportivos';
    	'4': Carga.TipoCarga := 'Armas e Municoes';
    	'5': Carga.TipoCarga := 'Objectos de Alto valor';
    	'6': Carga.TipoCarga := 'Produtos Alimenticios';
    	'7': Carga.TipoCarga := 'Equipamentos Electricos';
    	'8': Carga.TipoCarga := 'Equipamentos Medicinais';
  	end;
  
  
  	writeln('+-------------------+------------------------+');
  	writeln('|  Categoria    | [1] - Peso Leve < 1000Kg   |');
  	writeln('|     de        | [2] - Peso Medio < 5000kg  |');
  	writeln('|    Peso       | [3] - Peso Pesado > 5000Kg |');
  	writeln('+---------------+----------------------------+');
  	write('| Informe o peso em (Kg): ');readln(Carga.PesoCarga);
  	
  	while(Carga.PesoCarga<0) do begin
  		textcolor(yellow);
  		write('Peso invalido! Tente Novamente');
  		readln(Carga.PesoCarga);
  	end;
  	
 		if (Carga.PesoCarga < 1000) then Carga.CategoriaPeso := 'Peso Leve';
  	if (Carga.PesoCarga >= 1000) and (Carga.PesoCarga <= 5000) then Carga.CategoriaPeso := 'Peso Medio';
  	if (Carga.PesoCarga > 5000) then Carga.CategoriaPeso := 'Peso Pesado';
  
  
  	//Calculando o Preco
  	if (Carga.CategoriaPeso = 'Peso Leve') then Carga.PrecoCarga := 5000;
  	if (Carga.CategoriaPeso = 'Peso Medio') then Carga.PrecoCarga := 10000;
  	if (Carga.CategoriaPeso = 'Peso Pesado') then Carga.PrecoCarga := 20000;
  	writeln('+--------------------------------------------+');
  	writeln('| Preco de Viajem da Carga: ',Carga.PrecoCarga:0:2,'MT |');
  	writeln('+--------------------------------------------+');
end; //Fim do procedimento para voos de carga



procedure ReservarVoo; //Procedimento da Reserva
var dia, numero: Integer;
		nome, vooID: String;
	
		procedure cabecalho;
		begin
  		writeln('+=====================================+');
  		writeln('|      R E S E R V A S   L A M        |');
  		Writeln('+=====================================+');
		end;
begin  //Inicio do Procedimento Reserva
		OpenFile;
		Bilhete.Indice := filesize(tiket);
		Bilhete.Status := 'Nao Pago';
		Bilhete.Referencia:=0;
		cabecalho;
		write('| Nome do Viajante: ');read(Bilhete.Viajante);
		
		//Interrompe a execussao qualquer momento
		if (Bilhete.Viajante = '0') then exit;
		
		writeln('+---------------------------------------+');
		write('| Idade: ');read(Bilhete.Idade);
		writeln('+---------------------------------------+');
		
		//interrompe a execussao a qualquer momento
		if (Bilhete.idade=0) then exit;
		
		while (Bilhete.idade<0)do begin 
				write('Idade inavalida! Tente Novamente: ');
				readln(Bilhete.Idade);
		end;
		
		while(Bilhete.idade<18) do begin
		    writeln('| O viajante deve ser maior de Idade! ');
		    write('| Digite novamente a Idade: ');read(Bilhete.Idade);
		end;
		
		write('| Sexo: ');read(Bilhete.sexo);
		writeln('+---------------------------------------+');
		
		//Interrompe  execussao a qualquer momento
		if (Bilhete.sexo='0') then exit;
		
		//Tratando Erros
  	while(Bilhete.sexo <> 'F')and(Bilhete.sexo <> 'M') do
  	begin
  	   writeln('Sexo Invalido! Tente Novamente');
			 write('| Sexo [M/F]: ');read(Bilhete.sexo);
  	end;
		

  	cabecalho;
  	writeln('| TIPO DE VIAJEM | [1] - So ida       |');
  	writeln('|                | [2] - Ida e Volta  |');
  	writeln('+-------------------------------------+');
  	readln(numero);
  	
  	//Interrompe a execussao se numero='0'
  	if (numero=0) then exit;
  	
		while(numero<>1)and(numero<>2) do begin
  			textcolor(Yellow);
				writeln('Viajem Invalida! Tente Novamente.');
				readln(numero);
				textcolor(white);
		end;
  	
  	case (numero) of //Estrutura case of
    	1: Bilhete.TipoViajem := 'So Ida';
    	2: Bilhete.TipoViajem := 'Ida e Volta';
  	end;
  
  	repeat
				Cabecalho;
  			write('| Informe o ID do Voo: ');read(vooID);
  			writeln('+-------------------------------------+');
  	
  			//Interrupcao do programa se o numero digitado for zero
  	    if (VooID='0') then exit; 
  	
				//Tratando Erros
  			while(Length(VooID) <> 6) do
  			begin
  				 textcolor(Yellow);
  			   writeln('VOO Invalido! Tente Novamente');
					 write('| Informe o ID do Voo: ');read(vooID);
					 textcolor(white);
  			end;
		
				(*---------------VOOS Nacionais----------------------*)
  	
				if (UpCase(vooID) = 'TM2144') then begin
					Bilhete.vooID := vooID;
					Bilhete.aviao := 'Q400';
					Bilhete.Partida := 'MAPUTO';
					Bilhete.Chegada := 'Beira';
					Bilhete.HoraPartida := '11:45';
					Bilhete.HoraChegada := '12:55';
					Bilhete.DiaPartida := 'Segunda-feira';
					Bilhete.PrecoBilhete := 6860;
				end;
		
  			if (vooID = 'TM2132') then begin 
 			 	  Bilhete.vooID := vooID;
  				Bilhete.aviao := 'EMB145';
  				Bilhete.Partida := 'Maputo';
  				Bilhete.Chegada := 'Nampula';
  				Bilhete.HoraPartida := '13:25';
  				Bilhete.HoraChegada := '14:45';
  				Bilhete.DiaPartida := 'Segunda-Feira / Quarta-Feirta';
					Bilhete.PrecoBilhete := 5158;
				end;
		
  			if (vooID = 'TM2131') then begin 
  				Bilhete.aviao := 'Q400';
  				Bilhete.Partida := 'Maputo';
  				Bilhete.vooID := vooID;
  				Bilhete.Chegada := 'Tete';
  				Bilhete.HoraPartida := '07:00';
  				Bilhete.HoraChegada := '08:10';
  				Bilhete.DiaPartida := 'Terca-Feira / Quinta-Feirta';
					Bilhete.PrecoBilhete := 4786;
				end;
		
  			if (vooID = 'TM2135') then begin
  				Bilhete.aviao := 'EMB120';
  				Bilhete.vooID := vooID;
  				Bilhete.Partida := 'Maputo';
  				Bilhete.Chegada := 'Quelimane';
  				Bilhete.HoraPartida := '18:30';
  				Bilhete.HoraChegada := '19:40';
  				Bilhete.DiaPartida := 'Terca-Feira / Quinta-Feirta';
					Bilhete.PrecoBilhete := 3046;
				end;
		
  			if (vooID = 'TM2147') then begin 
  				Bilhete.aviao := 'EMB145';
  				Bilhete.Partida := 'Maputo';
  				Bilhete.Chegada := 'Chimoio';
  				Bilhete.HoraPartida := '09:15';
  				Bilhete.HoraChegada := '12:05';
  				Bilhete.DiaPartida := 'Quarta-Feira / Sabado';
					Bilhete.PrecoBilhete := 1913;
					Bilhete.vooID := vooID;
				end;
		
  			if (vooID = 'TM2153') then begin 
  				Bilhete.aviao := 'EMB145';
  				Bilhete.Partida := 'Maputo';
  				Bilhete.Chegada := 'Inhambane';
  				Bilhete.HoraPartida := '12:25';
  				Bilhete.HoraChegada := '15:30';
  				Bilhete.DiaPartida := 'Quinta-Feira / Sabado';
					Bilhete.PrecoBilhete := 3196;
					Bilhete.vooID := vooID;
				end;
		
  			if (vooID = 'TM2159') then begin
  			  Bilhete.aviao := 'Q400';
  				Bilhete.Partida := 'Maputo';
  				Bilhete.Chegada := 'Nacala';
  				Bilhete.HoraPartida := '15:15';
  				Bilhete.HoraChegada := '17:00';
  				Bilhete.DiaPartida := 'Sexta-Feira';
				  Bilhete.PrecoBilhete := 5491;
				  Bilhete.vooID := vooID;
				end;  
		
 			 	if (vooID = 'TM2152') then begin
 		 			Bilhete.aviao := 'EMB190';
  				Bilhete.Partida := 'Maputo';
  				Bilhete.Chegada := 'Pemba';
  				Bilhete.HoraPartida := '17:20';
  				Bilhete.HoraChegada := '19:05';
  				Bilhete.DiaPartida := 'Sabado / Domingo';
					Bilhete.PrecoBilhete := 4522;
					Bilhete.vooID := vooID;
				end;
		
  			if (vooID = 'TM2139') then begin
  	 		 	Bilhete.aviao := 'EMB120';
  				Bilhete.Partida := 'Maputo';
  				Bilhete.Chegada := 'Vilankulo';
  				Bilhete.HoraPartida := '15:15';
  				Bilhete.HoraChegada := '16:25';
  				Bilhete.DiaPartida := 'Quinta-Feira';
					Bilhete.PrecoBilhete := 5041;
					Bilhete.vooID := vooID;
				end;
		
  			if (vooID = 'TM2140') then begin
  	 		 	Bilhete.aviao := 'EMB145';
  				Bilhete.Partida := 'Maputo';
  				Bilhete.Chegada := 'Nampula';
  				Bilhete.HoraPartida := '17:20';
  				Bilhete.HoraChegada := '18:30';
  				Bilhete.DiaPartida := 'Domingo';
					Bilhete.PrecoBilhete := 5313;
					Bilhete.vooID := vooID;
				end;
		
  			if (vooID = 'TM2156') then begin   
					Bilhete.aviao := 'EMB145';
  				Bilhete.Partida := 'Maputo';
  				Bilhete.Chegada := 'Niassa';
  				Bilhete.HoraPartida := '11:30';
  				Bilhete.HoraChegada := '13:45';
  				Bilhete.DiaPartida := 'Sabado / Domingo';  
					Bilhete.PrecoBilhete := 7757;
					Bilhete.vooID := vooID;
				end;
		
  			if (vooID = 'TM2171') then begin 
  	  		Bilhete.aviao := 'EMB190';
  				Bilhete.Partida := 'Beira';
  				Bilhete.Chegada := 'Tete';
  				Bilhete.HoraPartida := '08:00';
  				Bilhete.HoraChegada := '09:20';
  				Bilhete.DiaPartida := 'Terca/Quarta/Sexta-Feira';
					Bilhete.PrecoBilhete := 2360;
					Bilhete.vooID := vooID;
				end;
		
  			if (vooID = 'TM2173') then begin
		  		Bilhete.aviao := 'B772-5';
  				Bilhete.Partida := 'Chimoio';
  				Bilhete.Chegada := 'Quelimane';
  				Bilhete.HoraPartida := '07:30';
  				Bilhete.HoraChegada := '08:40';
  				Bilhete.DiaPartida := 'Quarta-Feira / Sabado';
					Bilhete.PrecoBilhete := 3490;
					Bilhete.vooID := vooID;
				end;
		
  			if (vooID = 'TM2179') then begin 
  				Bilhete.aviao := 'B737-9';
  				Bilhete.Partida := 'Pemba';
  				Bilhete.Chegada := 'Maputo';
  				Bilhete.HoraPartida := '12:10';
  				Bilhete.HoraChegada := '15:15';
  				Bilhete.DiaPartida := 'Segunda-Feira / Terca-Feira';
					Bilhete.PrecoBilhete := 4160;
					Bilhete.vooID := vooID;
				end;
		
  			if (vooID = 'TM2106') then begin
  				Bilhete.aviao := 'Q400';
  				Bilhete.Partida := 'Beira';
  				Bilhete.Chegada := 'Niassa';
  				Bilhete.HoraPartida := '14:50';
  				Bilhete.HoraChegada := '16:00';
  				Bilhete.DiaPartida := 'Terca-Feira / Quinta-Feira';
					Bilhete.PrecoBilhete := 7000;
					Bilhete.vooID := vooID;
				end;
		
  			if (vooID = 'TM2130') then begin
  				Bilhete.aviao := 'EMB190';
  				Bilhete.Partida := 'Niassa';
  				Bilhete.Chegada := 'Inhambane';
  				Bilhete.HoraPartida := '19:30';
  				Bilhete.HoraChegada := '21:15';
  				Bilhete.DiaPartida := 'Sexta-Feira / Quinta-Feira';
					Bilhete.PrecoBilhete := 2367;
					Bilhete.vooID := vooID;
				end;
		
  			if (vooID = 'TM2126') then begin
  	  		Bilhete.aviao := 'EMB120';
  				Bilhete.Partida := 'Tete';
  				Bilhete.Chegada := 'Niassa';
  				Bilhete.HoraPartida := '15:00';
  				Bilhete.HoraChegada := '17:00';
  				Bilhete.DiaPartida := 'Sexta-Feira / Sabado / Domingo';
					Bilhete.PrecoBilhete := 4567;
					Bilhete.vooID := vooID;
				end;
  
    
				(*------------------------------Para VOOS Internacionais---------------*)
    		if (vooID = 'BM4044') then begin
  	  		Bilhete.aviao := 'Q400';
  				Bilhete.Partida := 'Beira  - BRA';
  				Bilhete.Chegada := 'Nairobi  - NBO';
  				Bilhete.HoraPartida := '10:45';
  				Bilhete.HoraChegada := '17:50';
  				Bilhete.DiaPartida := 'Segunda-Feira';
					Bilhete.PrecoBilhete := 6860;
					Bilhete.vooID := vooID;
				end;
  
    		if (vooID = 'MJ7070') then begin
  	  		Bilhete.aviao := 'Q400';
  				Bilhete.Partida := 'Maputo - MPT';
  				Bilhete.Chegada := 'Joanesburgo - JNB';
  				Bilhete.HoraPartida := '13:00';
  				Bilhete.HoraChegada := '16:45';
  				Bilhete.DiaPartida := 'Segunda-Feira / Quarta-Feira';
					Bilhete.PrecoBilhete := 5158;
					Bilhete.vooID := vooID;
				end;
		
				if (vooID = 'NL2135') then begin
  	  		Bilhete.aviao := 'EMB120';
  				Bilhete.Partida := 'Nacala - NCL';
  				Bilhete.Chegada := 'Lusaka - LUN';
  				Bilhete.HoraPartida := '18:30';
  				Bilhete.HoraChegada := '21:40';
  				Bilhete.DiaPartida := 'Terca/Quinta-Feira';
					Bilhete.PrecoBilhete := 1046;
					Bilhete.vooID := vooID;
				end;
			
				if (vooID = 'BL8987') then begin
  	  		Bilhete.aviao := 'EMB145';
  				Bilhete.Partida := 'Beira  - BRA';
  				Bilhete.Chegada := 'Luanda  - LAD';
  				Bilhete.HoraPartida := '09:15';
  				Bilhete.HoraChegada := '12:05';
  				Bilhete.DiaPartida := 'Quarta-Feira / Sabado ';
					Bilhete.PrecoBilhete := 1913;
					Bilhete.vooID := vooID;
				end;
		
				if (vooID = 'MM2153') then begin
  	  		Bilhete.aviao := 'EMB145';
  				Bilhete.Partida := 'Maputo  - MPT';
  				Bilhete.Chegada := 'Mumbai  - BOM';
  				Bilhete.HoraPartida := '12:25';
  				Bilhete.HoraChegada := '15:30';
  				Bilhete.DiaPartida := 'Quinta-Feira / Sabado';
					Bilhete.PrecoBilhete := 3196;
					Bilhete.vooID := vooID;
				end;
		
				if (vooID = 'MD4015') then begin
  	 		 	Bilhete.aviao := 'Q400';
  				Bilhete.Partida := 'Maputo  - MPT';
  				Bilhete.Chegada := 'Dubai   - DXB';
  				Bilhete.HoraPartida := '15:15';
  				Bilhete.HoraChegada := '21:00';
  				Bilhete.DiaPartida := 'Sexta-Feira';
					Bilhete.PrecoBilhete := 5491;
					Bilhete.vooID := vooID;
				end;
		
				if (vooID = 'BG6754') then begin
  	  		Bilhete.aviao := 'EMB190';
  				Bilhete.Partida := 'Beira  - BRA';
  				Bilhete.Chegada := 'Guangzhou   - CAN';
  				Bilhete.HoraPartida := '17:20';
  				Bilhete.HoraChegada := '19:05';
  				Bilhete.DiaPartida := 'Sabado / Domingo';
					Bilhete.PrecoBilhete := 4522;
					Bilhete.vooID := vooID;
				end;
		
				if (vooID = 'MB3456') then begin
  	  		Bilhete.aviao := 'EMB120';
  				Bilhete.Partida := 'Maputo  - MPT';
  				Bilhete.Chegada := 'Bangkok  - BKK';
  				Bilhete.HoraPartida := '15:15';
  				Bilhete.HoraChegada := '20:25';
  				Bilhete.DiaPartida := 'QUinta-Feira';
					Bilhete.PrecoBilhete := 5041;
					Bilhete.vooID := vooID;
				end;
		
				if (vooID = 'MN9087') then begin
  	  		Bilhete.aviao := 'EMB145';
  				Bilhete.Partida := 'Maputo - MPT';
  				Bilhete.Chegada := 'Nairobi     - NBO';
  				Bilhete.HoraPartida := '18:30';
  				Bilhete.HoraChegada := '22:34';
  				Bilhete.DiaPartida := 'Domingo';
					Bilhete.PrecoBilhete := 5313;
					Bilhete.vooID := vooID;
				end;
		
				if (vooID = 'BH4738') then begin
  	  		Bilhete.aviao := 'EMB145';
  				Bilhete.Partida := 'Beira  - BRA';
  				Bilhete.Chegada := 'Harare   - HRA';
  				Bilhete.HoraPartida := '11:30';
  				Bilhete.HoraChegada := '14:15';
  				Bilhete.DiaPartida := 'Sabado / Domingo';
					Bilhete.PrecoBilhete := 1757;
					Bilhete.vooID := vooID;
				end;
		
				if (vooID = 'BJ3485') then begin
  	  		Bilhete.aviao := 'EMB190';
  				Bilhete.Partida := 'Beira  - BRA ';
  				Bilhete.Chegada := 'Joanesburgo - JNB';
  				Bilhete.HoraPartida := '10:20';
  				Bilhete.HoraChegada := '14:15';
  				Bilhete.DiaPartida := 'Terca/Quarta/Sexta-Feira';
					Bilhete.PrecoBilhete := 2360;
					Bilhete.vooID := vooID;
				end;
				
				if (Length(Bilhete.VooId) <> 6) then
				begin
					writeln('ID do VOO incorreto!');
					writeln;
				end
				
		Until(Length(Bilhete.VooId) = 6);
		
  	
		cabecalho;
  	writeln('| P A S S A G E I R O S  A  B O R D O |');
  	writeln('+-------------------------------------+');
  	writeln('|             |[1]- Adultos > 16 anos |');
  	writeln('| CATEGORIA   |[2]- Criancas < 15 anos|');
  	Writeln('|             |[3]- Bebes < 2 anos    |');
  	writeln('+-------------------------------------+');
  	write('| Informe o numero de Adultos: ');readln(Bilhete.PassagerAdulto);
    
		while (Bilhete.PassagerAdulto<0) do begin
    	 writeln('Numero invalido! Tente Novamente.');
    	 readln(Bilhete.PassagerAdulto);
		end;
		
		INC(Bilhete.PassagerAdulto);//O numero de adultos Recebe um incremento
		
  	write('| Informe o numero de Criancas: ');readln(Bilhete.PassagerCrianca);
  	
  	while (Bilhete.PassagerCrianca<0) do begin
    	 writeln('Numero invalido! Tente Novamente.');
    	 readln(Bilhete.PassagerCrianca);
		end;
  	
  	write('| Informe o numero de Bebes: ');readln(Bilhete.PassagerBebes);
  	
  	while (Bilhete.PassagerBebes<0) do begin
    	 writeln('Numero invalido! Tente Novamente.');
    	 readln(Bilhete.PassagerBebes);
		end;
		
  	writeln('+-------------------------------------+');
  
  	cabecalho;
  	writeln('| F O R M A   D E  P A G A M E N T O  |');
  	writeln('+-------------------------------------+');
  	writeln('| [1] - Pagar via M-pesa/E-mola       |');
  	writeln('| [2] - Pagar via Millenium Bim       |');
  	writeln('| [3] - Pagar via Banco BCI           |');
  	writeln('+-------------------------------------+');
  	writeln('| escolha uma das opcoes: ');readln(n);
  	case (n) of
    	'1':begin
      		writeln('+-------------------------------------+');
      		writeln('| Entidade :  Passagem LAM            |');
      		writeln('| Referencia: 700747                  |');
      		writeln('+-------------------------------------+');
      		Bilhete.Entidade := 'Passagem LAM';
      		Bilhete.Referencia := 700747;
    		end;
    	'2':begin
      		writeln('+-------------------------------------+');
      		writeln('| Entidade :  Companhia Aeria LAM     |');
      		writeln('| Referencia: 100909220               |');
      		writeln('+-------------------------------------+');
      		Bilhete.Entidade := 'Companhia Aeria LAM';
      		Bilhete.Referencia := 100909220;
    		end;
    	'3':begin
      		writeln('+-------------------------------------+');
      		writeln('| Entidade :  Companhia Aeria LAM     |');
      		writeln('| Referencia: 100909220               |');
      		writeln('+-------------------------------------+');
      		Bilhete.Entidade := 'Companhia Aeria LAM';
      		Bilhete.Referencia := 100909220;
    		end;
    	else
    	  begin
    	    writeln('Opcao invalida');
    	    Delay(2000);
    	    exit;
    	  end;
  	end;
  	writeln('Indice do Bilhete: ', Bilhete.indice);
  	writeln('STATUS do Bilhete: ', Bilhete.status);
  	writeln('Memorize o indice do bilhete!!!');
		
  
end; //Fim do procedimento reserva

{--------------------Procedimento Gravar Dados---------------------}
procedure GravarDados;                   
var 
   extensao: string;
begin
  reset(tiket);
  
	//Vai para o final do arquivo para gravar novos dados
	seek(tiket, filesize(tiket));
  
  writeln;
  //gravando dados no arquivo;
	write(tiket,Bilhete);
  
  close(tiket);
  writeln('Dados Gravados!');
end;

{------------------Procedure para Imprimir Bilhete em arquivo de texto -----------}
procedure PrintBilhete;
var
   nomeTiket, ext: string;
begin
     ext := '_bilhete.txt';
		 NomeTiket := concat(Bilhete.Viajante, ext) ;
		 assign(bilhetePrinter, NomeTiket);
		 rewrite(BilhetePrinter);
		 //dados pessoais
				writeln(BilhetePrinter,'Indice da Passagem: ', Filepos(tiket));
		  	writeln(BilhetePrinter,'Referencia do Bilhete: ',Bilhete.BilheteID);
		  	writeln(BilhetePrinter,'Nome do Viajante: ',Bilhete.Viajante);
		  	writeln(BilhetePrinter,'Idade do viajante: ',Bilhete.Idade);
		  	writeln(BilhetePrinter,'Genero(Sexo): ',Bilhete.Sexo);
	 
		 		//dados da viagem
		  	writeln(BilhetePrinter,'Tipo de Viajem: ',Bilhete.TipoViajem);
  			writeln(BilhetePrinter,'VOO: ',Bilhete.VooID);
				writeln(BilhetePrinter,'Cidade de Partida: ',Bilhete.Partida);
 				writeln(BilhetePrinter,'Cidade de Chegada: ',Bilhete.Chegada);
 				writeln(BilhetePrinter,'Hora de Partida: ',Bilhete.HoraPartida);
 				writeln(BilhetePrinter,'Hora de Chegada: ',Bilhete.HoraChegada);
 				writeln(BilhetePrinter,'Dia do VOO: ',Bilhete.DiaPartida);
  			writeln(BilhetePrinter,'Adultos: ',Bilhete.PassagerAdulto);
  			writeln(BilhetePrinter,'Criancas: ',Bilhete.PassagerCrianca);
  			writeln(BilhetePrinter,'Bebes: ',Bilhete.PassagerBebes);
  			writeln(BilhetePrinter,'Entidade: ',Bilhete.Entidade);
  			writeln(BilhetePrinter,'Referencia: ',Bilhete.Referencia);
  			writeln(BilhetePrinter,'Preco do Bilhete: ',Bilhete.PrecoBilhete,'MT');
  			writeln(BilhetePrinter,'STATUS: ',Bilhete.status);
  	
		Close(bilhetePrinter); //Fechar o arquivo para salvar os dados gravados
  			writeln('Bilhete Imprimido Com sucesso');
end;

Procedure PrintCargo;
var extensio: string; 
		NomeCargo: string;
begin
		 extensio := ' Cargo VOO.txt';
		 NomeCargo := concat(Carga.DonoCarga, extensio) ;
		 assign(CargoPrinter, NomeCargo);
		 rewrite(CargoPrinter);
		 //dados pessoais
				writeln(CargoPrinter,'Responsavel Pela Carga: ', Carga.DonoCarga);
		  	writeln(CargoPrinter,'Tipo de Bagagem: ',Carga.TipoBagagem);
		  	writeln(CargoPrinter,'Peso da Carga: ',Carga.PesoCarga);
		  	writeln(CargoPrinter,'Tipo de Carga: ',Carga.TipoCarga);
		  	writeln(CargoPrinter,'Categoria do Peso: ',Carga.CategoriaPeso);
		  	writeln(CargoPrinter,'Preco da Carga: ',Carga.PrecoCarga);
	 
		Close(CargoPrinter); //Fechar o arquivo para salvar os dados gravados
  			writeln('Carga Imprimida Com sucesso');
		 
end;


procedure VerCargas;
begin
		 OpenCargo;
   {$I-} reset(tiketCargo); {$I+}
		 if IOResult <> 0 then begin
		 		writeln('O arquivo das passgens nao foi aberto corretamente!');
		 end;
		 
		 seek(Tiketcargo, 0);
		 
		 while (not eof(TiketCargo)) do begin
		    read(tiketCargo, Carga);
		    writeln('Responsavel Pela Carga: ', Carga.DonoCarga); Delay(200);
		  	writeln('Tipo de Bagagem: ',Carga.TipoBagagem); Delay(200);
		  	writeln('Peso da Carga: ',Carga.PesoCarga); Delay(200);
		  	writeln('Tipo de Carga: ',Carga.TipoCarga); Delay(200);
		  	writeln('Categoria do Peso: ',Carga.CategoriaPeso); Delay(200);
		  	writeln('Preco da Carga: ',Carga.PrecoCarga); Delay(200);
	      writeln('------------------------------------------------'); Delay(200);
	      writeln;
		 end;
end;

{------------------------Procedure para Validar o Bilhete---------------------}
procedure ValidarBilhete;
var
   i: integer;
	 index: integer;
	 p: char; 
begin
		 {$I-} reset(tiket); {$I+}
		 if IOResult <> 0 then begin
		 		writeln('O arquivo das passgens nao foi aberto corretamente!');
		 end;
		 
		 write('Digite o Indice do seu Bilhete: ');
		 readln(index);
		 
		 if (index < 0) or (index > filesize(tiket)) then 
		 begin
		    textcolor(red);
		 		writeln('[ERROR] Indice Inexistente!!!');
				textcolor(white);
				Delay(2000);
				exit;		
		 end;
		 
		 seek(tiket, index);
		 		 
		 while (not eof(tiket)) do begin
		 		read(tiket,Bilhete);
		    
				//dados pessoais
				writeln('Indice da Passagem: ', Filepos(tiket));Delay(100);
		  	writeln('Referencia do Bilhete: ',Bilhete.BilheteID);Delay(100);
		  	writeln('Nome do Viajante: ',Bilhete.Viajante);Delay(100);
		  	writeln('Genero(Sexo): ',Bilhete.Sexo);Delay(100);
	 
		 		//dados da viagem
		  	writeln('Tipo de Viajem: ',Bilhete.TipoViajem);
  			writeln('VOO: ',Bilhete.VooID);
				writeln('Cidade de Partida: ',Bilhete.Partida);
 				writeln('Cidade de Chegada: ',Bilhete.Chegada);
 				writeln('Dia do VOO: ',Bilhete.DiaPartida);
  			writeln('Adultos: ',Bilhete.PassagerAdulto);
  			writeln('Criancas: ',Bilhete.PassagerCrianca);
  			writeln('Bebes: ',Bilhete.PassagerBebes);
  			writeln('Preco do Bilhete: ',Bilhete.PrecoBilhete,'MT');
  			writeln('STATUS: ',Bilhete.status);
  			break;
		  end;
		  writeln(' ');
		  writeln('+-------------------------------------------+');
		  writeln('| Pressione | [P] - Para imprimir o Bilhete |');
		  writeln('|           | [X] - Para Sair sem Imprimir  |');
		  writeln('+-----------+-------------------------------+');
		  readln(p);
		  
		  while (UpCase(p)<>'P')and(UpCase(p)<>'X') do begin
		  		writeln('Tecla Invalida! TenteNovamente');
		  		readln(p);
		  end;
		  
		  case (UpCase(p)) of 
		  		'P':PrintBilhete;
					'X':begin
								Resposta:='N';
					      Delay(1000);
					      exit;
							end; 	 
			end;
end;
{=============================Pra sair do Programa=======================}
Procedure Sair;
var 
   s: char;
begin
    writeln('************************************');
    writeln('*         P R E S S I O N E        *');
    writeln('************************************');
    writeln('* [S] - Para ver o Menu Principal  *');
    writeln('************************************');
    writeln('* [N] - Para Fechar o Programa     *');
    writeln('************************************');
		readln(s);
		
		while (UpCase(s)<>'S')and(UpCase(s)<>'N') do begin
				if (Length(s)>1) then begin
				  write('A opcao deve Conter apenas 1 Caractere');
				end;
				writeln('Opcao Invalida! Tente Novamente');
				readln(s);
		end;
		
		case (UpCase(s)) of 
		    'S': Resposta := 'S';
		    'N': begin
		           Resposta := 'N';
						   exit;
						end;
		end;
end;


(*----------------------------PROCEDIMENTO PARA MOSTRAR TODOS OS BILHETES--------------*)
Procedure SeeAllTikets;
begin
     {$I-} reset(tiket); {$I+}
		 if IOResult <> 0 then begin
		 		writeln('O arquivo das passgens nao foi aberto corretamente!');
		 end;
		 
		 seek(tiket, 0);
		 		 
		 while (not eof(tiket)) do begin
		 		read(tiket,Bilhete);
		    
				//dados pessoais
				writeln('Indice da Passagem: ', Filepos(tiket));
		  	writeln('Referencia do Bilhete: ',Bilhete.BilheteID);
		  	writeln('Nome do Viajante: ',Bilhete.Viajante);
		  	writeln('Idade: ',Bilhete.Idade);
		  	writeln('Genero(Sexo): ',Bilhete.Sexo);
	 
		 		//dados da viagem
		  	writeln('Tipo de Viajem: ',Bilhete.TipoViajem);
  			writeln('VOO: ',Bilhete.VooID);
				writeln('Cidade de Partida: ',Bilhete.Partida);
 				writeln('Cidade de Chegada: ',Bilhete.Chegada);
 				writeln('Dia do VOO: ',Bilhete.DiaPartida);
  			writeln('Adultos: ',Bilhete.PassagerAdulto);
  			writeln('Criancas: ',Bilhete.PassagerCrianca);
  			writeln('Bebes: ',Bilhete.PassagerBebes);
  			writeln('Preco do Bilhete: ',Bilhete.PrecoBilhete,'MT');
  			writeln('STATUS: ',Bilhete.status);
  			writeln('--------------------------------------');
  			writeln;
		  end;
end;


{================================P R O G R A M A   P R I N C I P A L ===============} 
Begin
  
	OpenFile;
  
	repeat
  
    clrscr;
    
    MainMenu:
    MenuPrincipal; //Exibição do Menu Principal
    write('ESCOLHA UMA DAS OPCOES ACIMA:');readln(n);
    
    case (n) of
      '2':begin { [2] - Reservas }
        		clrscr;
        		Destiny:
        		DestinosLAM; //Exibição do Menu dos destinos Nacionais e Internacionais
        		writeln('| [V]  -  Para Voltar          |');
        		writeln('+==============================+');
        		write('ESCOLHA UMA DAS OPCOES: ');readln(a);
        		Case (UPCase(a)) of
         				'1':Begin
            					clrscr;
            					DestinosNacionais; //Exibição do Menu dos destinos Nacionais
            					writeln;
            					Delay(1000);
            					writeln('+----------------------------------+');Delay(100);
            					writeln('| [V] - Para voltar                |');Delay(100);
            					writeln('+----------------------------------+');Delay(100);
            					writeln('| [R] - Para Reservar uma passagem |');Delay(100);
            					writeln('+----------------------------------+');
            					readln(a);
											
											//Tratando Erros
											while(UpCase(a)<>'R')and(Upcase(a)<>'V') do begin
												textcolor(yellow);
											  writeln('Opcao Invalida! Tente Novamente');
											  textcolor(white);
											  readln(a);
											end;
            				
            					if (UpCase(a)='V') then begin
            							clrscr;
													Goto Destiny;
											end;
            					if (UpCase(a)='R') then begin
            							ReservarVoo;
            							if (Bilhete.Referencia <> 0) then GravarDados;
													Delay(1000);
													writeln('+----------------------------------+');Delay(100);
            							writeln('| [M] - Menu Principal             |');Delay(100);
            							writeln('+----------------------------------+');Delay(100);
            							writeln('| [E] - Fechar Programa            |');Delay(100);
            							writeln('+----------------------------------+');
            							readln(n);
            							
													while(UpCase(n)<>'M')and(Upcase(n)<>'E') do begin
											  			writeln('Opcao Invalida! Tente Novamente');
											  			readln(n);
													end;
													
            							case (UpCase(n)) of
            									'M':begin
            												clrscr;
																		Goto MainMenu;
																	end;
            									'E': Goto DeadEnd;
													end;
											end;
											
            			 		
          				  end;
          			'2':Begin
            					clrscr;
            					DestinosInter; //Exibição do Menu dos destinos Internacionais
            			 		writeln;
            			 		
            			 		Delay(1000);
            					writeln('+----------------------------------+');Delay(100);
            					writeln('| [V] - Para voltar                |');Delay(100);
            					writeln('+----------------------------------+');Delay(100);
            					writeln('| [R] - Para Reservar uma passagem |');Delay(100);
            					writeln('+----------------------------------+');
            					readln(a);
											
											//Tratando Erros
											while(UpCase(a)<>'R')and(Upcase(a)<>'V') do begin
												textcolor(yellow);
											  writeln('Opcao Invalida! Tente Novamente');
											  textcolor(white);
											  readln(a);
											end;
            				
            					if (UpCase(a)='V') then begin
            							clrscr;
													Goto Destiny;
											end;
            					if (UpCase(a)='R') then begin
            							ReservarVoo;
            							if (Bilhete.referencia <> 0)then GravarDados;
            							Delay(1000);
            							writeln('+------------------------------+');
            							writeln('| [M] - Menu Principal         |');
            							writeln('+------------------------------+');
            							writeln('| [E] - Fechar Programa        |');
            							writeln('+------------------------------+');
            							readln(n);
            							
													while(UpCase(n)<>'M')and(Upcase(n)<>'E') do begin
											  			writeln('Opcao Invalida! Tente Novamente');
											  			readln(n);
													end;
													
            							case (UpCase(n)) of
            									'M':Begin
																		clrscr; 
																		Goto MainMenu;
																	end;
            									'E': Goto DeadEnd;
													end;
											end;
          				  end;
          			'V':begin
          						Clrscr;
          						Goto MainMenu;
										end;	
          			else
          			  begin
          			      writeln('OPCAO INVALIDA! Tente Novamente');
          			  		Delay(1000);
          			  		clrscr;
          			  		Goto Destiny;
          			  end;
        		end;
      	end;
      	
      '1':begin
						clrscr; 
        		DestinosNacionais; //Exibição do Menu dos destinos Nacionais e Internacionais	
        		writeln; writeln;
        	  DestinosInter;
        	  writeln;
        	  Delay(2000);
        	  textcolor(yellow);Delay(200);
        	  writeln('+-------------------------------+');Delay(200);
            writeln('|Escolha uma das Opcoes abaixo: |');Delay(200);
            writeln('+-------------------------------+');Delay(200);
   					writeln('| [V] - Para voltar             |');Delay(200);
   					writeln('+-------------------------------+');Delay(200);
            writeln('| [E] - Fechar Programa         |');Delay(200);
            writeln('+-------------------------------+');
            readln(a);
											
						//Tratando Erros
						while(UpCase(a)<>'V')and(Upcase(a)<>'E') do begin
								writeln('Opcao Invalida! Tente Novamente');
								readln(a);
						end;
						textcolor(white);
						
						case (UpCase(a)) of
								'V':begin
											clrscr;
											Goto MainMenu;
										end;
								'E':Goto DeadEnd;
						end; 
      		end;
      		
      '3':begin
        		clrscr;
        		CargoLAM;
        		writeln;
        		CargoVoo;
        		GravarCargas;
        		PrintCargo;
        		readln;
      	end;
      '4':begin
      			clrscr;
				    ValidarBilhete;
				    readln;
					end;
			'0':Goto DeadEnd;
			'+':Begin
						clrscr;
						SeeAllTikets;
						readln;
						if (Keypressed) then goto MainMenu;
					end;
			'*':begin
			    	clrscr;
			    	VerCargas;
			    	readln;
			    	if (Keypressed) then goto MainMenu;
					end;
			else
			  begin
			      writeln('Opcao Invalida!');
			      Delay(700);
			      clrscr;
			      goto MainMenu;
			  end;	
    end;
    
  until(UPCASE(Resposta) = 'N');
  DeadEnd:
  close(tiket);
End.
  
  