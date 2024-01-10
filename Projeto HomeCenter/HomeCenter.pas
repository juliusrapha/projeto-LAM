{
@PROGRAM  Gestao de Vendas e Compras da Loja HOME CENTER
@AUTHOR Julius Raphael 
@VERSION 1.0
@DATE: 03/11/2023 
}


Program HomeCenter;
uses crt;

(****************** SUB-AREA TYPE ******************)
Type
		//Para Produtos
    produto = record                //         !
    		Nome: String;               //        ! !
    		Categoria:  String;         //       !   !
    		Referencia: String;         //      ! DO  !
    		unidades: Integer;          //     !  NOT  !
    		DataCompra: String;         //    ! MODIFY  !
    		Preco: Real;                //   !           !
    		PrecoTotal: Real;           //  !!!!!!!!!!!!!!!
    end;
    
    //Para Gestao  de stock dos Produtos
		stock = record                  //          !
				NomeProduto: String;        //         ! !
				Categoria: String;          //        !   !
				Ref: String[10];            //       ! DO  !
				Quantidade: Integer;        //      !  NOT  !         
				PrecoUnidade: Real;         //     ! MODIFY  !
				                            //    !           !
		end;                            //   !!!!!!!!!!!!!!!
	  
		Gerente = record
			  Nome: string;
			  Senha: integer;
		end;

//--------------------AREAS DOS LABELS------------------------------
label 
     MenuRaiz,
     MenuCompras,
     ManagerMenu,
     showStock,
     StockAdd,
     Finaly;
		
//----------------------------AREA DAS VARIAVEIS---------------------                                
var
   Gestor: Gerente;
   produtos, ProdutosTempo: stock;
   armazem: file of stock;
	 n,j: Integer;
   resp: char;
	 NomeRecibo,letra: String;
   movel: Produto;
   recibo: text;
   nome, voltar, sair: string;
   senha: integer;
   

(*********************PROCEDIMENTOS PARA AREA DE GESTAO DE VENDAS *************************************)

//Procedimento para criar e abrir o arquivo stck
procedure OpenStockFile;
begin
		 assign(armazem,'Armazenamento.uni');
		 
		 {$I-} reset(armazem); {$I+}
		 if (IOResult <> 0) then rewrite(armazem);
end;


//procedimento para aumentar o stock sala
procedure AdicionarStockSala;
begin
     repeat
     		OpenStockFile;
     		seek(armazem,0);
     		
     		while(not eof(armazem)) do begin
     			read(armazem,produtos);
     			ProdutosTempo.NomeProduto := Produtos.NomeProduto;
     			ProdutosTempo.Ref := Produtos.Ref;
     			ProdutosTempo.Quantidade := Produtos.Quantidade;
					ProdutosTempo.PrecoUnidade := Produtos.PrecoUnidade; 
     		end;
     		
	   		writeln('---------------------------------------');
		 		write('Nome do Produto: ');readln(Produtos.NomeProduto);
		 		write('Referencia do Produto: ');readln(Produtos.Ref);
		 		write('Quantidade: ');readln(Produtos.Quantidade);
		 		write('Preco por Unidade: ');readln(Produtos.PrecoUnidade);
		 		writeln('-------------------------------------');
				close(armazem);
				 
		 		ProdutosTempo.NomeProduto := Produtos.NomeProduto;
     		ProdutosTempo.Categoria := 'Movel Para Sala';
				ProdutosTempo.Ref := Produtos.Ref;
     		ProdutosTempo.Quantidade := ProdutosTempo.Quantidade + Produtos.Quantidade;
				ProdutosTempo.PrecoUnidade := Produtos.PrecoUnidade;
		 
		    OpenStockFile;
		 		seek(armazem, 0);
		 		write(armazem,ProdutosTempo);
		 		close(armazem);//fecha o arquivo para salvar as alteracoes
		 		
		 		write('Deseja Adicionar Outro Stock? [S] - Sim / [N] - Nao: ');
		 		readln(resp);
		 Until(UPCase(resp) = 'N');
end;

//procedimento para aumentar o stock Quartos
procedure AdicionarStockQuarto;
var
   num: integer;
