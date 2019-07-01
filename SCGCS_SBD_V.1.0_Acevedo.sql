CREATE DATABASE [cnfConfiguracion]
GO
ALTER DATABASE [cnfConfiguracion] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cnfConfiguracion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cnfConfiguracion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET ARITHABORT OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cnfConfiguracion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cnfConfiguracion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET  ENABLE_BROKER 
GO
ALTER DATABASE [cnfConfiguracion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cnfConfiguracion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET RECOVERY FULL 
GO
ALTER DATABASE [cnfConfiguracion] SET  MULTI_USER 
GO
ALTER DATABASE [cnfConfiguracion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cnfConfiguracion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cnfConfiguracion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cnfConfiguracion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cnfConfiguracion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cnfConfiguracion] SET QUERY_STORE = OFF
GO
USE [cnfConfiguracion]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [cnfConfiguracion]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfEEMpEntregaEntregableMiembro](
	[EEMcodigo] [int] IDENTITY(1,1) NOT NULL,
	[EMEcodigo] [int] NULL,
	[PECcodigo] [int] NULL,
	[EEMfecha_Registro] [date] NULL,
	[EEMversion] [varchar](30) NULL,
	[EEMrevision] [varchar](30) NULL,
	[EEMestado] [varchar](30) NULL,
	[EEMentregable] [varchar](250) NULL,
	[EEMfecha_Version] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EEMcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfEMEpEntregableMiembroEntregable](
	[EMEcodigo] [int] IDENTITY(1,1) NOT NULL,
	[PECcodigo] [int] NULL,
	[PMIcodigo_Responsable] [int] NULL,
	[PMIcodigo_Evaluador] [int] NULL,
	[PRYcodigo] [int] NULL,
	[MNTcodigo] [int] NULL,
	[EMEfecha_Registro] [date] NULL,
	[EMEfecha_Entrega] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EMEcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfEREpEntregableRelacion](
	[EREcodigo] [int] IDENTITY(1,1) NOT NULL,
	[MNTcodigo_Origen] [int] NULL,
	[MNTcodigo_Relacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EREcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfMEFpMetodologiaFase](
	[MEFcodigo] [int] IDENTITY(1,1) NOT NULL,
	[MTDcodigo] [int] NULL,
	[MEFnombre] [varchar](250) NULL,
	[MEFfecha_Registro] [date] NULL,
	[MEFestado] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[MEFcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfMNTpMetodologiaEntregable](
	[MNTcodigo] [int] IDENTITY(1,1) NOT NULL,
	[MEFcodigo] [int] NULL,
	[MNTnombre] [varchar](250) NULL,
	[MNTdescripcion] [varchar](100) NULL,
	[MNTfecha_Registro] [date] NULL,
	[MNTnomenclatura] [varchar](250) NULL,
	[MNTestado] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[MNTcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfMTDpMetodologia](
	[MTDcodigo] [int] IDENTITY(1,1) NOT NULL,
	[MTDnombre] [varchar](250) NULL,
	[MTDfecha_Registro] [date] NULL,
	[MTDestado] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[MTDcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfPECpProyectoElementoConfiguracion](
	[PECcodigo] [int] IDENTITY(1,1) NOT NULL,
	[MEFcodigo] [int] NULL,
	[PRYcodigo] [int] NULL,
	[MNTcodigo] [int] NULL,
	[PLBcodigo] [int] NULL,
	[PEClocalizacion] [varchar](250) NULL,
	[PECnombre] [varchar](250) NULL,
	[PECdescripcion] [varchar](250) NULL,
	[PECtipo] [varchar](250) NULL,
	[PECestado] [varchar](250) NULL,
	[PECestado_InOut] [varchar](250) NULL,
	[PECarchivo] [varchar](250) NULL,
	[PECextension] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PECcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfPERpProyectoElementoRelacion](
	[PERcodigo] [int] IDENTITY(1,1) NOT NULL,
	[PECcodigo_Relacion] [int] NULL,
	[PECcodigo_Origen] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PERcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfPLBpProyectoLineaBase](
	[PLBcodigo] [int] IDENTITY(1,1) NOT NULL,
	[PRYcodigo] [int] NULL,
	[MEFcodigo] [int] NULL,
	[PLBfecha_LineaBase] [date] NULL,
	[PLBestado] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[PLBcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfPMCpProyectoMiembroCargo](
	[PMCcodigo] [int] IDENTITY(1,1) NOT NULL,
	[PMIcodigo] [int] NULL,
	[PMCcargo] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[PMCcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfPMIpProyectoMiembro](
	[PMIcodigo] [int] IDENTITY(1,1) NOT NULL,
	[PRYcodigo] [int] NULL,
	[USUcodigo] [int] NULL,
	[PMIestado] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[PMIcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfPRYpProyecto](
	[PRYcodigo] [int] IDENTITY(1,1) NOT NULL,
	[MTDcodigo] [int] NULL,
	[USUcodigo] [int] NULL,
	[PRYnombre] [varchar](250) NULL,
	[PRYdescripcion] [varchar](250) NULL,
	[PRYfecha_Registro] [date] NULL,
	[PRYestado] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[PRYcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfPYEpProyectoEntregable](
	[PYEcodigo] [int] IDENTITY(1,1) NOT NULL,
	[MEFcodigo] [int] NULL,
	[PRYcodigo] [int] NULL,
	[MNTcodigo] [int] NULL,
	[PYEfecha_InicioFase] [date] NULL,
	[PYEfecha_FinFase] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PYEcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfSCCpSolicitudComiteCambio](
	[SCCcodigo] [int] IDENTITY(1,1) NOT NULL,
	[SOLcodigo] [int] NULL,
	[PMIcodigo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SCCcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfSEVpSolicitudEvaluador](
	[SEVcodigo] [int] IDENTITY(1,1) NOT NULL,
	[SOLcodigo] [int] NULL,
	[PMIcodigo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SEVcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfSIApSolicitudInformeAprobacion](
	[SIAcodigo] [int] IDENTITY(1,1) NOT NULL,
	[SICcodigo] [int] NULL,
	[SOLcodigo] [int] NULL,
	[SIAinforme_Aprobacion] [varchar](250) NULL,
	[SICfecha_Registro] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SIAcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfSICpSolicitudInformeCambio](
	[SICcodigo] [int] IDENTITY(1,1) NOT NULL,
	[SOLcodigo] [int] NULL,
	[SICinforme_Cambio] [varchar](250) NULL,
	[SICcomentario] [varchar](250) NULL,
	[SICfecha_Registro] [date] NULL,
	[SICestado_Cambio] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SICcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfSMCpSolicitudMiembroCambio](
	[SMCcodigo] [int] IDENTITY(1,1) NOT NULL,
	[SOLcodigo] [int] NULL,
	[PMIcodigo] [int] NULL,
	[SMCfecha_EntregaCambio] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SMCcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfSOLpSolicitud](
	[SOLcodigo] [int] IDENTITY(1,1) NOT NULL,
	[PRYcodigo] [int] NULL,
	[PECcodigo] [int] NULL,
	[MNTcodigo] [int] NULL,
	[USUcodigo] [int] NULL,
	[SOLsolicitud] [varchar](250) NULL,
	[SOLestado] [int] NULL,
	[SOLfecha_Registro] [date] NULL,
	[SOLnivel] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[SOLcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cnfUSUpUsuario](
	[USUcodigo] [int] IDENTITY(1,1) NOT NULL,
	[USUdni] [char](8) NULL,
	[USUnombre] [varchar](250) NULL,
	[USUapellido] [varchar](250) NULL,
	[USUcorreo] [varchar](250) NULL,
	[USUtelefono] [varchar](10) NULL,
	[USUusuario] [varchar](8) NULL,
	[USUcontrasena] [varchar](8) NULL,
	[USUnivel] [varchar](20) NULL,
	[USUestado] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[USUcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cnfMEFpMetodologiaFase] ON 

INSERT [dbo].[cnfMEFpMetodologiaFase] ([MEFcodigo], [MTDcodigo], [MEFnombre], [MEFfecha_Registro], [MEFestado]) VALUES (1, 1, N'Inicio', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfMEFpMetodologiaFase] ([MEFcodigo], [MTDcodigo], [MEFnombre], [MEFfecha_Registro], [MEFestado]) VALUES (2, 1, N'Desarrollo', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfMEFpMetodologiaFase] ([MEFcodigo], [MTDcodigo], [MEFnombre], [MEFfecha_Registro], [MEFestado]) VALUES (3, 1, N'Diseno', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfMEFpMetodologiaFase] ([MEFcodigo], [MTDcodigo], [MEFnombre], [MEFfecha_Registro], [MEFestado]) VALUES (4, 1, N'Mantenimiento', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfMEFpMetodologiaFase] ([MEFcodigo], [MTDcodigo], [MEFnombre], [MEFfecha_Registro], [MEFestado]) VALUES (5, 1, N'Analisis', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfMEFpMetodologiaFase] ([MEFcodigo], [MTDcodigo], [MEFnombre], [MEFfecha_Registro], [MEFestado]) VALUES (6, 4, N'Planeacion', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfMEFpMetodologiaFase] ([MEFcodigo], [MTDcodigo], [MEFnombre], [MEFfecha_Registro], [MEFestado]) VALUES (7, 4, N'Riesgo', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfMEFpMetodologiaFase] ([MEFcodigo], [MTDcodigo], [MEFnombre], [MEFfecha_Registro], [MEFestado]) VALUES (8, 4, N'Desarr', CAST(GETDATE() AS Date), N'Activo')
SET IDENTITY_INSERT [dbo].[cnfMEFpMetodologiaFase] OFF
SET IDENTITY_INSERT [dbo].[cnfMNTpMetodologiaEntregable] ON 

INSERT [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo], [MEFcodigo], [MNTnombre], [MNTdescripcion], [MNTfecha_Registro], [MNTnomenclatura], [MNTestado]) VALUES (1, 1, N'Especificacion de Requerimientos', N'La lista y especificación de los requerimientos', CAST(GETDATE() AS Date), N'ER', N'Activo')
INSERT [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo], [MEFcodigo], [MNTnombre], [MNTdescripcion], [MNTfecha_Registro], [MNTnomenclatura], [MNTestado]) VALUES (2, 3, N'Diseño de Arquitectura de Software', N'Documento con los diagramas del diseño del software', CAST(GETDATE() AS Date), N'DAS', N'Activo')
INSERT [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo], [MEFcodigo], [MNTnombre], [MNTdescripcion], [MNTfecha_Registro], [MNTnomenclatura], [MNTestado]) VALUES (3, 8, N'Modulos', N'Documento de modulos', CAST(GETDATE() AS Date), N'DM', N'Activo')
INSERT [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo], [MEFcodigo], [MNTnombre], [MNTdescripcion], [MNTfecha_Registro], [MNTnomenclatura], [MNTestado]) VALUES (1003, 1, N'Acta de Reunion', N'Acta de reunion del proyecto', CAST(GETDATE() AS Date), N'AR', N'Activo')
INSERT [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo], [MEFcodigo], [MNTnombre], [MNTdescripcion], [MNTfecha_Registro], [MNTnomenclatura], [MNTestado]) VALUES (1004, 3, N'Documento de arquitectura de software', N'Documento de arquitectura de software', CAST(GETDATE() AS Date), N'DAS', N'Activo')
INSERT [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo], [MEFcodigo], [MNTnombre], [MNTdescripcion], [MNTfecha_Registro], [MNTnomenclatura], [MNTestado]) VALUES (1005, 4, N'Manual de Usuario', N'Manual de Usuario', CAST(GETDATE() AS Date), N'MU', N'Activo')
INSERT [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo], [MEFcodigo], [MNTnombre], [MNTdescripcion], [MNTfecha_Registro], [MNTnomenclatura], [MNTestado]) VALUES (1006, 2, N'Codigo Fuente', N'Codigo Fuente', CAST(GETDATE() AS Date), N'CF', N'Activo')
SET IDENTITY_INSERT [dbo].[cnfMNTpMetodologiaEntregable] OFF
SET IDENTITY_INSERT [dbo].[cnfMTDpMetodologia] ON 

INSERT [dbo].[cnfMTDpMetodologia] ([MTDcodigo], [MTDnombre], [MTDfecha_Registro], [MTDestado]) VALUES (1, N'RUP', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfMTDpMetodologia] ([MTDcodigo], [MTDnombre], [MTDfecha_Registro], [MTDestado]) VALUES (2, N'SCRUM', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfMTDpMetodologia] ([MTDcodigo], [MTDnombre], [MTDfecha_Registro], [MTDestado]) VALUES (3, N'AGILE', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfMTDpMetodologia] ([MTDcodigo], [MTDnombre], [MTDfecha_Registro], [MTDestado]) VALUES (4, N'ESPIRAL', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfMTDpMetodologia] ([MTDcodigo], [MTDnombre], [MTDfecha_Registro], [MTDestado]) VALUES (5, N'XP', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfMTDpMetodologia] ([MTDcodigo], [MTDnombre], [MTDfecha_Registro], [MTDestado]) VALUES (6, N'TEST', CAST(GETDATE() AS Date), N'Activo')
SET IDENTITY_INSERT [dbo].[cnfMTDpMetodologia] OFF
SET IDENTITY_INSERT [dbo].[cnfPECpProyectoElementoConfiguracion] ON 

INSERT [dbo].[cnfPECpProyectoElementoConfiguracion] ([PECcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PLBcodigo], [PEClocalizacion], [PECnombre], [PECdescripcion], [PECtipo], [PECestado], [PECestado_InOut], [PECarchivo], [PECextension]) VALUES (1011, 1, 11, 1, 1, N'RastreoGPS/Inicio', N'ER-01', N'Especificacion de Requerimientos', N'Documento', N'Activo', N'Out', N'1011.doc', N'.doc')
INSERT [dbo].[cnfPECpProyectoElementoConfiguracion] ([PECcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PLBcodigo], [PEClocalizacion], [PECnombre], [PECdescripcion], [PECtipo], [PECestado], [PECestado_InOut], [PECarchivo], [PECextension]) VALUES (1012, 2, 11, 1006, 2, N'RastreoGPS/Desarrollo', N'CF - 01', N'Código Fuente', N'Documento', N'Activo', N'Out', N'1012.doc', N'.doc')
INSERT [dbo].[cnfPECpProyectoElementoConfiguracion] ([PECcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PLBcodigo], [PEClocalizacion], [PECnombre], [PECdescripcion], [PECtipo], [PECestado], [PECestado_InOut], [PECarchivo], [PECextension]) VALUES (1013, 1, 1005, 1, 1005, N'TEST/Inicio', N'ER-01', N'Esp', N'Documento', N'Activo', N'In', N'1013.doc', N'.doc')
INSERT [dbo].[cnfPECpProyectoElementoConfiguracion] ([PECcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PLBcodigo], [PEClocalizacion], [PECnombre], [PECdescripcion], [PECtipo], [PECestado], [PECestado_InOut], [PECarchivo], [PECextension]) VALUES (1014, 1, 1005, 1, 1005, N'TEST/Inicio', N'ER-02', N'EE', N'Documento', N'Activo', N'Out', N'1014.doc', N'.doc')
SET IDENTITY_INSERT [dbo].[cnfPECpProyectoElementoConfiguracion] OFF
SET IDENTITY_INSERT [dbo].[cnfPLBpProyectoLineaBase] ON 

INSERT [dbo].[cnfPLBpProyectoLineaBase] ([PLBcodigo], [PRYcodigo], [MEFcodigo], [PLBfecha_LineaBase], [PLBestado]) VALUES (1, 11, 1, CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfPLBpProyectoLineaBase] ([PLBcodigo], [PRYcodigo], [MEFcodigo], [PLBfecha_LineaBase], [PLBestado]) VALUES (2, 11, 2, CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfPLBpProyectoLineaBase] ([PLBcodigo], [PRYcodigo], [MEFcodigo], [PLBfecha_LineaBase], [PLBestado]) VALUES (1002, 11, 3, CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfPLBpProyectoLineaBase] ([PLBcodigo], [PRYcodigo], [MEFcodigo], [PLBfecha_LineaBase], [PLBestado]) VALUES (1003, 11, 4, CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfPLBpProyectoLineaBase] ([PLBcodigo], [PRYcodigo], [MEFcodigo], [PLBfecha_LineaBase], [PLBestado]) VALUES (1004, 11, 5, CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfPLBpProyectoLineaBase] ([PLBcodigo], [PRYcodigo], [MEFcodigo], [PLBfecha_LineaBase], [PLBestado]) VALUES (1005, 1005, 1, CAST(GETDATE() AS Date), N'Activo')
SET IDENTITY_INSERT [dbo].[cnfPLBpProyectoLineaBase] OFF
SET IDENTITY_INSERT [dbo].[cnfPMCpProyectoMiembroCargo] ON 

INSERT [dbo].[cnfPMCpProyectoMiembroCargo] ([PMCcodigo], [PMIcodigo], [PMCcargo]) VALUES (1, 1, N'Diseñador')
INSERT [dbo].[cnfPMCpProyectoMiembroCargo] ([PMCcodigo], [PMIcodigo], [PMCcargo]) VALUES (2, 1, N'Programador')
INSERT [dbo].[cnfPMCpProyectoMiembroCargo] ([PMCcodigo], [PMIcodigo], [PMCcargo]) VALUES (3, 1, N'Analista')
SET IDENTITY_INSERT [dbo].[cnfPMCpProyectoMiembroCargo] OFF
SET IDENTITY_INSERT [dbo].[cnfPMIpProyectoMiembro] ON 

INSERT [dbo].[cnfPMIpProyectoMiembro] ([PMIcodigo], [PRYcodigo], [USUcodigo], [PMIestado]) VALUES (1, 11, 1, N'Activo')
SET IDENTITY_INSERT [dbo].[cnfPMIpProyectoMiembro] OFF
SET IDENTITY_INSERT [dbo].[cnfPRYpProyecto] ON 

INSERT [dbo].[cnfPRYpProyecto] ([PRYcodigo], [MTDcodigo], [USUcodigo], [PRYnombre], [PRYdescripcion], [PRYfecha_Registro], [PRYestado]) VALUES (11, 1, 2, N'RastreoGPS', N'2223', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfPRYpProyecto] ([PRYcodigo], [MTDcodigo], [USUcodigo], [PRYnombre], [PRYdescripcion], [PRYfecha_Registro], [PRYestado]) VALUES (12, 4, 2, N'ComeBien', N'Comebien', CAST(GETDATE() AS Date), N'Activo')
INSERT [dbo].[cnfPRYpProyecto] ([PRYcodigo], [MTDcodigo], [USUcodigo], [PRYnombre], [PRYdescripcion], [PRYfecha_Registro], [PRYestado]) VALUES (1005, 1, 2, N'TEST', N'TTT', CAST(GETDATE() AS Date), N'Activo')
SET IDENTITY_INSERT [dbo].[cnfPRYpProyecto] OFF
SET IDENTITY_INSERT [dbo].[cnfPYEpProyectoEntregable] ON 

INSERT [dbo].[cnfPYEpProyectoEntregable] ([PYEcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PYEfecha_InicioFase], [PYEfecha_FinFase]) VALUES (2, 8, 12, 3, CAST(N'2019-02-02' AS Date), CAST(N'2018-02-06' AS Date))
INSERT [dbo].[cnfPYEpProyectoEntregable] ([PYEcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PYEfecha_InicioFase], [PYEfecha_FinFase]) VALUES (1002, 1, 11, 1, CAST(N'2019-02-02' AS Date), CAST(N'2018-02-06' AS Date))
INSERT [dbo].[cnfPYEpProyectoEntregable] ([PYEcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PYEfecha_InicioFase], [PYEfecha_FinFase]) VALUES (1003, 1, 11, 1003, CAST(N'2019-02-02' AS Date), CAST(N'2018-02-06' AS Date))
INSERT [dbo].[cnfPYEpProyectoEntregable] ([PYEcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PYEfecha_InicioFase], [PYEfecha_FinFase]) VALUES (1004, 2, 11, 1006, CAST(N'2019-02-06' AS Date), CAST(N'2018-02-07' AS Date))
INSERT [dbo].[cnfPYEpProyectoEntregable] ([PYEcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PYEfecha_InicioFase], [PYEfecha_FinFase]) VALUES (1005, 3, 11, 2, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date))
INSERT [dbo].[cnfPYEpProyectoEntregable] ([PYEcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PYEfecha_InicioFase], [PYEfecha_FinFase]) VALUES (1006, 3, 11, 1004, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date))
INSERT [dbo].[cnfPYEpProyectoEntregable] ([PYEcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PYEfecha_InicioFase], [PYEfecha_FinFase]) VALUES (1007, 4, 11, 1005, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date))
INSERT [dbo].[cnfPYEpProyectoEntregable] ([PYEcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PYEfecha_InicioFase], [PYEfecha_FinFase]) VALUES (1008, 1, 1005, 1, CAST(N'2015-12-05' AS Date), CAST(N'2018-05-19' AS Date))
INSERT [dbo].[cnfPYEpProyectoEntregable] ([PYEcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PYEfecha_InicioFase], [PYEfecha_FinFase]) VALUES (1009, 2, 1005, 1006, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date))
INSERT [dbo].[cnfPYEpProyectoEntregable] ([PYEcodigo], [MEFcodigo], [PRYcodigo], [MNTcodigo], [PYEfecha_InicioFase], [PYEfecha_FinFase]) VALUES (1010, 3, 1005, 2, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[cnfPYEpProyectoEntregable] OFF
SET IDENTITY_INSERT [dbo].[cnfSOLpSolicitud] ON 

INSERT [dbo].[cnfSOLpSolicitud] ([SOLcodigo], [PRYcodigo], [PECcodigo], [MNTcodigo], [USUcodigo], [SOLsolicitud], [SOLestado], [SOLfecha_Registro], [SOLnivel]) VALUES (1, 11, 1011, 1, 2, N'kaldasl;ldsadsa;lkdsa;ldas;lads;', 1, CAST(GETDATE() AS Date), NULL)
INSERT [dbo].[cnfSOLpSolicitud] ([SOLcodigo], [PRYcodigo], [PECcodigo], [MNTcodigo], [USUcodigo], [SOLsolicitud], [SOLestado], [SOLfecha_Registro], [SOLnivel]) VALUES (9, 11, 1011, 1, 2, N'sadlkasamsa;kldasmdmsdsdasaddsa', 1, CAST(GETDATE() AS Date), NULL)
SET IDENTITY_INSERT [dbo].[cnfSOLpSolicitud] OFF
SET IDENTITY_INSERT [dbo].[cnfUSUpUsuario] ON 

INSERT [dbo].[cnfUSUpUsuario] ([USUcodigo], [USUdni], [USUnombre], [USUapellido], [USUcorreo], [USUtelefono], [USUusuario], [USUcontrasena], [USUnivel], [USUestado]) VALUES (1, N'71444451', N'Leonardo', N'Acevedo', N'lacevedo@gmail.com', N'955441144', N'lacevedo', N'123', N'Miembro', N'Activo')
INSERT [dbo].[cnfUSUpUsuario] ([USUcodigo], [USUdni], [USUnombre], [USUapellido], [USUcorreo], [USUtelefono], [USUusuario], [USUcontrasena], [USUnivel], [USUestado]) VALUES (2, N'70161897', N'Tommy', N'Morales', N'tmorales@gmail.com', N'922117733', N'tmorales', N'123', N'Jefe', N'Activo')
SET IDENTITY_INSERT [dbo].[cnfUSUpUsuario] OFF
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[cnfMEFpMetodologiaFase] ADD UNIQUE NONCLUSTERED 
(
	[MEFnombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[cnfMNTpMetodologiaEntregable] ADD UNIQUE NONCLUSTERED 
(
	[MNTnombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[cnfMTDpMetodologia] ADD UNIQUE NONCLUSTERED 
(
	[MTDnombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[cnfPRYpProyecto] ADD UNIQUE NONCLUSTERED 
(
	[PRYnombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[cnfUSUpUsuario] ADD UNIQUE NONCLUSTERED 
(
	[USUdni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[cnfUSUpUsuario] ADD UNIQUE NONCLUSTERED 
(
	[USUusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cnfEEMpEntregaEntregableMiembro]  WITH CHECK ADD FOREIGN KEY([EMEcodigo])
REFERENCES [dbo].[cnfEMEpEntregableMiembroEntregable] ([EMEcodigo])
GO
ALTER TABLE [dbo].[cnfEEMpEntregaEntregableMiembro]  WITH CHECK ADD FOREIGN KEY([PECcodigo])
REFERENCES [dbo].[cnfPECpProyectoElementoConfiguracion] ([PECcodigo])
GO
ALTER TABLE [dbo].[cnfEMEpEntregableMiembroEntregable]  WITH CHECK ADD FOREIGN KEY([MNTcodigo])
REFERENCES [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo])
GO
ALTER TABLE [dbo].[cnfEMEpEntregableMiembroEntregable]  WITH CHECK ADD FOREIGN KEY([PECcodigo])
REFERENCES [dbo].[cnfPECpProyectoElementoConfiguracion] ([PECcodigo])
GO
ALTER TABLE [dbo].[cnfEMEpEntregableMiembroEntregable]  WITH CHECK ADD FOREIGN KEY([PMIcodigo_Responsable])
REFERENCES [dbo].[cnfPMIpProyectoMiembro] ([PMIcodigo])
GO
ALTER TABLE [dbo].[cnfEMEpEntregableMiembroEntregable]  WITH CHECK ADD FOREIGN KEY([PMIcodigo_Evaluador])
REFERENCES [dbo].[cnfPMIpProyectoMiembro] ([PMIcodigo])
GO
ALTER TABLE [dbo].[cnfEMEpEntregableMiembroEntregable]  WITH CHECK ADD FOREIGN KEY([PRYcodigo])
REFERENCES [dbo].[cnfPRYpProyecto] ([PRYcodigo])
GO
ALTER TABLE [dbo].[cnfEREpEntregableRelacion]  WITH CHECK ADD FOREIGN KEY([MNTcodigo_Origen])
REFERENCES [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo])
GO
ALTER TABLE [dbo].[cnfEREpEntregableRelacion]  WITH CHECK ADD FOREIGN KEY([MNTcodigo_Relacion])
REFERENCES [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo])
GO
ALTER TABLE [dbo].[cnfMEFpMetodologiaFase]  WITH CHECK ADD FOREIGN KEY([MTDcodigo])
REFERENCES [dbo].[cnfMTDpMetodologia] ([MTDcodigo])
GO
ALTER TABLE [dbo].[cnfMNTpMetodologiaEntregable]  WITH CHECK ADD FOREIGN KEY([MEFcodigo])
REFERENCES [dbo].[cnfMEFpMetodologiaFase] ([MEFcodigo])
GO
ALTER TABLE [dbo].[cnfPECpProyectoElementoConfiguracion]  WITH CHECK ADD FOREIGN KEY([MEFcodigo])
REFERENCES [dbo].[cnfMEFpMetodologiaFase] ([MEFcodigo])
GO
ALTER TABLE [dbo].[cnfPECpProyectoElementoConfiguracion]  WITH CHECK ADD FOREIGN KEY([MNTcodigo])
REFERENCES [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo])
GO
ALTER TABLE [dbo].[cnfPECpProyectoElementoConfiguracion]  WITH CHECK ADD FOREIGN KEY([PLBcodigo])
REFERENCES [dbo].[cnfPLBpProyectoLineaBase] ([PLBcodigo])
GO
ALTER TABLE [dbo].[cnfPECpProyectoElementoConfiguracion]  WITH CHECK ADD FOREIGN KEY([PRYcodigo])
REFERENCES [dbo].[cnfPRYpProyecto] ([PRYcodigo])
GO
ALTER TABLE [dbo].[cnfPERpProyectoElementoRelacion]  WITH CHECK ADD FOREIGN KEY([PECcodigo_Relacion])
REFERENCES [dbo].[cnfPECpProyectoElementoConfiguracion] ([PECcodigo])
GO
ALTER TABLE [dbo].[cnfPERpProyectoElementoRelacion]  WITH CHECK ADD FOREIGN KEY([PECcodigo_Origen])
REFERENCES [dbo].[cnfPECpProyectoElementoConfiguracion] ([PECcodigo])
GO
ALTER TABLE [dbo].[cnfPLBpProyectoLineaBase]  WITH CHECK ADD FOREIGN KEY([MEFcodigo])
REFERENCES [dbo].[cnfMEFpMetodologiaFase] ([MEFcodigo])
GO
ALTER TABLE [dbo].[cnfPLBpProyectoLineaBase]  WITH CHECK ADD FOREIGN KEY([PRYcodigo])
REFERENCES [dbo].[cnfPRYpProyecto] ([PRYcodigo])
GO
ALTER TABLE [dbo].[cnfPMCpProyectoMiembroCargo]  WITH CHECK ADD FOREIGN KEY([PMIcodigo])
REFERENCES [dbo].[cnfPMIpProyectoMiembro] ([PMIcodigo])
GO
ALTER TABLE [dbo].[cnfPMIpProyectoMiembro]  WITH CHECK ADD FOREIGN KEY([PRYcodigo])
REFERENCES [dbo].[cnfPRYpProyecto] ([PRYcodigo])
GO
ALTER TABLE [dbo].[cnfPMIpProyectoMiembro]  WITH CHECK ADD FOREIGN KEY([USUcodigo])
REFERENCES [dbo].[cnfUSUpUsuario] ([USUcodigo])
GO
ALTER TABLE [dbo].[cnfPRYpProyecto]  WITH CHECK ADD FOREIGN KEY([MTDcodigo])
REFERENCES [dbo].[cnfMTDpMetodologia] ([MTDcodigo])
GO
ALTER TABLE [dbo].[cnfPRYpProyecto]  WITH CHECK ADD FOREIGN KEY([USUcodigo])
REFERENCES [dbo].[cnfUSUpUsuario] ([USUcodigo])
GO
ALTER TABLE [dbo].[cnfPYEpProyectoEntregable]  WITH CHECK ADD FOREIGN KEY([MEFcodigo])
REFERENCES [dbo].[cnfMEFpMetodologiaFase] ([MEFcodigo])
GO
ALTER TABLE [dbo].[cnfPYEpProyectoEntregable]  WITH CHECK ADD FOREIGN KEY([MNTcodigo])
REFERENCES [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo])
GO
ALTER TABLE [dbo].[cnfPYEpProyectoEntregable]  WITH CHECK ADD FOREIGN KEY([PRYcodigo])
REFERENCES [dbo].[cnfPRYpProyecto] ([PRYcodigo])
GO
ALTER TABLE [dbo].[cnfSCCpSolicitudComiteCambio]  WITH CHECK ADD FOREIGN KEY([PMIcodigo])
REFERENCES [dbo].[cnfPMIpProyectoMiembro] ([PMIcodigo])
GO
ALTER TABLE [dbo].[cnfSCCpSolicitudComiteCambio]  WITH CHECK ADD FOREIGN KEY([SOLcodigo])
REFERENCES [dbo].[cnfSOLpSolicitud] ([SOLcodigo])
GO
ALTER TABLE [dbo].[cnfSEVpSolicitudEvaluador]  WITH CHECK ADD FOREIGN KEY([PMIcodigo])
REFERENCES [dbo].[cnfPMIpProyectoMiembro] ([PMIcodigo])
GO
ALTER TABLE [dbo].[cnfSEVpSolicitudEvaluador]  WITH CHECK ADD FOREIGN KEY([SOLcodigo])
REFERENCES [dbo].[cnfSOLpSolicitud] ([SOLcodigo])
GO
ALTER TABLE [dbo].[cnfSIApSolicitudInformeAprobacion]  WITH CHECK ADD FOREIGN KEY([SICcodigo])
REFERENCES [dbo].[cnfSICpSolicitudInformeCambio] ([SICcodigo])
GO
ALTER TABLE [dbo].[cnfSIApSolicitudInformeAprobacion]  WITH CHECK ADD FOREIGN KEY([SOLcodigo])
REFERENCES [dbo].[cnfSOLpSolicitud] ([SOLcodigo])
GO
ALTER TABLE [dbo].[cnfSICpSolicitudInformeCambio]  WITH CHECK ADD FOREIGN KEY([SOLcodigo])
REFERENCES [dbo].[cnfSOLpSolicitud] ([SOLcodigo])
GO
ALTER TABLE [dbo].[cnfSMCpSolicitudMiembroCambio]  WITH CHECK ADD FOREIGN KEY([PMIcodigo])
REFERENCES [dbo].[cnfPMIpProyectoMiembro] ([PMIcodigo])
GO
ALTER TABLE [dbo].[cnfSMCpSolicitudMiembroCambio]  WITH CHECK ADD FOREIGN KEY([SOLcodigo])
REFERENCES [dbo].[cnfSOLpSolicitud] ([SOLcodigo])
GO
ALTER TABLE [dbo].[cnfSOLpSolicitud]  WITH CHECK ADD FOREIGN KEY([MNTcodigo])
REFERENCES [dbo].[cnfMNTpMetodologiaEntregable] ([MNTcodigo])
GO
ALTER TABLE [dbo].[cnfSOLpSolicitud]  WITH CHECK ADD FOREIGN KEY([PECcodigo])
REFERENCES [dbo].[cnfPECpProyectoElementoConfiguracion] ([PECcodigo])
GO
ALTER TABLE [dbo].[cnfSOLpSolicitud]  WITH CHECK ADD FOREIGN KEY([PRYcodigo])
REFERENCES [dbo].[cnfPRYpProyecto] ([PRYcodigo])
GO
ALTER TABLE [dbo].[cnfSOLpSolicitud]  WITH CHECK ADD FOREIGN KEY([USUcodigo])
REFERENCES [dbo].[cnfUSUpUsuario] ([USUcodigo])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[usp_D_cnfEREpEntregableRelacion_Borrar]
(
@MNTcodigo_Origen int,
@MNTcodigo_Relacion int
)
as
    delete from cnfEREpEntregableRelacion where MNTcodigo_Origen = @MNTcodigo_Origen AND MNTcodigo_Relacion = @MNTcodigo_Relacion
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_D_cnfPERpProyectoElementoRelacion_Borrar]
(
@PECcodigo_Origen int,
@PECcodigo_Relacion int
)
as
    delete from cnfPERpProyectoElementoRelacion where PECcodigo_Origen = @PECcodigo_Origen AND PECcodigo_Relacion = @PECcodigo_Relacion
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_D_cnfPMIpProyectoMiembro_BorrarPrincipal]
(
@EREparametro int
)
as
    delete from cnfPMIpProyectoMiembro where PRYcodigo = @EREparametro 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_D_cnfPMIpProyectoMiembro_BorrarSecundario]
(
@EREparametro int
)
as
    delete from cnfPMCpProyectoMiembroCargo where PMIcodigo in (select PMIcodigo from cnfPMIpProyectoMiembro where PRYcodigo = @EREparametro) 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_D_cnfPRYpProyectoEntregable_Borrar]
(
@EREparametro int
)
as
	delete from cnfPYEpProyectoEntregable where PRYcodigo = @EREparametro 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_I_cnfEREpEntregableRelacion_GuardarDatosSecundario]
(
@MNTcodigo_Origen int,
@MNTcodigo_Relacion int
)
as
    insert cnfEREpEntregableRelacion (MNTcodigo_Origen, MNTcodigo_Relacion) values (@MNTcodigo_Origen,@MNTcodigo_Relacion)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_I_cnfMEFpMetodologiaFase_Guardar]
(
@MTDcodigo int,
@MEFnombre varchar(250),
@MEFfecha_Registro date,
@MEFestado varchar(250)
)
as
    insert into cnfMEFpMetodologiaFase (MTDcodigo,MEFnombre,MEFfecha_Registro,MEFestado) values(@MTDcodigo, @MEFnombre, @MEFfecha_Registro,@MEFestado)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_I_cnfMNTpMetodologiaEntregable_GuardarPrincipal]
(
@MEFcodigo int,
@MNTnombre varchar(250),
@MNTdescripcion varchar(100),
@MNTfecha_Registro date,
@MNTnomenclatura varchar(250),
@MNTestado varchar(250)
)
as
    insert into cnfMNTpMetodologiaEntregable (MEFcodigo,MNTnombre,MNTdescripcion,MNTfecha_Registro,MNTnomenclatura,MNTestado) values(@MEFcodigo, @MNTnombre, @MNTdescripcion,@MNTfecha_Registro,@MNTnomenclatura,@MNTestado)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_I_cnfMTDpMetodologia_Guardar]
