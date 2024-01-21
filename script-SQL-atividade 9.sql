create database clinicaveterinaria;

create table animal (
id_animal		integer not null primary key,
nome			varchar(50) not null,
id_raca			integer not null,
id_proprietario	integer not null);

create table proprietario (
id_proprietario	integer not null primary key,
nome			varchar(50) not null,
endereco 		varchar(100) not null,
telefone		varchar(15) not null);

create table raca (
id_raca			integer not null primary key,
raca			varchar(50) not null);

ALTER TABLE animal  ADD FOREIGN KEY (id_proprietario) REFERENCES proprietario(id_proprietario);
ALTER TABLE animal ADD FOREIGN KEY (id_raca) REFERENCES raca(id_raca);

create table consulta (
id_consulta			integer not null primary key,
data				date not null,
hora				time not null,
id_animal			integer not null,
id_medico			integer not null,
id_condicaomedica		integer not null);

create table medico (
id_medico		integer not null primary key,
nome			varchar(50) not null,
endereco		varchar(100) not null,
telefone		varchar(15) not null);

create table condicaomedica (
id_condicaomedica 	integer not null primary key,
nomecientifico		varchar(100) not null,
nomecomum		varchar(100) not null);

ALTER TABLE consulta ADD FOREIGN KEY (id_animal) REFERENCES animal(id_animal);
ALTER TABLE consulta ADD FOREIGN KEY (id_medico) REFERENCES medico(id_medico);
ALTER TABLE consulta ADD FOREIGN KEY (id_condicaomedica) REFERENCES condicaomedica(id_condicaomedica);

create table raca_condicao (
id_raca_condicao	integer not null primary key,
id_raca			integer not null,
id_condicaomedica	integer not null); 

ALTER TABLE raca_condicao ADD FOREIGN KEY (id_raca) REFERENCES raca(id_raca);
ALTER TABLE raca_condicao ADD FOREIGN KEY (id_condicaomedica) REFERENCES condicaomedica(id_condicaomedica);

INSERT INTO animal VALUES 	(1001, 'Boby', 5001, 101),
				(1002, 'Eluna', 5002, 102),
				(1003, 'Luke', 5003, 103),
				(1004, 'Theo', 5004, 104),
				(1005, 'Dudu', 5005, 105),
				(1006, 'Princesa', 5006, 106),
				(1007, 'Fred', 5007, 107),
				(1008, 'Charlotte', 5008, 108);
							
INSERT INTO proprietario VALUES 	(5001, 'Simone Couto', 'Av Lions, 159', 'Sintra', '961240232'),
					(5002, 'Tainá Santos', 'Praceta das Avencas, 18, 3 DTO', 'Lisboa', '967624069'),
					(5003, 'Luis Rodrigues', 'Rua Rui Andrade, 3', 'Oeiras', '969252964'),
					(5004, 'Cristina Bonfim', 'Rua Fernando Pessoa, 8, 5 DTO','Sintra', '935164782'),
					(5005, 'Flávio Ferronato', 'Rua Carlos Ayres, 277', 'Cascais', '954853603'),
					(5006, 'Fabiana Moraes', 'Rua São José, 151, 4 ESQ', 'Cascais', '935102469'),
					(5007, 'Julia Bastos', 'Calçada da Rinchoa, 74, RC ESQ', 'Lisboa', '964152753'),
					(5008, 'Yasmin Alves', 'Rua José Magalhães, 55', 'Oeiras', '965123652');
							
INSERT INTO raca VALUES (101, 'Poodle'),
						(102, 'Gato Doméstico'),
						(103, 'Yorkshire'),
						(104, 'Gato Siamês'),
						(105, 'Hamster'),
						(106, 'Coelho Anão Holandês'),
						(107, 'Gato Bengel'),
						(108, 'Golden Retriever');
						
INSERT INTO medico VALUES 	(201, 'Adriana Ferraz', 'Rua Sorocaba, 21, RC', 'Lisboa', '941252130'),
				(202, 'Fernando Almeida', 'Av da República, 670, 6 DTO', 'Cascais', '941745412'),
				(203, 'Marco Antonio', 'Av Miguel Bombarda, 126', 'Cascais', '912000125'),
				(204, 'Gustavo Ramos', 'Praceta das Mimosas, 26, 1 ESQ', 'Oeiras', '963154972');
						
INSERT INTO condicaomedica VALUES 	(701, 'Lyssavirus Rabhdoviridae', 'Raiva Canina'),
					(702, 'Canine Distemper Vírus', 'Cinomose'),
					(703, 'Calicivírus Felino', 'Calicivirose'),
					(704, 'Peritonite Infecciosa Felina (PIF)', 'Pneumonia Felina'),
					(705, 'Spironucleus Muris', 'Doença do Sistema Digestivo'),
					(706, 'Leporipoxvirus', 'Mixomatose');
									
INSERT INTO consulta VALUES 	(100001, '2023-09-25', '08:12:05', 1001, 204, 702),
				(100002, '2023-09-25', '11:00:00', 1008, 202, 701),
				(100003, '2023-09-25', '13:15:40', 1006, 201, 706),
				(100004, '2023-09-26', '15:23:12', 1002, 201, 704),
				(100005, '2023-09-26', '16:05:30', 1003, 203, 702),
				(100006, '2023-09-27', '09:04:10', 1004, 202, 703),
				(100007, '2023-09-27', '10:37:19', 1005, 204, 705),
				(100008, '2023-09-27', '12:01:42', 1007, 202, 704),
				(100009, '2023-09-28', '14:44:19', 1006, 203, 706),
				(100010, '2023-09-28', '17:12:14', 1008, 201, 701),
				(100011, '2023-09-29', '10:17:20', 1002, 204, 703),
				(100012, '2023-09-29', '13:56:48', 1004, 202, 704),
				(100013, '2023-09-29', '18:00:08', 1003, 203, 701),
				(100014, '2023-10-02', '09:35:27', 1007, 204, 704),
				(100015, '2023-10-02', '12:04:31', 1008, 203, 701),
				(100016, '2023-10-02', '16:05:39', 1001, 204, 702);

INSERT INTO raca_condicao VALUES 	(301, 101, 702),
					(302, 108, 701),
					(303, 106, 706),
					(304, 102, 704),
					(305, 103, 702),
					(306, 104, 703),
					(307, 105, 705),
					(308, 107, 704),
					(309, 106, 706),
					(310, 108, 701),
					(311, 102, 703),
					(312, 104, 704),
					(313, 103, 701),
					(314, 107, 704),
					(315, 108, 701),
					(316, 101, 702);
