-- Creación de esquemas
CREATE SCHEMA General;
CREATE SCHEMA Entrenamiento;
CREATE SCHEMA Usuarios;
CREATE SCHEMA Historial;
CREATE SCHEMA Membresia;

-- Mover las tablas al esquema adecuado (asumiendo que las tablas ya están creadas en el esquema "dbo" que es el esquema por defecto)

-- General
ALTER SCHEMA General TRANSFER dbo.Direccion;
ALTER SCHEMA General TRANSFER dbo.Certificado;

-- Entrenamiento
ALTER SCHEMA Entrenamiento TRANSFER dbo.Ejercicio;
ALTER SCHEMA Entrenamiento TRANSFER dbo.Tipo_area_muscular;
ALTER SCHEMA Entrenamiento TRANSFER dbo.Tipo_disciplina;
ALTER SCHEMA Entrenamiento TRANSFER dbo.Tipo_area_muscular_Ejercicio;
ALTER SCHEMA Entrenamiento TRANSFER dbo.Tipo_disciplina_Ejercicio;
ALTER SCHEMA Entrenamiento TRANSFER dbo.Ejercicio_Session;

-- Usuarios
ALTER SCHEMA Usuarios TRANSFER dbo.Miembro;
ALTER SCHEMA Usuarios TRANSFER dbo.Instructor;
ALTER SCHEMA Usuarios TRANSFER dbo.Instructor_Certificado;

-- Historial
ALTER SCHEMA Historial TRANSFER dbo.Progreso_entrenamiento;
ALTER SCHEMA Historial TRANSFER dbo.Medida_antropometrica;
ALTER SCHEMA Historial TRANSFER dbo.Sesion;
ALTER SCHEMA Historial TRANSFER dbo.HistoriaMiembro_Sesion;

-- Membresia
ALTER SCHEMA Membresia TRANSFER dbo.Membresia;