(
@MTDnombre varchar(250),
@MTDfecha_Registro date,
@MTDestado varchar(250)
)
as
    insert into cnfMTDpMetodologia (MTDnombre,MTDfecha_Registro,MTDestado) values(@MTDnombre, @MTDfecha_Registro, @MTDestado)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_I_cnfPECpProyectoElementoConfiguracion_GuardarPrincipal]
(
@MEFcodigo int,
@PRYcodigo int,
@MNTcodigo int,
@PLBcodigo int,
@PEClocalizacion varchar(250),
@PECnombre varchar(250),
@PECdescripcion varchar(250),
@PECtipo varchar(250),
@PECestado varchar(250),
@PECestado_InOut varchar(250),
@PECarchivo varchar(250),
@PECextension varchar(100)
)
as
    insert into cnfPECpProyectoElementoConfiguracion values(@MEFcodigo, @PRYcodigo, @MNTcodigo,@PLBcodigo,@PEClocalizacion,@PECnombre,@PECdescripcion,@PECtipo,@PECestado,@PECestado_InOut, @PECarchivo, @PECextension)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_I_cnfPERpProyectoElementoRelacion_GuardarDatosSecundario]
(
@PECcodigo_Origen int,
@PECcodigo_Relacion int
)
as
     cnfPERpProyectoElementoRelacion(PECcodigo_Origen, PECcodigo_Relacion) values (@PECcodigo_Origen,@PECcodigo_Relacion)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_I_cnfPLBpProyectoLineaBase_Guardar]
