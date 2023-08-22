-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;

-- Tabla Certificado
CREATE TABLE Certificado (
	id int IDENTITY(1,1) NOT NULL,
	nombre_certificado varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	duracion_aprendizaje int NOT NULL,
	CONSTRAINT PK_Certificado PRIMARY KEY (id)
);

-- Tabla Direccion
CREATE TABLE Direccion (
	id int IDENTITY(1,1) NOT NULL,
	ciudad varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	codigo_postal varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	pais varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	especificacion varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Direccion PRIMARY KEY (id)
);

-- Tabla Ejercicio
CREATE TABLE Ejercicio (
	id int IDENTITY(1,1) NOT NULL,
	nombre varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	series int NOT NULL,
	repeticiones int NOT NULL,
	peso_extra int NOT NULL,
	CONSTRAINT PK_Ejercicios PRIMARY KEY (id)
);

-- Tabla HistoriaMiembro_Sesion
CREATE TABLE HistoriaMiembro_Sesion (
	[int] int NOT NULL,
	antes int NOT NULL,
	despues int NOT NULL,
	CONSTRAINT PK_HistoriaMiembro_Sesion PRIMARY KEY ([int])
);

-- Tabla Medida_antropometrica
CREATE TABLE Medida_antropometrica (
	id int IDENTITY(1,1) NOT NULL,
	circunferencia_cintura decimal(10,2) NOT NULL,
	circunferencia_cadera decimal(10,2) NOT NULL,
	circunferencia_brazo decimal(10,2) NOT NULL,
	circunferencia_muslo decimal(10,2) NOT NULL,
	circunferencia_pantorrilla decimal(10,2) NOT NULL,
	ancho_hombros decimal(10,2) NOT NULL,
	CONSTRAINT PK_Medidas_antropometricas PRIMARY KEY (id)
);

-- Tabla Membresia
CREATE TABLE Membresia (
	id int IDENTITY(1,1) NOT NULL,
	nombre_plan varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	fecha_inicio date NOT NULL,
	fecha_vencimiento date NOT NULL,
	precio money NOT NULL,
	CONSTRAINT PK_Membresia PRIMARY KEY (id)
);

-- Tabla Tipo_area_muscular
CREATE TABLE Tipo_area_muscular (
	id int IDENTITY(1,1) NOT NULL,
	nombre varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Tipo_area_muscular PRIMARY KEY (id)
);

-- Tabla Tipo_disciplina
CREATE TABLE Tipo_disciplina (
	id int IDENTITY(1,1) NOT NULL,
	nombre varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Tipo_disciplina PRIMARY KEY (id)
);

-- Tabla Instructor
CREATE TABLE Instructor (
	id int IDENTITY(1,1) NOT NULL,
	nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	apellido_materno varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	apellido_paterno varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	telefono varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	correo_electronico varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	idDireccion int NOT NULL,
	CONSTRAINT PK_Instructor PRIMARY KEY (id),
	CONSTRAINT FK_Instructor_Direccion FOREIGN KEY (idDireccion) REFERENCES Direccion(id)
);

-- Tabla Instructor_Certificado
CREATE TABLE Instructor_Certificado (
	idInstructor int NOT NULL,
	idCertificado int NOT NULL,
	CONSTRAINT PK_Instructor_Certificado PRIMARY KEY (idInstructor,idCertificado),
	CONSTRAINT FK_Instructor_Certificado_Certificado FOREIGN KEY (idCertificado) REFERENCES Certificado(id),
	CONSTRAINT FK_Instructor_Certificado_Instructor FOREIGN KEY (idInstructor) REFERENCES Instructor(id)
);

-- Tabla Miembro
CREATE TABLE Miembro (
	id int IDENTITY(1,1) NOT NULL,
	telefono varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	correo_electronico varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	apellido_materno varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	apellido_paterno varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	fecha_nacimiento date NOT NULL,
	fecha_inscripcion date NOT NULL,
	dni varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	idMembresia int NOT NULL,
	idDireccion int NOT NULL,
	CONSTRAINT PK_Miembro PRIMARY KEY (id),
	CONSTRAINT FK_Miembro_Direccion FOREIGN KEY (idDireccion) REFERENCES Direccion(id),
	CONSTRAINT FK_Miembro_Membresia FOREIGN KEY (idMembresia) REFERENCES Membresia(id)
);