begin
     repeat
     		OpenStockFile;
     		seek(armazem,1);
     		
     		while(not eof(armazem)) do begin
     			read(armazem,produtos);
     			ProdutosTempo.NomeProduto := Produtos.NomeProduto;
     			ProdutosTempo.Ref := Produtos.Ref;
     			ProdutosTempo.Quantidade := Produtos.Quantidade;
					ProdutosTempo.PrecoUnidade := Produtos.PrecoUnidade; 
     		end;
     		
	   		writeln('---------------------------------------');
		 		write('Nome do Produto: ');readln(Produtos.NomeProduto);
		 		write('Referencia do Produto: ');readln(Produtos.Ref);
		 		write('Quantidade: ');readln(Produtos.Quantidade);
		 		write('Preco por Unidade: ');readln(Produtos.PrecoUnidade);
		 		writeln('-------------------------------------'); 
		 
		 		ProdutosTempo.NomeProduto := Produtos.NomeProduto;
     		ProdutosTempo.Categoria := Produtos.Categoria;
				ProdutosTempo.Ref := Produtos.Ref;
     		ProdutosTempo.Quantidade := ProdutosTempo.Quantidade + Produtos.Quantidade;
				ProdutosTempo.PrecoUnidade := Produtos.PrecoUnidade;
		 
		 
		 		seek(armazem, 1);
		 		write(armazem,ProdutosTempo);
		 		
		 		write('Deseja Adicionar Outro Stock? [S] - Sim / [N] - Nao: ');
		 		readln(resp);
		 		close(armazem);//fecha o arquivo para salvar as alteracoes
		 Until(UPCase(resp) = 'N');
end;	


//procedimento para aumentar o stock Cozinha
procedure AdicionarStockCozinha;
var
   num: integer;
begin
     repeat
     		OpenStockFile;
     		seek(armazem,2);
     		
     		while(not eof(armazem)) do begin
     			read(armazem,produtos);
     			ProdutosTempo.NomeProduto := Produtos.NomeProduto;
     			ProdutosTempo.Ref := Produtos.Ref;
     			ProdutosTempo.Quantidade := Produtos.Quantidade;
					ProdutosTempo.PrecoUnidade := Produtos.PrecoUnidade; 
     		end;
     		
	   		writeln('---------------------------------------');
		 		write('Nome do Produto: ');readln(Produtos.NomeProduto);
		 		write('Referencia do Produto: ');readln(Produtos.Ref);
		 		write('Quantidade: ');readln(Produtos.Quantidade);
		 		write('Preco por Unidade: ');readln(Produtos.PrecoUnidade);
		 		writeln('-------------------------------------'); 
		 
		 		ProdutosTempo.NomeProduto := Produtos.NomeProduto;
     		ProdutosTempo.Categoria := Produtos.Categoria;
				ProdutosTempo.Ref := Produtos.Ref;
     		ProdutosTempo.Quantidade := ProdutosTempo.Quantidade + Produtos.Quantidade;
				ProdutosTempo.PrecoUnidade := Produtos.PrecoUnidade;
		 
		 
		 		seek(armazem, 2);
		 		write(armazem,ProdutosTempo);
		 		
		 		write('Deseja Adicionar Outro Stock? [S] - Sim / [N] - Nao: ');
		 		readln(resp);
		 		close(armazem);//fecha o arquivo para salvar as alteracoes
		 Until(UPCase(resp) = 'N');
end;	


//Procedimento para exibir o stock dos produtos
procedure ExibirStock(posicao: integer);
begin
		 seek(armazem, posicao);
		 while (not eof(armazem)) do begin
		 		read(armazem,ProdutosTempo);
		 		writeln('Stock numero: ',filepos(armazem));
		 		writeln('Categoria: ',ProdutosTempo.Categoria);
		 		//writeln('Nome do Produto: ',Produtos.NomeProduto);
		 		//writeln('Referencia: ',Produtos.Ref);
		 		writeln('Quantidade Total: ',ProdutosTempo.Quantidade);
		 		//writeln('Preco Por Unidade: ',produtos.PrecoUnidade)
		 		break;
		 end;
end;


//procedimento do menu gestao de vendas
procedure SubMenuGestao(name: string; pass: integer );
var
   j: integer;
begin
     if (name<>Gestor.Nome)and(pass<>Gestor.Senha) then 
		  begin
		 		writeln('Insira as Credenciais para fazer o LOGIN ');
		 		write('Nome: ');readln(nome);
		 		write('Senha: ');readln(senha);
		  end;
		
		 	//Validando a senha e nome do gestor
		 	if (nome = Gestor.nome) and (senha = Gestor.senha) then
		 			begin
		 		    textcolor(yellow);
		 				writeln('Acesso Permitido!!!');
		 				textcolor(white);
		 				writeln('Pressione [ENTER] para continuar!');
		 				readln;
		 			end
		 	else
		    	begin
		    		textcolor(red);
		    		writeln('Acesso Negado!!!');
		    		textcolor(white);
		    		exit;
		    	end;
		 
		 	clrscr;
		 	writeln('[1] - Ver o Stock ');
			writeln('[2] - Adicionar Stock ');
			writeln('[0] - Voltar ao Menu Principal');
		 
