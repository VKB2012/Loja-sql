
create database LOJA;
use LOJA;

create table TBSexo(
Codigo int,
Descricao varchar (20),
primary key (Codigo));
insert into TBSexo values (1, "Masculino");
insert into TBSexo values (2, "Feminino");
insert into TBSexo values (3, "Nao binario");

create table TB_FUNCIONARIOS(
	ID_FUNCIONARIO int   not null auto_increment,
    Nome varchar (100),
    Ano_de_contratacao Year,
    Salario float,
    Carga_horaria INT, 
    CPF char(11),
    Ano_de_nascimento YEAR,
    Carteira_de_trabalho boolean,
    Sexo int,
    celular varchar(14),
    Lucro_de_vendas float,
    
    foreign key (sexo) references TBSexo(codigo),
    
    primary key (ID_FUNCIONARIO));
   
insert into TB_FUNCIONARIOS values (1,'Maicao',2015,900.0,8,75369874125,1970,false,1,42995596234,300.0);  
insert into TB_FUNCIONARIOS values (2,'Enzo',2018,700.0,8,75369874158,2004,true,1,41985831584,200.0);  
insert into TB_FUNCIONARIOS values (3,'Claudete',2014,1400.0,8,75369874877,1990,true,2,41985831751,500.0);  
insert into TB_FUNCIONARIOS values (4,'Geraldo',2017,900.0,9,75369874444,1980,true,3,41924638741,200.0);  
insert into TB_FUNCIONARIOS values (5,'Cleiton',2019,1200.0,7,75369874999,1980,true,3,41985838514,100.0);  
insert into TB_FUNCIONARIOS values (6,'Eliza',2015,2500.0,7,75369874123,1975,true,3,41985831364,50.0);  


create table TB_Marcas(
ID_MARCA int  not null auto_increment,
Nome varchar(20),
 primary key (ID_MARCA));
 
insert into TB_Marcas values (1, "CEGA");  
insert into TB_Marcas values (2,"SONI");   
insert into TB_Marcas values (3, "MICROSOFITI");  
insert into TB_Marcas values (4,"NEMTENDO");
insert into TB_Marcas values (5,"RAIZAR");

create table TB_Reabastecimento(
	ID_REMESSA int  not null auto_increment,
    Data_de_reabastecimento DATE, 
    Fornecedor int, 
    End_Rua varchar (100),
    End_Numero char (20),
    End_CEP char (8),
    primary key (ID_REMESSA),
    foreign key(Fornecedor) references TB_Marcas(ID_MARCA));   
    
insert into TB_Reabastecimento values (1, "2020/02/06",1,"AV.Marcelo",388,54076422);  
insert into TB_Reabastecimento values (2, "2020/04/06",2,"AV.Marcelo",388,54076422);   
insert into TB_Reabastecimento values (3, "2020/06/06",3,"AV.Marcelo",388,54076422);  
insert into TB_Reabastecimento values (4, "2020/08/06",4,"AV.Marcelo",388,54076422);
insert into TB_Reabastecimento values (5, "2020/10/06",5,"AV.Marcelo",388,54076422);
insert into TB_Reabastecimento values (6, "2020/12/06",1,"AV.Marcelo",388,54076422);

create table TB_TIPO(
ID_TIPO int,
Tipo varchar(10),

primary key(ID_TIPO));

insert into TB_TIPO values (1,"Console");
insert into TB_TIPO values (2,"Jogo");
insert into TB_TIPO values (3,"Acessório");

create table TB_RESTRICAO(
ID_RES int,
idade varchar(10),

primary key(ID_RES));

insert into TB_RESTRICAO values (1,"L");
insert into TB_RESTRICAO values (2,10);
insert into TB_RESTRICAO values (3,14);
insert into TB_RESTRICAO values (4,16);
insert into TB_RESTRICAO values (5,18);