(
@PRYcodigo int,
@MEFcodigo int,
@PLBfecha_LineaBase date,
@PLBestado varchar(20)
)
as
    insert into cnfPLBpProyectoLineaBase values(@PRYcodigo, @MEFcodigo, @PLBfecha_LineaBase,@PLBestado)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_I_cnfPMIpProyectoMiembro_GuardarPrincipal]
(
@PRYcodigo int,
@USUcodigo int,
@PMIestado varchar(250)
)
as
    insert into cnfPMIpProyectoMiembro values (@PRYcodigo,@USUcodigo,@PMIestado)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_I_cnfPMIpProyectoMiembro_GuardarSecundario]
(
@PMIcodigo int,
@PMCcargo varchar(250)
)
as
    insert into cnfPMCpProyectoMiembroCargo values (@PMIcodigo,@PMCcargo)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_I_cnfPRYpProyecto_Guardar]
(
@MTDcodigo int,
@USUcodigo int,
@PRYnombre varchar(250),
@PRYdescripcion varchar(250),
@PRYfecha_Registro date,
@PRYestado varchar(250)
)
as
    insert into cnfPRYpProyecto (MTDcodigo,USUcodigo,PRYnombre,PRYdescripcion,PRYfecha_Registro,PRYestado) 
	values(@MTDcodigo, @USUcodigo, @PRYnombre,@PRYdescripcion,@PRYfecha_Registro,@PRYestado)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_I_cnfPRYpProyectoEntregable_Guardar]
