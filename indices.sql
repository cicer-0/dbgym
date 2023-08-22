-- Índice en la tabla Certificado en la columna nombre_certificado
CREATE INDEX IX_Certificado_NombreCertificado ON Certificado(nombre_certificado);

-- Índice en la tabla Direccion en la columna ciudad
CREATE INDEX IX_Direccion_Ciudad ON Direccion(ciudad);

-- Índice en la tabla Ejercicio en la columna nombre
CREATE INDEX IX_Ejercicio_Nombre ON Ejercicio(nombre);

-- Índice en la tabla Miembro en la columna correo_electronico
CREATE UNIQUE INDEX IX_Miembro_CorreoElectronico ON Miembro(correo_electronico);

-- Índice en la tabla Instructor en las columnas apellido_paterno y apellido_materno
CREATE INDEX IX_Instructor_Apellidos ON Instructor(apellido_paterno, apellido_materno);

-- Índice en la tabla Progreso_entrenamiento en la columna fecha
CREATE INDEX IX_ProgresoEntrenamiento_Fecha ON Progreso_entrenamiento(fecha);

-- Índice en la tabla Sesion en la columna fecha
CREATE INDEX IX_Sesion_Fecha ON Sesion(fecha);

-- Índice en la tabla Tipo_area_muscular_Ejercicio en la columna idEjercicio
CREATE INDEX IX_TipoAreaMuscularEjercicio_Ejercicio ON Tipo_area_muscular_Ejercicio(idEjercicio);

-- Índice en la tabla Tipo_disciplina_Ejercicio en la columna idEjercicio
CREATE INDEX IX_TipoDisciplinaEjercicio_Ejercicio ON Tipo_disciplina_Ejercicio(idEjercicio);

-- Índice en la tabla Ejercicio_Session en la columna idSesion
CREATE INDEX IX_EjercicioSession_Sesion ON Ejercicio_Session(idSesion);
