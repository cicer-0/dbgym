-- CRUD para Certificado:

-- CREATE (Insertar)
CREATE PROCEDURE InsertarCertificado
    @nombre_certificado varchar(50),
    @descripcion varchar(200),
    @duracion_aprendizaje int
AS
BEGIN
    INSERT INTO Certificado (nombre_certificado, descripcion, duracion_aprendizaje)
    VALUES (@nombre_certificado, @descripcion, @duracion_aprendizaje);
END;

-- READ (Seleccionar)
CREATE PROCEDURE SeleccionarCertificado
    @id int
AS
BEGIN
    SELECT * FROM Certificado WHERE id = @id;
END;

-- UPDATE (Actualizar)
CREATE PROCEDURE ActualizarCertificado
    @id int,
    @nombre_certificado varchar(50),
    @descripcion varchar(200),
    @duracion_aprendizaje int
AS
BEGIN
    UPDATE Certificado
    SET nombre_certificado = @nombre_certificado,
        descripcion = @descripcion,
        duracion_aprendizaje = @duracion_aprendizaje
    WHERE id = @id;
END;

-- DELETE (Eliminar)
CREATE PROCEDURE EliminarCertificado
    @id int
AS
BEGIN
    DELETE FROM Certificado WHERE id = @id;
END;

-- CRUD para Direccion:

-- CREATE (Insertar)
CREATE PROCEDURE InsertarDireccion
    @ciudad varchar(100),
    @codigo_postal varchar(15),
    @pais varchar(50),
    @especificacion varchar(300)
AS
BEGIN
    INSERT INTO Direccion (ciudad, codigo_postal, pais, especificacion)
    VALUES (@ciudad, @codigo_postal, @pais, @especificacion);
END;

-- READ (Seleccionar)
CREATE PROCEDURE SeleccionarDireccion
    @id int
AS
BEGIN
    SELECT * FROM Direccion WHERE id = @id;
END;

-- UPDATE (Actualizar)
CREATE PROCEDURE ActualizarDireccion
    @id int,
    @ciudad varchar(100),
    @codigo_postal varchar(15),
    @pais varchar(50),
    @especificacion varchar(300)
AS
BEGIN
    UPDATE Direccion
    SET ciudad = @ciudad,
        codigo_postal = @codigo_postal,
        pais = @pais,
        especificacion = @especificacion
    WHERE id = @id;
END;

-- DELETE (Eliminar)
CREATE PROCEDURE EliminarDireccion
    @id int
AS
BEGIN
    DELETE FROM Direccion WHERE id = @id;
END;

-- CRUD para Ejercicio:

-- CREATE (Insertar)
CREATE PROCEDURE InsertarEjercicio
    @nombre varchar(50),
    @descripcion varchar(200),
    @series int,
    @repeticiones int,
    @peso_extra int
AS
BEGIN
    INSERT INTO Ejercicio (nombre, descripcion, series, repeticiones, peso_extra)
    VALUES (@nombre, @descripcion, @series, @repeticiones, @peso_extra);
END;

-- READ (Seleccionar)
CREATE PROCEDURE SeleccionarEjercicio
    @id int
AS
BEGIN
    SELECT * FROM Ejercicio WHERE id = @id;
END;

-- UPDATE (Actualizar)
CREATE PROCEDURE ActualizarEjercicio
    @id int,
    @nombre varchar(50),
    @descripcion varchar(200),
    @series int,
    @repeticiones int,
    @peso_extra int
AS
BEGIN
    UPDATE Ejercicio
    SET nombre = @nombre,
        descripcion = @descripcion,
        series = @series,
        repeticiones = @repeticiones,
        peso_extra = @peso_extra
    WHERE id = @id;
END;

-- DELETE (Eliminar)
CREATE PROCEDURE EliminarEjercicio
    @id int
AS
BEGIN
    DELETE FROM Ejercicio WHERE id = @id;
END;

-- CRUD para Miembro:

-- CREATE (Insertar)
CREATE PROCEDURE InsertarMiembro
    @telefono varchar(20),
    @correo_electronico varchar(100),
    @apellido_materno varchar(100),
    @apellido_paterno varchar(100),
    @nombre varchar(100),
    @fecha_nacimiento date,
    @fecha_inscripcion date,
    @dni varchar(10),
    @idMembresia int,
    @idDireccion int
AS
BEGIN
    INSERT INTO Miembro (telefono, correo_electronico, apellido_materno, apellido_paterno, nombre, fecha_nacimiento, fecha_inscripcion, dni, idMembresia, idDireccion)
    VALUES (@telefono, @correo_electronico, @apellido_materno, @apellido_paterno, @nombre, @fecha_nacimiento, @fecha_inscripcion, @dni, @idMembresia, @idDireccion);
END;

-- READ (Seleccionar)
CREATE PROCEDURE SeleccionarMiembro
    @id int
AS
BEGIN
    SELECT * FROM Miembro WHERE id = @id;
END;

-- UPDATE (Actualizar)
CREATE PROCEDURE ActualizarMiembro
    @id int,
    @telefono varchar(20),
    @correo_electronico varchar(100),
    @apellido_materno varchar(100),
    @apellido_paterno varchar(100),
    @nombre varchar(100),
    @fecha_nacimiento date,
    @fecha_inscripcion date,
    @dni varchar(10),
    @idMembresia int,
    @idDireccion int
AS
BEGIN
    UPDATE Miembro
    SET telefono = @telefono,
        correo_electronico = @correo_electronico,
        apellido_materno = @apellido_materno,
        apellido_paterno = @apellido_paterno,
        nombre = @nombre,
        fecha_nacimiento = @fecha_nacimiento,
        fecha_inscripcion = @fecha_inscripcion,
        dni = @dni,
        idMembresia = @idMembresia,
        idDireccion = @idDireccion
    WHERE id = @id;
END;

-- DELETE (Eliminar)
CREATE PROCEDURE EliminarMiembro
    @id int
AS
BEGIN
    DELETE FROM Miembro WHERE id = @id;
END;
