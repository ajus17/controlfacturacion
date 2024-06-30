create database contador;
use contador;

-- noinspection SqlNoDataSourceInspection
create table tipoproducto(
    codtipo int primary key auto_increment not null,
    descripciontipo varchar(250) not null
);

create table productos(
    pn VARCHAR(50) primary key not null,
    tipo int not null,
    descripcion varchar(750) not null,
    price double not null,
    yield varchar(250),
    rmvp varchar(250),
    dutycycle varchar(250),
    CONSTRAINT fktipoproducto FOREIGN KEY (tipo) REFERENCES tipoproducto(codtipo) ON UPDATE CASCADE ON DELETE CASCADE
);

create table usuarios(
    coduser int primary key auto_increment not null,
    nombre varchar(500),
    usuario varchar(500),
    contrasena varchar(750),
    correo varchar(250)
);

create table cliente(
    codCliente int primary key auto_increment not null,
    nombre varchar(500)
);

create table contrato(
    codContrato int primary key auto_increment not null,
    cliente int,
    cantMeses int,
    CONSTRAINT fkclientecontrato FOREIGN KEY (cliente) REFERENCES cliente(codCliente) ON UPDATE CASCADE ON DELETE CASCADE
);

create table facturacion(
    facturaproducto int primary key auto_increment not null,
    contrato int,
    producto VARCHAR(50),
    preciofob double,
    porcentajeflete int,
    flete double,
    margen double,
    precioventa double,
    tonermensual int,
    toneranual int,
    costoToner double,
    facturacionToner double,
    CONSTRAINT fkcontrato FOREIGN KEY (contrato) REFERENCES contrato(codContrato) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fkproducto FOREIGN KEY (producto) REFERENCES productos(pn) ON UPDATE CASCADE ON DELETE CASCADE
);