end;





(**********************PROCEDIMENTOS DA AREAS DE COMPRAS**********************)

//Procedimento para prencher dados do recibo                    //         !
procedure Preencherdados(p: INTEGER);                           //        ! !
var
   value: Integer;
   ref: string;
begin                                                           //       !   !
		 
		 write('Referencia do Movel: ');readln(ref);  
		 
		 if (ref='0') then begin
		 		sair:='0';
		 		exit;
		 end;
		 
		 {=======================================Moveis para sala=============================}
		 if (upcase(ref)='TPE37328') then begin
		 		Movel.Nome:= 'TAPETE';
		 		Movel.referencia := 'TPE37328';
		 		Movel.Preco := 4500;
		 end;
		 
		 if (upcase(ref)='MDJ23312') then begin		 
		 		Movel.Nome:= 'MESA DE JANTAR';             		 
		 		Movel.referencia := 'MDJ23312';    		 
		 		Movel.Preco := 18900;               		 
		 end;                                   		 
		 
		 if (upcase(ref)='MDJ44012') then begin		 
		 		Movel.Nome:= 'MESA DE JANTAR';             		 
		 		Movel.referencia := 'MDJ44012';    		 
		 		Movel.Preco := 17599;               		 
		 end;
		 
		 if (upcase(ref)='MDJ77841') then begin		 
		 		Movel.Nome:= 'MESA DE JANTAR';             		 
		 		Movel.referencia := 'MDJ77841';    		 
		 		Movel.Preco := 10999;               		 
		 end;                                   		 
		 
		 if (upcase(ref)='MDJ84563') then begin		 
		 		Movel.Nome:= 'MESA DE JANTAR';             		 
		 		Movel.referencia := 'MDJ84563';    		 
		 		Movel.Preco := 17299;               		 
		 end;
		 
		 if (upcase(ref)='MDJ45741') then begin    
		   		 		Movel.Nome:= 'MESA DE JANTAR';         
		   		 		Movel.referencia := 'MDJ45741';        
		   		 		Movel.Preco := 45900;                                                   		 
		  end;
			
			                                      
		 if	 (upcase(ref)='CB478421') then begin		 
		 			   Movel.Nome:= 'CADEIRA';             		
						   Movel.referencia := 'CB478421';    	 
						   Movel.Preco := 4199;               	 
		 end;                                   	 
						 
		 if (upcase(ref)='MDJ47411') then begin  
		 				 		Movel.Nome:= 'MESA DE JANTAR';      
		 				 		Movel.referencia := 'MDJ47411';     
		 		 		Movel.Preco := 32000;               	 
		 end;
		  
		 if (upcase(ref)='CB392114') then begin
		 		Movel.Nome:= 'CADEIRA';             
		 		Movel.referencia := 'CB392114';    		 
		 		Movel.Preco := 4999;               		 
		 end;
		 
		 if (upcase(ref)='MSR88985') then begin		 
		 		Movel.Nome:= 'MESA REDONDA';             		 
		 		Movel.referencia := 'MSR88985';    		 
		 		Movel.Preco := 42500;               		 
		 end;                                   		 
		 
		 if (upcase(ref)='SFA76348') then begin		 
		 		Movel.Nome:= 'SOFA 2 LUGARES';             		 
		 		Movel.referencia := 'SFA76348';    		 
		 		Movel.Preco := 24000;               		 
		 end;                                   		 

		 if (upcase(ref)='TBL67561') then begin
		 		Movel.Nome:= 'TABULEIRO';             
		 		Movel.referencia := 'TBL67561';    
		 		Movel.Preco := 1399;               
		 end;                                   

		 if (upcase(ref)='TCA76402') then begin
		 		Movel.Nome:= 'TACA APERITIVO';             
		 		Movel.referencia := 'TCA76402';    
		 		Movel.Preco := 289;               
		 end; 
		 
		 if (upcase(ref)='TCA71743') then begin  
		 		Movel.Nome:= 'TACA APERITIVO';       
		 		Movel.referencia := 'TCA71743';      
		 		Movel.Preco := 260;                 
		 end;
		 
		 if (upcase(ref)='FTR50023') then begin  
		 		Movel.Nome:= 'FRUTEIRA';       
		 		Movel.referencia := 'FTR50023';      
		 		Movel.Preco := 785;                 
		 end;                                     
		 
		 if (upcase(ref)='FDP76700') then begin  
		 		Movel.Nome:= 'FARSCO DISPENSA';       
		 		Movel.referencia := 'FDP76700';      
		 		Movel.Preco := 420;                 
		 end;                                     
		 
		 
		 if (upcase(ref)='APR63346') then begin  
		 		Movel.Nome:= 'APARADOR';       
		 		Movel.referencia := 'APR63346';      
		 		Movel.Preco := 2390;                 
		 end;                                     
		 
		 if (upcase(ref)='VSDR6357') then begin  
		 		Movel.Nome:= ' VASO DE COR';       
		 		Movel.referencia := 'VSDR6357';      
		 		Movel.Preco := 1100;                 
		 end;                                     
		 
		 if (upcase(ref)='CSLA5754') then begin  
		 		Movel.Nome:= 'CONSOLA';       
		 		Movel.referencia := 'CSLA5754';      
		 		Movel.Preco := 19300;                 
		 end;                                     
		 
		 
		 {=======================================Moveis para Quartos================================}
		 if (upcase(ref)='QT169232') then begin  
		 		Movel.Nome:= 'MOVEL 4 GAVETAS';       
		 		Movel.referencia := 'QT169232';      
		 		Movel.Preco := 9999;                 
		 end;                                     
		 
		 if (upcase(ref)='JLM24141') then begin  
		 		Movel.Nome:= 'Cama Solteiro';       
		 		Movel.referencia := 'JLM24141';      
		 		Movel.Preco := 16500;                 
		 end;                                     
		 
		 if (upcase(ref)='CBLZ2242') then begin  
		 		Movel.Nome:= 'Cabeceira Casal';       
		 		Movel.referencia := 'CBLZ2242';      
		 		Movel.Preco := 17999;                 
		 end;                                     
		 
		 if (upcase(ref)='CMSL2368') then begin  
		 		Movel.Nome:= 'CAMA CASAL';       
		 		Movel.referencia := 'CMSL2368';      
		 		Movel.Preco := 14999;                 
		 end;                                     
		 
		 if (upcase(ref)='ALM76347') then begin  
		 		Movel.Nome:= 'ALMOFADAS';       
		 		Movel.referencia := 'ALM76347';      
		 		Movel.Preco := 1300;                 
		 end;                                     
		 
		 if (upcase(ref)='PIC26475') then begin  
		 		Movel.Nome:= 'MOLDURA DE COR';       
		 		Movel.referencia := 'PIC26475';      
		 		Movel.Preco := 10400;                 
		 end;                                     
		 
		 if (upcase(ref)='CEST6725') then begin  
		 		Movel.Nome:= 'CONJUNTO DE 4 CESTOS';       
		 		Movel.referencia := 'CEST6725';      
		 		Movel.Preco := 800;                                                      
		 end;                                                                       
		 
		 if (upcase(ref)='LAM79489') then begin  
		 		Movel.Nome:= 'MOLDURA ESPELHO';       
		 		Movel.referencia := 'LAM79489';      
		 		Movel.Preco := 15900;                 
		 end;                                     
		 
		 if (upcase(ref)='TPE79800') then begin  
		 		Movel.Nome:= 'TAPETE';       
		 		Movel.referencia := 'TPE79800';      
		 		Movel.Preco := 10900;                 
		 end;                                     
		 
		 if (upcase(ref)='CPAL7901') then begin  
		 		Movel.Nome:= 'CAPA DE ALMOFADA';       
		 		Movel.referencia := 'CPAL7901';      
		 		Movel.Preco := 480;                 
		 end;                                     
		 
		 if (upcase(ref)='PTV47685') then begin  
		 		Movel.Nome:= 'PORTA VELA';       
		 		Movel.referencia := 'PTV47685';      
		 		Movel.Preco := 3100;                 
		 end;                                     
		 
		 if (upcase(ref)='HCNEW123') then begin  
		 		Movel.Nome:= 'POLTRONA';       
		 		Movel.referencia := 'HCNEW123';      
		 		Movel.Preco := 12100;                 
		 end;                                     
		 
		 if (upcase(ref)='RCB09227') then begin  
		 		Movel.Nome:= 'RACK PARA TV';       
		 		Movel.referencia := 'RCB09227';      
		 		Movel.Preco := 16400;                 
		 end;                                     
		 
		 if (upcase(ref)='RCB62586') then begin  
		 		Movel.Nome:= 'RAC BAIXO';       
		 		Movel.referencia := 'RCB62586';      
		 		Movel.Preco := 21900;                 
		 end; 