create table TB_PRODUTOS(
ID_PRODUTO int,
Nome varchar(100),
Marca int,
Ano_de_lancamento YEAR,
Preco float,
Quantia_em_estoque int,
Restricao_de_idade int,
Consoles_compativeis int,
Tipo int,
    
foreign key(Marca) references TB_Marcas(ID_MARCA),
foreign key(Tipo) references TB_TIPO(ID_TIPO),
foreign key(Restricao_de_idade) references TB_RESTRICAO(ID_RES),
foreign key(Consoles_compativeis) references TB_PRODUTOS(ID_PRODUTO),

primary key(ID_PRODUTO));

    
insert into TB_PRODUTOS values (1, "ZBOZ_370",3,2012, 2500.00, 495,1,NULL,1);
insert into TB_PRODUTOS values (2, "PRAYS_ESTATION_2",2, 2001,1200.00, 125,1,NULL,1);
insert into TB_PRODUTOS values (3, "NEMTENDO_WIII",4, 2009,2000.00, 140,1,NULL,1);
insert into TB_PRODUTOS values (4, "NEMTENDO_SWITCHIE",4, 2017,3000.0, 1000,1,NULL,1);
insert into TB_PRODUTOS values (5, "PRAYSTATION_5",2, 2020,5500.0, 20,1,NULL,1);
insert into TB_PRODUTOS values (6, "ZBOZ_DOIS_X_MAX_PLUS",3,2020, 3900.0, 50,1,NULL,1);
insert into TB_PRODUTOS values (7, "ZBOZ_DOIS_S_MAX_PLUS",3,2017,3500.0,75,1,NULL,1);
insert into TB_PRODUTOS values (8, "PRAYSTATION_4",2, 2017,2500.0, 305,1,NULL,1);

insert into TB_PRODUTOS values (9, "O Bom de Guerra",      2, 2021,97.95, 20,4,8,2);
insert into TB_PRODUTOS values (10, "Geraldo o bruxo ",    3, 2015,45.50, 36,3,7,2);
insert into TB_PRODUTOS values (11, "Final da Fantasia XV",4, 2014,105.50,14,2,4,2);
insert into TB_PRODUTOS values (12, "Infeccao pelo sangue",2, 2013,48.75, 18,4,5,2);
insert into TB_PRODUTOS values (13, "Residente do mal 8",  4, 2021,200.0, 18,4,5,2);

insert into TB_PRODUTOS values (14, "Fone_da_RAIZAR",5, 2017,250.0,25,1,7,3);
insert into TB_PRODUTOS values (15, "Headhseath_da_NEMTENDO",4,2017,400.0,90,1,4,3);
insert into TB_PRODUTOS values (16, "Mause_da_RAIZAR",5, 2015,300.0,15,1,6,3);  
insert into TB_PRODUTOS values (17, "Controle_da_ZBOZ",3,2017,150.0,75,1,1,3);
insert into TB_PRODUTOS values (18, "Controle_da_PRAYSTATION_5",2,2019,250.0,25,1,5,3);



create table TB_PAGAMENTO(
Codigo int  not null auto_increment,
Descricao varchar (20),
primary key (Codigo));

insert into TB_PAGAMENTO values (1, "Boleto");
insert into TB_PAGAMENTO values (2, "Credito");
insert into TB_PAGAMENTO values (3, "Debito"); 
insert into TB_PAGAMENTO values (4, "Pix"); 

create table TB_CLIENTE(
	ID_CLIENTE int  not null auto_increment,
    Nome_Completo varchar (100),
    Meios_de_pagamento int,
    End_Rua varchar (100),
    End_Numero char (20),
    End_CEP char (8),
    CPF char (11),
	Sexo int,
	Celular varchar(14),
    Ano_de_nascimento YEAR,
    Ano_de_cadastro YEAR,
    
    foreign key(Meios_de_pagamento) references TB_PAGAMENTO(Codigo),
    foreign key (Sexo) references TBSexo(codigo),
    
    primary key (ID_CLIENTE));
    
