Program ProjectoLAM;
{````````````````````````UNITS`````````````````````}
uses UnitMenu, Crt;

{````````````````````````TYPE``````````````````````}
Type
		BilheteVOO = Record
		  //ID do bilhete
		  Indice: Integer;
		  BilheteID: Integer;
		  
		  //dados Pesssoais
		  Ordenante: String[30];
		  Idade: Integer;
		  Sexo: char;
		  address: String;
		  EstadoCivil: String;
		  
		  //dados da viagem
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
		controle,n,a: integer;
		resposta: char;
		NomeBilhete: String;




{````````````````````````PROCEDIMENTOS`````````````}

procedure CargoVoo; //Procedimento Dos Voos de Carga
begin
  	writeln('+===========================================+');
  	writeln('|   P R O D U T O S   D E   C A R G A       |');
  	writeln('+===========================================+');
  	writeln('| Bagagem      | [1] - DE CABINE            |');
  	writeln('|              | [2] - DE PORAO             |');
  	writeln('+-------------------+-----------------------+');
  	readln(n);
  	
		case (n) of
    	1: Carga.TipoBagagem := 'Bagagem de Cabine';
    	2: Carga.TipoBagagem := 'Bagagem de Porao';
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
  	case (n) of
    	1: Carga.TipoCarga := 'Animais Vivos';
    	2: Carga.TipoCarga := 'Bens Perigosos';
    	3: Carga.TipoCarga := 'Equipamentos Desportivos';
    	4: Carga.TipoCarga := 'Armas e Municoes';
    	5: Carga.TipoCarga := 'Objectos de Alto valor';
    	6: Carga.TipoCarga := 'Produtos Alimenticios';
    	7: Carga.TipoCarga := 'Equipamentos Electricos';
    	8: Carga.TipoCarga := 'Equipamentos Medicinais';
  	end;
  
  
  	writeln('+-------------------+------------------------+');
  	writeln('|  Categoria    | [1] - Peso Leve < 1000Kg   |');
  	writeln('|     de        | [2] - Peso Medio < 2000kg  |');
  	writeln('|    Peso       | [3] - Peso Pesado > 5000Kg |');
  	writeln('+---------------+----------------------------+');
  	write('| Informe o peso em (Kg): ');readln(Carga.PesoCarga);
 		if (Carga.PesoCarga < 1000) then Carga.CategoriaPeso := 'Peso Leve';
  	if (Carga.PesoCarga > 2000) and (Carga.PesoCarga < 5000) then Carga.CategoriaPeso := 'Peso Medio';
  	if (Carga.PesoCarga >= 5000) then Carga.CategoriaPeso := 'Peso Pesado';
  
  
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
		Bilhete.BilheteID := 12345;
		Bilhete.Indice := filesize(tiket);
		Bilhete.Status := 'Nao Pago';
		cabecalho;
		textcolor(red);
		writeln('| !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! |');
		writeln('| PORFAVOR PREENCHA O FORMULARIO ABAIXO |');
		WRITEln('|---------------------------------------|');
		textcolor(white);
		write('| Nome do Ordenante da Passagem: ');read(Bilhete.Ordenante);
		writeln('+---------------------------------------+');
		write('| Idade do Ordenante: ');read(Bilhete.idade);
		writeln('+---------------------------------------+');
		write('| Sexo do Ordenante: ');read(Bilhete.sexo);
		writeln('+---------------------------------------+');
		write('| Estado Civil: '); Read(Bilhete.EstadoCivil);
		writeln('+---------------------------------------+');
		write('Morada (avenida/Bairro/quarteirao): ');read(Bilhete.address);
		writeln('+---------------------------------------+');

  	cabecalho;
  	writeln('| TIPO DE VIAJEM | [1] - So ida       |');
  	writeln('|                | [2] - Ida e Volta  |');
  	writeln('+-------------------------------------+');
  	readln(numero);
  	case (numero) of //Estrutura case of
    	1: Bilhete.TipoViajem := 'So Ida';
    	2: Bilhete.TipoViajem := 'Ida e Volta';
  	end;
  
  	Cabecalho;
  	write('| Informe o ID do Voo: ');read(vooID);
  	writeln('+-------------------------------------+');
  	Bilhete.vooID := vooID;
  	
		//Atribui o valor da passagem de acordo com o voo
  	if (vooID = 'TM2144') then Bilhete.PrecoBilhete := 6860;
  	if (vooID = 'TM2132') then Bilhete.PrecoBilhete := 5158;
  	if (vooID = 'TM2131') then Bilhete.PrecoBilhete := 4786;
  	if (vooID = 'TM2135') then Bilhete.PrecoBilhete := 3046;
  	if (vooID = 'TM2147') then Bilhete.PrecoBilhete := 1913;
  	if (vooID = 'TM2153') then Bilhete.PrecoBilhete := 3196;
  	if (vooID = 'TM2159') then Bilhete.PrecoBilhete := 5491;
  	if (vooID = 'TM2152') then Bilhete.PrecoBilhete := 4522;
  	if (vooID = 'TM3135') then Bilhete.PrecoBilhete := 5041;
  	if (vooID = 'TM2140') then Bilhete.PrecoBilhete := 5313;
  	if (vooID = 'TM2156') then Bilhete.PrecoBilhete := 7757;
  	if (vooID = 'TM2126') then Bilhete.PrecoBilhete := 2360;
  	if (vooID = 'TM2145') then Bilhete.PrecoBilhete := 3490;
  	if (vooID = 'TM1164') then Bilhete.PrecoBilhete := 4160;
  	if (vooID = 'TM2183') then Bilhete.PrecoBilhete := 7000;
  	if (vooID = 'TM2172') then Bilhete.PrecoBilhete := 2367;
  	if (vooID = 'TM2101') then Bilhete.PrecoBilhete := 4567;
  
  
  	cabecalho;
  	writeln('| Insira Nome da Cidade de Partida:  |');
  	writeln('+------------------------------------+');
  	readln(nome);
  	Bilhete.Partida := nome;
  
  	cabecalho;
  	writeln('| Insira Nome da Cidade de Chegada:  |');
  	writeln('+------------------------------------+');
  	readln(nome);
  	Bilhete.Chegada := nome;
  
  	cabecalho;
  	writeln('+----------------+--------------------+');
  	writeln('|                |[1] - Domingo       |');
  	writeln('|   Selecione    |[2] - Segunda feira |');
  	writeln('|       O        |[3] - Terca feira   |');
  	writeln('|      Dia       |[4] - Quarta feira  |');
  	writeln('|      da        |[5] - Quintna feira |');
  	writeln('|    Partida     |[6] - Sexta feira   |');
  	writeln('|                |[7] - Sabado        |');
  	writeln('+----------------+--------------------+');
  	readln(dia);
  	case (dia) of
    		1: Bilhete.DiaPartida := 'Domingo';
    		2: Bilhete.DiaPartida := 'Segunda Feira';
    		3: Bilhete.DiaPartida := 'Terca Feira';
    		4: Bilhete.DiaPartida := 'Quarta Feira';
    		5: Bilhete.DiaPartida := 'Quinta Feira';
    		6: Bilhete.DiaPartida := 'Sexta Feira';
    		7: Bilhete.DiaPartida := 'Sabado';
  	end;
  
  	cabecalho;
  	writeln('| P A S S A G E I R O S  A  B O R D O |');
  	writeln('+-------------------------------------+');
  	writeln('|             |[1]- Adultos > 12 anos |');
  	writeln('| CATEGORIA   |[2]- Criancas < 11 anos|');
  	Writeln('|             |[3]- Bebes < 2 anos    |');
  	writeln('+-------------------------------------+');
  	write('| Informe o numero de Adutlos: ');readln(Bilhete.PassagerAdulto);
  	write('| Informe o numero de Criancas: ');readln(Bilhete.PassagerCrianca);
  	write('| Informe o numero de Bebes: ');readln(Bilhete.PassagerBebes);
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
    	1:begin
      		writeln('+-------------------------------------+');
      		writeln('| Entidade :  Passagem LAM            |');
      		writeln('| Referencia: 700747                  |');
      		writeln('+-------------------------------------+');
    		end;
    	2:begin
      		writeln('+-------------------------------------+');
      		writeln('| Entidade :  Companhia Aeria LAM     |');
      		writeln('| Referencia: 100909220               |');
      		writeln('+-------------------------------------+');
    		end;
    	3:begin
      		writeln('+-------------------------------------+');
      		writeln('| Entidade :  Companhia Aeria LAM     |');
      		writeln('| Referencia: 100909220               |');
      		writeln('+-------------------------------------+');
    		end
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
	
	//extensao := '_Bilhete.uni';
	//NomeBilhete := concat(Bilhete.Ordenante, extensao); //Faz a concatenacao do nomes para gerar o nome do arquivo
  
	//atribuindo o nome externo do arquivo Tiket
	//assign(tiket, NomeBilhete);
  
	//Vai para o final do arquivo para gravar novos dados
	seek(tiket, filesize(tiket));
  
  //gravando dados no arquivo;
	write(tiket,Bilhete);
  
  writeln('Dados Gravados!');
