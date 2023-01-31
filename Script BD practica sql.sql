create schema wvcontrolcoches authorization ckphsfwq;

--- 1. Modelo y sus tablas de referencia.

--- Creando Tabla Grupo Empresarial

create table wvcontrolcoches.GrupoEmpresarial(
idGrupoEmpresarial varchar(20) not null, --PK
NombreGrupoEmpresarial varchar(30) not null,
constraint GrupoEmpresarial_PK primary key(idGrupoEmpresarial)
);

--- Creando Tabla Marca

create table wvcontrolcoches.Marca(
idMarca varchar (20) not null, --PK
NombreMarca varchar (30) not null,
GrupoEmpresarial varchar (30) not null, --FK
constraint Marca_PK primary key(idMarca),
constraint Marca_GrupoEmpresarial_FK foreign key(GrupoEmpresarial)
references wvcontrolcoches.GrupoEmpresarial(idGrupoEmpresarial)
);

--- Creando Tabla Modelo

create table wvcontrolcoches.Modelo(
idModelo varchar (20) not null, --PK
NombreModelo varchar (30) not null,
Marca varchar (30) not null, --FK
constraint Modelo_PK primary key(idModelo),
constraint Modelo_Marca_FK foreign key(Marca)
references wvcontrolcoches.marca(idMarca)
);

--- Creando Tabla Color

create table wvcontrolcoches.Color(
idColor varchar (20) not null, --PK
NombreColor varchar (30) not null,
constraint Color_PK primary key(idColor)
);

--- Creando Tabla Aseguradora

create table wvcontrolcoches.Aseguradora(
idAseguradora varchar (20) not null, --PK
NombreAseguradora varchar (30) not null,
constraint Aseguradora_PK primary key(idAseguradora)
);

--- Creando Tabla Coche

create table wvcontrolcoches.Coche(
idCoche varchar (20) not null, --PK
Modelo varchar (30) not null, --FK
Color varchar (30) not null, --FK
Matricula varchar (30) not null,
FechaCompra date not null,
FechaBaja date not null default '4000-01-01',
NdePoliza varchar (50) not null,
KmTotal INT not null,
Aseguradora varchar (30) not null, --FK
constraint Coche_PK primary key (idCoche),
constraint Coche_Modelo_FK foreign key (Modelo)
references wvcontrolcoches.modelo (idModelo),
constraint Coche_Color_FK foreign key (Color)
references wvcontrolcoches.color (idColor),
constraint Coche_Aseguradora_FK foreign key (Aseguradora)
references wvcontrolcoches.aseguradora (idAseguradora)
);

--- Creando Tabla Moneda

create table wvcontrolcoches.Moneda(
idMoneda varchar(20) not null, --PK
NombreMoneda varchar(30) not null,
constraint Moneda_PK primary key(idMoneda)
);

--- Creando Tabla Revision

create table wvcontrolcoches.Revision(
idRevision varchar(20) not null, --PK
Coche varchar(20) not null,--FK
id INT not null, --ORDINAL
KmPorRevision INT not null,
FechaRevision date not null,
ImporteRevision varchar(20) not null,
Moneda varchar (20) not null, --FK
constraint Revision_PK primary key(Coche, idRevision, id),
constraint Revision_Coche_FK foreign key(Coche)
references wvcontrolcoches.Coche (idCoche),
constraint Revision_Moneda_FK foreign key(Moneda)
references wvcontrolcoches.Moneda (idMoneda)
);

------
------

--- Cargando datos en Tabla Moneda

insert into wvcontrolcoches.moneda(idmoneda, nombremoneda)values('M-001', 'Dolar');

--- Cargando datos en Tabla Color

insert into wvcontrolcoches.color(idColor, nombrecolor)values('C-001', 'Negro');
insert into wvcontrolcoches.color(idColor, nombrecolor)values('C-002', 'Azul oscuro');
insert into wvcontrolcoches.color(idColor, nombrecolor)values('C-003','Plateado');
insert into wvcontrolcoches.color(idColor, nombrecolor)values('C-004','Color perlino');
insert into wvcontrolcoches.color(idColor, nombrecolor)values('C-005','Color arena de playa');

--- Cargando datos en Tabla Aseguradora

