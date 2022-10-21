-- exercicio 1

create database sprint2;
use sprint2;
create table Atleta (
idAtleta int primary key auto_increment,
nome varchar (40),
modalidade varchar (40),
qtdMedalha int
);
insert into Atleta (nome, modalidade, qtdmedalha) values
('Nathan', 'Hockey', 501),
('Bruno', 'Hockey', 10),
('Luis', 'Futebol', 15),
('Kaio', 'Futebol', 20),
('Vitor', 'Hockey', 16);
create table País (
idPais int primary key auto_increment,
nome varchar (30),
capital varchar (40)
);
insert into país (nome, capital) values
('Brasil', 'Brasília'),
('Espanha', 'Madrid'),
('China', 'Pequim'),
('Coreia do Sul', 'Seoul');

alter table Atleta add column fkPais int;
alter table Atleta add foreign key (fkPais) references País (idPais);
select * from atleta;
select * from País;
update Atleta set fkPais = 1 where idatleta in (1,3);
update Atleta set fkpais = 2 where idatleta = 2;
update atleta set fkpais = 3 where idatleta = 4;
update atleta set fkpais = 4 where idatleta = 5;
select atleta.*, país.nome from atleta join país on idpais = fkpais;
select a.nome as Atleta, país.nome as Pais from atleta as a join país on idpais = fkpais;
select a.nome as Atleta, p.nome, p.capital as Pais from atleta as a join país as p on idpais = fkpais where capital = 'Pequim';

-- exercicio 2

create table Musica (
idMusica int primary key auto_increment,
titulo varchar (40),
artista varchar (40),
genero varchar (40)
);
insert into musica (titulo, artista, genero) values
('Ride', 'Lane del Rey', 'Indie'),
('Kiss me mora', 'DojaCat', 'Pop'),
('Counting Stars', 'One Republic', 'Pop'),
('Careless Whispers', 'George Michael', 'Pop'),
('Streets', 'DojaCat', 'Pop');
create table Album (
idAlbum int primary key auto_increment,
nome varchar (40),
tipo varchar (7),
dtLancamento date,
constraint chkTipo check (tipo in('digital', 'físico'))
);
insert into Album (nome, tipo, dtLancamento) values
('The Final', 'físico', '1986-05-05'),
('Planet Her', 'digital', '2021-05-06'),
('UltraViolence', 'digital', '2010-05-07');

select * from musica;
select * from album;
alter table musica add column fkAlbum int;
alter table musica add foreign key (fkAlbum) references Album (idAlbum);
update musica set fkalbum = 1 where idmusica = 4;
update musica set fkalbum = 2 where idmusica in (2,3,5);
update musica set fkalbum = 3 where idmusica = 1;
select * from musica join Album on idAlbum = fkAlbum;
select musica.titulo, album.nome from musica join Album on idAlbum = fkAlbum;
select musica.titulo, album.nome from musica join Album on idAlbum = fkAlbum where tipo = 'digital';