(
@MEFcodigo int,
@PRYcodigo int,
@MNTcodigo int,
@PYEfecha_InicioFase date,
@PYEfecha_FinFase date
)
as
    insert into cnfPYEpProyectoEntregable values(@MEFcodigo, @PRYcodigo, @MNTcodigo,@PYEfecha_InicioFase,@PYEfecha_FinFase)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_I_cnfUSUpUsuario_Guardar]
(
@USUdni char(8),
@USUnombre varchar(250),
@USUapellido varchar(250),
@USUcorreo varchar(250),
@USUtelefono varchar(250),
@USUusuario varchar(8),
@USUcontrasena varchar(8),
@USUnivel varchar(20),
@USUestado varchar(20)
)
as
    insert into cnfUSUpUsuario (USUdni,USUnombre,USUapellido,USUcorreo,USUtelefono,USUusuario,USUcontrasena,USUnivel,USUestado) 
	values(@USUdni, @USUnombre, @USUapellido,@USUcorreo,@USUtelefono,@USUusuario,@USUcontrasena,@USUnivel,@USUestado)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfEREpEntregableRelacion_CargarDatosRelacion]
(
@EREparametro int
)
as
    select * from cnfEREpEntregableRelacion inner join cnfMNTpMetodologiaEntregable
	on cnfEREpEntregableRelacion.MNTcodigo_Origen = cnfMNTpMetodologiaEntregable.MNTcodigo where MNTcodigo_Origen = @EREparametro OR MNTcodigo_Relacion = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfEREpEntregableRelacion_CargarDatosSecundario]