end;

{------------------------Procedure para Validar o Bilhete---------------------}
procedure ValidarBilhete;
var
   i: integer;
	 index: integer; 
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
				exit;		
		 end;
		 
		 seek(tiket, index);
		 		 
		 while (not eof(tiket)) do begin
		 		read(tiket,Bilhete);
		    
				//dados pessoais
				writeln('Indice da Passagem: ', Filepos(tiket));
		  	writeln('Referencia do Bilhete: ',Bilhete.BilheteID);
		  	writeln('Nome do Ordenante: ',Bilhete.Ordenante);
		  	writeln('Idade do Ordenante: ',Bilhete.Idade);
		  	writeln('Genero(Sexo): ',Bilhete.Sexo);
		  	writeln('Endereco da Morada: ',Bilhete.address);
		 		writeln('Estado Civil: ',Bilhete.EstadoCivil);
	 
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
end;

{------------------Porcedimento abrir arquivo-----------}
procedure OpenFile;
begin
  assign(tiket,'Passageiros.uni');
	{$I-}
	   reset(tiket);
  {$I+}
  if (IOResult <> 0) then rewrite(tiket);
end;

{------------------Procedure para Imprimir Bilhete em arquivo de texto -----------}
procedure PrintBilhete;
begin
end;

{```````````````````````PROGRAMA PRINCIPAL`````````}
Begin
  OpenFile;
  repeat
    clrscr;
    MenuPrincipal; //Exibição do Menu Principal
    write('ESCOLHA UMA DAS OPCOES ACIMA:');readln(n);
    
    case (n) of
      1:begin { [1] - Ver Destinos LAM }
        		clrscr;
        		DestinosLAM; //Exibição do Menu dos destinos Nacionais e Internacionais
        		write('ESCOLHA UMA DAS OPCOES: ');readln(a);
        		Case (a) of
         				1:Begin
            					clrscr;
            					DestinosNacionais; //Exibição do Menu dos destinos Nacionais
            					readln;
          				end;
          			2:Begin
            					clrscr;
            					DestinosInter; //Exibição do Menu dos destinos Internacionais
            					readln;
          				end;
        		end;
      	end;
      2:begin { [2] - Reservar VOO LAM }
        		clrscr; //Limapr Tela
        		DestinosLAM; //Exibir Menu dos voos Nacionais
        		write('ESCOLHA UMA DAS OPCOES: ');readln(a); //Lê a opção escolhida
        		case (a) of
          		1:begin
            			clrscr;//Limpar Tela
            			DestinosNacionais; //Exibe
            			writeln;
            			ReservarVoo;
            			GravarDados;
            			readln;
          			end;
          		2:begin
            			clrscr;
            			DestinosInter;
            			writeln;
            			ReservarVoo;
            			readln;
          			end;
        		end;
      	end;
      3:begin
        		clrscr;
        		CargoLAM;
        		writeln;
        		CargoVoo;
        		readln;
      	end;
      4:begin
      			clrscr;
				    ValidarBilhete;
				    readln;
				end;	
    end;
    clrscr;
    writeln('************************************');
    writeln('*         P R E S S I O N E        *');
    writeln('************************************');
    writeln('* [S] - Para ver o Menu Principal  *');
    writeln('************************************');
    writeln('* [N] - Para Fechar o Programa     *');
    writeln('************************************');
    readln(Resposta);
  until(UPCASE(Resposta) = 'N');
  close(tiket);
End.
  
  