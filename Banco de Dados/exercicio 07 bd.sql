create database AlunoProjeto;
use AlunoProjeto;
create table projeto (
idProjeto int primary key auto_increment,
nome varchar (45),
descricao varchar (255)
);
create table aluno (
RA char (8) primary key,
fkProjeto int,
foreign key (fkProjeto) references projeto(idProjeto),
fkRepresentante char (8),
foreign key (fkRepresentante) references aluno(RA),
nome varchar (45),
telefone char (12)
);
create table acompanhante (
idAcompanhante int,
fkAluno char(8),
foreign key (fkAluno) references aluno(RA),
primary key (idAcompanhante,fkAluno),
nome varchar (45),
relacao varchar (45)
);

insert into projeto values 
(null, 'Remédios', 'Controle de temperatura e umidade de remédios para cancer'),
(null, 'Café', 'Controle de temperatura e umidade em silos'),
(null, 'Luz', 'Controle de intensidade de luz através de monitoramento de presença');

insert into aluno values
('01222010', 1, null,  'Rafael Aldo', '11 983007885'),
('01222020', 2, null,  'Bruno Ryu', '11 983005678'),
('01222030', 1, null,  'Nathan Rodrigo', '11 983007099'),
('01222040', 3, null,  'Lethicia Ferraz', '11 983033300'),
('01222050', 3, null,  'Livia Loiola', '11 983056700'),
('01222060', 2, null,  'Samuel Bryan', '11 983407000');
update aluno set fkRepresentante = '01222030' where RA in ('01222010', '01222020');
update aluno set fkRepresentante = '01222020' where RA in ('01222040', '01222050');
update aluno set fkRepresentante = '01222010' where RA = '01222060';

insert into acompanhante values 
(1, '01222030', 'Maria', 'Irmã'),
(2, '01222030', 'Ryan', 'Amigo'),
(1, '01222010', 'Alberto', 'Irmão'),
(1, '01222020', 'Eduarda', 'Amiga'),
(2, '01222020', 'Julia', 'Irmã'),
(1, '01222040', 'Kleber', 'Pai'),
(1, '01222050', 'Paulo', 'Amigo'),
(1, '01222060', 'Wesley', 'Irmão'),
(3, '01222020', 'Giovana', 'Mãe');

select * from projeto;
select * from aluno;
select * from acompanhante;

select a.ra as RA, a.nome as Aluno, p.nome as Projeto, p.descricao as 'Descrição' from aluno as a join projeto as p on fkProjeto = idProjeto;
select a.ra, a.nome as Aluno, ac.nome as Acompanhante from aluno as a join acompanhante as ac on fkAluno = RA;
select a.ra as RA, a.nome as Aluno, r.nome as Representante from aluno as a join aluno as r on r.ra = a.fkRepresentante;
select 
	a.ra as RA, a.nome as Aluno, a.telefone as Telefone, 
    p.idProjeto as ID, p.nome as Projeto, p.descricao as Descrição 
		from aluno as a join projeto as p on fkProjeto = idProjeto
			where p.nome = 'café';
select 
	a.ra as RA, a.nome as Aluno, a.telefone as Telefone,
    r.nome as Representante,
    ac.nome as Acompanhante, ac.relacao as Relação,
    p.nome as Projeto, p.descricao as Descrição
		from projeto as p
			right join aluno as a on fkProjeto = idProjeto
            left join aluno as r on r.ra = a.fkRepresentante
			join acompanhante as ac on ac.fkAluno = a.ra;
            
-- ex 2

create database Campanha;
use Campanha;

create table organizador (
idOrganizador int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
rua varchar (45),
bairro varchar (45),
email varchar (45),
fkExperiente int,
foreign key (fkExperiente) references organizador(idOrganizador)
)auto_increment = 30;

create table campanha (
idCampanha int auto_increment,
categoria varchar (45),
instituicao1 varchar (45),
instituicao2 varchar (45),
dataFinal date,
fkOrganizador int,
primary key (idCampanha, fkOrganizador)
)auto_increment = 500;
select * from organizador;
insert into organizador values
(null, 'Nathan', 'Lopes', 'Rua Libra', 'Cosmos', 'nathan.lopes@sptech.com', null),
(null, 'Wilson', 'Kanaiama', 'Rua Touro', 'Cosmos', 'wilson.kanaiama@sptech.com', null),
(null, 'José', 'Matos', 'Rua Astral', 'Cosmos', 'jose.matos@sptech.com', null);

update organizador set fkExperiente = 30 where idOrganizador in (31, 32);

insert into campanha values
(null, 'Roupa', 'São Lucas', null, '2022-12-30', 30),
(null, 'Comida', 'São Matheus', 'São Paulo', '2022-12-30', 30),
(null, 'Remédio', 'São Carlos', null, '2022-12-30', 31),
(null, 'Produto de higiene', 'São Paulo', 'São Gabriel', '2022-12-30', 32);

select * from organizador;
select * from campanha;

select * from organizador left join campanha on idOrganizador = fkOrganizador;
select * from organizador join campanha on idOrganizador = fkOrganizador where nome = 'Nathan';
select o.*, e.nome from organizador as o join organizador as e on e.idOrganizador = o.fkExperiente;
select o.*, e.nome from organizador as o join organizador as e on e.idOrganizador = o.fkExperiente where e.nome = 'Nathan';
select o.*, c.idCAmpanha, c.categoria, e.nome from organizador as o left join organizador as e on e.idOrganizador = o.fkExperiente join campanha as c
on o.idOrganizador = c.fkOrganizador;
select o.*, c.idCAmpanha, c.categoria, e.nome from organizador as o join organizador as e on e.idOrganizador = o.fkExperiente join campanha as c
on o.idOrganizador = c.fkOrganizador where o.nome = 'Wilson';







    