-- Tabla Progreso_entrenamiento
CREATE TABLE Progreso_entrenamiento (
	id int IDENTITY(1,1) NOT NULL,
	fecha date NOT NULL,
	peso decimal(10,2) NOT NULL,
	altura decimal(10,2) NOT NULL,
	porcentaje_masa_muscular decimal(10,2) NOT NULL,
	porcentaje_masa_grasa decimal(10,2) NOT NULL,
	objetivos_entrenamiento varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	idMedida_antropometrica int NOT NULL,
	CONSTRAINT PK_Progreso_entrenamiento PRIMARY KEY (id),
	CONSTRAINT FK_Progreso_entrenamiento_Medida_antropometrica FOREIGN KEY (idMedida_antropometrica) REFERENCES Medida_antropometrica(id)
);

-- Tabla Sesion
CREATE TABLE Sesion (
	id int IDENTITY(1,1) NOT NULL,
	nota varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	hora_inicio time NOT NULL,
	hora_fin time NOT NULL,
	fecha date NOT NULL,
	idMiembro int NOT NULL,
	idInstructor int NOT NULL,
	idProgreso_entrenamiento int NOT NULL,
	CONSTRAINT PK_Sesion PRIMARY KEY (id),
	CONSTRAINT FK_Sesion_Instructor FOREIGN KEY (idInstructor) REFERENCES Instructor(id),
	CONSTRAINT FK_Sesion_Miembro FOREIGN KEY (idMiembro) REFERENCES Miembro(id),
	CONSTRAINT FK_Sesion_Progreso_entrenamiento FOREIGN KEY (idProgreso_entrenamiento) REFERENCES Progreso_entrenamiento(id)
);

-- Tabla Tipo_area_muscular_Ejercicio
CREATE TABLE Tipo_area_muscular_Ejercicio (
	idEjercicio int NOT NULL,
	idTipo_area_muscular int NOT NULL,
	CONSTRAINT PK_Tipo_area_muscular_Ejercicios PRIMARY KEY (idEjercicio,idTipo_area_muscular),
	CONSTRAINT FK_Tipo_area_muscular_Ejercicio_Ejercicio FOREIGN KEY (idEjercicio) REFERENCES Ejercicio(id),
	CONSTRAINT FK_Tipo_area_muscular_Ejercicio_Tipo_area_muscular FOREIGN KEY (idTipo_area_muscular) REFERENCES Tipo_area_muscular(id)
);

-- Tabla Tipo_disciplina_Ejercicio
CREATE TABLE Tipo_disciplina_Ejercicio (
	idEjercicio int NOT NULL,
	idTipo_disciplina int NOT NULL,
	CONSTRAINT PK_Tipo_disciplina_Ejercicios PRIMARY KEY (idEjercicio,idTipo_disciplina),
	CONSTRAINT FK_Tipo_disciplina_Ejercicios_Ejercicios FOREIGN KEY (idEjercicio) REFERENCES Ejercicio(id),
	CONSTRAINT FK_Tipo_disciplina_Ejercicios_Tipo_disciplina FOREIGN KEY (idTipo_disciplina) REFERENCES Tipo_disciplina(id)
);

-- Tabla Ejercicio_Session
CREATE TABLE Ejercicio_Session (
	idEjercicio int NOT NULL,
	idSesion int NOT NULL,
	CONSTRAINT PK_Ejercicio_Session PRIMARY KEY (idSesion,idEjercicio),
	CONSTRAINT FK_Ejercicio_Session_Ejercicio FOREIGN KEY (idEjercicio) REFERENCES Ejercicio(id),
	CONSTRAINT FK_Ejercicio_Session_Sesion FOREIGN KEY (idSesion) REFERENCES Sesion(id)
);