insert into wvcontrolcoches.aseguradora(idAseguradora, nombreaseguradora)values('A-001','Generali');
insert into wvcontrolcoches.aseguradora(idAseguradora, nombreaseguradora)values('A-002','Mapfre');
insert into wvcontrolcoches.aseguradora(idAseguradora, nombreaseguradora)values('A-003','Allianz');
insert into wvcontrolcoches.aseguradora(idAseguradora, nombreaseguradora)values('A-004','Asisa');

--- Cargando datos en Tabla GrupoEmpresarial

insert into wvcontrolcoches.grupoempresarial(idGrupoEmpresarial, nombregrupoempresarial)values('G-001','VAG');
insert into wvcontrolcoches.grupoempresarial(idGrupoEmpresarial, nombregrupoempresarial)values('G-002','General Motors');
insert into wvcontrolcoches.grupoempresarial(idGrupoEmpresarial, nombregrupoempresarial)values('G-003','Daimler');
insert into wvcontrolcoches.grupoempresarial(idGrupoEmpresarial, nombregrupoempresarial)values('G-004','BMW Group');

--- Cargando datos en Tabla Marca

insert into	wvcontrolcoches.marca(idMarca, nombremarca, grupoempresarial)values('MA-001','Lamborghini','G-001');
insert into	wvcontrolcoches.marca(idMarca, nombremarca, grupoempresarial)values('MA-002','Volkswagen','G-001');
insert into	wvcontrolcoches.marca(idMarca, nombremarca, grupoempresarial)values('MA-003','Rolls-Royce','G-004');
insert into	wvcontrolcoches.marca(idMarca, nombremarca, grupoempresarial)values('MA-004','Mercedes-Benz','G-003');
insert into	wvcontrolcoches.marca(idMarca, nombremarca, grupoempresarial)values('MA-005','Bugatti','G-001');
insert into	wvcontrolcoches.marca(idMarca, nombremarca, grupoempresarial)values('MA-006','Porsche','G-001');
insert into	wvcontrolcoches.marca(idMarca, nombremarca, grupoempresarial)values('MA-007','Cadillac','G-002');

--- Cargando datos en Tabla Modelo

insert into wvcontrolcoches.modelo(idmodelo, nombremodelo, marca)values('MO-001','Boat Tail','MA-003');
insert into wvcontrolcoches.modelo(idmodelo, nombremodelo, marca)values('MO-002','Sweptail','MA-003');
insert into wvcontrolcoches.modelo(idmodelo, nombremodelo, marca)values('MO-003','Voiture Noire','MA-005');
insert into wvcontrolcoches.modelo(idmodelo, nombremodelo, marca)values('MO-004','Centodieci','MA-005');
insert into wvcontrolcoches.modelo(idmodelo, nombremodelo, marca)values('MO-005','Maybach Exelero','MA-004');
insert into wvcontrolcoches.modelo(idmodelo, nombremodelo, marca)values('MO-006','Mistral','MA-005');
insert into wvcontrolcoches.modelo(idmodelo, nombremodelo, marca)values('MO-007','Divo','MA-005');
insert into wvcontrolcoches.modelo(idmodelo, nombremodelo, marca)values('MO-008','Veneno Roadster','MA-001');
insert into wvcontrolcoches.modelo(idmodelo, nombremodelo, marca)values('MO-009','Sián','MA-001');
insert into wvcontrolcoches.modelo(idmodelo, nombremodelo, marca)values('MO-010','T-Cross 2022','MA-002');
insert into wvcontrolcoches.modelo(idmodelo, nombremodelo, marca)values('MO-011','Celestiq 2024','MA-007');
insert into wvcontrolcoches.modelo(idmodelo, nombremodelo, marca)values('MO-012','911 GT1 Stradale','MA-006');

--- Cargando datos en Tabla Coche