(
@EREparametro int
)
as
	select cnfMNTpMetodologiaEntregable.MNTcodigo, cnfMNTpMetodologiaEntregable.MEFcodigo, cnfMTDpMetodologia.MTDcodigo, cnfMEFpMetodologiaFase.MEFnombre, cnfMTDpMetodologia.MTDnombre, cnfMNTpMetodologiaEntregable.MNTnombre, cnfMNTpMetodologiaEntregable.MNTdescripcion, cnfMNTpMetodologiaEntregable.MNTfecha_Registro, cnfMNTpMetodologiaEntregable.MNTnomenclatura, cnfMNTpMetodologiaEntregable.MNTestado 
	from cnfMNTpMetodologiaEntregable 
	inner join cnfMEFpMetodologiaFase
	on cnfMNTpMetodologiaEntregable.MEFcodigo = cnfMEFpMetodologiaFase.MEFcodigo
	inner join cnfMTDpMetodologia 
	on cnfMEFpMetodologiaFase.MTDcodigo = cnfMTDpMetodologia.MTDcodigo
	where cnfMTDpMetodologia.MTDcodigo 
	in (select cnfMTDpMetodologia.MTDcodigo from cnfMNTpMetodologiaEntregable inner join cnfMEFpMetodologiaFase
	on cnfMNTpMetodologiaEntregable.MEFcodigo = cnfMEFpMetodologiaFase.MEFcodigo where cnfMNTpMetodologiaEntregable.MNTcodigo = @EREparametro)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfMEFpMetodologiaFase_Buscar]
