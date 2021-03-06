USE [BD2]
GO
/****** Object:  StoredProcedure [dbo].[TR1]    Script Date: 26/02/2022 10:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[TR1] (
@firstname varchar(100),
@lastname varchar(100),
@email varchar(100), 
@password varchar(100),
@credits int
)
AS
BEGIN
DECLARE @rc int, @dateBirth datetime, @id_usuario uniqueidentifier, @id_rol uniqueidentifier, @mensaje varchar(max);
--Validando que email sea único
BEGIN TRY
SET @rc = 0
SET @email = RTRIM(LTRIM(@email))
IF EXISTS (select top 1 1 from practica1.Usuarios where Email = @email)
BEGIN
	select 'Correo ya registrado.'
	return -1
END
ELSE
BEGIN
	--SET @dateBirth = '1990-01-01'
	SET @dateBirth = GETDATE()
	SET @mensaje = 'Registro exitoso.'
	SET @id_usuario =  NEWID()
	SELECT @id_rol = Id FROM practica1.Roles WHERE RoleName = 'Student'
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al recuperar rol Student en tabla Roles'
		return -1
	END
	--INICIO DE TRANSACCIÓN 
	BEGIN TRAN registro_usuario
	INSERT INTO practica1.Usuarios (Id, Firstname, Lastname, Email, DateOfBirth, Password, LastChanges, EmailConfirmed)
	VALUES (@id_usuario, @firstname, @lastname, @email, @dateBirth, @password, GETDATE(), 0)
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al insertar en tabla Usuarios'
		set @rc = -1
		goto fin
	END
	INSERT INTO practica1.UsuarioRole (RoleId, UserId, IsLatestVersion)
	VALUES (@id_rol, @id_usuario, 1)
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al insertar en tabla UsuarioRole'
		set @rc = -1
		goto fin
	END
	INSERT INTO practica1.ProfileStudent (UserId, Credits)
	VALUES (@id_usuario, @credits)
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al insertar en tabla ProfileStudent'
		set @rc = -1
		goto fin
	END
	INSERT INTO practica1.TFA (UserId, Status, LastUpdate)
	VALUES (@id_usuario, 0, GETDATE())
	IF @@ERROR != 0 OR @@ROWCOUNT = 0
	BEGIN
		select 'Error al insertar en tabla TFA'
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
		INSERT INTO practica1.HistoryLog (Date, Description) VALUES (GETDATE(), 'TR1 - Registro de Usuarios - finalizado con exito.')
		COMMIT TRAN registro_usuario
		RETURN 0
	END
	ELSE 
	BEGIN
		ROLLBACK TRAN registro_usuario
		RETURN -1
	END
END TRY 
BEGIN CATCH 
	SELECT 'Error: ' + ERROR_MESSAGE()
	INSERT INTO practica1.HistoryLog (Date, Description) VALUES (GETDATE(), 'TR1 - Registro de Usuarios - finalizado con error: ' + ERROR_MESSAGE())
	--Si está abierta una transacción debe de hacer rollback porque ocurrió una excepción.
	IF @@TRANCOUNT > 0
		ROLLBACK TRAN
	RETURN -1
END CATCH  
END

