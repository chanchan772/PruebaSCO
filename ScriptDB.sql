USE [PruebaBank]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 7/05/2021 2:17:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombreCiu] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 7/05/2021 2:17:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sede]    Script Date: 7/05/2021 2:17:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sede](
	[idSede] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idCiudad] [int] NOT NULL,
 CONSTRAINT [PK_Sede] PRIMARY KEY CLUSTERED 
(
	[idSede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 7/05/2021 2:17:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[cedula] [varchar](50) NOT NULL,
	[idSede] [int] NOT NULL,
	[idRol] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ciudad] ON 

INSERT [dbo].[Ciudad] ([id], [nombreCiu]) VALUES (1, N'Bogota')
INSERT [dbo].[Ciudad] ([id], [nombreCiu]) VALUES (2, N'Medellin')
INSERT [dbo].[Ciudad] ([id], [nombreCiu]) VALUES (3, N'Cali')
INSERT [dbo].[Ciudad] ([id], [nombreCiu]) VALUES (4, N'Boyaca')
INSERT [dbo].[Ciudad] ([id], [nombreCiu]) VALUES (5, N'Ciudad 1')
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (1, N'Admin')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (2, N'Normal')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Sede] ON 

INSERT [dbo].[Sede] ([idSede], [nombre], [idCiudad]) VALUES (2, N'Sede1', 1)
INSERT [dbo].[Sede] ([idSede], [nombre], [idCiudad]) VALUES (3, N'Sede2', 2)
INSERT [dbo].[Sede] ([idSede], [nombre], [idCiudad]) VALUES (4, N'Sede3', 3)
INSERT [dbo].[Sede] ([idSede], [nombre], [idCiudad]) VALUES (5, N'Sede4', 1)
INSERT [dbo].[Sede] ([idSede], [nombre], [idCiudad]) VALUES (6, N'Sede10', 1)
INSERT [dbo].[Sede] ([idSede], [nombre], [idCiudad]) VALUES (7, N'Sede1', 1)
SET IDENTITY_INSERT [dbo].[Sede] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [cedula], [idSede], [idRol]) VALUES (3, N'Sebastian', N'Mateus', N'1032468', 2, 1)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [cedula], [idSede], [idRol]) VALUES (4, N'Andres', N'Rodriguez', N'1112223', 2, 2)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [cedula], [idSede], [idRol]) VALUES (5, N'Felipe', N'Bernal', N'1032469', 3, 2)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [cedula], [idSede], [idRol]) VALUES (6, N'Sebastian 3', N'Mateus 3', N'10324683', 2, 1)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [cedula], [idSede], [idRol]) VALUES (7, N'Sebastian', N'Mateus', N'1032468', 2, 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Sede]  WITH CHECK ADD  CONSTRAINT [FK_Sede_Ciudad] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudad] ([id])
GO
ALTER TABLE [dbo].[Sede] CHECK CONSTRAINT [FK_Sede_Ciudad]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Rol]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Sede] FOREIGN KEY([idSede])
REFERENCES [dbo].[Sede] ([idSede])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Sede]
GO
/****** Object:  StoredProcedure [dbo].[InicioSesionUsuarioAdmin]    Script Date: 7/05/2021 2:17:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InicioSesionUsuarioAdmin](@nombre varchar(50),@cedula varchar(50))
AS
BEGIN
	if exists (SELECT * FROM [PruebaBank].[dbo].[Usuarios] where nombre = @nombre and cedula = @cedula and idRol = 1)
	begin
		select 'Es Admin'
	end
	else
		select 'No es Admin';
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCiudad]    Script Date: 7/05/2021 2:17:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertCiudad](@nombreCiu varchar(50))
AS
BEGIN
	INSERT INTO [dbo].[Ciudad]
           ([nombreCiu])
     VALUES
           (@nombreCiu)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertSede]    Script Date: 7/05/2021 2:17:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertSede](@nombre varchar(50),@idCiudad int)
AS
BEGIN
	INSERT INTO [dbo].[Sede]
           ([nombre]
           ,[idCiudad])
     VALUES
           (@nombre,@idCiudad)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUsuario]    Script Date: 7/05/2021 2:17:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUsuario](@nombre varchar(50),@apellido varchar(50),@cedula varchar(50),@idSede int, @idRol int)
AS
BEGIN
	INSERT INTO [dbo].[Usuarios]
           ([nombre]
           ,[apellido]
           ,[cedula]
           ,[idSede]
           ,[idRol])
     VALUES
           (@nombre
           ,@apellido
           ,@cedula
           ,@idSede
           ,@idRol)
END
GO
