-- exercicio 1

create database sprint1;
use sprint1;
create table Professor (
idProfessor int primary key auto_increment,
nome varchar (50),
sobrenome varchar (30),
especialidade1 varchar (40),
especialidade2 varchar (40)
);
insert into Professor (nome, sobrenome, especialidade1, especialidade2) values
('Vivian', 'Silva', 'Banco de dados', 'Presentear com bombom'),
('Yoshi', 'Moura', 'JavaScript', 'Toma'),
('Mônica', 'Herrero', 'Tecnologia da Informação', 'Documentação'),
('Fernanda', 'Caramico', 'Pesquisa e Inovação', 'Cantar'),
('João Pedro', 'Santos', 'JavaScript', 'Guitarra'),
('Rogério', 'Chola', 'Arquitetura Computacional', 'Ciências');

create table Disciplina (
idDisc int primary key auto_increment,
nomeDisc varchar (45)
);
insert into Disciplina (nomeDisc) values
('Algoritimos'),
('TI'),
('PI'),
('Arq Comp'),
('Banco de dados');
alter table Disciplina add column fkProfessor int;
alter table Disciplina add foreign key (fkProfessor) references Professor(idProfessor);
update disciplina set fkProfessor = 1 where idDisc = 5;
update disciplina set fkProfessor = 2 where idDisc = 1;
update disciplina set fkProfessor = 3 where idDisc = 2;
update disciplina set fkProfessor = 4 where idDisc = 3;
update disciplina set fkProfessor = 6 where idDisc = 4;
select * from professor join disciplina on fkProfessor = idProfessor;
select disciplina.nomeDisc, professor.nome from professor join disciplina on fkProfessor = idProfessor;
select professor.*, disciplina.nomeDisc from Professor join disciplina on fkProfessor = idProfessor where sobrenome = 'Silva';
select professor.especialidade1 as 'Melhor Aula', disciplina.nomeDisc as 'Me da um Bombom s2' from professor join disciplina on fkProfessor = idProfessor where sobrenome = 'Silva' order by especialidade1 asc; 

-- exercicio 2

create database sprint2;
use sprint2;
create table Curso (
idCurso int primary key auto_increment,
nome varchar (50),
sigla char (3),
coordenador varchar (40)
);
insert into curso (nome, sigla, coordenador) values
('Algoritimos', 'ALG', 'Yoshi'),
('Banco de dados', 'BDS', 'Vivian'),
('Pesquisa e Inovação', 'PSI', 'Fernanda');

create table Alunos (
idAluno int primary key auto_increment,
nome varchar (40),
comida varchar (40),
nota decimal (4,2)
);

insert into Alunos(nome, comida, nota) values
('Nathan', 'Bombom', 9.5),
('Igor', 'Nacarrão', 8),
('Luiz', 'Café em grãos', 9.75),
('Kaio', 'Pão', 9);

alter table Alunos add column fkCurso int;
alter table Alunos add foreign key (fkCurso) references Curso(idCurso);

update Alunos set fkCurso = 2 where idAluno = 1;
update Alunos set fkCurso = 1 where idAluno = 2;
update Alunos set fkCurso = 3 where idAluno = 3;
update Alunos set fkCurso = 3 where idAluno = 4;

select alunos.* , curso.* from Alunos join curso on fkCurso = idCurso;
select alunos.*, curso.nome as 'Da um Bombom pro cara' from Alunos join curso on fkCurso = idCurso where idAluno = 1;
alter table alunos add constraint chknota check (nota >=0 and nota <=10);



