CREATE DATABASE DB_TICKETS;

USE DB_TICKETS
GO

CREATE TABLE Eventos(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Codigo VARCHAR(50) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(350) NOT NULL,
    Fecha DATETIME NOT NULL,
	Lugar VARCHAR(50) NOT NULL,
    Direccion VARCHAR(200)NOT NULL,
	Capacidad INT NOT NULL,
    Imagen VARCHAR(200),
    Estado BIT NOT NULL DEFAULT 1
)

CREATE TABLE Usuarios (
    IDUsuario INT PRIMARY KEY IDENTITY(1,1),
    Email VARCHAR(50) NOT NULL,
    Pass VARCHAR(50) NOT NULL,
    TipoUsuario INT NOT NULL,
    DNI VARCHAR(8) NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Apellido VARCHAR(20) NOT NULL,
    fechaNacimiento DATETIME NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    CodPostal VARCHAR(10) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1,
    Imagen VARCHAR(200) NULL
    FOREIGN KEY (IDUsuario) REFERENCES Usuarios(IDUsuario)
)

CREATE TABLE TiposEntradas (
    IDTiposEntradas INT NOT NULL identity (1, 1),
    IdEvento INT NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    Precio MONEY NOT NULL,
	Cantidad INT NOT NULL,
    PRIMARY KEY (IDTiposEntradas),
    FOREIGN KEY (IdEvento) REFERENCES Eventos(Id)
)

CREATE TABLE Compra (
    IdCompra INT PRIMARY KEY IDENTITY(1,1),
    IdCliente INT NOT NULL,
	IdEvento INT NOT NULL,
    IDTiposEntradas INT NOT NULL,
	CantidadEntradas INT NOT NULL,
    FechaCompra DATETIME DEFAULT GETDATE(),
    Estado BIT NOT NULL,
	MontoTotal MONEY,
    FOREIGN KEY (IdCliente) REFERENCES Usuarios(IdUsuario),
	FOREIGN KEY (IdEvento) REFERENCES Eventos(Id)
)

CREATE TABLE Entrada (
    IdEntrada INT PRIMARY KEY IDENTITY(1,1),
    IdEvento INT NOT NULL,
    IDTiposEntradas INT NOT NULL,
	IdCompra INT NOT NULL,
    Codigo VARCHAR(5) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (IdEvento) REFERENCES Eventos(Id),
	FOREIGN KEY (IdCompra) REFERENCES Compra(IdCompra)
)

CREATE TABLE Favoritos (
    IdUsuario INT NOT NULL,
    IdEvento INT NOT NULL
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IDUsuario),
    FOREIGN KEY (IdEvento) REFERENCES Eventos(Id)
)