create database venda;
use venda;

create table cliente (
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
cidade varchar(45),
bairro varchar(45),
rua varchar(45),
cep char(9),
complemento varchar(45),
fkClienteIndicador int,
foreign key (fkClienteIndicador) references cliente(idCliente)
);

insert into cliente values
(null, 'Nathan', 'nathan@sptech.school', 'São Paulo', 'Santa Barbara', 'Rua Laranja', '08350-000', 'Nº 1114', null),
(null, 'Misael', 'misael@sptech.school', 'São Paulo', 'Santa Maria', 'Rua Vermelha', '08770-200', 'Nº 154', 1),
(null, 'João', 'joao@sptech.school', 'São Paulo', 'Santa Luisa', 'Rua Azul', '08398-010', 'Nº 140', 1);

create table produto (
idProduto int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
preco decimal(5,2)
)auto_increment = 101;

insert into produto values
(null, 'Copo', 'Vidro 250ml', 5.99),
(null, 'Mesa', 'Madeira', 100.50),
(null, 'Garrafa', 'Plastico 600ml', 10.99),
(null, 'Travesseiro', 'Pena de ganço', 30.10),
(null, 'Bola', 'Futebol', 15.32),
(null, 'Caneta', 'Bic Preta', 1.50);

create table venda (
idVenda int,
fkCliente int,
fkProduto int,
dataH date,
quantidade int,
totalVenda decimal(6,2),
desconto decimal(5,2),
foreign key (fkCliente) references cliente(idCliente),
foreign key (fkProduto) references produto(idProduto),
primary key (idVenda, fkCliente, fkProduto)
);

insert into venda values
(1, 1, 101, '2022-10-22', 2, null, 0),
(1, 1, 102, '2022-10-22', 1, null, 0.50),
(1, 1, 105, '2022-10-22', 1, null, 1.30),
(2, 2, 103, '2022-10-24', 2, null, 0.99),
(2, 2, 104, '2022-10-24', 2, null, 1),
(3, 1, 106, '2022-10-27', 3, null, 0.30),
(4, 3, 103, '2022-10-28', 2, null, 0.45),
(5, 3, 102, '2022-10-29', 1, null, 0.10),
(5, 3, 104, '2022-10-29', 2, null, 0),
(6, 2, 101, '2022-10-29', 4, null, 0.99);


select * from cliente;
select * from produto;
select * from venda;

select * from cliente join venda on idCliente = fkCliente;

select * from cliente join venda on idCliente = fkCliente where cliente.nome = 'Nathan';

select * from cliente as indicador join cliente as indicado on indicador.idCliente = indicado.fkClienteIndicador;

select * from cliente as indicado join cliente as indicador on indicado.fkClienteIndicador = indicador.idCliente where indicador.nome = 'Nathan';

select * from cliente as indicado join cliente as indicador on indicado.fkClienteIndicador = indicador.idCliente
join venda on indicado.idCliente = venda.fkCliente join produto on venda.fkProduto = produto.idProduto;

select v.dataH 'Data', p.nome 'Produto', v.quantidade 'Quantidade' from venda as v join produto as p on v.fkProduto = p.idProduto where v.idVenda = 1 and v.fkCliente = 1; 

select p.nome 'Produto', p.preco 'Preço', sum(v.quantidade) 'Quantidade' from produto as p join venda as v on p.idProduto = v.fkProduto group by p.nome;

insert into cliente values
(null, 'Eduardo', 'eduardo@sptech.school', 'São Paulo', 'Santa Monica', 'Rua Esmeralda', '08763-510', 'Nº 736', 2);

select * from cliente left join venda on idCliente = fkCliente;

select min(preco) 'Menor Preço', max(preco)'Maior Preço' from produto;

select sum(preco) 'Soma dos Preços', round(avg(preco),2) 'Media dos Preços' from produto;

select count(preco)'Produtos acima da média' from produto where preco > 27.40;

select sum(distinct preco) from produto;

select sum(preco) "Preço Total", venda.idVenda from produto join venda on idProduto = fkProduto group by idVenda;