{==========================================MOVEIS PARA COZINHA===========================}		                                     
		 

		 if (upcase(ref)='KCZV125') then begin  
		 		Movel.Nome:= 'KIT COZINHA VITORIA';       
		 		Movel.referencia := 'KCZV125';      
		 		Movel.Preco := 11950;                 
		 end;                                     
		 
		 if (upcase(ref)='KCZP587') then begin  
		 		Movel.Nome:= 'KIT COZINHA PALOMA';       
		 		Movel.referencia := 'KCZP587';      
		 		Movel.Preco := 11750;                 
		 end;                                     
		 
		 if (upcase(ref)='KCZQ153') then begin  
		 		Movel.Nome:= 'KIT COZINHA QUARTZ';       
		 		Movel.referencia := 'KCZQ153';      
		 		Movel.Preco := 23600;                 
		 end;                                     
		 
		 if (upcase(ref)='KCZM78B') then begin  
		 		Movel.Nome:= 'KIT COZINHA MIRAGE';       
		 		Movel.referencia := 'KCZM78B';      
		 		Movel.Preco := 35800;                 
		 end;                                     
		 
		 if (upcase(ref)='KCZK54Y') then begin  
		 		Movel.Nome:= 'COZINHA DE CANTO KALI';       
		 		Movel.referencia := 'KCZK54Y';      
		 		Movel.Preco := 77290;                 
		 end;                                     
		 
		 if (upcase(ref)='KCZK54Y') then begin  
		 		Movel.Nome:= 'COZINHA ASTI PLUS';       
		 		Movel.referencia := 'KCZK54Y';      
		 		Movel.Preco := 58250;                 
		 end;                                     
		 
		 if (upcase(ref)='KCZK54Y') then begin  
		 		Movel.Nome:= 'KIT COZINHA IRACEMA';       
		 		Movel.referencia := 'KCZK54Y';      
		 		Movel.Preco := 42500;                 
		 end;
    while (length(ref) < 8) or (length(ref) >8) do 
		 Begin
		 writeln('Referencia Invalida!!!');
		 write('Tente Novamente:');
		 Readln(ref);
		end; 
	
 // FIM DO CADASTRO DOS MOVEIS                                               		                                    		 
		 write('Unidades a Comprar: ');
		 readln(Movel.unidades);
		 
     while (Movel.Unidades < 0) do begin
     		writeln('Por favor insira um valor positivo!');
     		readln(Movel.unidades);
     end;            
                 
     if (p=0)or(p=1)or(p=2) then begin
        OpenStockFile;
        seek(Armazem,p);
        read(Armazem, ProdutosTempo);
        value := ProdutosTempo.Quantidade;
        close(armazem);
        
        ProdutosTempo.Quantidade := value - Movel.unidades;
        
				OpenStockFile;
        seek(Armazem,0);
        write(Armazem,ProdutosTempo);
        close(armazem);
		 end;                                                        