insert into TB_CLIENTE values (1, "Joao Couves",1,"R 123 de oliveira 4",      378,"80000000", 98431564857,1,81999955017,2004,2021);
insert into TB_CLIENTE values (2, "Obamium Carvaljo",2,"R 128 de Feira ",      45,"80000000", 34935687146,1,41932547821,1984,2015);
insert into TB_CLIENTE values (3, "Joana Margalho",3,"R 453 de Manaus",       284,"80000000", 19874834593,2,41935741287,2006,2014);
insert into TB_CLIENTE values (4, "Joao Repolho",4,"R 161 Morais ",            85,"80000000", 77637246531,3,42964636861,2012,2018);
insert into TB_CLIENTE values (5, "Henata Govisk",1,"R 521 Ribeiro",           65,"80000000", 48246571388,3,42952637461,1980,2021);
insert into TB_CLIENTE values (6, "Mira Morais",1,"R 61 de Marcelo",          841,"80000000", 13658405825,2,42965128542,1997,2020); 
insert into TB_CLIENTE values (7, "Juan Silva",1,"R 61 de Marcelo",           850,"80000000", 46328762420,3,41955746325,2013,2013); 
insert into TB_CLIENTE values (8, "Geraldo da Rivia",1,"R 123 de oliveira 4", 380,"80000000", 96325874132,1,41961756280,1992,2019);
insert into TB_CLIENTE values (9, "Fernanda Hits",3,"R 61 de carvalho",        55,"80000000", 74125896365, 2,42963178245,1998,2020);
insert into TB_CLIENTE values (10, "Batatias Frica",4,"R 123 de oliveira 4",  438,"80000000", 56123987452, 1,41935745885,1945,2021);
 
create table TB_PUBLICIDADE(
	ID_ int  not null auto_increment,
    Parceria int,
    Produto int ,
    
	foreign key(Parceria) references TB_Marcas(ID_MARCA),
    foreign key(Produto) references TB_PRODUTOS(ID_PRODUTO),
   

    primary key (ID_));
        
insert into TB_PUBLICIDADE values (1,2,5);
insert into TB_PUBLICIDADE values (2,3,7);

insert into TB_PUBLICIDADE values (3,3,1);
insert into TB_PUBLICIDADE values (4,2,2);
insert into TB_PUBLICIDADE values (5,4,3);

insert into TB_PUBLICIDADE values (6,3,10);
insert into TB_PUBLICIDADE values (7,4,11);

insert into TB_PUBLICIDADE values (8,4,13);
insert into TB_PUBLICIDADE values (9,5,14);
insert into TB_PUBLICIDADE values (10,4,15);
insert into TB_PUBLICIDADE values (11,1,NULL);
                                                             
-- 1.Qual jogo do ano passado foi mais vendido?
Select  TB_PRODUTOS.NOME,TB_PRODUTOS.Quantia_em_estoque
From  TB_PRODUTOS, TB_TIPO
Where TB_PRODUTOS.Ano_de_lancamento=2021
AND TB_TIPO.TIPO="JOGO"
AND TB_TIPO.ID_TIPO=TB_PRODUTOS.TIPO
ORDER BY TB_PRODUTOS.Quantia_em_estoque 
LIMIT 1;
                                                             
-- 2.Qual a marca com maior número de compatibilidade de acessórios?     
Select TB_MarcaS.NOME , count(*) 
From  TB_PRODUTOS,TB_MARCAS,TB_TIPO
WHERE TB_PRODUTOS.Marca=TB_MARCAS.ID_MARCA
AND TB_TIPO.TIPO="ACESSORIO"
AND TB_TIPO.ID_TIPO=TB_PRODUTOS.TIPO
GROUP BY TB_PRODUTOS.Marca 
ORDER BY COUNT(*) DESC
LIMIT 1;
   
-- 3.Quais funcionários estão perto de se aposentar?      
Select Ano_de_nascimento, Nome
From  TB_FUNCIONARIOS
WHERE Ano_de_nascimento <=1980;
                           
