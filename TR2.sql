USE [BD2]
GO
/****** Object:  StoredProcedure [dbo].[TR2]    Script Date: 26/02/2022 11:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[TR2] (
@email varchar(100), 
@codCourse int
)
AS
BEGIN
DECLARE @rc int, @id_usuario uniqueidentifier, @id_rol uniqueidentifier, @mensaje varchar(max), @id_cursoTutor int;
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
ELSE
BEGIN
	SET @mensaje = 'Asignado como tutor al curso con codigo: ' + cast(@codCourse as varchar)
	SELECT @id_rol = Id FROM practica1.Roles WHERE RoleName = 'Tutor'
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al recuperar rol Tutor en tabla Roles'
		return -1
	END
	SELECT @id_usuario = Id FROM practica1.Usuarios WHERE Email = @email
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al recuperar id usuario en tabla Usuarios'
		return -1
	END
	--INICIO DE TRANSACCIÓN 
	BEGIN TRAN registro_tutor
	INSERT INTO practica1.UsuarioRole (RoleId, UserId, IsLatestVersion)
	VALUES (@id_rol, @id_usuario, 1)
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al insertar en tabla UsuarioRole'
		set @rc = -1
		goto fin
	END
	INSERT INTO practica1.CourseTutor(TutorId, CourseCodCourse)
	VALUES (@id_usuario, @codCourse)
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al insertar en tabla CourseTutor'
		set @rc = -1
		goto fin
	END
	SET @id_cursoTutor =  SCOPE_IDENTITY()
	INSERT INTO practica1.TutorProfile(UserId, TutorCode)
	VALUES (@id_usuario, @id_cursoTutor)
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al insertar en tabla TutorProfile'
		set @rc = -1
		goto fin
	END
	INSERT INTO practica1.Notification (UserId, Message, Date)
	VALUES (@id_usuario, @mensaje, GETDATE())
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al insertar en tabla Notification'
		set @rc = -1
		goto fin
	END
END
FIN:
	IF @rc = 0
	BEGIN
		INSERT INTO practica1.HistoryLog (Date, Description) VALUES (GETDATE(), 'TR1 - Cambio de Roles - finalizado con exito.')
		COMMIT TRAN registro_tutor
		RETURN 0
	END
	ELSE 
	BEGIN
		ROLLBACK TRAN registro_tutor
		RETURN -1
	END
END TRY 
BEGIN CATCH 
	SELECT 'Error: ' + ERROR_MESSAGE()
	INSERT INTO practica1.HistoryLog (Date, Description) VALUES (GETDATE(), 'TR1 - Cambio de Roles - finalizado con error: ' + ERROR_MESSAGE())
	--Si está abierta una transacción debe de hacer rollback porque ocurrió una excepción.
	IF @@TRANCOUNT > 0
		ROLLBACK TRAN
	RETURN -1
END CATCH  
END

