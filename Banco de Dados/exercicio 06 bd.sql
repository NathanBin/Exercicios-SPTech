create database pet;
use pet;


create table cliente (
idCliente int primary key auto_increment,
nome varchar (45),
sobrenome varchar (45),
telFixo char (11),
telCelular char (12),
rua varchar (45),
cidade varchar (45),
bairro varchar(45),
numeroCasa int
);
create table animal (
idAnimal int auto_increment,
tipo varchar (45),
nome varchar (45),
raca varchar (45),
dtNasc date,
fkCliente int,
primary key (idAnimal, fkCliente),
foreign key (fkCliente) references cliente(idCliente)
)auto_increment = 101;

insert into animal values 
(null, 'Cachorro', 'Dogão', 'Pitbull', '2020-09-13', 3),
(null, 'Papagaio', 'Lorenzo', 'Verde', '2022-10-11',4),
(null, 'Gato', 'Bolinha', 'Persa', '2021-03-18',2),
(null, 'Cachorro', 'Biruta', 'rote vai ler', '2022-02-01',1),
(null, 'Gato', 'Yumi', 'Persa', '2017-07-12',2);
insert into cliente values
(null, 'Carlos','Lopes', '11 20201012', '11 983331212', 'Rua Laranja', 'São Paulo','Cores', 149),
(null, 'Bruno','Ryu', '11 20271011', '11 983391282', 'Rua Azul', 'São Paulo','Aquarelas', 110),
(null, 'Nathan','Lopes' ,'11 20214012', '11 983831216', 'Rua Cinza', 'São Paulo','Santas artes', 1841),
(null, 'Vitor','Xavier' ,'11 20281012', '11 983671212', 'Rua Lilás', 'São Paulo','Itapevi de espectros', 14);

select * from animal;
select * from cliente;

alter table cliente modify column nome varchar (100);
select * from animal where tipo = 'gato';
select nome, dtNasc from animal;
select * from animal order by nome asc;
select * from cliente order by bairro desc;
select * from animal where nome like 'y%';
select * from cliente where sobrenome = 'lopes';
update cliente set telFixo = '11 20218952' where idCliente = 1;
select * from cliente;
select animal.*, cliente.nome as dono from animal join cliente on fkCliente = idCliente;
select animal.*, cliente.nome as dono from animal join cliente on fkCliente = idCliente where cliente.nome = 'bruno';
delete from animal where idAnimal = 103;
select * from animal;
drop table animal;
drop table cliente;
drop database pet;

-- ex 02

create database controleGasto;
use controleGasto;

create table pessoa (
idPessoa int primary key auto_increment,
nome varchar (45),
dtNasc date,
profissao varchar (45)
);
create table gasto (
idGasto int auto_increment,
dataGasto date,
valor decimal (8,2),
descricao varchar (100),
fkPessoa int,
foreign key (fkPessoa) references pessoa(idPessoa),
primary key (idGasto, fkPessoa)
);
insert into pessoa values
(null, 'Nathan', '2001-05-05', 'Estágiario'),
(null, 'Luiz', '1999-08-17', 'Vendedor'),
(null, 'João', '1948-06-01', 'Aposentado'),
(null, 'Eduardo', '2001-05-13', 'Politico');
insert into gasto values
(null, '2022-09-14', '20.50', 'Café no StarBucks', 1),
(null, '2022-09-14', '289.28', 'Compras do mês', 3),
(null, '2022-09-14', '1.50', 'Café na esquina', 2),
(null, '2022-09-14', '220.00', 'Peça para notebook', 1),
(null, '2022-09-06', '1023.89', 'Viagem para Bahia', 4);

select * from pessoa;
select * from gasto;
select * from pessoa join gasto on fkPessoa = idPessoa where pessoa.nome = 'Nathan';
select pessoa.nome, gasto.valor, gasto.descricao from pessoa join gasto on fkPessoa = idPessoa;
select pessoa.nome, gasto.valor, gasto.descricao from pessoa join gasto on fkPessoa = idPessoa where pessoa.nome = 'Nathan';
update gasto set valor = 19.25, descricao = 'Fraputinno no StarBucks' where idGasto = 1;
update pessoa set profissao = 'Psicologo' where idPessoa = 2;
delete from gasto where idGasto = 4;

drop table gasto;
drop table pessoa;
drop database controleGasto;

-- ex 03

create database praticaFuncionario;
use praticaFuncionario;