end;



//Procedimento para exibicao dos produtos
procedure SubMenuProdutos;  
begin
		 writeln('[1] - Mobiliario Para Sala');
		 writeln('[2] - Mobiliario Para Quarto');
		 writeln('[3] - Sanitarios Para Cozinha');
     writeln('[0] - Para Voltar');
end;

//Procedimento para exibicao dos Moveis  de SAlA
procedure ProdutosSala;
begin
     writeln('+--------------------------------------+');
     writeln('|       Movel    | REFERENCE | PRECO   |');
     writeln('+----------------+-----------+---------+');
     writeln('| Tapete         | TPE37328  | 4500MT  |');
     writeln('| Mesa de Jantar | MDJ23312  | 18900MT |');
     writeln('| Mesa de Jantar | MDJ45741  | 45900MT |');
     writeln('| Mesa de Jantar | MDJ47411  | 32000MT |');
     writeln('| Mesa de jantar | MDJ44012  | 17599MT |');
     writeln('| Mesa de jantar | MDJ77841  | 10999MT |');
     writeln('| Mesa de jantar | MDJ84563  | 17299MT |');
     writeln('| Cadeira        | CB478421  | 4199MT  |');
     writeln('| Cadeira        | CB392114  | 4999MT  |');
     writeln('| Mesa Redonda   | MSR88985  | 42500MT |');
     writeln('| SOFA 2 LUGARES | SFA76348  | 24000MT |');
     writeln('| Tabuleiro      | TBL67561  | 1399MT  |');
     writeln('| Taca Aperitivo | TCA76402  | 289MT   |');
     writeln('| Taca Aperitivo | TCA71743  | 260MT   |');
     writeln('| Fruteira       | FTR50023  | 785MT   |');
     writeln('| Frasco dispensa| FDP76700  | 420MT   |');
     writeln('| Aparador       | APR63346  | 2390MT |');
     writeln('| Vaso DeCoR     | VSDR6357  | 1100MT  |');
     writeln('| Consola        | CSLA5754  | 19300   |');
     writeln('+----------------+-----------+---------+');
     
