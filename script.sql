USE [master]
GO
/****** Object:  Database [BD2]    Script Date: 26/02/2022 11:54:00 ******/
CREATE DATABASE [BD2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BD2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BD2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BD2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD2] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD2] SET RECOVERY FULL 
GO
ALTER DATABASE [BD2] SET  MULTI_USER 
GO
ALTER DATABASE [BD2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD2] SET QUERY_STORE = OFF
GO
USE [BD2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BD2]
GO
/****** Object:  Schema [practica1]    Script Date: 26/02/2022 11:54:00 ******/
CREATE SCHEMA [practica1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [practica1].[Course]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[Course](
	[CodCourse] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreditsRequired] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CodCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [practica1].[CourseAssignment]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[CourseAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [uniqueidentifier] NOT NULL,
	[CourseCodCourse] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [practica1].[CourseTutor]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[CourseTutor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TutorId] [uniqueidentifier] NOT NULL,
	[CourseCodCourse] [int] NOT NULL,
 CONSTRAINT [PK_CourseTutor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [practica1].[HistoryLog]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[HistoryLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_HistoryLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [practica1].[Notification]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [practica1].[ProfileStudent]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[ProfileStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Credits] [int] NOT NULL,
 CONSTRAINT [PK_ProfileStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [practica1].[Roles]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [practica1].[TFA]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[TFA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Status] [bit] NOT NULL,
	[LastUpdate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TFA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [practica1].[TutorProfile]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[TutorProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TutorCode] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TutorProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [practica1].[UsuarioRole]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[UsuarioRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[IsLatestVersion] [bit] NOT NULL,
 CONSTRAINT [PK_UsuarioRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [practica1].[Usuarios]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [practica1].[Usuarios](
	[Id] [uniqueidentifier] NOT NULL,
	[Firstname] [nvarchar](max) NOT NULL,
	[Lastname] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[LastChanges] [datetime2](7) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseAssignment_CourseCodCourse]    Script Date: 26/02/2022 11:54:00 ******/
CREATE NONCLUSTERED INDEX [IX_CourseAssignment_CourseCodCourse] ON [practica1].[CourseAssignment]
(
	[CourseCodCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseAssignment_StudentId]    Script Date: 26/02/2022 11:54:00 ******/
CREATE NONCLUSTERED INDEX [IX_CourseAssignment_StudentId] ON [practica1].[CourseAssignment]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseTutor_CourseCodCourse]    Script Date: 26/02/2022 11:54:00 ******/
CREATE NONCLUSTERED INDEX [IX_CourseTutor_CourseCodCourse] ON [practica1].[CourseTutor]
(
	[CourseCodCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseTutor_TutorId]    Script Date: 26/02/2022 11:54:00 ******/
CREATE NONCLUSTERED INDEX [IX_CourseTutor_TutorId] ON [practica1].[CourseTutor]
(
	[TutorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notification_UserId]    Script Date: 26/02/2022 11:54:00 ******/
CREATE NONCLUSTERED INDEX [IX_Notification_UserId] ON [practica1].[Notification]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProfileStudent_UserId]    Script Date: 26/02/2022 11:54:00 ******/
CREATE NONCLUSTERED INDEX [IX_ProfileStudent_UserId] ON [practica1].[ProfileStudent]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TFA_UserId]    Script Date: 26/02/2022 11:54:00 ******/
CREATE NONCLUSTERED INDEX [IX_TFA_UserId] ON [practica1].[TFA]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TutorProfile_UserId]    Script Date: 26/02/2022 11:54:00 ******/
CREATE NONCLUSTERED INDEX [IX_TutorProfile_UserId] ON [practica1].[TutorProfile]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsuarioRole_RoleId]    Script Date: 26/02/2022 11:54:00 ******/
CREATE NONCLUSTERED INDEX [IX_UsuarioRole_RoleId] ON [practica1].[UsuarioRole]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsuarioRole_UserId]    Script Date: 26/02/2022 11:54:00 ******/
CREATE NONCLUSTERED INDEX [IX_UsuarioRole_UserId] ON [practica1].[UsuarioRole]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [practica1].[CourseAssignment]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignment_Course_CourseCodCourse] FOREIGN KEY([CourseCodCourse])
REFERENCES [practica1].[Course] ([CodCourse])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[CourseAssignment] CHECK CONSTRAINT [FK_CourseAssignment_Course_CourseCodCourse]
GO
ALTER TABLE [practica1].[CourseAssignment]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignment_Usuarios_StudentId] FOREIGN KEY([StudentId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[CourseAssignment] CHECK CONSTRAINT [FK_CourseAssignment_Usuarios_StudentId]
GO
ALTER TABLE [practica1].[CourseTutor]  WITH CHECK ADD  CONSTRAINT [FK_CourseTutor_Course_CourseCodCourse] FOREIGN KEY([CourseCodCourse])
REFERENCES [practica1].[Course] ([CodCourse])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[CourseTutor] CHECK CONSTRAINT [FK_CourseTutor_Course_CourseCodCourse]
GO
ALTER TABLE [practica1].[CourseTutor]  WITH CHECK ADD  CONSTRAINT [FK_CourseTutor_Usuarios_TutorId] FOREIGN KEY([TutorId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[CourseTutor] CHECK CONSTRAINT [FK_CourseTutor_Usuarios_TutorId]
GO
ALTER TABLE [practica1].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[Notification] CHECK CONSTRAINT [FK_Notification_Usuarios_UserId]
GO
ALTER TABLE [practica1].[ProfileStudent]  WITH CHECK ADD  CONSTRAINT [FK_ProfileStudent_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[ProfileStudent] CHECK CONSTRAINT [FK_ProfileStudent_Usuarios_UserId]
GO
ALTER TABLE [practica1].[TFA]  WITH CHECK ADD  CONSTRAINT [FK_TFA_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[TFA] CHECK CONSTRAINT [FK_TFA_Usuarios_UserId]
GO
ALTER TABLE [practica1].[TutorProfile]  WITH CHECK ADD  CONSTRAINT [FK_TutorProfile_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[TutorProfile] CHECK CONSTRAINT [FK_TutorProfile_Usuarios_UserId]
GO
ALTER TABLE [practica1].[UsuarioRole]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRole_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [practica1].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[UsuarioRole] CHECK CONSTRAINT [FK_UsuarioRole_Roles_RoleId]
GO
ALTER TABLE [practica1].[UsuarioRole]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRole_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [practica1].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [practica1].[UsuarioRole] CHECK CONSTRAINT [FK_UsuarioRole_Usuarios_UserId]
GO
/****** Object:  StoredProcedure [dbo].[TR1]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TR1] (
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

GO
/****** Object:  StoredProcedure [dbo].[TR2]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TR2] (
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

GO
/****** Object:  StoredProcedure [dbo].[TR3]    Script Date: 26/02/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TR3] (
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

GO
USE [master]
GO
ALTER DATABASE [BD2] SET  READ_WRITE 
GO