-- 4.Quantos funcionários tem a carteira assinada?          
Select COUNT(*)
From  TB_FUNCIONARIOS
WHERE Carteira_de_Trabalho=true;


-- 5.Quais as 3 Marcas que possui o menor numero de intens na publicidade?
Select TB_MARCAS.ID_MARCA,TB_MARCAS.NOME
From TB_PUBLICIDADE,TB_MARCAS
WHERE TB_PUBLICIDADE.PARCERIA=TB_MARCAS.ID_MARCA
GROUP BY TB_MARCAS.NOME 
ORDER BY COUNT(*) 
LIMIT 3;

  
-- 6.Quantos clientes tem o cartão de fidelidade de 3 anos? 
Select NOME_COMPLETO,Ano_de_cadastro
From  TB_CLIENTE
Where Ano_de_cadastro <=2018;
                                                                                                                                                                                                                                                                                                                                                             
-- 7.QUANTOS CLIENTES PODEM COMPRAR JOGOS +16 ?
Select count(*)
From TB_CLIENTE
WHERE TB_CLIENTE.Ano_de_nascimento<=2006;


-- 8.Quais foram os 3 funcionarios nao bin que obtiveram o maior lucro em 2022?
Select TB_FUNCIONARIOS.Nome,TB_FUNCIONARIOS.Lucro_de_vendas
From TB_FUNCIONARIOS,TBsexo
WHERE TB_FUNCIONARIOS.Sexo=TBsexo.codigo
AND TB_FUNCIONARIOS.Sexo=3
ORDER BY TB_FUNCIONARIOS.Lucro_de_vendas DESC
LIMIT 3;

-- 9.Quantos vendedores foram contratados durante o ano de 2021?
Select count(*)
From TB_FUNCIONARIOS
WHERE Ano_de_contratacao=2021;

-- 10.Qual as 2 Marcas com mais produtos na loja
Select TB_MARCAS.NOME,COUNT(*)
From TB_MARCAS,TB_PRODUTOS
Where TB_MARCAS.ID_MARCA=TB_PRODUTOS.Marca
Group By TB_MARCAS.NOME
LIMIT 2;

-- 11.Quais os sexo das 3 pessoas com mais vendas em 2022?
Select TB_FUNCIONARIOS.Nome,TBsexo.Descricao,TB_FUNCIONARIOS.Lucro_de_Vendas
From TB_FUNCIONARIOS,TBsexo
WHERE TB_FUNCIONARIOS.Sexo=TBsexo.codigo
ORDER BY TB_FUNCIONARIOS.Lucro_de_vendas desc
LIMIT 3;

-- 12.Quais funcionários que trabalham apenas meio período?
Select TB_FUNCIONARIOS.Nome
From TB_FUNCIONARIOS
WHERE TB_FUNCIONARIOS.Ano_de_nascimento>=2003;

-- 13.Qual ano teve mais cadastros de clientes?
Select TB_Cliente.Ano_de_cadastro,COUNT(*)
From TB_CLIENTE
GROUP BY TB_Cliente.Ano_de_cadastro
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 14.Qual a Marca que possui maior numero de intens na publicidade? 
Select TB_MARCAS.NOME, COUNT(*)
From TB_PUBLICIDADE,TB_MARCAS
WHERE TB_PUBLICIDADE.PARCERIA=TB_MARCAS.ID_MARCA
GROUP BY TB_MARCAS.NOME
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 15.Quais funcionarios que tem mais de 30 anos ganham R$ 1200,00 ou mais?
Select TB_FUNCIONARIOS.Nome,TB_FUNCIONARIOS.Salario+TB_FUNCIONARIOS.LUCRO_DE_VENDAS
From TB_FUNCIONARIOS
WHERE TB_FUNCIONARIOS.Ano_de_nascimento<=1992
AND TB_FUNCIONARIOS.Salario+TB_FUNCIONARIOS.LUCRO_DE_VENDAS>=1200.0;