insert into wvcontrolcoches.coche values ('CO-001', 'MO-004', 'C-002', '1613 BHA', '2018-05-10', DEFAULT, '519-46-4393','10000','A-002');
insert into wvcontrolcoches.coche values ('CO-002','MO-010','C-001','3679 FPB','2017-09-15','2019-03-21','487-12-3098','50000','A-003');
insert into wvcontrolcoches.coche values ('CO-003','MO-001','C-002','7382 DGE','2020-04-25',DEFAULT,'010-88-7663','14000','A-004');
insert into wvcontrolcoches.coche values ('CO-004','MO-012','C-004','8871 LJJ','2019-12-24',DEFAULT,'252-40-9800','25000','A-001');
insert into wvcontrolcoches.coche values ('CO-005','MO-002','C-005','5362 AYW','2021-02-14',DEFAULT,'400-21-6327','24900','A-002');
insert into wvcontrolcoches.coche values ('CO-006','MO-005','C-003','2975 TFB','2020-06-10',DEFAULT,'450-65-5168','12000','A-003');
insert into wvcontrolcoches.coche values ('CO-007','MO-008','C-004','7556 OUC','2021-08-04',DEFAULT,'510-64-7824','23000','A-001');
insert into wvcontrolcoches.coche values ('CO-008','MO-009','C-003','2713 MRC','2022-03-18',DEFAULT,'529-21-0492','15000','A-004');
insert into wvcontrolcoches.coche values ('CO-009','MO-003','C-001','1187 SRR','2021-07-05',DEFAULT,'433-83-5521','13000','A-002');
insert into wvcontrolcoches.coche values ('CO-010','MO-006','C-002','0016 PAL','2020-10-03',DEFAULT,'503-18-6107','22000','A-003');
insert into wvcontrolcoches.coche values ('CO-011','MO-007','C-005','4605 HML','2021-09-20',DEFAULT,'426-88-4174','16000','A-002');
insert into wvcontrolcoches.coche values ('CO-012','MO-011','C-003','1012 VYN','2020-03-30',DEFAULT,'509-07-0214','33000','A-004');
insert into wvcontrolcoches.coche values ('CO-013','MO-011','C-002','2767 UTX','2021-08-25',DEFAULT,'585-54-2635','13000','A-001');

--- Cargando datos en la Tabla Revision

insert into wvcontrolcoches.revision values('RE-001','CO-001','1','10000','2019-03-18','600','M-001');
insert into wvcontrolcoches.revision values('RE-002','CO-002','2','10000','2017-11-02','550','M-001');
insert into wvcontrolcoches.revision values('RE-002','CO-002','3','20000','2018-01-14','800','M-001');
insert into wvcontrolcoches.revision values('RE-002','CO-002','4','25000','2018-05-23','1100','M-001');
insert into wvcontrolcoches.revision values('RE-002','CO-002','5','32000','2018-09-15','1000','M-001');
insert into wvcontrolcoches.revision values('RE-002','CO-002','6','42000','2018-12-28','1400','M-001');
insert into wvcontrolcoches.revision values('RE-003','CO-003','7','10000','2020-06-23','875','M-001');
insert into wvcontrolcoches.revision values('RE-004','CO-004','8','10000','2020-02-20','900','M-001');
insert into wvcontrolcoches.revision values('RE-004','CO-004','9','20000','2020-06-15','1150','M-001');
insert into wvcontrolcoches.revision values('RE-005','CO-005','10','10000','2021-05-30','975','M-001');
insert into wvcontrolcoches.revision values('RE-005','CO-005','11','20000','2021-09-05','1300','M-001');
insert into wvcontrolcoches.revision values('RE-006','CO-006','12','10000','2020-10-04','1000','M-001');
insert into wvcontrolcoches.revision values('RE-007','CO-007','13','10000','2021-12-25','1100','M-001');
insert into wvcontrolcoches.revision values('RE-007','CO-007','14','20000','2022-03-21','1250','M-001');
insert into wvcontrolcoches.revision values('RE-008','CO-008','15','10000','2022-06-25','1150','M-001');
insert into wvcontrolcoches.revision values('RE-009','CO-009','16','10000','2021-12-15','1000','M-001');
insert into wvcontrolcoches.revision values('RE-010','CO-010','17','10000','2021-01-15','1050','M-001');
insert into wvcontrolcoches.revision values('RE-010','CO-010','18','20000','2021-04-30','1250','M-001');
insert into wvcontrolcoches.revision values('RE-011','CO-011','19','10000','2021-12-29','1100','M-001');
insert into wvcontrolcoches.revision values('RE-012','CO-012','20','10000','2020-06-15','1000','M-001');
insert into wvcontrolcoches.revision values('RE-012','CO-012','21','20000','2020-09-14','1100','M-001');
insert into wvcontrolcoches.revision values('RE-012','CO-012','22','30000','2021-01-30','1400','M-001');
insert into wvcontrolcoches.revision values('RE-013','CO-013','23','10000','2021-12-30','1000','M-001');

---Final del script

