create database avaliacaoPI;
use avaliacaoPI;

create table professor (
idProfessor int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
disciplina varchar(45)
)auto_increment = 10000;

insert into professor values
(null, 'Pablo', 'Silva', 'Pesquisa e inovação'),
(null, 'Rafael', 'Santos', 'Banco de Dados'),
(null, 'Fernando', 'Lopes', 'Algoritimos'),
(null, 'João', 'Pereira', 'Pesquisa e inovação');

create table grupo (
idGrupo int primary key auto_increment,
nome varchar(45),
descProjeto varchar(100)
);

insert into grupo values
(null, 'Grupo 4', 'Controle de temperatura remédios'),
(null, 'Grupo 2', 'Controle de umidade silos');

create table aluno (
RA char(8) primary key,
fkGrupo int,
nome varchar(45),
sobrenome varchar(45),
email varchar(45),
foreign key (fkGrupo) references grupo(idGrupo)
);

insert into aluno values
('01222030', 1, 'Nathan', 'Lopes', 'nathan@sptech.school'),
('01222032', 1, 'José', 'Mota', 'jose@sptech.school'),
('01222037', 1, 'Diego', 'Vieira', 'diego@sptech.school'),
('01222010', 2, 'Vinicius', 'Pereira', 'vinicius@sptech.school'),
('01222070', 2, 'Matheus', 'Resende', 'matheus@sptech.school'),
('01222045', 2, 'Pedro', 'Rocha', 'pedro@sptech.school');

create table avaliacao (
idAvaliacao int,
fkProfessor int,
fkGrupo int,
dataH datetime,
nota int,
foreign key (fkProfessor) references professor(idProfessor),
foreign key (fkGrupo) references grupo(idGrupo),
primary key(idAvaliacao, fkProfessor, fkGrupo)
);

insert into avaliacao values
(1, 10000, 1, '2022-11-04 12:40:00', 10),
(1, 10001, 1, '2022-11-04 12:40:00', 10),
(2, 10002, 2, '2022-11-04 14:20:00', 9),
(2, 10003, 2, '2022-11-04 14:20:00', 9),
(3, 10001, 1, '2022-11-07 10:40:00', 8),
(3, 10003, 1, '2022-11-07 10:40:00', 8);

select * from professor;
select * from grupo;
select * from aluno;
select * from avaliacao;

select * from grupo join aluno on fkGrupo = idGrupo;

select * from grupo join aluno on fkGrupo = idGrupo where idGrupo = 1;

select round(avg(distinct nota),0) from avaliacao;

select min(nota), max(nota) from avaliacao;

select sum(distinct nota) from avaliacao;

select professor.*, grupo.*, avaliacao.dataH from professor join avaliacao on fkProfessor = idProfessor join grupo on fkGrupo = idGrupo;

select professor.*, grupo.*, avaliacao.dataH from professor join avaliacao on fkProfessor = idProfessor join grupo on fkGrupo = idGrupo where grupo.idGrupo = 1;

select grupo.nome, professor.nome from grupo join avaliacao on idGrupo = fkGrupo join professor on idProfessor = fkProfessor where professor.nome = 'Rafael';

select grupo.*, aluno.nome, professor.nome, a.dataH from grupo join aluno on fkGrupo = idGrupo join avaliacao as a on a.fkGrupo = idGrupo join professor on idProfessor = fkProfessor;

select count(distinct nota) from avaliacao;

select p.nome'Professor', round(avg(nota),0) 'Média', sum(nota)'Soma' from professor as p join avaliacao on fkProfessor = idProfessor group by p.nome;

select g.nome'Grupo', round(avg(nota),0) 'Média', sum(nota)'Soma' from grupo as g join avaliacao on fkGrupo = idGrupo group by g.nome;

select p.nome'Professor', min(nota)'Nota mínima', max(nota)'Nota máxima' from professor as p join avaliacao on fkProfessor = idProfessor group by p.nome;

select g.nome'Grupo', min(nota)'Nota mínima', max(nota)'Nota máxima' from grupo as g join avaliacao on fkGrupo = idGrupo group by g.nome;

