USE [BD2]
GO
/****** Object:  StoredProcedure [dbo].[TR3]    Script Date: 26/02/2022 11:10:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[TR3] (
@email varchar(100), 
@codCourse int
)
AS
BEGIN
DECLARE @rc int, @id_estudiante int, @mensaje varchar(max), @id_cursoTutor int, @id_usuario uniqueidentifier, @id_tutor uniqueidentifier;
--Validando que email sea único
BEGIN TRY
SET @rc = 0
SET @email = RTRIM(LTRIM(@email))
IF NOT EXISTS (select top 1 1 from practica1.Usuarios where Email = @email and EmailConfirmed = 1)
BEGIN
	select 'Correo no registrado o no confirmado.'
	return -1
END
ELSE IF NOT EXISTS (select top 1 1 from practica1.Course where CodCourse =  @codCourse)
BEGIN
	select 'Curso no registrado.'
	return -1
END
ELSE IF NOT EXISTS (select top 1 1 from practica1.ProfileStudent s
inner join practica1.Course c on c.CreditsRequired <= s.Credits
inner join practica1.Usuarios u on u.Id = s.UserId and u.Email = @email)
BEGIN
	select 'Estudiante no cumple con los créditos mínimos.'
	return -1
END
ELSE
BEGIN
	SET @mensaje = 'Curso con codigo: ' + cast(@codCourse as varchar) + ', asignado exitosamente ' 
	SELECT @id_usuario = Id FROM practica1.Usuarios WHERE Email = @email
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al recuperar id usuario en tabla Usuarios'
		return -1
	END
	SELECT @id_tutor = TutorId from practica1.CourseTutor
	WHERE CourseCodCourse = @codCourse
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al recuperar id tutor en tabla CourseTutor'
		return -1
	END
	--INICIO DE TRANSACCIÓN 
	BEGIN TRAN asignacion_curso
	INSERT INTO practica1.CourseAssignment(StudentId, CourseCodCourse)
	VALUES (@id_usuario, @codCourse)
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al insertar en tabla CourseAssignment'
		set @rc = -1
		goto fin
	END
	INSERT INTO practica1.Notification (UserId, Message, Date)
	VALUES (@id_usuario, @mensaje, GETDATE())
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al insertar estudiante en tabla Notification'
		set @rc = -1
		goto fin
	END
	SET @mensaje = 'Se ha asignado un estudiante a su curso con codigo: ' + cast(@codCourse as varchar)
	INSERT INTO practica1.Notification (UserId, Message, Date)
	VALUES (@id_tutor, @mensaje, GETDATE())
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al insertar tutor en tabla Notification'
		set @rc = -1
		goto fin
	END
END
FIN:
	IF @rc = 0
	BEGIN
		INSERT INTO practica1.HistoryLog (Date, Description) VALUES (GETDATE(), 'TR1 - Asignación de Curso - finalizado con exito.')
		COMMIT TRAN asignacion_curso
		RETURN 0
	END
	ELSE 
	BEGIN
		ROLLBACK TRAN asignacion_curso
		RETURN -1
	END
END TRY 
BEGIN CATCH 
	SELECT 'Error: ' + ERROR_MESSAGE()
	INSERT INTO practica1.HistoryLog (Date, Description) VALUES (GETDATE(), 'TR1 - Asignación de Curso - finalizado con error: ' + ERROR_MESSAGE())
	--Si está abierta una transacción debe de hacer rollback porque ocurrió una excepción.
	IF @@TRANCOUNT > 0
		ROLLBACK TRAN
	RETURN -1
END CATCH  
END

