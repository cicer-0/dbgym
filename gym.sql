-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;
-- DBgym.dbo.Certificado definition

-- Drop table

-- DROP TABLE DBgym.dbo.Certificado;

CREATE TABLE DBgym.dbo.Certificado (
	id int IDENTITY(1,1) NOT NULL,
	nombre_certificado varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	duracion_aprendizaje int NOT NULL,
	CONSTRAINT PK_Certificado PRIMARY KEY (id)
);


-- DBgym.dbo.Direccion definition

-- Drop table

-- DROP TABLE DBgym.dbo.Direccion;

CREATE TABLE DBgym.dbo.Direccion (
	id int IDENTITY(1,1) NOT NULL,
	ciudad varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	codigo_postal varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	pais varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	especificacion varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Direccion PRIMARY KEY (id)
);


-- DBgym.dbo.Ejercicio definition

-- Drop table

-- DROP TABLE DBgym.dbo.Ejercicio;

CREATE TABLE DBgym.dbo.Ejercicio (
	id int IDENTITY(1,1) NOT NULL,
	nombre varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	series int NOT NULL,
	repeticiones int NOT NULL,
	peso_extra int NOT NULL,
	CONSTRAINT PK_Ejercicios PRIMARY KEY (id)
);


-- DBgym.dbo.HistoriaMiembro_Sesion definition

-- Drop table

-- DROP TABLE DBgym.dbo.HistoriaMiembro_Sesion;

CREATE TABLE DBgym.dbo.HistoriaMiembro_Sesion (
	[int] int NOT NULL,
	antes int NOT NULL,
	despues int NOT NULL,
	CONSTRAINT PK_HistoriaMiembro_Sesion PRIMARY KEY ([int])
);


-- DBgym.dbo.Medida_antropometrica definition

-- Drop table

-- DROP TABLE DBgym.dbo.Medida_antropometrica;

CREATE TABLE DBgym.dbo.Medida_antropometrica (
	id int IDENTITY(1,1) NOT NULL,
	circunferencia_cintura decimal(10,2) NOT NULL,
	circunferencia_cadera decimal(10,2) NOT NULL,
	circunferencia_brazo decimal(10,2) NOT NULL,
	circunferencia_muslo decimal(10,2) NOT NULL,
	circunferencia_pantorrilla decimal(10,2) NOT NULL,
	ancho_hombros decimal(10,2) NOT NULL,
	CONSTRAINT PK_Medidas_antropometricas PRIMARY KEY (id)
);


-- DBgym.dbo.Membresia definition

-- Drop table

-- DROP TABLE DBgym.dbo.Membresia;

CREATE TABLE DBgym.dbo.Membresia (
	id int IDENTITY(1,1) NOT NULL,
	nombre_plan varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	fecha_inicio date NOT NULL,
	fecha_vencimiento date NOT NULL,
	precio money NOT NULL,
	CONSTRAINT PK_Membresia PRIMARY KEY (id)
);


-- DBgym.dbo.Tipo_area_muscular definition

-- Drop table

-- DROP TABLE DBgym.dbo.Tipo_area_muscular;

CREATE TABLE DBgym.dbo.Tipo_area_muscular (
	id int IDENTITY(1,1) NOT NULL,
	nombre varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Tipo_area_muscular PRIMARY KEY (id)
);


-- DBgym.dbo.Tipo_disciplina definition

-- Drop table

-- DROP TABLE DBgym.dbo.Tipo_disciplina;

CREATE TABLE DBgym.dbo.Tipo_disciplina (
	id int IDENTITY(1,1) NOT NULL,
	nombre varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Tipo_disciplina PRIMARY KEY (id)
);


-- DBgym.dbo.Instructor definition

-- Drop table

-- DROP TABLE DBgym.dbo.Instructor;