end;
									
//Procedimento para exibicao dos Moveis de Quarto
procedure ProdutosQuarto;
begin
		 writeln('+----------------------------------------+');
		 writeln('|     Movel       |  REF       | PRECO   |');
		 writeln('+-----------------+------------+---------+');
		 writeln('| Comoda 4 GAV    | QT169232   | 9999MT  |');
		 writeln('| Cama Solteiro   | JLM24141   | 16500MT |');
		 writeln('| Cabeceira Casal | CBLZ2242   | 17999MT |');
		 writeln('| Cama Casal      | CMSL2368   | 14999MT |');
		 writeln('| Almofadas       | ALM76347   | 1300MT  |');
		 writeln('| Moldura de Cor  | PIC26475   | 10400MT |');
		 writeln('| Cj 4 Cestos     | CEST6725   | 800MT   |');
		 writeln('| Moldura espelho | LAM79489   | 15900MT |');
		 writeln('| Tapete          | TPE79800   | 10900MT |');
		 writeln('| Capa de Almofada| CPAL7901   | 480MT   |');
		 writeln('| Poltrona        | HCNEW123   | 12100MT |');
		 writeln('| Porta Vela      | PTV47685   | 3100MT  |');
		 writeln('| Rack para TV    | RCB09227   | 16400MT |');
		 writeln('| Rack baixo      | RCB62586   | 21900MT |');
		 writeln('+-----------------+------------+---------+');
end;

//Procedimento para exibicao dos Moveis de Cozinha
PROCEDURE ProdutosCozinha;
begin
		 writeln('+------------------------------------------+');
     writeln('|        Movel         |   REF   |  PRECO  |');
     writeln('+----------------------+---------+---------+');
     writeln('| Kit Cozinha Vitoria  | KCZV125 | 11950MT |');
     writeln('| Kit Cozinha Paloma   | KCZP587 | 11750MT |');
     writeln('| Kit Cozinha Quartz   | KCZQ153 | 23600MT |');
     writeln('| Kit Cozinha Mirage   | KCZM78B | 35800MT |');
     writeln('| Cozinha de Canto KALI| KCZK54Y | 77290MT |');
     writeln('| Cozinha Asti Plus    | KCZK54Y | 58250MT |');
     writeln('| Kit Cozinha Iracema  | KCZK54Y | 42500MT |');
		 writeln('+------------------------------------------+');
end;


//Procedimento para exibicao dos produtos
procedure EmitirRecibo;
var 
   extensao: String;
   day, year, month, wday: word;
   h, m, s, ms: integer;
begin
		 extensao := concat(Movel.referencia,'.txt');
		 NomeRecibo := concat('Recibo_',extensao);                    //         !
		 assign(recibo,NomeRecibo);                                   //        ! !
		 rewrite(recibo);                                             //       !   !
		 writeln(recibo, 'Nome do Produto: ',Movel.nome);             //      ! DO  !
		 writeln(recibo, 'Categoria do Produto: ',Movel.categoria);   //     !  NOT  !
		 writeln(recibo, 'Referencia: ',Movel.referencia);            //    ! MODIFY  !
		 writeln(recibo, 'Preco do Produto: ',Movel.preco);           //   !           !
		 writeln(recibo, 'Unidades: ',Movel.unidades);                //  !!!!!!!!!!!!!!!
		 
		 //calcular o preco total
		 Movel.PrecoTotal := Movel.Preco * Movel.Unidades;
		 GetDate(year, month, day, wday);  
		 GetTime(h, m, s, ms);
		 
		 writeln(recibo, 'Preco Total da Compra: ',Movel.PrecoTotal);
		 writeln(recibo, 'Data da Compra: ',day,'/', month,'/',year, '   ',h,'h:',m,'min',s,'sec');
		 close(recibo);
		 writeln('O recibo foi Gerado!');
end;