create table setor (
idSetor int primary key auto_increment,
nome varchar (45),
andar int
);
create table funcionario (
idFunc int primary key auto_increment,
nome varchar (45),
telCelular char (12),
salario decimal (8,2),
fkSetor int,
foreign key (fkSetor) references setor(idSetor)
);
create table acompanhante (
idAcomp int auto_increment,
nome varchar (45),
relacionamento varchar (45),
dtNasc date,
fkFunc int,
foreign key (fkFunc) references funcionario(idFunc),
primary key (idAcomp,fkFunc)
);
insert into setor values
(null, 'Comercial', 1),
(null, 'Desenvolvimento', 2),
(null, 'RH', 3);
insert into funcionario values
(null, 'Nathan', '11 987654312', 4730.00, 2),
(null, 'Luiz', '11 987659712', 4250.00, 3),
(null, 'Eduardo', '11 911654312', 2830.00, 1),
(null, 'Bruno', '11 945674312', 5170.00, 1),
(null, 'José', '11 985554312', 3760.00, 2);
insert into acompanhante values
(null, 'Ryan', 'Amigo', '2001-09-15', 1),
(null, 'Maria', 'Mãe', '2000-01-10', 2),
(null, 'João', 'Pai', '1948-06-01', 1),
(null, 'Paulo', 'Tio', '1998-08-03', 4),
(null, 'Cristina', 'Prima', '1999-10-07', 3),
(null, 'Fabian', 'Irmão', '1970-07-30', 5);
select * from setor;
select * from funcionario;
select * from acompanhante;
select setor.*, funcionario.nome from funcionario join setor on idSetor = fkSetor;
select setor.nome as Setor, funcionario.nome from setor join funcionario on idSetor = fkSetor where setor.nome = 'desenvolvimento';
select f.*, a.nome as acompanhante from funcionario as f join acompanhante as a on idFunc = fkFunc;
select f.*, a.* from funcionario as f join acompanhante as a on idFunc = fkFunc where f.nome = 'Nathan';
select f.*, s.*, a.* from funcionario as f join acompanhante as a on idFunc = fkFunc join setor as s on idSetor = fkSetor; 

drop database praticafuncionario;

-- ex 04

create database Treinador;
use treinador;

create table treinador (
idTrein int primary key auto_increment,
nome varchar (45),
telCelular char (12),
email varchar(45),
constraint chkemail check (email like('%@%')),
fkOrientador int,
foreign key (fkOrientador) references treinador(idTrein)
)auto_increment=10;
create table nadador (
idNad int auto_increment,
nome varchar (45),
estado varchar(45),
dtNasc date,
fkTrein int,
foreign key (fkTrein) references treinador(idTrein),
primary key (idNad, fkTrein)
)auto_increment=100;

insert into treinador values
(null, 'Nathan', '11 981237654', 'nathan@aquatec.com', null),
(null, 'Maria', '11 981237888', 'maria@aquatec.com', null),
(null, 'João', '11 981237777', 'joao@aquatec.com', null),
(null, 'William', '11 981237999', 'wiliam@aquatec.com', null),
(null, 'Thiago', '11 981237333', 'thiago@aquatec.com', null);
update treinador set fkOrientador = 10 where idTrein in (11, 12);
update treinador set fkOrientador = 13 where idTrein = 14;
update treinador set fkOrientador = 11 where idTrein = 13;
insert into nadador values
(null, 'Eduardo', 'São Paulo', '2000-05-01', 10),
(null, 'Samira', 'Rio de Janeiro', '1998-10-20', 10),
(null, 'Carlos', 'Rio de Janeiro', '2001-06-06', 11),
(null, 'Alberto', 'Amazonas', '2000-01-31', 12),
(null, 'Daniel', 'São Paulo', '2007-10-25', 14),
(null, 'Igor', 'Ceará', '2003-08-17', 13),
(null, 'Rafael', 'São Paulo', '2002-07-15', 11);

select * from treinador;
select * from nadador;
select * from treinador join nadador on fkTrein = idTrein;
select * from treinador join nadador on fkTrein = idTrein where treinador.nome = 'Nathan';
select *, treinador.nome as orientador from treinador; 
select aluno.idTrein as 'ID Treinador', aluno.nome as 'Nome Treinador', aluno.telCelular as 'Telefone', aluno.email as 'Email',
	   orientador.idTrein as 'ID Orientador', orientador.nome as 'Nome Orientador' from treinador aluno, treinador orientador 
       where aluno.idTrein <> orientador.idTrein and aluno.fkOrientador = orientador.idTrein;
select aluno.idTrein as 'ID Treinador', aluno.nome as 'Nome Treinador', aluno.telCelular as 'Telefone', aluno.email as 'Email',
	   orientador.idTrein as 'ID Orientador', orientador.nome as 'Nome Orientador' from treinador aluno, treinador orientador 
       where aluno.idTrein <> orientador.idTrein and aluno.fkOrientador = orientador.idTrein and orientador.nome = 'Nathan';
select aluno.idTrein as 'ID Treinador', aluno.nome as 'Nome Treinador', aluno.telCelular as 'Telefone', aluno.email as 'Email',
	   orientador.idTrein as 'ID Orientador', orientador.nome as 'Nome Orientador', n.idNad as 'ID Nadador', n.nome as 'Nome Nadador', 
       n.estado as 'Estado de Origem', n.dtNasc as 'Data de Nascimento' from treinador aluno, treinador orientador
       join nadador as n on fkTrein = idTrein
       where aluno.idTrein <> orientador.idTrein and aluno.fkOrientador = orientador.idTrein;
select aluno.idTrein as 'ID Treinador', aluno.nome as 'Nome Treinador', aluno.telCelular as 'Telefone', aluno.email as 'Email',
	   orientador.idTrein as 'ID Orientador', orientador.nome as 'Nome Orientador', n.idNad as 'ID Nadador', n.nome as 'Nome Nadador', 
       n.estado as 'Estado de Origem', n.dtNasc as 'Data de Nascimento' from treinador aluno, treinador orientador
       join nadador as n on fkTrein = idTrein
       where aluno.idTrein <> orientador.idTrein and aluno.fkOrientador = orientador.idTrein and aluno.nome = 'Maria';
drop database treinador;