CREATE TABLE DBgym.dbo.Instructor (
	id int IDENTITY(1,1) NOT NULL,
	nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	apellido_materno varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	apellido_paterno varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	telefono varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	correo_electronico varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	idDireccion int NOT NULL,
	CONSTRAINT PK_Instructor PRIMARY KEY (id),
	CONSTRAINT FK_Instructor_Direccion FOREIGN KEY (idDireccion) REFERENCES DBgym.dbo.Direccion(id)
);


-- DBgym.dbo.Instructor_Certificado definition

-- Drop table

-- DROP TABLE DBgym.dbo.Instructor_Certificado;

CREATE TABLE DBgym.dbo.Instructor_Certificado (
	idInstructor int NOT NULL,
	idCertificado int NOT NULL,
	CONSTRAINT PK_Instructor_Certificado PRIMARY KEY (idInstructor,idCertificado),
	CONSTRAINT FK_Instructor_Certificado_Certificado FOREIGN KEY (idCertificado) REFERENCES DBgym.dbo.Certificado(id),
	CONSTRAINT FK_Instructor_Certificado_Instructor FOREIGN KEY (idInstructor) REFERENCES DBgym.dbo.Instructor(id)
);


-- DBgym.dbo.Miembro definition

-- Drop table

-- DROP TABLE DBgym.dbo.Miembro;

CREATE TABLE DBgym.dbo.Miembro (
	id int IDENTITY(1,1) NOT NULL,
	telefono varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	correo_electronico varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	apellido_materno varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	apeliido_paterno varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	fecha_nacimiento date NOT NULL,
	fecha_inscripcion date NOT NULL,
	dni varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	idMembresia int NOT NULL,
	idDireccion int NOT NULL,
	CONSTRAINT PK_Miembro PRIMARY KEY (id),
	CONSTRAINT FK_Miembro_Direccion FOREIGN KEY (idDireccion) REFERENCES DBgym.dbo.Direccion(id),
	CONSTRAINT FK_Miembro_Membresia FOREIGN KEY (idMembresia) REFERENCES DBgym.dbo.Membresia(id)
);


-- DBgym.dbo.Progreso_entrenamiento definition

-- Drop table

-- DROP TABLE DBgym.dbo.Progreso_entrenamiento;

CREATE TABLE DBgym.dbo.Progreso_entrenamiento (
	id int IDENTITY(1,1) NOT NULL,
	fecha date NOT NULL,
	peso decimal(10,2) NOT NULL,
	altura decimal(10,2) NOT NULL,
	porcentaje_masa_muscular decimal(10,2) NOT NULL,
	porcentaje_masa_grasa decimal(10,2) NOT NULL,
	objetivos_entrenamiento varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	idMedida_antropometrica int NOT NULL,
	CONSTRAINT PK_Progreso_entrenamiento PRIMARY KEY (id),
	CONSTRAINT FK_Progreso_entrenamiento_Medida_antropometrica FOREIGN KEY (idMedida_antropometrica) REFERENCES DBgym.dbo.Medida_antropometrica(id)
);


-- DBgym.dbo.Sesion definition

-- Drop table

-- DROP TABLE DBgym.dbo.Sesion;

CREATE TABLE DBgym.dbo.Sesion (
	id int IDENTITY(1,1) NOT NULL,
	nota varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	hora_inicio time NOT NULL,
	hora_fin time NOT NULL,
	fecha date NOT NULL,
	idMiembro int NOT NULL,
	idInstructor int NOT NULL,
	idProgreso_entrenamiento int NOT NULL,
	CONSTRAINT PK_Sesion PRIMARY KEY (id),
	CONSTRAINT FK_Sesion_Instructor FOREIGN KEY (idInstructor) REFERENCES DBgym.dbo.Instructor(id),
	CONSTRAINT FK_Sesion_Miembro FOREIGN KEY (idMiembro) REFERENCES DBgym.dbo.Miembro(id),
	CONSTRAINT FK_Sesion_Progreso_entrenamiento FOREIGN KEY (idProgreso_entrenamiento) REFERENCES DBgym.dbo.Progreso_entrenamiento(id)
);


-- DBgym.dbo.Tipo_area_muscular_Ejercicio definition

-- Drop table