//Logotipo da empresa
procedure LOGOTIPO;
begin
    textcolor(lightblue);
		writeln('+----------------------------------------------------------------------------------------------+');
    writeln('|                    $$$$$$$$$$$$$$$$$$$$$$$$$$ $                                              |');
		writeln('|         $$$$     $$$$$$$$$$$$$$$$$$$$$$$$$$ $$$$$                                            |');
		writeln('|         $$$$   $$$$$$$$$$$$$$$$$$$$$$$$$$$ $$$$$$$$                                          |');
		writeln('|         $$$$ $$$$$$$$$$$$$$$$$$$$$$$$$$$ $$$$$$$$$$$$                                        |');
		writeln('|         $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ $$$$$$$$$$$$$$$$                     $$$$$$$          |');
		writeln('|         $$$$$$$$$$$$$$$$$$$$$$$$$$$$ $$$$$$$$$$$$$$$$$$$$                $$$$$$$$$$$$$       |');
		writeln('|        $$$$$$$$$$$$$$$$$$$$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$$$            $$$$$$$$$$$$$$$$$     |');
		writeln('|      $$$$$$$$$$$$$$$$$$$$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$$$$$$$        $$$$$$$$$$$$$$$$$$$$    |');
		writeln('|    $$$$$$$$$$$$$$$$$$$$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     $$$$$$$$$$$$$$$$$$$$$$   |');
		writeln('|  $$$$$$$$$$$$$$$$$$$$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   $$$$$$$$$$$$$$$$$$$$$$   |');
		writeln('|     $$$$$$$$+---+---+$$$$$$$ $$$$$$$$$$$$$ _______ $$$$$$$$$$        $$$$$$$$$$$$$$$$$$$$    |');
		writeln('|     $$$$$$$$|   |   |$$$$$$$ $$$$$$$$$$$$$|       |$$$$$$$$$$          $$$$$$$$$$$$$$$$      |');  
		writeln('|     $$$$$$$$|  *|*  |$$$$$$$ $$$$$$$$$$$$$|       |$$$$$$$$$$                $$              |');
		writeln('|     $$$$$$$$|   |   |$$$$$$$ $$$$$$$$$$$$$|       |$$$$$$$$$$                $$              |');
		writeln('|     $$$$$$$$+---+---+$$$$$$$ $$$$$$$$$$$$$|*      |$$$$$$$$$$                $$              |');
		writeln('|     $$$$$$$$$$$$$$$$$$$$$$$$ $$$$$$$$$$$$$|       |$$$$$$$$$$                $$              |');
		writeln('|     $$$$$$$$$$$$$$$$$$$$$$$$ $$$$$$$$$$$$$|       |$$$$$$$$$$                $$              |');
		writeln('|  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$       $$$$$$$$$$$$$        |');
		writeln('|                                                                                              |');
		writeln('|   H   H    O O    MM     MM   EEEEE      CCCC   EEEE   NN    N  TTTTT  EEEE  RRRR            |');
		writeln('|   H   H   O   O   M M   M M   E         C       E      N N   N    T    E     R   R           |');
		writeln('|   HHHHH   O   O   M  M M  M   EEEEE     c       EEEE   N  N  N    T    EEEE  RRRR            |');  
		writeln('|   H   H   O   O   M   M   M   E         C       E      N   N N    T    E     R   R           |');
		writeln('|   H   H    O O    M       M   EEEEE      CCCC   EEEE   N    NN    T    EEEE  R   R           |');
		writeln('+----------------------------------------------------------------------------------------------+');
		textcolor(Yellow);
		writeln('PRESSIONE [ENTER]: ');
		Textcolor(white);
end; 