(
@MEFparametro varchar(250)
)
as
    select * from cnfMEFpMetodologiaFase where MEFcodigo like @MEFparametro OR MEFnombre like @MEFparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----Fase

create procedure [dbo].[usp_S_cnfMEFpMetodologiaFase_CargarDatos]
as
    select cnfMEFpMetodologiaFase.MEFcodigo, cnfMTDpMetodologia.MTDnombre, cnfMEFpMetodologiaFase.MEFnombre, cnfMEFpMetodologiaFase.MEFfecha_Registro, cnfMEFpMetodologiaFase.MEFestado from cnfMEFpMetodologiaFase inner join cnfMTDpMetodologia on cnfMEFpMetodologiaFase.MTDcodigo = cnfMTDpMetodologia.MTDcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfMEFpMetodologiaFase_ComboMetodologia]
as
    select * from cnfMTDpMetodologia where MTDestado='Activo'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfMNTpMetodologiaEntregable_Buscar]
(
@MNTparametro varchar(250)
)
as
	select MNT.MNTcodigo, MEF.MEFcodigo, MTD.MTDcodigo, MEF.MEFnombre, MTD.MTDnombre, MNTnombre, MNTdescripcion, MNTfecha_Registro, MNTnomenclatura, MNTestado
	from cnfMNTpMetodologiaEntregable as MNT
	inner join cnfMEFpMetodologiaFase as MEF on 
	MNT.MEFcodigo = MEF.MEFcodigo inner join
	cnfMTDpMetodologia as MTD on MEF.MTDcodigo = MTD.MTDcodigo
	where MNT.MNTcodigo like @MNTparametro OR MNT.MNTnombre like @MNTparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----Entregable

create procedure [dbo].[usp_S_cnfMNTpMetodologiaEntregable_CargarDatosPrincipal]
as
    select MNT.MNTcodigo, MEF.MEFcodigo, MTD.MTDcodigo, MEF.MEFnombre, MTD.MTDnombre, MNTnombre, MNTdescripcion, MNTfecha_Registro, MNTnomenclatura, MNTestado
	from cnfMNTpMetodologiaEntregable as MNT
	inner join cnfMEFpMetodologiaFase as MEF on 
	MNT.MEFcodigo = MEF.MEFcodigo inner join
	cnfMTDpMetodologia as MTD on MEF.MTDcodigo = MTD.MTDcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfMNTpMetodologiaEntregable_CargarDatosSecundario]
(
@MNTparametro int
)
as
    select * from cnfMNTpMetodologiaEntregable where MEFcodigo = @MNTparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfMNTpMetodologiaEntregable_ComboFase]
(
@MNTparametro int
)
as
    select * from cnfMEFpMetodologiaFase where MTDcodigo = @MNTparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfMNTpMetodologiaEntregable_ComboMetodologia]
as
    select * from cnfMTDpMetodologia where MTDestado='Activo'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfMTDpMetodologia_Buscar]
(
@MTDparametro varchar(250)
)
as
    select * from cnfMTDpMetodologia where MTDcodigo like @MTDparametro OR MTDnombre like @MTDparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------Procedimientos Almacenados---------------------------------

create procedure [dbo].[usp_S_cnfMTDpMetodologia_CargarDatos]
as
    select * from cnfMTDpMetodologia
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPECpProyectoElementoConfiguracion_Buscar]
(
@EREparametro int
)
as
	select PEC.PECcodigo, MEF.MEFcodigo, MEF.MEFnombre, PRY.PRYcodigo, PRY.PRYnombre, MNT.MNTcodigo, MNT.MNTnombre, PLB.PLBcodigo, PLB.PLBfecha_LineaBase, PEC.PEClocalizacion, PEC.PECnombre, PEC.PECdescripcion, PEC.PECtipo, PEC.PECestado, PEC.PECestado_InOut
	from cnfPECpProyectoElementoConfiguracion as PEC
	inner join cnfMEFpMetodologiaFase as MEF on
	PEC.MEFcodigo = MEF.MEFcodigo
	inner join cnfMNTpMetodologiaEntregable as MNT on
	MEF.MEFcodigo = MNT.MEFcodigo
	inner join cnfPLBpProyectoLineaBase as PLB on
	MEF.MEFcodigo = PLB.MEFcodigo
	inner join cnfPRYpProyecto as PRY on
	PEC.PRYcodigo = PRY.PRYcodigo
	inner join cnfUSUpUsuario as USU on
	PRY.USUcodigo = USU.USUcodigo
	where PEC.PECcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----Proyecto Elemento Configuracion

CREATE procedure [dbo].[usp_S_cnfPECpProyectoElementoConfiguracion_CargarDatosPrincipal]
(
@EREparametro int
)
as
	select PEC.PECcodigo, MEF.MEFcodigo, MEF.MEFnombre, PRY.PRYcodigo, PRY.PRYnombre, MNT.MNTcodigo, MNT.MNTnombre, PLB.PLBcodigo, PLB.PLBfecha_LineaBase, PEC.PEClocalizacion, PEC.PECnombre, PEC.PECdescripcion, PEC.PECtipo, PEC.PECestado, PEC.PECestado_InOut, PEC.PECarchivo, PEC.PECextension
	from cnfPECpProyectoElementoConfiguracion as PEC
	inner join cnfMNTpMetodologiaEntregable as MNT on
	PEC.MNTcodigo = MNT.MNTcodigo
	inner join cnfMEFpMetodologiaFase as MEF on
	PEC.MEFcodigo = MEF.MEFcodigo
	inner join cnfPLBpProyectoLineaBase as PLB on
	PEC.PLBcodigo = PLB.PLBcodigo
	inner join cnfPRYpProyecto as PRY on
	PEC.PRYcodigo = PRY.PRYcodigo
	inner join cnfUSUpUsuario as USU on
	PRY.USUcodigo = USU.USUcodigo
	where PRY.USUcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPECpProyectoElementoConfiguracion_CargarDatosSecundario]
(
@EREparametro int,
@PRYcodigo int
)
as
	select PEC.PECcodigo, MEF.MEFcodigo, MEF.MEFnombre, PRY.PRYcodigo, PRY.PRYnombre, MNT.MNTcodigo, MNT.MNTnombre, PLB.PLBcodigo, PLB.PLBfecha_LineaBase, PEC.PEClocalizacion, PEC.PECnombre, PEC.PECdescripcion, PEC.PECtipo, PEC.PECestado, PEC.PECestado_InOut
	from cnfPECpProyectoElementoConfiguracion as PEC
	inner join cnfMNTpMetodologiaEntregable as MNT
	on PEC.MNTcodigo = MNT.MNTcodigo
	inner join cnfMEFpMetodologiaFase as MEF
	on MEF.MEFcodigo = MNT.MEFcodigo
	inner join cnfPLBpProyectoLineaBase as PLB
	on PLB.MEFcodigo = MEF.MEFcodigo
	inner join cnfPRYpProyecto as PRY
	on PRY.PRYcodigo = PEC.PRYcodigo
	where PRY.PRYcodigo = @PRYcodigo AND MEF.MEFcodigo 
	in (select cnfPECpProyectoElementoConfiguracion.MEFcodigo from cnfPECpProyectoElementoConfiguracion inner join cnfMEFpMetodologiaFase
	on cnfPECpProyectoElementoConfiguracion.MEFcodigo = cnfMEFpMetodologiaFase.MEFcodigo where cnfPECpProyectoElementoConfiguracion.PECcodigo = @EREparametro)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPECpProyectoElementoConfiguracion_ComboEntregable]
(
@EREparametro int
)
as
    select * from cnfMNTpMetodologiaEntregable where  MNTestado='Activo' AND MEFcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPECpProyectoElementoConfiguracion_ComboFase]