-- DROP TABLE DBgym.dbo.Tipo_area_muscular_Ejercicio;

CREATE TABLE DBgym.dbo.Tipo_area_muscular_Ejercicio (
	idEjercicio int NOT NULL,
	idTipo_area_muscular int NOT NULL,
	CONSTRAINT PK_Tipo_area_muscular_Ejercicios PRIMARY KEY (idEjercicio,idTipo_area_muscular),
	CONSTRAINT FK_Tipo_area_muscular_Ejercicio_Ejercicio FOREIGN KEY (idEjercicio) REFERENCES DBgym.dbo.Ejercicio(id),
	CONSTRAINT FK_Tipo_area_muscular_Ejercicio_Tipo_area_muscular FOREIGN KEY (idTipo_area_muscular) REFERENCES DBgym.dbo.Tipo_area_muscular(id)
);


-- DBgym.dbo.Tipo_disciplina_Ejercicio definition

-- Drop table

-- DROP TABLE DBgym.dbo.Tipo_disciplina_Ejercicio;

CREATE TABLE DBgym.dbo.Tipo_disciplina_Ejercicio (
	idEjercicio int NOT NULL,
	idTipo_disciplina int NOT NULL,
	CONSTRAINT PK_Tipo_disciplina_Ejercicios PRIMARY KEY (idEjercicio,idTipo_disciplina),
	CONSTRAINT FK_Tipo_disciplina_Ejercicios_Ejercicios FOREIGN KEY (idEjercicio) REFERENCES DBgym.dbo.Ejercicio(id),
	CONSTRAINT FK_Tipo_disciplina_Ejercicios_Tipo_disciplina FOREIGN KEY (idTipo_disciplina) REFERENCES DBgym.dbo.Tipo_disciplina(id)
);


-- DBgym.dbo.Ejercicio_Session definition

-- Drop table

-- DROP TABLE DBgym.dbo.Ejercicio_Session;

CREATE TABLE DBgym.dbo.Ejercicio_Session (
	idEjercicio int NOT NULL,
	idSesion int NOT NULL,
	CONSTRAINT PK_Ejercicio_Session PRIMARY KEY (idSesion,idEjercicio),
	CONSTRAINT FK_Ejercicio_Session_Ejercicio FOREIGN KEY (idEjercicio) REFERENCES DBgym.dbo.Ejercicio(id),
	CONSTRAINT FK_Ejercicio_Session_Sesion FOREIGN KEY (idSesion) REFERENCES DBgym.dbo.Sesion(id)
);


-- dbo.vw_Ejercicio_TipoDisciplina source

CREATE VIEW [vw_Ejercicio_TipoDisciplina]
AS
    SELECT e.id AS idEjercicio, e.nombre, e.descripcion, e.series, e.repeticiones, e.peso_extra, td.id AS idTipoDisciplina, td.nombre AS tipoDisciplina
    FROM Ejercicio e
        inner JOIN Tipo_disciplina_Ejercicio tde ON e.id = tde.idEjercicio
        INNER join Tipo_disciplina td on tde.idTipo_disciplina=td.id;
-- Vista vw_Sesion_Entrenamiento:
-- -- Vista que muestra la información de las sesiones de entrenamiento con detalles de miembros, instructores y progreso de entrenamiento
-- CREATE VIEW vw_Sesion_Entrenamiento AS
-- SELECT s.id, s.nota, s.hora_inicio, s.hora_fin, s.fecha, m.nombre AS nombreMiembro, i.nombre AS nombreInstructor, p.fecha AS fechaProgreso
-- FROM Sesion s
-- JOIN Miembro m ON s.idMiembro = m.id
-- JOIN Instructor i ON s.idInstructor = i.id
-- JOIN Progreso_entrenamiento p ON s.idProgreso_entrenamiento = p.id;
-- Esta vista muestra los detalles de las sesiones de entrenamiento, incluyendo la nota, hora de inicio, hora de fin, fecha, nombre del miembro, nombre del instructor y fecha del progreso de entrenamiento asociado. 