(*****************PROGRAMA PRINCIPAL**********************)
Begin
		Gestor.Nome := 'Julio';
		Gestor.Senha := 123;
		nome:='none';
		senha:=0000;
		LogoTipo;
		readln;
		
		repeat
				MenuRaiz: //LABEL
		    clrscr;
				writeln('MENU PRINCIPAL');
		 		writeln('[1] - Exibir Produtos e os Respectivos Precos');
		 		writeln('[2] - Gerenciar as Vendas');
		 		writeln('[3] - Sair');
				readln(n);
				case(n) of
					1:Begin
							MenuCompras: //LABEL
							clrscr;
							SubMenuProdutos;
							readln(n);
							case (n) of
     						1:Begin
     								Movel.categoria := 'Movel para Sala';
     								clrscr;
				 						ProdutosSala;
				 						PreencherDados(n);
				 						EmitirRecibo;
				 					end;
     						2:begin
     								Movel.categoria := 'Movel para Quarto';
     								clrscr;
				 						ProdutosQuarto;
				 						PreencherDados(n);
				 						EmitirRecibo;
				  				end;
     						3:begin
     								Movel.categoria := 'Movel para Cozinha';
     								clrscr;
				  					ProdutosCozinha;
				  					PreencherDados(n);
				  					EmitirRecibo;
				  				end;
				  			0:Begin
				  					Goto MenuRaiz;
									end; 
     					end;
						end;
					2:Begin
							ManagerMenu:
							clrscr;
							OpenStockFile;
							SubMenuGestao(nome, senha);
							if (Nome=Gestor.Nome)and(Senha=Gestor.Senha) then begin
								readln(j); 
		 						case (j) of 
		 							1:begin
		 							    showStock:
		 		      				clrscr;
		 		      				writeln('[1] - Exibir stock dos moveis de Sala');
		 		      				writeln('[2] - Exibir stock dos moveis de Quarto');
		 		      				writeln('[3] - Exibir stock dos moveis de Cozinha');
		 		      				writeln('[0] - Para Voltar');
		 		      				readln(j);
		 		      				if (j=0) then Goto ManagerMenu;
		 									
											if(j=1) then begin
											 clrscr; //Limpar Tela
											 ExibirStock(0);
											 writeln;
											 writeln('Pressione [V] para voltar');
											 readln(letra);
											 
											 while (UpCase(letra)<>'V') do begin
											 		write('Tecla Incorreta! Try Again: ');
											 		readln(letra);
											 end;
											 
											 if (UpCase(letra)='V') then Goto showStock;
											end;
		 									
											if(j=2) then begin 
											 clrscr; //Limpar tela
											 ExibirStock(1);
											 writeln;
											 writeln('Pressione [V] para voltar');
											 readln(letra);
											 
											 while (UpCase(letra)<>'V') do begin
											 		write('Tecla Incorreta! Try Again: ');
											 		readln(letra);
											 end;
											 
											 if (UpCase(letra)='V') then Goto showStock;
											end;
											
		 									if(j=3) then begin
											 clrscr; //Limpar tela 
											 ExibirStock(2);
											 writeln;
											 writeln('Pressione [V] para voltar');
											 readln(letra);
											 
											 while (UpCase(letra)<>'V') do begin
											 		write('Tecla Incorreta! Try Again: ');
											 		readln(letra);
											 end;
											 
											 if (UpCase(letra)='V') then Goto showStock;
											end;
		 									readln
				  					end; 
		 							2:begin
		 							    stockAdd:
		 		      				clrscr;
		 		      				writeln('[1] - Adicionar stock Para Moveis de Sala');
		 		      				writeln('[2] - Adicionar stock Para Moveis de Quarto');
		 		      				writeln('[3] - Adicionar stock Para Moveis de Cozinha');
		 		      				writeln('[0] - Para Voltar');
		 		      				readln(j);
		 		      				if(j=0) then Goto ManagerMenu;
		 									
											if(j=1) then begin 
											 AdicionarStockSala;
											 writeln;
											 writeln('Pressione [V] para voltar');
											 readln(letra);
											 
											 while (Upcase(letra)<>'V') do begin
											 		write('Tecla Incorreta! Try Again: ');
											 		readln(letra);
											 end;
											 
											 if (UpCase(letra)='V') then Goto stockAdd;
											end;
		 									
											if(j=2) then begin 
											 AdicionarStockQuarto;
											 writeln;
											 writeln('Pressione [V] para voltar');
											 readln(letra);
											 
											 while (UpCase(letra)<>'V') do begin
											 		write('Tecla Incorreta! Try Again: ');
											 		readln(letra);
											 end;
											 
											 if (UpCase(letra)='V') then Goto stockAdd;
											end;
											
		 									if(j=3) then begin 
											 AdicionarStockCozinha;
											 writeln;
											 writeln('Pressione [V] para voltar');
											 readln(letra);
											 
											 while (Upcase(letra)<>'V') do begin
											 		write('Tecla Incorreta! Try Again: ');
											 		readln(letra);
											 end;
											 
											 if (UpCase(letra)='V') then Goto stockAdd;
											end;
											
		 									readln;
		 									clrscr;
		 		  					end;
		 		  				0: Goto MenuRaiz;
								 end;
							end;
						End;
					3:exit;
					else
						writeln('Opcao Invalida');
						Delay(1000);
						Goto MenuRaiz;
				end;
				writeln;
				writeln('+--------------------------------------+');
				writeln('|Deseja Ver novamente o Menu Principal?|');
				writeln('|--------------------------------------|');
				writeln('|  [S] - SIM              [N] - Nao    |');
				writeln('+--------------------------------------+');
				read(resp);
		Until(UPCASE(resp) = 'N');
		Finaly:
End.