(
@EREparametro int
)
as
    select * from cnfMEFpMetodologiaFase
	inner join cnfPRYpProyecto on
	cnfMEFpMetodologiaFase.MTDcodigo = cnfPRYpProyecto.MTDcodigo
	where cnfPRYpProyecto.PRYcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPECpProyectoElementoConfiguracion_ComboLineaBase]
(
@EREparametro int
)
as
    select * from cnfPLBpProyectoLineaBase where PLBestado='Activo' AND MEFcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPECpProyectoElementoConfiguracion_ComboProyecto]
(
@EREparametro int
)
as
    select * from cnfPRYpProyecto where PRYestado='Activo' AND USUcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPECpProyectoElementoConfiguracion_ObtenerProyecto]
(
@EREparametro int
)
as
	select * from cnfPRYpProyecto inner join cnfPECpProyectoElementoConfiguracion
	on cnfPRYpProyecto.PRYcodigo = cnfPECpProyectoElementoConfiguracion.PRYcodigo
	where cnfPECpProyectoElementoConfiguracion.PECcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPERpProyectoElementoRelacion_CargarDatosRelacion]
(
@EREparametro int
)
as
    select * from cnfPERpProyectoElementoRelacion inner join cnfPECpProyectoElementoConfiguracion
	on cnfPERpProyectoElementoRelacion.PECcodigo_Origen = cnfPECpProyectoElementoConfiguracion.PECcodigo where PECcodigo_Origen = @EREparametro OR PECcodigo_Relacion = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPLBpProyectoLineaBase_Buscar]
(
@EREparametro int
)
as
	select * from cnfPLBpProyectoLineaBase where PLBcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----Proyecto Linea Base

create procedure [dbo].[usp_S_cnfPLBpProyectoLineaBase_CargarDatos]
(
@EREparametro int
)
as
    select PLB.PLBcodigo, PRY.PRYcodigo, PRY.PRYnombre, MEF.MEFcodigo, MEF.MEFnombre, PLB.PLBfecha_LineaBase, PLB.PLBestado
	from cnfPLBpProyectoLineaBase as PLB inner join	
	cnfPRYpProyecto as PRY on
	PLB.PRYcodigo =  PRY.PRYcodigo
	inner join cnfMEFpMetodologiaFase as MEF on
	PLB.MEFcodigo = MEF.MEFcodigo
	inner join cnfUSUpUsuario as USU on
	PRY.USUcodigo = USU.USUcodigo
	where PRY.USUcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPLBpProyectoLineaBase_ComboFase]
(
@EREparametro int
)
as
    select * from cnfMEFpMetodologiaFase as MEF
	inner join cnfMTDpMetodologia as MTD on
	MEF.MTDcodigo = MTD.MTDcodigo
	inner join cnfPRYpProyecto as PRY on
	MTD.MTDcodigo = PRY.MTDcodigo where PRY.PRYcodigo = @EREparametro AND MEF.MEFestado = 'Activo'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPLBpProyectoLineaBase_ComboProyecto]
(
@EREparametro int
)
as
    select *
	from cnfPRYpProyecto as PRY
	inner join cnfUSUpUsuario as USU on 
	PRY.USUcodigo = USU.USUcodigo
	where PRY.USUcodigo = @EREparametro AND PRY.PRYestado = 'Activo'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPMIpProyectoMiembro_CargarDatos]
(
@EREparametro int
)
as
    select *
	from cnfPMIpProyectoMiembro as PMI
	inner join cnfPRYpProyecto as PRY on
	PMI.PRYcodigo = PRY.PRYcodigo
	where PRY.PRYcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPMIpProyectoMiembro_CargarUsuario]
as
    select *
	from cnfUSUpUsuario
	where USUnivel != 'Jefe de Proyecto' AND USUnivel != 'Administrador'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPMIpProyectoMiembro_CargoMiembro]
(
@EREparametro int
)
as
    select *
	from cnfPMCpProyectoMiembroCargo as PMC
	inner join cnfPMIpProyectoMiembro as PMI on
	PMC.PMIcodigo = PMI.PMIcodigo
	inner join cnfPRYpProyecto as PRY on
	PMI.PRYcodigo = PRY.PRYcodigo
	where PRY.PRYcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----Proyecto Miembro Proyecto

create procedure [dbo].[usp_S_cnfPMIpProyectoMiembro_ComboProyecto]
(
@EREparametro int
)
as
    select *
	from cnfPRYpProyecto as PRY
	inner join cnfUSUpUsuario as USU on
	PRY.USUcodigo = USU.USUcodigo
	where PRY.USUcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPMIpProyectoMiembro_ObtenerUltimoGuardadoPrincipal]
as
    declare @EREultimo int
	select @EREultimo = max(PMIcodigo) from cnfPMIpProyectoMiembro
	select * from cnfPMIpProyectoMiembro where PMIcodigo = @EREultimo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyecto_Buscar]
(
@EREparametro int
)
as
    select PRY.PRYcodigo, MTD.MTDcodigo, MTD.MTDnombre, USU.USUcodigo, USU.USUnombre, USU.USUapellido, PRY.PRYnombre, PRY.PRYdescripcion, PRY.PRYfecha_Registro, PRY.PRYestado 
	from cnfPRYpProyecto as PRY
	inner join cnfMTDpMetodologia as MTD on 
	PRY.MTDcodigo = MTD.MTDcodigo inner join
	cnfUSUpUsuario as USU on PRY.USUcodigo = USU.USUcodigo
	where PRY.PRYcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---Iniciar Sesion

create procedure [dbo].[usp_S_cnfPRYpProyecto_CargarDatos]
(
@USUcodigo int
)
as
    select PRY.PRYcodigo, MTD.MTDcodigo, MTD.MTDnombre, USU.USUcodigo, USU.USUnombre, USU.USUapellido, PRY.PRYnombre, PRY.PRYdescripcion, PRY.PRYfecha_Registro, PRY.PRYestado 
	from cnfPRYpProyecto as PRY
	inner join cnfMTDpMetodologia as MTD on 
	PRY.MTDcodigo = MTD.MTDcodigo inner join
	cnfUSUpUsuario as USU on PRY.USUcodigo = USU.USUcodigo
	where PRY.USUcodigo = @USUcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyecto_ComboMetodologia]
as
    select * from cnfMTDpMetodologia where MTDestado='Activo'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyecto_ObtenerFase]
(
@EREparametro int,
@EREnombreproyecto varchar(250)
)
as
    select * 
	from cnfMEFpMetodologiaFase as MEF
	inner join cnfPRYpProyecto as PRY on 
	PRY.MTDcodigo = MEF.MTDcodigo
	where PRY.USUcodigo = @EREparametro AND PRY.PRYnombre = @EREnombreproyecto
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyecto_ObtenerUsuario]
(
@EREparametro int,
@EREnombreproyecto varchar(250)
)
as
    select * 
	from cnfUSUpUsuario as USU
	inner join cnfPRYpProyecto as PRY on 
	PRY.USUcodigo = USU.USUcodigo
	where PRY.USUcodigo = @EREparametro AND PRY.PRYnombre = @EREnombreproyecto
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyectoEntregable_Buscar]
(
@EREparametro int
)
as
	select * from cnfPRYpProyecto where PRYcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyectoEntregable_CargarDatos]
(
@EREparametro int
)
as
    select MTD.MTDcodigo, MTD.MTDnombre, MEF.MEFcodigo, MEF.MEFnombre, MNT.MNTcodigo, MNT.MNTnombre 
	from cnfMNTpMetodologiaEntregable as MNT inner join	
	cnfMEFpMetodologiaFase as MEF on
	MNT.MEFcodigo =  MEF.MEFcodigo
	inner join cnfMTDpMetodologia as MTD on
	MTD.MTDcodigo = MEF.MTDcodigo
	where MTD.MTDestado = 'Activo' AND MEF.MEFestado = 'Activo' AND MNT.MNTestado = 'Activo' AND MTD.MTDcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyectoEntregable_CargarDatosRelacion]
(
@EREparametro int
)
as
    select * from cnfPYEpProyectoEntregable where PRYcodigo = @EREparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----Proyecto Entregable

create procedure [dbo].[usp_S_cnfPRYpProyectoEntregable_ComboProyecto]
(
@EREparametro int
)
as
    select PRY.PRYcodigo, MTD.MTDcodigo, MTD.MTDnombre, USU.USUcodigo, USU.USUnombre, USU.USUapellido, PRY.PRYnombre, PRY.PRYdescripcion, PRY.PRYfecha_Registro, PRY.PRYestado 
	from cnfPRYpProyecto as PRY
	inner join cnfMTDpMetodologia as MTD on 
	PRY.MTDcodigo = MTD.MTDcodigo inner join
	cnfUSUpUsuario as USU on PRY.USUcodigo = USU.USUcodigo
	where PRY.USUcodigo = @EREparametro AND PRY.PRYestado = 'Activo'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyectoEntregable_ListarFase]