-- Vista vw_Miembro_Membresia:
-- -- Vista que muestra la información de los miembros con detalles de su membresía
-- CREATE VIEW vw_Miembro_Membresia AS
-- SELECT m.id, m.nombre, m.apellido_paterno, m.apellido_materno, m.telefono, m.correo_electronico, mb.nombre_plan, mb.fecha_inicio, mb.fecha_vencimiento, mb.precio
-- FROM Miembro m
-- JOIN Membresia mb ON m.idMembresia = mb.id;
-- Esta vista muestra los detalles de los miembros, incluyendo su nombre, apellidos, teléfono, correo electrónico, así como los detalles de su membresía, como el plan, fecha de inicio, fecha de vencimiento y precio. 


-- Vista vw_Instructor_Certificado:
-- -- Vista que muestra la información de los instructores con detalles de sus certificados
-- CREATE VIEW vw_Instructor_Certificado AS
-- SELECT i.id, i.nombre, i.apellido_paterno, i.apellido_materno, i.telefono, i.correo_electronico, c.nombre_certificado, c.descripcion, c.duracion_aprendizaje
-- FROM Instructor i
-- JOIN Instructor_Certificado ic ON i.id = ic.idInstructor
-- JOIN Certificado c ON ic.idCertificado = c.id;
-- Esta vista muestra los detalles de los instructores, incluyendo su nombre, apellidos, teléfono, correo electrónico, así como los detalles de sus certificados, como el nombre del certificado, descripción y duración de aprendizaje.;


-- dbo.vw_Instructor_Certificado source

CREATE VIEW vw_Instructor_Certificado AS
SELECT i.id, i.nombre, i.apellido_paterno, i.apellido_materno, i.telefono, i.correo_electronico, c.nombre_certificado, c.descripcion, c.duracion_aprendizaje
FROM Instructor i
JOIN Instructor_Certificado ic ON i.id = ic.idInstructor
JOIN Certificado c ON ic.idCertificado = c.id;


-- dbo.vw_Miembro_Membresia source

-- Vista que muestra la información de las sesiones de entrenamiento con detalles de miembros, instructores y progreso de entrenamie

-- Vista vw_Miembro_Membresia:
-- Vista que muestra la información de los miembros con detalles de su membresía
CREATE VIEW vw_Miembro_Membresia AS
SELECT m.id, m.nombre, m.apeliido_paterno, m.apellido_materno, m.telefono, m.correo_electronico, mb.nombre_plan, mb.fecha_inicio, mb.fecha_vencimiento, mb.precio
FROM Miembro m
JOIN Membresia mb ON m.idMembresia = mb.id;

-- Vista vw_Instructor_Certificado:
-- -- Vista que muestra la información de los instructores con detalles de sus certificados
-- CREATE VIEW vw_Instructor_Certificado AS
-- SELECT i.id, i.nombre, i.apellido_paterno, i.apellido_materno, i.telefono, i.correo_electronico, c.nombre_certificado, c.descripcion, c.duracion_aprendizaje
-- FROM Instructor i
-- JOIN Instructor_Certificado ic ON i.id = ic.idInstructor
-- JOIN Certificado c ON ic.idCertificado = c.id;
-- Esta vista muestra los detalles de los instructores, incluyendo su nombre, apellidos, teléfono, correo electrónico, así como los detalles de sus certificados, como el nombre del certificado, descripción y duración de aprendizaje.;


-- dbo.vw_Sesion_Entrenamiento source

CREATE VIEW vw_Sesion_Entrenamiento AS
SELECT s.id, s.nota, s.hora_inicio, s.hora_fin, s.fecha, m.nombre AS nombreMiembro, i.nombre AS nombreInstructor, p.fecha AS fechaProgreso
FROM Sesion s
JOIN Miembro m ON s.idMiembro = m.id
JOIN Instructor i ON s.idInstructor = i.id
JOIN Progreso_entrenamiento p ON s.idProgreso_entrenamiento = p.id;