-- 16.Quais funcionários têm mais de 5 anos na empresa?
Select TB_FUNCIONARIOS.Nome,TB_FUNCIONARIOS.Ano_de_contratacao
From TB_FUNCIONARIOS
WHERE TB_FUNCIONARIOS.Ano_de_contratacao<=2017;

-- 17.Qual o meio de pagamento mais utilizado entre as pessoas nao bin?
SELECT TB_PAGAMENTO.DESCRICAO
FROM TB_CLIENTE,TBsexo,TB_PAGAMENTO
WHERE TB_CLIENTE.SEXO=TBsexo.codigo
AND  TB_CLIENTE.SEXO=3
AND TB_CLIENTE.Meios_de_pagamento=TB_PAGAMENTO.CODIGO
group by TB_PAGAMENTO.DESCRICAO
LIMIT 1;

-- 18.Quais 5 consoles lançados depois de 2012 foram mais vendidos? 
SELECT TB_PRODUTOS.NOME,TB_PRODUTOS.Quantia_em_estoque 
FROM TB_PRODUTOS,TB_TIPO
WHERE TB_PRODUTOS.Ano_de_lancamento >=2012
AND TB_PRODUTOS.TIPO= TB_TIPO.ID_TIPO
AND TB_TIPO.ID_TIPO = 1
ORDER BY TB_PRODUTOS.Quantia_em_estoque  
LIMIT 5;

-- 19.Quais são os meios de pagamentos menos utilizados por usuarios menores de 18 anos?
SELECT TB_PAGAMENTO.DESCRICAO,count(*)
FROM TB_CLIENTE,TB_PAGAMENTO
WHERE TB_CLIENTE.Ano_de_nascimento<=2004
AND TB_CLIENTE.Meios_de_pagamento=TB_PAGAMENTO.CODIGO
group by TB_PAGAMENTO.DESCRICAO
ORDER BY count(*);

-- 20.Qual o endereço do cliente mais antigo da loja?
SELECT Nome_completo,End_Rua, End_Numero, End_CEP,Ano_de_cadastro
FROM TB_CLIENTE
ORDER BY Ano_de_cadastro
LIMIT 1;

--  -------------------------------------------------------------------------
						-- ATIVIDADE DA AVALIAÇÃO --
-- --------------------------------------------------------------------------

-- 21.Quais são os produtos mais caros da marca SONI feito para crianças? 

-- --------------------------PRODUTO CARTESIANO------------------------------
Select TB_PRODUTOS.NOME, TB_PRODUTOS.PRECO 
From  TB_PRODUTOS,TB_MARCAS,TB_Restricao
WHERE TB_MARCAS.NOME="SONI"
AND TB_PRODUTOS.Marca = TB_MARCAS.ID_MARCA 
AND TB_Restricao.IDADE="L"
AND TB_Restricao.ID_RES=TB_PRODUTOS.Restricao_de_idade 
ORDER BY TB_PRODUTOS.PRECO DESC;

-- -------------------------------JUNÇÃO-------------------------------------
SELECT TB_PRODUTOS.NOME, TB_PRODUTOS.PRECO 
FROM ((TB_PRODUTOS
INNER JOIN TB_MARCAS ON TB_MARCAS.NOME="SONI" AND TB_PRODUTOS.Marca = TB_MARCAS.ID_MARCA )
INNER JOIN TB_Restricao ON TB_Restricao.IDADE="L" AND TB_Restricao.ID_RES=TB_PRODUTOS.Restricao_de_idade )
ORDER BY PRECO DESC;
-- --------------------------------------------------------------------------
-- 22.Quais são os 2 produtos mais caros de cada categoria?
(Select NOME,PRECO From TB_PRODUTOS WHERE TIPO=1 ORDER BY PRECO DESC LIMIT 2)
UNION
(Select NOME,PRECO From TB_PRODUTOS WHERE TIPO=2 ORDER BY PRECO DESC LIMIT 2)
UNION
(Select NOME,PRECO From  TB_PRODUTOS WHERE TIPO=3 ORDER BY PRECO DESC LIMIT 2); 