(
@EREparametro int
)
as
    select * from cnfMEFpMetodologiaFase where MTDcodigo = @EREparametro AND MEFestado = 'Activo'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyectoEntregable_ListarMiembrosProyecto]
(
@PRYcodigo int
)
as
	select USU.USUcodigo, USU.USUdni, USU.USUnombre,USU.USUapellido, USU.USUcorreo, USU.USUtelefono, USU.USUusuario, USU.USUcontrasena, USU.USUnivel, USU.USUestado
	from cnfPMIpProyectoMiembro as PMI
	inner join cnfPRYpProyecto as PRY
	on PMI.PRYcodigo = PRY.PRYcodigo
	inner join cnfUSUpUsuario as USU on
	PMI.USUcodigo = USU.USUcodigo
	where PRY.PRYcodigo = @PRYcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyectoEntregable_ListarProyecto]
(
@USUcodigo int
)
as
	select PRY.PRYcodigo, MTD.MTDcodigo, MTD.MTDnombre, USU.USUcodigo, USU.USUnombre, USU.USUapellido, PRY.PRYnombre, PRY.PRYdescripcion, PRY.PRYfecha_Registro, PRY.PRYestado 
	from cnfPRYpProyecto as PRY
	inner join cnfMTDpMetodologia as MTD on 
	PRY.MTDcodigo = MTD.MTDcodigo inner join
	cnfUSUpUsuario as USU on PRY.USUcodigo = USU.USUcodigo
	where PRY.USUcodigo = @USUcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyectoEntregable_ListarTodoProyecto]
as
	select PRY.PRYcodigo, MTD.MTDcodigo, MTD.MTDnombre, USU.USUcodigo, USU.USUnombre, USU.USUapellido, PRY.PRYnombre, PRY.PRYdescripcion, PRY.PRYfecha_Registro, PRY.PRYestado 
	from cnfPRYpProyecto as PRY
	inner join cnfMTDpMetodologia as MTD on 
	PRY.MTDcodigo = MTD.MTDcodigo inner join
	cnfUSUpUsuario as USU on PRY.USUcodigo = USU.USUcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyectoEntregable_ObtenerNivelUsuario]
(
@USUcodigo int
)
as
	select * from cnfUSUpUsuario where USUcodigo = @USUcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfPRYpProyectoEntregable_ObtenerProyecto]
(
@PRYcodigo int
)
as
	select PRY.PRYcodigo, MTD.MTDcodigo, MTD.MTDnombre, USU.USUcodigo, USU.USUnombre, USU.USUapellido, PRY.PRYnombre, PRY.PRYdescripcion, PRY.PRYfecha_Registro, PRY.PRYestado 
	from cnfPRYpProyecto as PRY
	inner join cnfMTDpMetodologia as MTD on 
	PRY.MTDcodigo = MTD.MTDcodigo inner join
	cnfUSUpUsuario as USU on PRY.USUcodigo = USU.USUcodigo
	where PRY.PRYcodigo = @PRYcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfUSUpUsuario_Buscar]
(
@USUparametro varchar(250)
)
as
    select * from cnfUSUpUsuario where USUcodigo like @USUparametro OR USUusuario like @USUparametro
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_S_cnfUSUpUsuario_CargarDatos]
as
    select * from cnfUSUpUsuario
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-----------IniciarSesion--------

Create procedure [dbo].[usp_S_cnfUSUpUsuario_IniciarSesion]
(
@USUusuario varchar(8),
@USUcontrasena varchar(8)


)
as
select * from cnfUSUpUsuario where USUusuario=@USUusuario AND USUcontrasena=@USUcontrasena
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_U_cnfMEFpMetodologiaFase_Modificar]
(
@MEFcodigo int,
@MTDcodigo int,
@MEFnombre varchar(250),
@MEFfecha_Registro date,
@MEFestado varchar(250)
)
as
    update cnfMEFpMetodologiaFase set MTDcodigo = @MTDcodigo, MEFnombre = @MEFnombre, MEFfecha_Registro = @MEFfecha_Registro, MEFestado = @MEFestado where MEFcodigo = @MEFcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_U_cnfMNTpMetodologiaEntregable_Modificar]
(
@MNTcodigo int,
@MEFcodigo int,
@MNTnombre varchar(250),
@MNTdescripcion varchar(100),
@MNTfecha_Registro date,
@MNTnomenclatura varchar(250),
@MNTestado varchar(250)
)
as
    update cnfMNTpMetodologiaEntregable set MEFcodigo = @MEFcodigo, MNTnombre = @MNTnombre, MNTdescripcion = @MNTdescripcion, MNTfecha_Registro = @MNTfecha_Registro, MNTnomenclatura = @MNTnomenclatura, MNTestado = @MNTestado where MNTcodigo = @MNTcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_U_cnfMTDpMetodologia_Modificar]
(
@MTDcodigo int,
@MTDnombre varchar(250),
@MTDfecha_Registro date,
@MTDestado varchar(250)
)
as
    update cnfMTDpMetodologia set MTDnombre = @MTDnombre, MTDfecha_Registro = @MTDfecha_Registro, MTDestado = @MTDestado where MTDcodigo = @MTDcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_U_cnfPECpProyectoElementoConfiguracion_Modificar]
(
@PECcodigo int,
@MEFcodigo int,
@PRYcodigo int,
@MNTcodigo int,
@PLBcodigo int,
@PEClocalizacion varchar(250),
@PECnombre varchar(250),
@PECdescripcion varchar(250),
@PECtipo varchar(250),
@PECestado varchar(250),
@PECestado_InOut varchar(250)
)
as
    update cnfPECpProyectoElementoConfiguracion set MEFcodigo = @MEFcodigo, PRYcodigo = @PRYcodigo, MNTcodigo = @MNTcodigo, PLBcodigo = @PLBcodigo, PEClocalizacion = @PEClocalizacion, PECnombre = @PECnombre, PECdescripcion = @PECdescripcion, PECtipo = @PECtipo, PECestado = @PECestado, PECestado_InOut = @PECestado_InOut where PECcodigo = @PECcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_U_cnfPLBpProyectoLineaBase_Modificar]
(
@PLBcodigo int,
@PRYcodigo int,
@MEFcodigo int,
@PLBfecha_LineaBase date,
@PLBestado varchar(20)
)
as
    update cnfPLBpProyectoLineaBase set PRYcodigo = @PRYcodigo, MEFcodigo = @MEFcodigo, PLBfecha_LineaBase = @PLBfecha_LineaBase, PLBestado=@PLBestado where PLBcodigo = @PLBcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_U_cnfPRYpProyecto_Modificar]
(
@PRYcodigo int,
@MTDcodigo int,
@USUcodigo int,
@PRYnombre varchar(250),
@PRYdescripcion varchar(250),
@PRYfecha_Registro date,
@PRYestado varchar(250)
)
as
    update cnfPRYpProyecto set MTDcodigo = @MTDcodigo, USUcodigo = @USUcodigo, PRYnombre = @PRYnombre, PRYdescripcion=@PRYdescripcion,PRYfecha_Registro=@PRYfecha_Registro,PRYestado=@PRYestado where PRYcodigo = @PRYcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_U_cnfUSUpUsuario_IniciarSesion]
(
@USUcodigo int
)
as
update cnfUSUpUsuario set USUestado = 'Inactivo' where USUcodigo = @USUcodigo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_U_cnfUSUpUsuario_Modificar]
(
@USUcodigo int,
@USUdni char(8),
@USUnombre varchar(250),
@USUapellido varchar(250),
@USUcorreo varchar(250),
@USUtelefono varchar(250),
@USUusuario varchar(8),
@USUcontrasena varchar(8),
@USUnivel varchar(20),
@USUestado varchar(20)
)
as
    update cnfUSUpUsuario set USUdni = @USUdni, USUnombre = @USUnombre, USUapellido = @USUapellido,USUcorreo=@USUcorreo,USUtelefono=@USUtelefono,USUusuario=@USUusuario, USUcontrasena=@USUcontrasena,USUnivel=@USUnivel,USUestado=@USUestado where USUcodigo = @USUcodigo
GO
USE [master]
GO
ALTER DATABASE [cnfConfiguracion] SET  READ_WRITE 
GO
