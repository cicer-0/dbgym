-- Scripts de las Vistas:

-- Vista de Miembros con Detalles de Dirección
CREATE VIEW VistaMiembrosConDireccion AS
SELECT M.*, D.ciudad, D.codigo_postal, D.pais, D.especificacion
FROM Miembro AS M
INNER JOIN Direccion AS D ON M.idDireccion = D.id;

-- Vista de Sesiones de Entrenamiento con Detalles
CREATE VIEW VistaSesionesConDetalles AS
SELECT S.*, I.nombre AS nombre_instructor, I.apellido_paterno AS apellido_instructor,
       I.telefono AS telefono_instructor, M.nombre AS nombre_miembro, M.apellido_paterno AS apellido_miembro
FROM Sesion AS S
INNER JOIN Instructor AS I ON S.idInstructor = I.id
INNER JOIN Miembro AS M ON S.idMiembro = M.id;

-- Vista de Progreso de Miembros
CREATE VIEW VistaProgresoMiembros AS
SELECT M.nombre AS nombre_miembro, M.apellido_paterno AS apellido_miembro,
       PE.fecha, PE.peso, PE.porcentaje_masa_muscular
FROM Miembro AS M
INNER JOIN Progreso_entrenamiento AS PE ON M.id = PE.idMiembro;

-- Vista de Certificados de Instructores
CREATE VIEW VistaCertificadosInstructores AS
SELECT I.nombre AS nombre_instructor, I.apellido_paterno AS apellido_instructor,
       C.nombre_certificado, C.descripcion AS descripcion_certificado
FROM Instructor AS I
INNER JOIN Instructor_Certificado AS IC ON I.id = IC.idInstructor
INNER JOIN Certificado AS C ON IC.idCertificado = C.id;

-- Vista de Membresías Vencidas
CREATE VIEW VistaMembresiasVencidas AS
SELECT M.nombre_plan, M.fecha_inicio, M.fecha_vencimiento, M.precio, 
       D.nombre AS nombre_miembro, D.apellido_paterno AS apellido_miembro
FROM Membresia AS M
INNER JOIN Miembro AS D ON M.id = D.idMembresia
WHERE M.fecha_vencimiento < GETDATE();

-- Vista de Ejercicios por Área Muscular
CREATE VIEW VistaEjerciciosPorAreaMuscular AS
SELECT T.nombre AS tipo_area_muscular, E.nombre, E.descripcion
FROM Tipo_area_muscular_Ejercicio AS TA
INNER JOIN Tipo_area_muscular AS T ON TA.idTipo_area_muscular = T.id
INNER JOIN Ejercicio AS E ON TA.idEjercicio = E.id;

-- Vista de Sesiones de Entrenamiento por Miembro
CREATE VIEW VistaSesionesPorMiembro AS
SELECT M.nombre AS nombre_miembro, M.apellido_paterno AS apellido_miembro,
       S.fecha, S.hora_inicio, S.hora_fin, S.nota
FROM Miembro AS M
INNER JOIN Sesion AS S ON M.id = S.idMiembro;

-- Vista de Instructor y Certificados
CREATE VIEW VistaInstructoresConCertificados AS
SELECT I.nombre, I.apellido_paterno, I.apellido_materno, I.telefono, I.correo_electronico,
       C.nombre_certificado, C.descripcion AS descripcion_certificado
FROM Instructor AS I
INNER JOIN Instructor_Certificado AS IC ON I.id = IC.idInstructor
INNER JOIN Certificado AS C ON IC.idCertificado = C.id;

-- Vista de Sesiones de Entrenamiento por Instructor
CREATE VIEW VistaSesionesPorInstructor AS
SELECT I.nombre AS nombre_instructor, I.apellido_paterno AS apellido_instructor,
       S.fecha, S.hora_inicio, S.hora_fin, S.nota
FROM Instructor AS I
INNER JOIN Sesion AS S ON I.id = S.idInstructor;

-- Vista de Miembros sin Renovar Membresía
CREATE VIEW VistaMiembrosSinRenovar AS
SELECT M.nombre, M.apellido_paterno, M.apellido_materno, M.correo_electronico, M.fecha_inscripcion, M.idMembresia, M.fecha_nacimiento,
       MB.fecha_vencimiento
FROM Miembro AS M
INNER JOIN Membresia AS MB ON M.idMembresia = MB.id
WHERE MB.fecha_vencimiento <= GETDATE();
