CREATE DATABASE Borrador12
GO

USE [Borrador12]
GO
/****** Object:  Table [dbo].[BU_CITA]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_CITA](
	[strCod_cita] [varchar](200) NOT NULL,
	[strCod_alu] [varchar](200) NOT NULL,
	[strCod_ser] [varchar](200) NULL,
	[dtFecha_cita] [datetime] NOT NULL,
	[strEstado_cita] [varchar](200) NULL,
	[strUserLog] [varchar](200) NULL,
	[dtFechaLog] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_cita] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BU_DETALLE_CITA]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_DETALLE_CITA](
	[strCod_detacita] [varchar](50) NOT NULL,
	[strCod_cita] [varchar](200) NOT NULL,
	[strDescripcion] [varchar](500) NOT NULL,
	[strObservaciones] [varchar](500) NOT NULL,
	[strUserLog] [varchar](200) NOT NULL,
	[dtFechaLog] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_detacita] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BU_DETALLEHISTO]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[BU_DETALLEHISTO](

	[strCod_deta] [int] NOT NULL, -- codigo del detalle 
	[strCod_histo] [varchar](200) NULL, -- codigo de historia
	[strCod_alu] [varchar](200) NULL, -- codigo del paciente
	[strCod_ser] [varchar](200) NULL, -- codigo de servicio 

	[strCod_Sede] [varchar](200) NULL,
	[strCod_Fac] [varchar](200) NULL, 
	[strCod_Car] [varchar](200) NULL,
	[strCod_matric] [varchar](200) NULL, 

	[strCod_sig] [varchar](200) NULL, -- codigo de BU_SIGNOV
	[dtFecha_deta] [date] NULL, -- fecha del sistema

	[strTipoAten_deta] [varchar](200) NULL,

	[strMotCons_deta] [varchar](500) NULL, -- motivo consulta
	[strEnfeActu_deta] [varchar](500) NULL, -- enfermedad actual
	[strDiasEnfer_deta] [varchar](500) NULL, -- dias de enfermedad
	[strPatolo_deta] [varchar](500) NULL, -- Patologia 
	[strDiagnostico_deta] [varchar](500) NULL, -- diagnostico
	[strTatamiento_deta] [varchar](500) NULL, -- tratamiento
	[strEstado_deta] [varchar](500) NULL, -- estado ( PENDIENTE , ATENDIDO )
	[strMedicamento_deta] [varchar](500) NULL, -- Medicamenteo
	[strCantidad_deta] [varchar](200) NULL, -- cantidad
	[strDosis_deta] [varchar](200) NULL, -- dosis
	[strCodEnfer_deta] [varchar](500) NULL, -- no se llena
	[strCuracion_deta] [varchar](500) NULL, -- curacion
	[strInyeccion_deta] [varchar](500) NULL, -- inyeccion
	[intHijos_deta] [int] NULL, -- numeros de hijos

	[str0a3_deta] [varchar](200) NULL,
	[str3a5_deta] [varchar](200) NULL,
	[strMayor7_deta] [varchar](200) NULL,
	[strRnmasc_deta] [varchar](200) NULL,
	[strRnfeme_deta] [varchar](200) NULL,
	[strPartoNor_deta] [varchar](200) NULL,
	[strPartoCesari_deta] [varchar](200) NULL,
	[strUserLog] [varchar](200) NULL,
	[dtFechaLog] [datetime] NULL,
	[strObs1_deta] [varchar](100) NULL,
	[strObs2_deta] [varchar](100) NULL,
	[decObs1_deta] [decimal](7, 2) NULL,
	[decObs2_deta] [decimal](7, 2) NULL,
	[bitObs1_deta] [bit] NULL,
	[bitObs2_deta] [bit] NULL,
	[dtObs1_deta] [datetime] NULL,
	[dtObs2_deta] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_deta] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BU_HISTORIAL]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_HISTORIAL](
	[strCod_histo] [varchar](200) NOT NULL,
	[strCod_alu] [varchar](200) NULL,
	[strCod_ser] [varchar](200) NULL,
	[strCod_Car] [varchar](200) NULL,
	[strCod_matric] [varchar](200) NULL,
	[dtFecha_histo] [date] NULL,
	[strCod_Sede] [varchar](200) NULL,
	[strCod_Fac] [varchar](200) NULL,
	[bitEstado_histo] [bit] NULL,
	[strUserLog] [varchar](200) NULL,
	[dtFechaLog] [datetime] NULL,
	[strObs1_histo] [varchar](100) NULL,
	[strObs2_histo] [varchar](100) NULL,
	[decObs1_histo] [decimal](7, 2) NULL,
	[decObs2_histo] [decimal](7, 2) NULL,
	[bitObs1_histo] [bit] NULL,
	[bitObs2_histo] [bit] NULL,
	[dtObs1_histo] [datetime] NULL,
	[dtObs2_histo] [datetime] NULL,
	[strCod_medico] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_histo] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BU_REGISTRO]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_REGISTRO](
	[strCod_reg] [varchar](200) NOT NULL,
	[strCod_alu] [varchar](200) NULL,
	[strCod_Car] [varchar](200) NULL,
	[strCod_Sede] [varchar](200) NULL,
	[strCod_Fac] [varchar](200) NULL,
	[strUserLog] [varchar](200) NULL,
	[dtFechaLog] [datetime] NULL,
	[strObs1_reg] [varchar](100) NULL,
	[strObs2_reg] [varchar](100) NULL,
	[decObs1_reg] [decimal](7, 2) NULL,
	[decObs2_reg] [decimal](7, 2) NULL,
	[bitObs1_reg] [bit] NULL,
	[bitObs2_reg] [bit] NULL,
	[dtObs1_reg] [datetime] NULL,
	[dtObs2_reg] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_reg] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BU_SERVICIO]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_SERVICIO](
	[strCod_ser] [varchar](200) NOT NULL,
	[strNombre_ser] [varchar](200) NULL,
	[strUserLog] [varchar](200) NULL,
	[dtFechaLog] [datetime] NULL,
	[strObs1_ser] [varchar](100) NULL,
	[strObs2_ser] [varchar](100) NULL,
	[decObs1_ser] [decimal](7, 2) NULL,
	[decObs2_ser] [decimal](7, 2) NULL,
	[bitObs1_ser] [bit] NULL,
	[bitObs2_ser] [bit] NULL,
	[dtObs1_ser] [datetime] NULL,
	[dtObs2_ser] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_ser] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BU_SIGNOV]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_SIGNOV](
	[strCod_sig] [varchar](200) NOT NULL,
	[strPreArt_sig] [varchar](200) NULL,
	[strTempera_sig] [varchar](200) NULL,
	[strPulso_sig] [varchar](200) NULL,
	[strFreRes_sig] [varchar](200) NULL,
	[strUserLog] [varchar](200) NULL,
	[dtFechaLog] [datetime] NULL,
	[strObs1_sig] [varchar](100) NULL,
	[strObs2_sig] [varchar](100) NULL,
	[decObs1_sig] [decimal](7, 2) NULL,
	[decObs2_sig] [decimal](7, 2) NULL,
	[bitObs1_sig] [bit] NULL,
	[bitObs2_sig] [bit] NULL,
	[dtObs1_sig] [datetime] NULL,
	[dtObs2_sig] [datetime] NULL,
	[strCod_alu] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_sig] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIGUTC_CARRERA]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIGUTC_CARRERA](
	[strCod_Car] [varchar](200) NOT NULL,
	[strNombre_Car] [varchar](200) NULL,
	[strCod_OrgC] [varchar](200) NULL,
	[strCedDirector_Car] [varchar](200) NULL,
	[strEstado_Car] [varchar](200) NULL,
	[strTipo_Car] [varchar](200) NULL,
	[strGrupo_Car] [varchar](200) NULL,
	[intMatricula_Car] [int] NULL,
	[intFolio_Car] [int] NULL,
	[strCedCoor_Car] [varchar](200) NULL,
	[strCod_Sede] [varchar](200) NULL,
	[strCod_Fac] [varchar](200) NULL,
	[strObs1_car] [varchar](200) NULL,
	[strObs2_Car] [varchar](200) NULL,
	[strObs3_Car] [varchar](200) NULL,
	[strObs4_Car] [varchar](200) NULL,
	[strModalidad_Car] [varchar](200) NULL,
	[strCampus_Car] [varchar](200) NULL,
	[dtFecha_log] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_Car] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIGUTC_CURSO]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIGUTC_CURSO](
	[strCod_curso] [varchar](200) NULL,
	[intCod_nivel] [varchar](200) NULL,
	[strParalelo_curso] [varchar](200) NULL,
	[intCupos_curso] [int] NULL,
	[intCapacidad_curso] [int] NULL,
	[strCod_aula] [varchar](200) NULL,
	[strJornada_curso] [varchar](200) NULL,
	[strCod_malla] [varchar](200) NULL,
	[strTipo_curso] [varchar](200) NULL,
	[strCod_per] [varchar](200) NULL,
	[strObs1_curso] [varchar](200) NULL,
	[strObs2_curso] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIGUTC_FACULTAD]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIGUTC_FACULTAD](
	[strCod_Fac] [varchar](200) NOT NULL,
	[strNombre_Fac] [varchar](200) NULL,
	[strCod_OrgC] [varchar](200) NULL,
	[strCedDecano_Fac] [varchar](200) NULL,
	[strCedSubDec_Fac] [varchar](200) NULL,
	[strEstado_Fac] [varchar](200) NULL,
	[strTipo_Fac] [varchar](200) NULL,
	[strCedCoor_Fac] [varchar](200) NULL,
	[strCod_Sede] [varchar](200) NULL,
	[strObs1_Fac] [varchar](200) NULL,
	[strObs2_Fac] [varchar](200) NULL,
	[strObs3_Fac] [varchar](200) NULL,
	[dtFecha_log] [datetime] NULL,
	[strUser_log] [varchar](200) NULL,
	[bitEstado_fac] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_Fac] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIGUTC_MATRICULA]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIGUTC_MATRICULA](
	[strCod_matric] [varchar](200) NOT NULL,
	[strCod_per] [varchar](200) NULL,
	[strCod_alu] [varchar](200) NULL,
	[intCod_nivel] [varchar](200) NULL,
	[dtFechaCrea_matric] [datetime] NULL,
	[bitEstado_matric] [bit] NULL,
	[intRepeticion_matric] [int] NULL,
	[bitBan1_matric] [bit] NULL,
	[bitBan2_matric] [bit] NULL,
	[decVal1_matric] [decimal](18, 0) NULL,
	[decVal2_matric] [decimal](18, 0) NULL,
	[decVal3_matric] [decimal](18, 0) NULL,
	[strObs1_matric] [varchar](200) NULL,
	[strObs2_matric] [varchar](200) NULL,
	[strObs3_matric] [varchar](200) NULL,
	[dtFec1_matric] [datetime] NULL,
	[dtFec2_matric] [datetime] NULL,
	[dtFec3_matric] [datetime] NULL,
	[dtFecha_log] [datetime] NULL,
	[strUser_log] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_matric] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIGUTC_PERIODO]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIGUTC_PERIODO](
	[strCod_per] [varchar](200) NOT NULL,
	[intNum_per] [int] NULL,
	[intNumSemanas_per] [int] NULL,
	[strCod_regim] [varchar](200) NULL,
	[strCod_Sede] [varchar](200) NULL,
	[strCod_Fac] [varchar](200) NULL,
	[strCod_Car] [varchar](200) NULL,
	[strNombre_per] [varchar](200) NULL,
	[dtFechaIni_per] [datetime] NULL,
	[dtFechaFin_per] [datetime] NULL,
	[strCod_malla] [varchar](200) NULL,
	[strEstado_per] [varchar](200) NULL,
	[dtFecha_log] [datetime] NULL,
	[strUser_log] [varchar](200) NULL,
	[strObs1_per] [varchar](200) NULL,
	[strObs2_per] [varchar](200) NULL,
	[strNombreCorto_per] [varchar](200) NULL,
	[bitEstado_per] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_per] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIGUTC_PERSONAL]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIGUTC_PERSONAL](
	[strCod_alu] [varchar](200) NOT NULL,
	[VALCED_ALU] [varchar](200) NULL,
	[CODIGO_CIU] [varchar](200) NULL,
	[APELLIDO_ALU] [varchar](200) NULL,
	[APELLIDOM_ALU] [varchar](200) NULL,
	[NOMBRE_ALU] [varchar](200) NULL,
	[SEXO_ALU] [varchar](200) NULL,
	[ESTCIV_ALU] [varchar](200) NULL,
	[FNAC_ALU] [varchar](200) NULL,
	[LNAC_ALU] [varchar](200) NULL,
	[NACIONALIDAD_ALU] [varchar](200) NULL,
	[DIRECCION_ALU] [varchar](200) NULL,
	[DIRCOMPLETA_ALU] [varchar](200) NULL,
	[FONFIJ_ALU] [varchar](200) NULL,
	[FONCEL_ALU] [varchar](200) NULL,
	[OPERADORAMOVIL_ALU] [varchar](200) NULL,
	[FOTO_ALU] [varchar](200) NULL,
	[OBS1_ALU] [varchar](200) NULL,
	[OBS2_ALU] [varchar](200) NULL,
	[OBS3_ALU] [varchar](200) NULL,
	[DISCAPACIDAD_ALU] [varchar](200) NULL,
	[NUMCONADIS_ALU] [varchar](200) NULL,
	[FLOG_ALU] [varchar](200) NULL,
	[OBS4_ALU] [varchar](200) NULL,
	[OBS5_ALU] [varchar](200) NULL,
	[OBS6_ALU] [varchar](200) NULL,
	[LIBRETAMILITAR_ALU] [varchar](200) NULL,
	[ANIOSRESIDENCIA_ALU] [varchar](200) NULL,
	[TIPOSANGRE_ALU] [varchar](200) NULL,
	[FONTRAB_ALU] [varchar](200) NULL,
	[NACIONALIDADINDIG_ALU] [varchar](200) NULL,
	[strUsername] [varchar](200) NULL,
	[strContrasena] [varchar](200) NULL,
	[strRol] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_alu] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIGUTC_SEDE]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIGUTC_SEDE](
	[strCod_Sede] [varchar](200) NOT NULL,
	[strNombre_Sede] [varchar](200) NULL,
	[strTipo_Sede] [varchar](200) NULL,
	[strCod_OrgC] [varchar](200) NULL,
	[strDir_sede] [varchar](200) NULL,
	[strSubDir_sede] [varchar](200) NULL,
	[strSubDirAdm_sede] [varchar](200) NULL,
	[strObs1_sede] [varchar](200) NULL,
	[strObs2_sede] [varchar](200) NULL,
	[strObs3_sede] [varchar](200) NULL,
	[dtFecha_log] [datetime] NULL,
	[strUser_log] [varchar](200) NULL,
	[bitEstado_sede] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[strCod_Sede] ASC
)
) ON [PRIMARY]
GO
INSERT [dbo].[BU_HISTORIAL] ([strCod_histo], [strCod_alu], [strCod_ser], [strCod_Car], [strCod_matric], [dtFecha_histo], [strCod_Sede], [strCod_Fac], [bitEstado_histo], [strUserLog], [dtFechaLog], [strObs1_histo], [strObs2_histo], [decObs1_histo], [decObs2_histo], [bitObs1_histo], [bitObs2_histo], [dtObs1_histo], [dtObs2_histo], [strCod_medico]) VALUES (N'11148676-9f8b-46f6-a9b5-6a8793eb634f', N'5005729464', N'SRMG', NULL, NULL, CAST(N'2024-07-31' AS Date), NULL, NULL, 1, N'2250242985', CAST(N'2024-07-31T22:21:23.483' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1850060022')
GO
INSERT [dbo].[BU_HISTORIAL] ([strCod_histo], [strCod_alu], [strCod_ser], [strCod_Car], [strCod_matric], [dtFecha_histo], [strCod_Sede], [strCod_Fac], [bitEstado_histo], [strUserLog], [dtFechaLog], [strObs1_histo], [strObs2_histo], [decObs1_histo], [decObs2_histo], [bitObs1_histo], [bitObs2_histo], [dtObs1_histo], [dtObs2_histo], [strCod_medico]) VALUES (N'267c0b60-1897-4b60-956e-aa192f0817bd', N'1792837465', N'SRMG', NULL, NULL, CAST(N'2024-07-31' AS Date), NULL, NULL, 1, N'2250242985', CAST(N'2024-07-31T22:16:29.503' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1850060011')
GO
INSERT [dbo].[BU_HISTORIAL] ([strCod_histo], [strCod_alu], [strCod_ser], [strCod_Car], [strCod_matric], [dtFecha_histo], [strCod_Sede], [strCod_Fac], [bitEstado_histo], [strUserLog], [dtFechaLog], [strObs1_histo], [strObs2_histo], [decObs1_histo], [decObs2_histo], [bitObs1_histo], [bitObs2_histo], [dtObs1_histo], [dtObs2_histo], [strCod_medico]) VALUES (N'9497afe0-e290-4304-9f0e-c956ed42f2d7', N'0550182471', N'SRMG', NULL, NULL, CAST(N'2024-08-01' AS Date), NULL, NULL, 1, N'2250242985', CAST(N'2024-08-01T00:57:48.760' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1850060022')
GO
INSERT [dbo].[BU_HISTORIAL] ([strCod_histo], [strCod_alu], [strCod_ser], [strCod_Car], [strCod_matric], [dtFecha_histo], [strCod_Sede], [strCod_Fac], [bitEstado_histo], [strUserLog], [dtFechaLog], [strObs1_histo], [strObs2_histo], [decObs1_histo], [decObs2_histo], [bitObs1_histo], [bitObs2_histo], [dtObs1_histo], [dtObs2_histo], [strCod_medico]) VALUES (N'ab4846c5-ee55-495b-93e1-99216f87c48b', N'1850043991', N'SRMG', NULL, NULL, CAST(N'2024-08-01' AS Date), NULL, NULL, 1, N'2250242985', CAST(N'2024-08-01T00:57:35.250' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0550058051')
GO
INSERT [dbo].[BU_HISTORIAL] ([strCod_histo], [strCod_alu], [strCod_ser], [strCod_Car], [strCod_matric], [dtFecha_histo], [strCod_Sede], [strCod_Fac], [bitEstado_histo], [strUserLog], [dtFechaLog], [strObs1_histo], [strObs2_histo], [decObs1_histo], [decObs2_histo], [bitObs1_histo], [bitObs2_histo], [dtObs1_histo], [dtObs2_histo], [strCod_medico]) VALUES (N'b9a2386f-f5ac-4570-8011-f7a9d03862fe', N'1792837465', N'SRMG', NULL, NULL, CAST(N'2024-07-31' AS Date), NULL, NULL, 1, N'2250242985', CAST(N'2024-07-31T22:16:46.063' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1850060011')
GO
INSERT [dbo].[BU_HISTORIAL] ([strCod_histo], [strCod_alu], [strCod_ser], [strCod_Car], [strCod_matric], [dtFecha_histo], [strCod_Sede], [strCod_Fac], [bitEstado_histo], [strUserLog], [dtFechaLog], [strObs1_histo], [strObs2_histo], [decObs1_histo], [decObs2_histo], [bitObs1_histo], [bitObs2_histo], [dtObs1_histo], [dtObs2_histo], [strCod_medico]) VALUES (N'd2fc17eb-897d-4475-8307-c56bd0389c4c', N'5005729464', N'SRMG', NULL, NULL, CAST(N'2024-07-31' AS Date), NULL, NULL, 1, N'2250242985', CAST(N'2024-07-31T23:00:54.523' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0550058051')
GO
INSERT [dbo].[BU_HISTORIAL] ([strCod_histo], [strCod_alu], [strCod_ser], [strCod_Car], [strCod_matric], [dtFecha_histo], [strCod_Sede], [strCod_Fac], [bitEstado_histo], [strUserLog], [dtFechaLog], [strObs1_histo], [strObs2_histo], [decObs1_histo], [decObs2_histo], [bitObs1_histo], [bitObs2_histo], [dtObs1_histo], [dtObs2_histo], [strCod_medico]) VALUES (N'ee034d14-2199-4bfc-843a-f6d6059db0fa', N'0550987262', N'SRMG', NULL, NULL, CAST(N'2024-08-01' AS Date), NULL, NULL, 1, N'2250242985', CAST(N'2024-08-01T00:57:20.227' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0550058051')
GO
INSERT [dbo].[BU_HISTORIAL] ([strCod_histo], [strCod_alu], [strCod_ser], [strCod_Car], [strCod_matric], [dtFecha_histo], [strCod_Sede], [strCod_Fac], [bitEstado_histo], [strUserLog], [dtFechaLog], [strObs1_histo], [strObs2_histo], [decObs1_histo], [decObs2_histo], [bitObs1_histo], [bitObs2_histo], [dtObs1_histo], [dtObs2_histo], [strCod_medico]) VALUES (N'eeac21be-58b8-4471-b607-f1df2c3ae57e', N'5005729464', N'SRMG', NULL, NULL, CAST(N'2024-08-01' AS Date), NULL, NULL, 1, N'2250242985', CAST(N'2024-08-01T01:46:53.833' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0550058051')
GO
INSERT [dbo].[BU_HISTORIAL] ([strCod_histo], [strCod_alu], [strCod_ser], [strCod_Car], [strCod_matric], [dtFecha_histo], [strCod_Sede], [strCod_Fac], [bitEstado_histo], [strUserLog], [dtFechaLog], [strObs1_histo], [strObs2_histo], [decObs1_histo], [decObs2_histo], [bitObs1_histo], [bitObs2_histo], [dtObs1_histo], [dtObs2_histo], [strCod_medico]) VALUES (N'fd6cd35e-9291-48c7-9f78-6d9d028b0a06', N'0550182471', N'SRMG', NULL, NULL, CAST(N'2024-08-01' AS Date), NULL, NULL, 1, N'2250242985', CAST(N'2024-08-01T01:43:09.457' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1850060011')
GO
INSERT [dbo].[BU_SERVICIO] ([strCod_ser], [strNombre_ser], [strUserLog], [dtFechaLog], [strObs1_ser], [strObs2_ser], [decObs1_ser], [decObs2_ser], [bitObs1_ser], [bitObs2_ser], [dtObs1_ser], [dtObs2_ser]) VALUES (N'SRMG', N'MEDICINA GENERAL', NULL, NULL, N'', NULL, NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[BU_SERVICIO] ([strCod_ser], [strNombre_ser], [strUserLog], [dtFechaLog], [strObs1_ser], [strObs2_ser], [decObs1_ser], [decObs2_ser], [bitObs1_ser], [bitObs2_ser], [dtObs1_ser], [dtObs2_ser]) VALUES (N'SROD', N'ODONTOLOGIA', NULL, NULL, N'', NULL, NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[BU_SERVICIO] ([strCod_ser], [strNombre_ser], [strUserLog], [dtFechaLog], [strObs1_ser], [strObs2_ser], [decObs1_ser], [decObs2_ser], [bitObs1_ser], [bitObs2_ser], [dtObs1_ser], [dtObs2_ser]) VALUES (N'SRPS', N'PSICOLOGIA ', NULL, NULL, NULL, N'', NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[BU_SIGNOV] ([strCod_sig], [strPreArt_sig], [strTempera_sig], [strPulso_sig], [strFreRes_sig], [strUserLog], [dtFechaLog], [strObs1_sig], [strObs2_sig], [decObs1_sig], [decObs2_sig], [bitObs1_sig], [bitObs2_sig], [dtObs1_sig], [dtObs2_sig], [strCod_alu]) VALUES (N'3644c619-353f-478c-94ea-1666c4592c49', N'23', N'442', N'332', N'23', N'2250242985', CAST(N'2024-08-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0550182471')
GO
INSERT [dbo].[BU_SIGNOV] ([strCod_sig], [strPreArt_sig], [strTempera_sig], [strPulso_sig], [strFreRes_sig], [strUserLog], [dtFechaLog], [strObs1_sig], [strObs2_sig], [decObs1_sig], [decObs2_sig], [bitObs1_sig], [bitObs2_sig], [dtObs1_sig], [dtObs2_sig], [strCod_alu]) VALUES (N'62d5407e-5c52-468d-ad57-1c4b79e1afe0', N'223', N'442', N'332', N'323', N'2250242985', CAST(N'2024-07-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'5005729464')
GO
INSERT [dbo].[BU_SIGNOV] ([strCod_sig], [strPreArt_sig], [strTempera_sig], [strPulso_sig], [strFreRes_sig], [strUserLog], [dtFechaLog], [strObs1_sig], [strObs2_sig], [decObs1_sig], [decObs2_sig], [bitObs1_sig], [bitObs2_sig], [dtObs1_sig], [dtObs2_sig], [strCod_alu]) VALUES (N'8a0e8e96-a8a8-4bd4-be1b-5a6aa6da5ac9', N'23', N'44', N'56', N'34', N'2250242985', CAST(N'2024-07-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1792837465')
GO
INSERT [dbo].[BU_SIGNOV] ([strCod_sig], [strPreArt_sig], [strTempera_sig], [strPulso_sig], [strFreRes_sig], [strUserLog], [dtFechaLog], [strObs1_sig], [strObs2_sig], [decObs1_sig], [decObs2_sig], [bitObs1_sig], [bitObs2_sig], [dtObs1_sig], [dtObs2_sig], [strCod_alu]) VALUES (N'9b44beec-0c29-40f4-a6f3-6f12eca97706', N'23', N'44', N'56', N'34', N'2250242985', CAST(N'2024-07-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1792837465')
GO
INSERT [dbo].[BU_SIGNOV] ([strCod_sig], [strPreArt_sig], [strTempera_sig], [strPulso_sig], [strFreRes_sig], [strUserLog], [dtFechaLog], [strObs1_sig], [strObs2_sig], [decObs1_sig], [decObs2_sig], [bitObs1_sig], [bitObs2_sig], [dtObs1_sig], [dtObs2_sig], [strCod_alu]) VALUES (N'9e03a804-77dc-4a1c-bc40-53d632eb2ba2', N'23', N'44', N'33', N'342', N'2250242985', CAST(N'2024-08-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'5005729464')
GO
INSERT [dbo].[BU_SIGNOV] ([strCod_sig], [strPreArt_sig], [strTempera_sig], [strPulso_sig], [strFreRes_sig], [strUserLog], [dtFechaLog], [strObs1_sig], [strObs2_sig], [decObs1_sig], [decObs2_sig], [bitObs1_sig], [bitObs2_sig], [dtObs1_sig], [dtObs2_sig], [strCod_alu]) VALUES (N'b84fe342-ece0-481b-86cf-e28d427a6249', N'23', N'44', N'56', N'34', N'2250242985', CAST(N'2024-07-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1792837465')
GO
INSERT [dbo].[BU_SIGNOV] ([strCod_sig], [strPreArt_sig], [strTempera_sig], [strPulso_sig], [strFreRes_sig], [strUserLog], [dtFechaLog], [strObs1_sig], [strObs2_sig], [decObs1_sig], [decObs2_sig], [bitObs1_sig], [bitObs2_sig], [dtObs1_sig], [dtObs2_sig], [strCod_alu]) VALUES (N'd2f128e9-a357-4754-a308-992257fe7679', N'23', N'442', N'23', N'23', N'2250242985', CAST(N'2024-07-31T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'5005729464')
GO
INSERT [dbo].[BU_SIGNOV] ([strCod_sig], [strPreArt_sig], [strTempera_sig], [strPulso_sig], [strFreRes_sig], [strUserLog], [dtFechaLog], [strObs1_sig], [strObs2_sig], [decObs1_sig], [decObs2_sig], [bitObs1_sig], [bitObs2_sig], [dtObs1_sig], [dtObs2_sig], [strCod_alu]) VALUES (N'd482c4f5-5dca-4522-bc6f-5f38d98db1ef', N'223', N'442', N'332', N'23', N'2250242985', CAST(N'2024-08-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1850043991')
GO
INSERT [dbo].[BU_SIGNOV] ([strCod_sig], [strPreArt_sig], [strTempera_sig], [strPulso_sig], [strFreRes_sig], [strUserLog], [dtFechaLog], [strObs1_sig], [strObs2_sig], [decObs1_sig], [decObs2_sig], [bitObs1_sig], [bitObs2_sig], [dtObs1_sig], [dtObs2_sig], [strCod_alu]) VALUES (N'ea4916fa-472f-4ad0-9513-d9611c31a5e3', N'223', N'44', N'332', N'34', N'2250242985', CAST(N'2024-08-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0550182471')
GO
INSERT [dbo].[BU_SIGNOV] ([strCod_sig], [strPreArt_sig], [strTempera_sig], [strPulso_sig], [strFreRes_sig], [strUserLog], [dtFechaLog], [strObs1_sig], [strObs2_sig], [decObs1_sig], [decObs2_sig], [bitObs1_sig], [bitObs2_sig], [dtObs1_sig], [dtObs2_sig], [strCod_alu]) VALUES (N'ee06029c-0670-4b75-a7f2-08a90e228e77', N'23', N'44', N'56', N'34', N'2250242985', CAST(N'2024-08-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0550987262')
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'IAGP', N'AGROPECUARIA', N'0', N'0', N'0', NULL, N'ING', 0, 0, NULL, N'MUTC', N'CAREN_MUTC', NULL, N'ML', N'PRESENCIAL', N'PRIMERO', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'IAGR', N'AGRONOMÍA', N'0', N'0', N'0', NULL, N'ING', 0, 0, NULL, N'MUTC', N'CAREN_MUTC', NULL, N'ML', N'PRESENCIAL', N'PRIMERO', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'IAID', N'INGENIERÍA AGROINDUSTRIAL', N'0', N'0', N'0', NULL, N'ING', 0, 0, NULL, N'MUTC', N'CAREN_MUTC', NULL, N'ML', N'PRESENCIAL', N'NIVELACION', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'ICOA', N'CONTABILIDAD Y AUDITORÍA', N'0', N'0', N'0', NULL, N'LIC', 0, 0, NULL, N'MUTC', N'CCAA_MUTC', NULL, N'ML', N'PRESENCIAL', N'PRIMERO', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'ICOM', N'ADMINISTRACIÓN DE EMPRESAS', N'0', N'0', N'0', NULL, N'LIC', 0, 0, NULL, N'MUTC', N'CCAA_MUTC', NULL, N'ML', N'PRESENCIAL', N'PRIMERO', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'IDIG', N'DISEÑO GRÁFICO', N'0', N'0', N'0', N'HUM', N'LIC', 0, 0, NULL, N'MUTC', N'CCHH_MUTC', NULL, N'ML', N'PRESENCIAL', N'PRIMERO', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'IELE', N'ELECTRICIDAD', N'0', N'0', N'0', NULL, N'ING', 0, 0, NULL, N'MUTC', N'CIYA_MUTC', NULL, N'ML', N'PRESENCIAL', N'NIVELACION', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'IELM', N'ELECTROMECÁNICA', N'0', N'0', N'0', NULL, N'ING', 0, 0, NULL, N'MUTC', N'CIYA_MUTC', NULL, N'ML', N'PRESENCIAL', N'NIVELACION', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'IHID', N'INGENIERÍA HIDRAULICA', N'0', N'0', N'0', NULL, N'ING', 0, 0, NULL, N'MUTC', N'CIYA_MUTC', NULL, N'ML', N'PRESENCIAL', N'NIVELACION', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'IIND', N'INGENIERÍA INDUSTRIAL', N'0', N'0', N'0', NULL, N'ING', 0, 0, NULL, N'MUTC', N'CIYA_MUTC', NULL, N'SF', N'PRESENCIAL', N'NIVELACION', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'ISIN', N'INGENIERÍA SISTEMAS DE INFORMACION', N'0', N'0', N'0', NULL, N'ING', 0, 0, NULL, N'MUTC', N'CIYA_MUTC', NULL, N'ML', N'PRESENCIAL', N'NIVELACION', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'LANI', N'ANIMACIÓN DIGITAL', N'0', N'0', N'0', N'HUM', N'LIC', 0, 0, NULL, N'MUTC', N'CCHH_MUTC', NULL, N'ML', N'PRESENCIAL', N'PRIMERO', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'LCCF', N'CIENCIAS DE LA EDUCACIÓN MENCIÓN CULTURA FÍSICA', N'0', N'0', N'0', N'EDU', N'LIC', 0, 0, NULL, N'MUTC', N'CCHH_MUTC', NULL, N'ML', N'PRESENCIAL', N'PRIMERO', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'LECO', N'ECONOMÍA', N'0', N'0', N'0', NULL, N'LIC', 0, 0, NULL, N'MUTC', N'CCAA_MUTC', NULL, N'ML', N'SEMIPRESENCIAL', N'PRIMERO', N'SEMIPRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'LMIAGR', N'AGRONOMÍA', N'0', N'0', N'0', NULL, N'ING', 0, 0, NULL, N'EMANA', N'CAREN_EMANA', NULL, N'ML', N'PRESENCIAL', N'PRIMERO', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'LMIAID', N'INGENIERÍA AGROINDUSTRIAL', N'0', N'0', N'0', NULL, N'ING', 0, 0, NULL, N'EMANA', N'CAREN_EMANA', NULL, N'ML', N'PRESENCIAL', N'NIVELACION', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'LMICOA', N'CONTABILIDAD Y AUDITORÍA', N'0', N'0', N'0', NULL, N'LIC', 0, 0, NULL, N'EMANA', N'CCAA_EMANA', NULL, N'ML', N'HIBRIDA', N'PRIMERO', N'HIBRIDA', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'LMICOM', N'ADMINISTRACIÓN DE EMPRESAS', N'0', N'0', N'0', NULL, N'LIC', 0, 0, NULL, N'EMANA', N'CCAA_EMANA', NULL, N'ML', N'PRESENCIAL', N'PRIMERO', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'LMIDIG', N'DISEÑO GRAFICO', N'0', N'0', N'0', NULL, N'LIC', 0, 0, NULL, N'EMANA', N'CCHH_EMANA', NULL, N'ML', N'PRESENCIAL', NULL, N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'LMLCCF', N'CIENCIAS DE LA EDUCACION MENCIÓN CULTURA FISICA', N'0', N'0', N'0', NULL, N'LIC', 0, 0, NULL, N'EMANA', N'CCHH_EMANA', NULL, N'ML', N'PRESENCIAL', NULL, N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'PULEDB', N'(PU)CIENCIAS DE LA EDUCACIÓN MENCIÓN EDUCACIÓN BÁSICA', N'0', N'0', N'0', N'EDU', N'LIC', 0, 0, NULL, N'EPUJI', N'CCHH_EPUJI', NULL, N'ML', N'PRESENCIAL', N'PRIMERO', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CARRERA] ([strCod_Car], [strNombre_Car], [strCod_OrgC], [strCedDirector_Car], [strEstado_Car], [strTipo_Car], [strGrupo_Car], [intMatricula_Car], [intFolio_Car], [strCedCoor_Car], [strCod_Sede], [strCod_Fac], [strObs1_car], [strObs2_Car], [strObs3_Car], [strObs4_Car], [strModalidad_Car], [strCampus_Car], [dtFecha_log]) VALUES (N'PULING', N'(PU)PEDAGOGÍA DE LOS IDIOMAS NACIONALES Y EXTRANJEROS', N'0', N'0', N'0', N'EDU', N'LIC', 0, 0, NULL, N'EPUJI', N'CCHH_EPUJI', NULL, N'ML', N'PRESENCIAL', N'PRIMERO', N'PRECENCIAL', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_EMANA_CAREN_LMIAGR_0_A_M2', N'8', N'A', 0, 0, N'LA MANA', N'Matutina', N'M0_EMANA_CAREN_LMIAGR', N'Normal', N'PA_EMANA_CAREN_LMIAGR', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_EMANA_CAREN_LMIAID_0_A_M2', N'8', N'B', 0, 0, N'LA MANA', N'Matutina', N'M1_EMANA_CAREN_LMIAID', N'Normal', N'PA_EMANA_CAREN_LMIAID', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_EMANA_CCAA_LMICOA_0_A_M2', N'8', N'A', 0, 0, N'LA MANA', N'Matutina', N'M2_EMANA_CCAA_LMICOA', N'Normal', N'PA_EMANA_CCAA_LMICOA', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_EMANA_CCAA_LMICOM_0_A_M2', N'8', N'A', 0, 0, N'LA MANA', N'Mañana', N'M3_EMANA_CCAA_LMICOM', N'Normal', N'PA_EMANA_CCAA_LMICOM', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_EMANA_CCHH_LMIDIG_0_A_M2', N'8', N'A', 0, 0, N'LA MANA', N'Matutina', N'M4_EMANA_CCHH_LMIDIG', N'Normal', N'PA_EMANA_CCHH_LMIDIG', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_EMANA_CCHH_LMLCCF_0_A_M2', N'8', N'A', 0, 0, N'LA MANA', N'Matutina', N'M5_EMANA_CCHH_LMLCCF', N'Normal', N'PA_EMANA_CCHH_LMLCCF', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_EPUJILI_CCHH_PULEDB_0_A_M2', N'8', N'A', 0, 0, N'PUJILI', N'Matutina', N'M6_EPUJI_CCHH_PULEDB', N'Normal', N'PA_EPUJILI_CCHH_PULEDB', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_EPUJILI_CCHH_PULING_0_A_M2', N'8', N'A', 0, 0, N'PUJILI', N'Matutina', N'M7_EPUJI_CCHH_PULING', N'Normal', N'PA_EPUJILI_CCHH_PULING', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CAREN_IAGP_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M8_MUTC_CAREN_IAGP', N'Normal', N'PA_MUTC_CAREN_IAGP', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CAREN_IAGR_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M9_MUTC_CAREN_IAGR', N'Normal', N'PA_MUTC_CAREN_IAGR', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CAREN_IAID_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M10_MUTC_CAREN_IAID', N'Normal', N'PA_MUTC_CAREN_IAID', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CCAA_ICOA_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M11_MUTC_CCAA_ICOA', N'Normal', N'PA_MUTC_CCAA_ICOA', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CCAA_ICOM_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M12_MUTC_CCAA_ICOM', N'Normal', N'PA_MUTC_CCAA_ICOM', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CCAA_LECO_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M13_MUTC_CCAA_LECO', N'Normal', N'PA_MUTC_CCAA_LECO', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CCHH_IDIG_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M14_MUTC_CCHH_IDIG', N'Normal', N'PA_MUTC_CCHH_IDIG', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CCHH_LANI_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M15_MUTC_CCHH_LANI', N'Normal', N'PA_MUTC_CCHH_LANI', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CCHH_LCCF_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M16_MUTC_CCHH_LCCF', N'Normal', N'PA_MUTC_CCHH_LCCF', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CIYA_IELE_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M17_MUTC_CIYA_IELE', N'Normal', N'PA_MUTC_CIYA_IELE', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CIYA_IELM_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M18_MUTC_CIYA_IELM', N'Normal', N'PA_MUTC_CIYA_IELM', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CIYA_IHID_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M19_MUTC_CIYA_IHID', N'Normal', N'PA_MUTC_CIYA_IHID', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CIYA_IIND_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M20_MUTC_CIYA_IIND', N'Normal', N'PA_MUTC_CIYA_IIND', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_CURSO] ([strCod_curso], [intCod_nivel], [strParalelo_curso], [intCupos_curso], [intCapacidad_curso], [strCod_aula], [strJornada_curso], [strCod_malla], [strTipo_curso], [strCod_per], [strObs1_curso], [strObs2_curso]) VALUES (N'CU_MUTC_CIYA_ISIN_0_A_M2', N'8', N'A', 0, 0, N'UTC', N'Matutina', N'M20_MUTC_CIYA_ISIN', N'Normal', N'PA_MUTC_CIYA_ISIN', NULL, NULL)
GO
INSERT [dbo].[SIGUTC_FACULTAD] ([strCod_Fac], [strNombre_Fac], [strCod_OrgC], [strCedDecano_Fac], [strCedSubDec_Fac], [strEstado_Fac], [strTipo_Fac], [strCedCoor_Fac], [strCod_Sede], [strObs1_Fac], [strObs2_Fac], [strObs3_Fac], [dtFecha_log], [strUser_log], [bitEstado_fac]) VALUES (N'CAREN_EMANA', N'LM CIENCIAS AGROPECUARIAS Y RECURSOS NATURALES', N'0', N'0', N'0', N'0', N'CARRERA', NULL, N'EMANA', N'DEFAULT', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SIGUTC_FACULTAD] ([strCod_Fac], [strNombre_Fac], [strCod_OrgC], [strCedDecano_Fac], [strCedSubDec_Fac], [strEstado_Fac], [strTipo_Fac], [strCedCoor_Fac], [strCod_Sede], [strObs1_Fac], [strObs2_Fac], [strObs3_Fac], [dtFecha_log], [strUser_log], [bitEstado_fac]) VALUES (N'CAREN_MUTC', N'CIENCIAS AGROPECUARIAS Y RECURSOS NATURALES', N'0', N'0', N'0', N'0', N'CARRERA', NULL, N'MUTC', N'DEFAULT', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SIGUTC_FACULTAD] ([strCod_Fac], [strNombre_Fac], [strCod_OrgC], [strCedDecano_Fac], [strCedSubDec_Fac], [strEstado_Fac], [strTipo_Fac], [strCedCoor_Fac], [strCod_Sede], [strObs1_Fac], [strObs2_Fac], [strObs3_Fac], [dtFecha_log], [strUser_log], [bitEstado_fac]) VALUES (N'CCAA_EMANA', N'LM CIENCIAS ADMINISTRATIVAS', N'0', N'0', N'0', N'0', N'CARRERA', NULL, N'EMANA', N'DEFAULT', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SIGUTC_FACULTAD] ([strCod_Fac], [strNombre_Fac], [strCod_OrgC], [strCedDecano_Fac], [strCedSubDec_Fac], [strEstado_Fac], [strTipo_Fac], [strCedCoor_Fac], [strCod_Sede], [strObs1_Fac], [strObs2_Fac], [strObs3_Fac], [dtFecha_log], [strUser_log], [bitEstado_fac]) VALUES (N'CCAA_MUTC', N'CIENCIAS ADMINISTRATIVAS', N'0', N'0', N'0', N'0', N'CARRERA', NULL, N'MUTC', N'DEFAULT', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SIGUTC_FACULTAD] ([strCod_Fac], [strNombre_Fac], [strCod_OrgC], [strCedDecano_Fac], [strCedSubDec_Fac], [strEstado_Fac], [strTipo_Fac], [strCedCoor_Fac], [strCod_Sede], [strObs1_Fac], [strObs2_Fac], [strObs3_Fac], [dtFecha_log], [strUser_log], [bitEstado_fac]) VALUES (N'CCHH_EMANA', N'LM CIENCIAS SOCIALES ARTES Y EDUCACIÓN', N'0', N'0', N'0', N'0', N'CARRERA', NULL, N'EMANA', N'DEFAULT', NULL, N'LM CIENCIAS HUMANAS Y DE EDUCACION', NULL, NULL, 1)
GO
INSERT [dbo].[SIGUTC_FACULTAD] ([strCod_Fac], [strNombre_Fac], [strCod_OrgC], [strCedDecano_Fac], [strCedSubDec_Fac], [strEstado_Fac], [strTipo_Fac], [strCedCoor_Fac], [strCod_Sede], [strObs1_Fac], [strObs2_Fac], [strObs3_Fac], [dtFecha_log], [strUser_log], [bitEstado_fac]) VALUES (N'CCHH_EPUJI', N'PU CIENCIAS SOCIALES ARTES Y EDUCACIÓN', N'0', N'0', N'0', N'0', N'CARRERA', NULL, N'EPUJI', N'DEFAULT', NULL, N'PU CIENCIAS HUMANAS Y DE EDUCACION', NULL, NULL, 1)
GO
INSERT [dbo].[SIGUTC_FACULTAD] ([strCod_Fac], [strNombre_Fac], [strCod_OrgC], [strCedDecano_Fac], [strCedSubDec_Fac], [strEstado_Fac], [strTipo_Fac], [strCedCoor_Fac], [strCod_Sede], [strObs1_Fac], [strObs2_Fac], [strObs3_Fac], [dtFecha_log], [strUser_log], [bitEstado_fac]) VALUES (N'CCHH_MUTC', N'CIENCIAS SOCIALES ARTES Y EDUCACIÓN', N'0', N'0', N'0', N'0', N'CARRERA', NULL, N'MUTC', N'DEFAULT', NULL, N'CIENCIAS HUMANAS Y DE EDUCACION', NULL, NULL, 1)
GO
INSERT [dbo].[SIGUTC_FACULTAD] ([strCod_Fac], [strNombre_Fac], [strCod_OrgC], [strCedDecano_Fac], [strCedSubDec_Fac], [strEstado_Fac], [strTipo_Fac], [strCedCoor_Fac], [strCod_Sede], [strObs1_Fac], [strObs2_Fac], [strObs3_Fac], [dtFecha_log], [strUser_log], [bitEstado_fac]) VALUES (N'CIYA_MUTC', N'INGENIERIA DE LAS CIENCIAS Y APLICADAS', N'0', N'0', N'0', N'0', N'CARRERA', NULL, N'MUTC', N'DEFAULT', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SIGUTC_MATRICULA] ([strCod_matric], [strCod_per], [strCod_alu], [intCod_nivel], [dtFechaCrea_matric], [bitEstado_matric], [intRepeticion_matric], [bitBan1_matric], [bitBan2_matric], [decVal1_matric], [decVal2_matric], [decVal3_matric], [strObs1_matric], [strObs2_matric], [strObs3_matric], [dtFec1_matric], [dtFec2_matric], [dtFec3_matric], [dtFecha_log], [strUser_log]) VALUES (N'MA_EMANA_CAREN_LMIAGR_0550058051', N'PA_EMANA_CAREN_LMIAGR', N'0550058051', N'8', NULL, 1, 1, 0, 0, CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), N'DEFAUL', N'DEFAULT', N'DEFAULT', NULL, NULL, NULL, NULL, N'1')
GO
INSERT [dbo].[SIGUTC_MATRICULA] ([strCod_matric], [strCod_per], [strCod_alu], [intCod_nivel], [dtFechaCrea_matric], [bitEstado_matric], [intRepeticion_matric], [bitBan1_matric], [bitBan2_matric], [decVal1_matric], [decVal2_matric], [decVal3_matric], [strObs1_matric], [strObs2_matric], [strObs3_matric], [dtFec1_matric], [dtFec2_matric], [dtFec3_matric], [dtFecha_log], [strUser_log]) VALUES (N'MA_EMANA_CCAA_LMICOA_0550182471', N'PA_EMANA_CAREN_LMIAID', N'0550182471', N'8', NULL, 1, 1, 0, 0, CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), N'DEFAUL', N'DEFAULT', N'DEFAULT', NULL, NULL, NULL, NULL, N'1')
GO
INSERT [dbo].[SIGUTC_MATRICULA] ([strCod_matric], [strCod_per], [strCod_alu], [intCod_nivel], [dtFechaCrea_matric], [bitEstado_matric], [intRepeticion_matric], [bitBan1_matric], [bitBan2_matric], [decVal1_matric], [decVal2_matric], [decVal3_matric], [strObs1_matric], [strObs2_matric], [strObs3_matric], [dtFec1_matric], [dtFec2_matric], [dtFec3_matric], [dtFecha_log], [strUser_log]) VALUES (N'MA_EMANA_CCHH_LMIDIG_0550497366', N'PA_EMANA_CCAA_LMICOA', N'0550497366', N'8', NULL, 1, 1, 0, 0, CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), N'DEFAUL', N'DEFAULT', N'DEFAULT', NULL, NULL, NULL, NULL, N'1')
GO
INSERT [dbo].[SIGUTC_MATRICULA] ([strCod_matric], [strCod_per], [strCod_alu], [intCod_nivel], [dtFechaCrea_matric], [bitEstado_matric], [intRepeticion_matric], [bitBan1_matric], [bitBan2_matric], [decVal1_matric], [decVal2_matric], [decVal3_matric], [strObs1_matric], [strObs2_matric], [strObs3_matric], [dtFec1_matric], [dtFec2_matric], [dtFec3_matric], [dtFecha_log], [strUser_log]) VALUES (N'MA_EMANA_CCHH_LMLCCF_1850043991', N'PA_EMANA_CCHH_LMIDIG', N'1850043991', N'8', NULL, 1, 1, 0, 0, CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), N'DEFAUL', N'DEFAULT', N'DEFAULT', NULL, NULL, NULL, NULL, N'1')
GO
INSERT [dbo].[SIGUTC_MATRICULA] ([strCod_matric], [strCod_per], [strCod_alu], [intCod_nivel], [dtFechaCrea_matric], [bitEstado_matric], [intRepeticion_matric], [bitBan1_matric], [bitBan2_matric], [decVal1_matric], [decVal2_matric], [decVal3_matric], [strObs1_matric], [strObs2_matric], [strObs3_matric], [dtFec1_matric], [dtFec2_matric], [dtFec3_matric], [dtFecha_log], [strUser_log]) VALUES (N'MA_EPUJILI_CCHH_PULEDB_2250242985', N'PA_EMANA_CCAA_LMICOM', N'2250242985', N'8', NULL, 1, 1, 0, 0, CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), N'DEFAUL', N'DEFAULT', N'DEFAULT', NULL, NULL, NULL, NULL, N'1')
GO
INSERT [dbo].[SIGUTC_MATRICULA] ([strCod_matric], [strCod_per], [strCod_alu], [intCod_nivel], [dtFechaCrea_matric], [bitEstado_matric], [intRepeticion_matric], [bitBan1_matric], [bitBan2_matric], [decVal1_matric], [decVal2_matric], [decVal3_matric], [strObs1_matric], [strObs2_matric], [strObs3_matric], [dtFec1_matric], [dtFec2_matric], [dtFec3_matric], [dtFecha_log], [strUser_log]) VALUES (N'MA_MUTC_CAREN_IAID_0550987262', N'PA_EMANA_CCHH_LMLCCF', N'0550987262', N'8', NULL, 1, 1, 0, 0, CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), N'DEFAUL', N'DEFAULT', N'DEFAULT', NULL, NULL, NULL, NULL, N'1')
GO
INSERT [dbo].[SIGUTC_MATRICULA] ([strCod_matric], [strCod_per], [strCod_alu], [intCod_nivel], [dtFechaCrea_matric], [bitEstado_matric], [intRepeticion_matric], [bitBan1_matric], [bitBan2_matric], [decVal1_matric], [decVal2_matric], [decVal3_matric], [strObs1_matric], [strObs2_matric], [strObs3_matric], [dtFec1_matric], [dtFec2_matric], [dtFec3_matric], [dtFecha_log], [strUser_log]) VALUES (N'MA_MUTC_CCHH_IDIG_2206982632', N'PA_EPUJILI_CCHH_PULING', N'2206982632', N'8', NULL, 1, 1, 0, 0, CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), N'DEFAUL', N'DEFAULT', N'DEFAULT', NULL, NULL, NULL, NULL, N'1')
GO
INSERT [dbo].[SIGUTC_MATRICULA] ([strCod_matric], [strCod_per], [strCod_alu], [intCod_nivel], [dtFechaCrea_matric], [bitEstado_matric], [intRepeticion_matric], [bitBan1_matric], [bitBan2_matric], [decVal1_matric], [decVal2_matric], [decVal3_matric], [strObs1_matric], [strObs2_matric], [strObs3_matric], [dtFec1_matric], [dtFec2_matric], [dtFec3_matric], [dtFecha_log], [strUser_log]) VALUES (N'MA_MUTC_CCHH_LCCF_1792837465', N'PA_EPUJILI_CCHH_PULEDB', N'1792837465', N'8', NULL, 1, 1, 0, 0, CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), N'DEFAUL', N'DEFAULT', N'DEFAULT', NULL, NULL, NULL, NULL, N'1')
GO
INSERT [dbo].[SIGUTC_MATRICULA] ([strCod_matric], [strCod_per], [strCod_alu], [intCod_nivel], [dtFechaCrea_matric], [bitEstado_matric], [intRepeticion_matric], [bitBan1_matric], [bitBan2_matric], [decVal1_matric], [decVal2_matric], [decVal3_matric], [strObs1_matric], [strObs2_matric], [strObs3_matric], [dtFec1_matric], [dtFec2_matric], [dtFec3_matric], [dtFecha_log], [strUser_log]) VALUES (N'MA_MUTC_CIYA_IELE_5005729464', N'PA_MUTC_CAREN_IAGP', N'5005729464', N'8', NULL, 1, 1, 0, 0, CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), N'DEFAUL', N'DEFAULT', N'DEFAULT', NULL, NULL, NULL, NULL, N'1')
GO
INSERT [dbo].[SIGUTC_MATRICULA] ([strCod_matric], [strCod_per], [strCod_alu], [intCod_nivel], [dtFechaCrea_matric], [bitEstado_matric], [intRepeticion_matric], [bitBan1_matric], [bitBan2_matric], [decVal1_matric], [decVal2_matric], [decVal3_matric], [strObs1_matric], [strObs2_matric], [strObs3_matric], [dtFec1_matric], [dtFec2_matric], [dtFec3_matric], [dtFecha_log], [strUser_log]) VALUES (N'MA_MUTC_CIYA_IHID_0519286254', N'PA_MUTC_CAREN_IAGR', N'0519286254', N'8', NULL, 1, 1, 0, 0, CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), N'DEFAUL', N'DEFAULT', N'DEFAULT', NULL, NULL, NULL, NULL, N'1')
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_EMANA_CAREN_LMIAGR', 1, 16, N'01_REG', N'EMANA', N'CAREN_EMANA', N'LMIAGR', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'0_EMANA_CAREN_LMIAGR', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_EMANA_CAREN_LMIAID', 1, 16, N'02_REG', N'EMANA', N'CAREN_EMANA', N'LMIAID', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'1_EMANA_CAREN_LMIAID', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_EMANA_CCAA_LMICOA', 1, 16, N'03_REG', N'EMANA', N'CCAA_EMANA', N'LMICOA', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'2_EMANA_CCAA_LMICOA', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_EMANA_CCAA_LMICOM', 1, 16, N'04_REG', N'EMANA', N'CCAA_EMANA', N'LMICOM', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'3_EMANA_CCAA_LMICOM', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_EMANA_CCHH_LMIDIG', 1, 16, N'05_REG', N'EMANA', N'CCHH_EMANA', N'LMIDIG', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'4_EMANA_CCHH_LMIDIG', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_EMANA_CCHH_LMLCCF', 1, 16, N'06_REG', N'EMANA', N'CCHH_EMANA', N'LMLCCF', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'5_EMANA_CCHH_LMLCCF', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_EPUJILI_CCHH_PULEDB', 1, 16, N'07_REG', N'EPUJI', N'CCHH_EPUJI', N'PULEDB', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'6_EPUJILI_CCHH_PULEDB', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_EPUJILI_CCHH_PULING', 1, 16, N'08_REG', N'EPUJI', N'CCHH_EPUJI', N'PULING', N'ABRIL 2024-AGOSTO 2023', NULL, NULL, N'7_EPUJILI_CCHH_PULING', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CAREN_IAGP', 1, 16, N'09_REG', N'MUTC', N'CAREN_MUTC', N'IAGP', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'8_MUTC_CAREN_IAGP', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CAREN_IAGR', 1, 16, N'10_REG', N'MUTC', N'CAREN_MUTC', N'IAGR', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'9_MUTC_CAREN_IAGR', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CAREN_IAID', 1, 16, N'11_RE', N'MUTC', N'CAREN_MUTC', N'IAID', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'10_MUTC_CAREN_IAID', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CCAA_ICOA', 1, 16, N'12_REG', N'MUTC', N'CCAA_MUTC', N'ICOA', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'11_MUTC_CCAA_ICOA', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CCAA_ICOM', 1, 16, N'13_REG', N'MUTC', N'CCAA_MUTC', N'ICOM', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'12_MUTC_CCAA_ICOM', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CCAA_LECO', 1, 16, N'14_REG', N'MUTC', N'CCAA_MUTC', N'LECO', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'13_MUTC_CCAA_LECO', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CCHH_IDIG', 1, 16, N'15_REG', N'MUTC', N'CCHH_MUTC', N'IDIG', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'14_MUTC_CCHH_IDIG', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CCHH_LANI', 1, 16, N'16_REG', N'MUTC', N'CCHH_MUTC', N'LANI', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'15_MUTC_CCHH_LANI', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CCHH_LCCF', 1, 16, N'17_REG', N'MUTC', N'CCHH_MUTC', N'LCCF', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'16_MUTC_CCHH_LCCF', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CIYA_IELE', 1, 16, N'18_REG', N'MUTC', N'CIYA_MUTC', N'IELE', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'17_MUTC_CIYA_IELE', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CIYA_IELM', 1, 16, N'19_REG', N'MUTC', N'CIYA_MUTC', N'IELM', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'18_MUTC_CIYA_IELM', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CIYA_IHID', 1, 16, N'20_REG', N'MUTC', N'CIYA_MUTC', N'IHID', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'19_MUTC_CIYA_IHID', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CIYA_IIND', 1, 16, N'21_REG', N'MUTC', N'CIYA_MUTC', N'IIND', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'20_MUTC_CIYA_IIND', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERIODO] ([strCod_per], [intNum_per], [intNumSemanas_per], [strCod_regim], [strCod_Sede], [strCod_Fac], [strCod_Car], [strNombre_per], [dtFechaIni_per], [dtFechaFin_per], [strCod_malla], [strEstado_per], [dtFecha_log], [strUser_log], [strObs1_per], [strObs2_per], [strNombreCorto_per], [bitEstado_per]) VALUES (N'PA_MUTC_CIYA_ISIN', 1, 16, N'22_REG', N'MUTC', N'CIYA_MUTC', N'ISIN', N'ABRIL 2024-AGOSTO 2024', NULL, NULL, N'21_MUTC_CIYA_ISIN', N'Activo', NULL, N'0', NULL, NULL, N'2024-2024', 1)
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'0519286254', N'P', N'050898', N'Martínez', N'Ramírez', N'Javier', N'M', N'Soltero', N'1997-02-10', N'Mexico', N'Mexicano', N'Latacunga', NULL, N'09517532', N'0987654321', N'Claro', NULL, N'javier..martines7878@utc.edu.ec', NULL, NULL, N'Ninguna', N'0', NULL, N'0519286254', N'0519286254', N'ESTUDIANTE', N'SD', N'0', N'A-', N'09147258', N'Blanco', NULL, NULL, N'ESTUDIANTE')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'0550058051', N'C', N'050101', N'Cayo', N'Masapanta', N'Henry Paul', N'M', N'Soltero', N'1999-03-02', N'Saquisili', N'Ecuatoriana', N'Saquisili', NULL, N'03297346', N'0993632664', N'Claro', NULL, N'henry.cayo8051@utc.edu.ec', NULL, NULL, N'Ninguna', N'0', NULL, N'0550058051', N'0550058051', N'MEDICO', N'SD', N'0', N'A+', N'04567890', N'Mestizo', N'medico00', N'admin', N'MEDICO')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'0550060011', N'C', N'050121', N'Paredes', N'Ramos', N'Lucia Isabel', N'F', N'Casada', N'1990-05-10', N'Guayaquil', N'Ecuatoriana', N'Guayaquil', NULL, N'044123456', N'0998765012', N'Claro', NULL, NULL, NULL, NULL, N'Ninguna', N'0', NULL, NULL, NULL, N'PSICOLOGO', N'SD', N'0', N'A+', N'01234590', N'Mestizo', N'psicologo01', N'admin', N'PSICOLOGO')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'0550060022', N'C', N'050122', N'Ortiz', N'Luna', N'Fernando Javier', N'M', N'Soltero', N'1987-09-25', N'Quito', N'Ecuatoriana', N'Quito', NULL, N'022134567', N'0998765023', N'Movistar', NULL, NULL, NULL, NULL, N'Ninguna', N'0', NULL, NULL, NULL, N'PSICOLOGO', N'SD', N'0', N'B+', N'01234591', N'Mestizo', N'psicologo02', N'admin', N'PSICOLOGO')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'0550060033', N'C', N'050123', N'Martinez', N'Vega', N'Jose Andres', N'M', N'Casado', N'1992-11-20', N'Cuenca', N'Ecuatoriana', N'Cuenca', NULL, N'073123456', N'0998765034', N'Claro', NULL, NULL, NULL, NULL, N'Ninguna', N'0', NULL, NULL, NULL, N'ODONTOLOGO', N'SD', N'0', N'O-', N'01234592', N'Mestizo', N'odontologo01', N'admin', N'ODONTOLOGO')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'0550060044', N'C', N'050124', N'Ramos', N'Navarro', N'Claudia Beatriz', N'F', N'Soltera', N'1985-08-13', N'Manta', N'Ecuatoriana', N'Manta', NULL, N'052123456', N'0998765045', N'Movistar', NULL, NULL, NULL, NULL, N'Ninguna', N'0', NULL, NULL, NULL, N'ODONTOLOGO', N'SD', N'0', N'AB-', N'01234593', N'Mestizo', N'odontologo03', N'admin', N'ODONTOLOGO')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'0550060055', N'C', N'050125', N'Perez', N'Quintero', N'Laura Sofia', N'F', N'Casada', N'1994-07-14', N'Loja', N'Ecuatoriana', N'Loja', NULL, N'073123457', N'0998765056', N'Claro', NULL, NULL, NULL, NULL, N'Ninguna', N'0', NULL, NULL, NULL, N'SECRETARIA', N'SD', N'0', N'B+', N'01234594', N'Mestizo', N'secretaria01', N'admin', N'SECRETARIA')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'0550060066', N'C', N'050126', N'Lopez', N'Castro', N'Carla Elena', N'F', N'Soltera', N'1990-06-17', N'Quito', N'Ecuatoriana', N'Quito', NULL, N'022134568', N'0998765067', N'Movistar', NULL, NULL, NULL, NULL, N'Ninguna', N'0', NULL, NULL, NULL, N'SECRETARIA', N'SD', N'0', N'A-', N'01234595', N'Mestizo', N'secretaria02', N'admin', N'SECRETARIA')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'0550182471', N'C', N'050110', N'Mena', N'Moreno', N'Joel Patricio', N'M', N'Soltero', N'2002-05-08', N'Lasso', N'Ecuatoriana', N'Lasso', NULL, N'0981734', N'0981234756', N'Claro', NULL, N'joel.mena2547@utc.edu.ec', NULL, NULL, N'Ninguna', N'0', NULL, N'0550182471', N'0550182471', N'ESTUDIANTE', N'SD', N'0', N'O-', N'09876543', N'Mestizo', NULL, NULL, N'ESTUDIANTE')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'0550497366', N'C', N'050114', N'Quimbita', N'Chicaiza', N'Carmen', N'F', N'Soltera', N'2000-12-20', N'Latacunga', N'Ecuatoriana', N'Lasso', NULL, N'02356485', N'098173645', N'Movistar', NULL, N'quinbita.carmen5908@utc.du.ec', NULL, NULL, N'Ninguna', N'0', NULL, N'0550497366', N'0550497366', N'SECRETARIA', N'SD', N'0', N'B+', N'03692581', N'Mestizo', N'secretaria03', N'admin', N'SECRETARIA')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'0550987262', N'C', N'051652', N'Gallardo', N'Perez', N'Ana Lucia', N'F', N'Soltera', N'2000-03-25', N'Latacunga', N'Ecuatoriana', N'Lasso', NULL, N'03698521', N'0987654321', N'Claro', NULL, N'ana.gallardo8089@utc.edu.ec', NULL, NULL, N'Ninguna', N'0', NULL, N'0550987262', N'0550987262', N'ESTUDIANTE', N'SD', N'0', N'O+', N'0753951', N'Mestizo', NULL, NULL, N'ESTUDIANTE')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'1792837465', N'C', N'170905', N'Gómez', N'López', N'Pedro Luis', N'M', N'Casado', N'1998-11-08', N'Guanani', N'Ecuatoriana', N'Quito', NULL, N'015935745', N'09876543216', N'Tuenti', NULL, N'luis.lopez8090@utc.edu.ec', NULL, NULL, N'Ninguna', N'0', NULL, N'1792837465', N'1792837465', N'ESTUDIANTE', N'SD', N'0', N'A+', N'0852963', N'Indígena', NULL, NULL, N'ESTUDIANTE')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'1850043991', N'C', N'170109', N'Freire', N'Oñate', N'Aldemar Isaias', N'M', N'Casado', N'2003-07-09', N'Quito', N'Ecuatoriana', N'Quero', NULL, N'03287654', N'097856432', N'Movistar', NULL, N'aldemar.freire8908@utc.edu.ec', NULL, NULL, N'Ninguna', N'0', NULL, N'1850043991', N'1850043991', N'ESTUDIANTE', N'SD', N'0', N'A-', N'0357951', N'Mestizo', NULL, NULL, N'ESTUDIANTE')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'1850060011', N'C', N'170120', N'Sanchez', N'Ramos', N'Miguel Angel', N'M', N'Casado', N'1990-03-21', N'Esmeraldas', N'Ecuatoriana', N'Esmeraldas', NULL, N'062123457', N'0998765090', N'Claro', NULL, NULL, NULL, NULL, N'Ninguna', N'0', NULL, NULL, NULL, N'MEDICO', N'SD', N'0', N'B+', N'01234598', N'Mestizo', N'medico01', N'admin', N'MEDICO')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'1850060022', N'C', N'170121', N'Hidalgo', N'Vargas', N'Roberto Daniel', N'M', N'Soltero', N'1987-05-15', N'Santo Domingo', N'Ecuatoriana', N'Santo Domingo', NULL, N'062234568', N'0998765101', N'Movistar', NULL, NULL, NULL, NULL, N'Ninguna', N'0', NULL, NULL, NULL, N'MEDICO', N'SD', N'0', N'AB-', N'01234599', N'Mestizo', N'medico02', N'admin', N'MEDICO')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'2206982632', N'P', N'170293', N'Fernández', N'García', N'Luisa', N'F', N'Soltera', N'1992-04-18', N'España', N'Español', N'Quito', NULL, N'03579512', N'0987654321', N'Claro', NULL, N'luisa.fernandez9894@utc.edu.ec', NULL, NULL, N'Sí', N'8', NULL, N'2206982632', N'2206982632', N'ESTUDIANTE', N'SD', N'0', N'O-', N'0369852', N'Blanco', NULL, NULL, N'ESTUDIANTE')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'2250242985', N'C', N'220201', N'Cruz', N'Aguinda', N'Evelyn Viviana', N'F', N'Soltera', N'1999-08-07', N'Coca', N'Ecuatoriana', N'Latacunga', NULL, N'03579246', N'091274563', N'Claro', NULL, N'evelyn.cruz2985@utc.edu.ec', NULL, NULL, N'Nimguna', N'0', NULL, N'2250242985', N'2250242985', N'ENFERMERA', N'SD', N'0', N'AB-', N'0951357', N'Mestizo', N'enfermera01', N'admin', N'ENFERMERA')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'2250260011', N'C', N'220212', N'Castro', N'Ramirez', N'Julia Patricia', N'F', N'Casada', N'1986-10-05', N'Ambato', N'Ecuatoriana', N'Ambato', NULL, N'032123457', N'0998765078', N'Claro', NULL, NULL, NULL, NULL, N'Ninguna', N'0', NULL, NULL, NULL, N'ENFERMERA', N'SD', N'0', N'O+', N'01234596', N'Mestizo', N'enfermera02', N'admin', N'ENFERMERA')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'2250260022', N'C', N'220213', N'Paredes', N'Morales', N'Diana Isabel', N'F', N'Soltera', N'1989-02-19', N'Riobamba', N'Ecuatoriana', N'Riobamba', NULL, N'032234568', N'0998765089', N'Movistar', NULL, NULL, NULL, NULL, N'Ninguna', N'0', NULL, NULL, NULL, N'ENFERMERA', N'SD', N'0', N'A-', N'01234597', N'Mestizo', N'enfermera03', N'admin', N'ENFERMERA')
GO
INSERT [dbo].[SIGUTC_PERSONAL] ([strCod_alu], [VALCED_ALU], [CODIGO_CIU], [APELLIDO_ALU], [APELLIDOM_ALU], [NOMBRE_ALU], [SEXO_ALU], [ESTCIV_ALU], [FNAC_ALU], [LNAC_ALU], [NACIONALIDAD_ALU], [DIRECCION_ALU], [DIRCOMPLETA_ALU], [FONFIJ_ALU], [FONCEL_ALU], [OPERADORAMOVIL_ALU], [FOTO_ALU], [OBS1_ALU], [OBS2_ALU], [OBS3_ALU], [DISCAPACIDAD_ALU], [NUMCONADIS_ALU], [FLOG_ALU], [OBS4_ALU], [OBS5_ALU], [OBS6_ALU], [LIBRETAMILITAR_ALU], [ANIOSRESIDENCIA_ALU], [TIPOSANGRE_ALU], [FONTRAB_ALU], [NACIONALIDADINDIG_ALU], [strUsername], [strContrasena], [strRol]) VALUES (N'5005729464', N'C', N'298374', N'Hernández', N'Pérez', N'Marcela', N'F', N'Casada', N'1998-09-25', N'Cuenca', N'Ecuatoriana', N'Lasso', NULL, N'07539512', N'0987654321', N'Movistar', NULL, N'marcela.hernandes8976@utc.edu.ec', NULL, NULL, N'Ninguna', N'0', NULL, N'5005729464', N'5005729464', N'ESTUDIANTE', N'SD', N'0', N'B+', N'08258369', N'Mestizo', NULL, NULL, N'ESTUDIANTE')
GO
INSERT [dbo].[SIGUTC_SEDE] ([strCod_Sede], [strNombre_Sede], [strTipo_Sede], [strCod_OrgC], [strDir_sede], [strSubDir_sede], [strSubDirAdm_sede], [strObs1_sede], [strObs2_sede], [strObs3_sede], [dtFecha_log], [strUser_log], [bitEstado_sede]) VALUES (N'EMANA', N'LA MANA', N'E', N'0', N'0', N'0', N'0', NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SIGUTC_SEDE] ([strCod_Sede], [strNombre_Sede], [strTipo_Sede], [strCod_OrgC], [strDir_sede], [strSubDir_sede], [strSubDirAdm_sede], [strObs1_sede], [strObs2_sede], [strObs3_sede], [dtFecha_log], [strUser_log], [bitEstado_sede]) VALUES (N'EPUJI', N'PUJILI', N'E', N'0', N'0', N'0', N'0', NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SIGUTC_SEDE] ([strCod_Sede], [strNombre_Sede], [strTipo_Sede], [strCod_OrgC], [strDir_sede], [strSubDir_sede], [strSubDirAdm_sede], [strObs1_sede], [strObs2_sede], [strObs3_sede], [dtFecha_log], [strUser_log], [bitEstado_sede]) VALUES (N'ESALACHE', N'SALACHE', N'E', N'0', N'0', N'0', N'0', NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SIGUTC_SEDE] ([strCod_Sede], [strNombre_Sede], [strTipo_Sede], [strCod_OrgC], [strDir_sede], [strSubDir_sede], [strSubDirAdm_sede], [strObs1_sede], [strObs2_sede], [strObs3_sede], [dtFecha_log], [strUser_log], [bitEstado_sede]) VALUES (N'MUTC', N'LATACUNGA', N'M', N'0', N'0', N'0', N'0', NULL, NULL, NULL, NULL, NULL, 1)
GO
ALTER TABLE [dbo].[BU_CITA]  WITH CHECK ADD FOREIGN KEY([strCod_alu])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[BU_CITA]  WITH CHECK ADD FOREIGN KEY([strCod_ser])
REFERENCES [dbo].[BU_SERVICIO] ([strCod_ser])
GO
ALTER TABLE [dbo].[BU_CITA]  WITH CHECK ADD FOREIGN KEY([strUserLog])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[BU_DETALLE_CITA]  WITH CHECK ADD FOREIGN KEY([strCod_cita])
REFERENCES [dbo].[BU_CITA] ([strCod_cita])
GO
ALTER TABLE [dbo].[BU_DETALLE_CITA]  WITH CHECK ADD FOREIGN KEY([strUserLog])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[BU_DETALLEHISTO]  WITH CHECK ADD FOREIGN KEY([strCod_alu])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[BU_DETALLEHISTO]  WITH CHECK ADD FOREIGN KEY([strCod_histo])
REFERENCES [dbo].[BU_HISTORIAL] ([strCod_histo])
GO
ALTER TABLE [dbo].[BU_DETALLEHISTO]  WITH CHECK ADD FOREIGN KEY([strCod_sig])
REFERENCES [dbo].[BU_SIGNOV] ([strCod_sig])
GO
ALTER TABLE [dbo].[BU_DETALLEHISTO]  WITH CHECK ADD FOREIGN KEY([strCod_Sede])
REFERENCES [dbo].[SIGUTC_SEDE] ([strCod_Sede])
GO
ALTER TABLE [dbo].[BU_DETALLEHISTO]  WITH CHECK ADD FOREIGN KEY([strCod_Fac])
REFERENCES [dbo].[SIGUTC_FACULTAD] ([strCod_Fac])
GO
ALTER TABLE [dbo].[BU_DETALLEHISTO]  WITH CHECK ADD FOREIGN KEY([strCod_ser])
REFERENCES [dbo].[BU_SERVICIO] ([strCod_ser])
GO
ALTER TABLE [dbo].[BU_DETALLEHISTO]  WITH CHECK ADD FOREIGN KEY([strCod_Car])
REFERENCES [dbo].[SIGUTC_CARRERA] ([strCod_Car])
GO
ALTER TABLE [dbo].[BU_DETALLEHISTO]  WITH CHECK ADD FOREIGN KEY([strCod_matric])
REFERENCES [dbo].[SIGUTC_MATRICULA] ([strCod_matric])
GO
ALTER TABLE [dbo].[BU_DETALLEHISTO]  WITH CHECK ADD FOREIGN KEY([strUserLog])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[BU_HISTORIAL]  WITH CHECK ADD FOREIGN KEY([strCod_alu])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[BU_HISTORIAL]  WITH CHECK ADD FOREIGN KEY([strCod_ser])
REFERENCES [dbo].[BU_SERVICIO] ([strCod_ser])
GO
ALTER TABLE [dbo].[BU_HISTORIAL]  WITH CHECK ADD FOREIGN KEY([strCod_Sede])
REFERENCES [dbo].[SIGUTC_SEDE] ([strCod_Sede])
GO
ALTER TABLE [dbo].[BU_HISTORIAL]  WITH CHECK ADD FOREIGN KEY([strCod_Fac])
REFERENCES [dbo].[SIGUTC_FACULTAD] ([strCod_Fac])
GO
ALTER TABLE [dbo].[BU_HISTORIAL]  WITH CHECK ADD FOREIGN KEY([strCod_Car])
REFERENCES [dbo].[SIGUTC_CARRERA] ([strCod_Car])
GO
ALTER TABLE [dbo].[BU_HISTORIAL]  WITH CHECK ADD FOREIGN KEY([strCod_matric])
REFERENCES [dbo].[SIGUTC_MATRICULA] ([strCod_matric])
GO
ALTER TABLE [dbo].[BU_HISTORIAL]  WITH CHECK ADD FOREIGN KEY([strUserLog])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[BU_HISTORIAL]  WITH CHECK ADD  CONSTRAINT [FK_BU_HISTORIAL_CodMedico] FOREIGN KEY([strCod_medico])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[BU_HISTORIAL] CHECK CONSTRAINT [FK_BU_HISTORIAL_CodMedico]
GO
ALTER TABLE [dbo].[BU_REGISTRO]  WITH CHECK ADD FOREIGN KEY([strCod_alu])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[BU_REGISTRO]  WITH CHECK ADD FOREIGN KEY([strCod_Sede])
REFERENCES [dbo].[SIGUTC_SEDE] ([strCod_Sede])
GO
ALTER TABLE [dbo].[BU_REGISTRO]  WITH CHECK ADD FOREIGN KEY([strCod_Fac])
REFERENCES [dbo].[SIGUTC_FACULTAD] ([strCod_Fac])
GO
ALTER TABLE [dbo].[BU_REGISTRO]  WITH CHECK ADD FOREIGN KEY([strCod_Car])
REFERENCES [dbo].[SIGUTC_CARRERA] ([strCod_Car])
GO
ALTER TABLE [dbo].[BU_REGISTRO]  WITH CHECK ADD FOREIGN KEY([strUserLog])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[BU_SIGNOV]  WITH CHECK ADD FOREIGN KEY([strCod_alu])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[BU_SIGNOV]  WITH CHECK ADD FOREIGN KEY([strUserLog])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[SIGUTC_CARRERA]  WITH CHECK ADD FOREIGN KEY([strCod_Sede])
REFERENCES [dbo].[SIGUTC_SEDE] ([strCod_Sede])
GO
ALTER TABLE [dbo].[SIGUTC_CARRERA]  WITH CHECK ADD FOREIGN KEY([strCod_Fac])
REFERENCES [dbo].[SIGUTC_FACULTAD] ([strCod_Fac])
GO
ALTER TABLE [dbo].[SIGUTC_CURSO]  WITH CHECK ADD FOREIGN KEY([strCod_per])
REFERENCES [dbo].[SIGUTC_PERIODO] ([strCod_per])
GO
ALTER TABLE [dbo].[SIGUTC_FACULTAD]  WITH CHECK ADD FOREIGN KEY([strCod_Sede])
REFERENCES [dbo].[SIGUTC_SEDE] ([strCod_Sede])
GO
ALTER TABLE [dbo].[SIGUTC_MATRICULA]  WITH CHECK ADD FOREIGN KEY([strCod_per])
REFERENCES [dbo].[SIGUTC_PERIODO] ([strCod_per])
GO
ALTER TABLE [dbo].[SIGUTC_MATRICULA]  WITH CHECK ADD FOREIGN KEY([strCod_alu])
REFERENCES [dbo].[SIGUTC_PERSONAL] ([strCod_alu])
GO
ALTER TABLE [dbo].[SIGUTC_PERIODO]  WITH CHECK ADD FOREIGN KEY([strCod_Sede])
REFERENCES [dbo].[SIGUTC_SEDE] ([strCod_Sede])
GO
ALTER TABLE [dbo].[SIGUTC_PERIODO]  WITH CHECK ADD FOREIGN KEY([strCod_Fac])
REFERENCES [dbo].[SIGUTC_FACULTAD] ([strCod_Fac])
GO
ALTER TABLE [dbo].[SIGUTC_PERIODO]  WITH CHECK ADD FOREIGN KEY([strCod_Car])
REFERENCES [dbo].[SIGUTC_CARRERA] ([strCod_Car])
GO
/****** Object:  StoredProcedure [dbo].[GetAtencionesDelDia]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAtencionesDelDia]
    @strCod_medico varchar(200),
    @fecha date
AS
BEGIN
    SELECT 
        h.strCod_histo,
        h.strCod_alu,
        a.NOMBRE_ALU + ' ' + a.APELLIDO_ALU + ' ' + a.APELLIDOM_ALU AS NombreCompleto,
        s.strNombre_ser,
        h.dtFecha_histo,
        h.bitEstado_histo
    FROM 
        BU_HISTORIAL h
    JOIN 
        SIGUTC_PERSONAL a ON h.strCod_alu = a.strCod_alu
    JOIN 
        BU_SERVICIO s ON h.strCod_ser = s.strCod_ser
    WHERE 
        h.strCod_medico = @strCod_medico
        AND h.dtFecha_histo = @fecha
    ORDER BY 
        h.dtFechaLog;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetPersonalByCredentials]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPersonalByCredentials]
    @strUsername varchar(200),
    @strContrasena varchar(200)
AS
BEGIN
    SELECT 
        strCod_alu,
        VALCED_ALU,
        CODIGO_CIU,
        APELLIDO_ALU,
        APELLIDOM_ALU,
        NOMBRE_ALU,
        SEXO_ALU,
        ESTCIV_ALU,
        FNAC_ALU,
        LNAC_ALU,
        NACIONALIDAD_ALU,
        DIRECCION_ALU,
        DIRCOMPLETA_ALU,
        FONFIJ_ALU,
        FONCEL_ALU,
        OPERADORAMOVIL_ALU,
        FOTO_ALU,
        OBS1_ALU,
        OBS2_ALU,
        OBS3_ALU,
        DISCAPACIDAD_ALU,
        NUMCONADIS_ALU,
        FLOG_ALU,
        OBS4_ALU,
        OBS5_ALU,
        OBS6_ALU,
        LIBRETAMILITAR_ALU,
        ANIOSRESIDENCIA_ALU,
        TIPOSANGRE_ALU,
        FONTRAB_ALU,
        NACIONALIDADINDIG_ALU,
        strUsername,
        strContrasena,
        strRol
    FROM 
        SIGUTC_PERSONAL
    WHERE 
        strUsername = @strUsername AND strContrasena = @strContrasena;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertBU_HISTORIAL]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertBU_HISTORIAL]
    @strCod_histo varchar(200),
    @strCod_alu varchar(200),
    @strCod_medico varchar(200),
    @strCod_ser varchar(200),
    @dtFecha_histo date,
    @bitEstado_histo bit,
    @strUserLog varchar(200),
    @dtFechaLog datetime
AS
BEGIN
    INSERT INTO BU_HISTORIAL (
        strCod_histo,
        strCod_alu,
        strCod_medico,
        strCod_ser,
        dtFecha_histo,
        bitEstado_histo,
        strUserLog,
        dtFechaLog
    )
    VALUES (
        @strCod_histo,
        @strCod_alu,
        @strCod_medico,
        @strCod_ser,
        @dtFecha_histo,
        @bitEstado_histo,
        @strUserLog,
        @dtFechaLog
    )
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBU_SIGNOV]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertBU_SIGNOV]
    @strCod_sig varchar(200),
    @strCod_alu varchar(200),
    @strPreArt_sig varchar(200),
    @strTempera_sig varchar(200),
    @strPulso_sig varchar(200),
    @strFreRes_sig varchar(200),
    @strUserLog varchar(200),
    @dtFechaLog datetime
AS
BEGIN
    INSERT INTO BU_SIGNOV (
        strCod_sig,
        strCod_alu,
        strPreArt_sig,
        strTempera_sig,
        strPulso_sig,
        strFreRes_sig,
        strUserLog,
        dtFechaLog
    )
    VALUES (
        @strCod_sig,
        @strCod_alu,
        @strPreArt_sig,
        @strTempera_sig,
        @strPulso_sig,
        @strFreRes_sig,
        @strUserLog,
        @dtFechaLog
    )
END
GO
/****** Object:  StoredProcedure [dbo].[ListarPorRol]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear el procedimiento almacenado
CREATE PROCEDURE [dbo].[ListarPorRol]
    @Rol VARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        strCod_alu, VALCED_ALU, CODIGO_CIU, APELLIDO_ALU, APELLIDOM_ALU, 
        NOMBRE_ALU, SEXO_ALU, ESTCIV_ALU, FNAC_ALU, LNAC_ALU, 
        NACIONALIDAD_ALU, DIRECCION_ALU, DIRCOMPLETA_ALU, FONFIJ_ALU, FONCEL_ALU, 
        OPERADORAMOVIL_ALU, FOTO_ALU, OBS1_ALU, OBS2_ALU, OBS3_ALU, 
        DISCAPACIDAD_ALU, NUMCONADIS_ALU, FLOG_ALU, OBS4_ALU, OBS5_ALU, 
        OBS6_ALU, LIBRETAMILITAR_ALU, ANIOSRESIDENCIA_ALU, TIPOSANGRE_ALU, FONTRAB_ALU, 
        NACIONALIDADINDIG_ALU, strUsername, strContrasena, strRol
    FROM dbo.SIGUTC_PERSONAL
    WHERE strRol = @Rol;
END;
GO
/****** Object:  StoredProcedure [dbo].[ListarTodosMenosEstudiante]    Script Date: 1/08/2024 22:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarTodosMenosEstudiante]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        strCod_alu, VALCED_ALU, CODIGO_CIU, APELLIDO_ALU, APELLIDOM_ALU, 
        NOMBRE_ALU, SEXO_ALU, ESTCIV_ALU, FNAC_ALU, LNAC_ALU, 
        NACIONALIDAD_ALU, DIRECCION_ALU, DIRCOMPLETA_ALU, FONFIJ_ALU, FONCEL_ALU, 
        OPERADORAMOVIL_ALU, FOTO_ALU, OBS1_ALU, OBS2_ALU, OBS3_ALU, 
        DISCAPACIDAD_ALU, NUMCONADIS_ALU, FLOG_ALU, OBS4_ALU, OBS5_ALU, 
        OBS6_ALU, LIBRETAMILITAR_ALU, ANIOSRESIDENCIA_ALU, TIPOSANGRE_ALU, FONTRAB_ALU, 
        NACIONALIDADINDIG_ALU, strUsername, strContrasena, strRol
    FROM dbo.SIGUTC_PERSONAL
    WHERE strRol != 'ESTUDIANTE';
END;
GO


-- PROCEDIMIENTO QUE VALIDA QUE paciente solo tenga una cita de un tipo por Dia

IF OBJECT_ID('dbo.VerificarCitaExistente', 'P') IS NOT NULL
    DROP PROCEDURE dbo.VerificarCitaExistente;
GO

CREATE PROCEDURE VerificarCitaExistente
    @codigoEstudiante VARCHAR(50),
    @codigoProfesional VARCHAR(50),
    @codigoServicio VARCHAR(50),
    @fecha DATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM BU_HISTORIAL
        WHERE 
            strCod_alu = @codigoEstudiante AND
            strCod_medico = @codigoProfesional AND
            strCod_ser = @codigoServicio AND
            dtFecha_histo = @fecha
    )
    BEGIN
        SELECT CAST(1 AS BIT) AS CitaExistente
    END
    ELSE
    BEGIN
        SELECT CAST(0 AS BIT) AS CitaExistente
    END
END
GO


-- Variables de prueba
DECLARE @codigoEstudiante VARCHAR(50) = '0550182471'; -- Reemplaza con un código de estudiante válido
DECLARE @codigoProfesional VARCHAR(50) = '1850060011'; -- Reemplaza con un código de profesional válido
DECLARE @codigoServicio VARCHAR(50) = 'SRMG'; -- Reemplaza con un código de servicio válido
DECLARE @fecha DATE = GETDATE(); -- Usa la fecha actual

-- Ejecutar el procedimiento almacenado para verificar la cita existente
EXEC VerificarCitaExistente 
    @codigoEstudiante = @codigoEstudiante,
    @codigoProfesional = @codigoProfesional,
    @codigoServicio = @codigoServicio,
    @fecha = @fecha;


use Borrador12



-- Verificar si el procedimiento ya existe y eliminarlo
IF OBJECT_ID('dbo.InsertarCita', 'P') IS NOT NULL
    DROP PROCEDURE dbo.InsertarCita;
GO

-- Crear el nuevo procedimiento almacenado
CREATE PROCEDURE InsertarCita
    @strCod_cita VARCHAR(200),
    @strCod_alu VARCHAR(200),
    @strCod_ser VARCHAR(200),
    @dtFecha_cita DATETIME,
    @strEstado_cita VARCHAR(200),
    @strUserLog VARCHAR(200),
    @dtFechaLog DATETIME
AS
BEGIN
    INSERT INTO BU_CITA (
        strCod_cita,
        strCod_alu,
        strCod_ser,
        dtFecha_cita,
        strEstado_cita,
        strUserLog,
        dtFechaLog
    )
    VALUES (
        @strCod_cita,
        @strCod_alu,
        @strCod_ser,
        @dtFecha_cita,
        @strEstado_cita,
        @strUserLog,
        @dtFechaLog
    );
END;
GO


IF OBJECT_ID('dbo.ObtenerCitasPorMedicoYFecha', 'P') IS NOT NULL
    DROP PROCEDURE dbo.ObtenerCitasPorMedicoYFecha;
GO

CREATE PROCEDURE ObtenerCitasPorMedicoYFecha
    @codigoMedico VARCHAR(200),
    @fecha DATE
AS
BEGIN
    SELECT 
        c.strCod_cita AS CodigoCita,
        c.strCod_alu AS CodigoPaciente,
        CONCAT(p.NOMBRE_ALU, ' ', p.APELLIDO_ALU, ' ', p.APELLIDOM_ALU) AS NombreCompletoPaciente,
        s.strNombre_ser AS NombreServicio,
        c.dtFecha_cita AS FechaCita,
        c.strEstado_cita AS Estado
    FROM BU_CITA c
    INNER JOIN BU_HISTORIAL h ON c.strCod_alu = h.strCod_alu
    INNER JOIN SIGUTC_PERSONAL p ON c.strCod_alu = p.strCod_alu
    INNER JOIN BU_SERVICIO s ON c.strCod_ser = s.strCod_ser
    WHERE h.strCod_medico = @codigoMedico
    AND CAST(c.dtFecha_cita AS DATE) = @fecha;
END;
GO



-- Definir las variables de entrada para el test
DECLARE @codigoMedico VARCHAR(200) = '0550058051';
DECLARE @fecha DATE = CAST(GETDATE() AS DATE);

-- Ejecutar el procedimiento para obtener citas
EXEC ObtenerCitasPorMedicoYFecha @codigoMedico, @fecha;


IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'trgActualizarEstadoCita')
BEGIN
    DROP TRIGGER [dbo].[trgActualizarEstadoCita];
END
GO

-- Crear el nuevo trigger
CREATE TRIGGER trgActualizarEstadoCita
ON [dbo].[BU_DETALLE_CITA]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CodigoCita varchar(200);

    SELECT @CodigoCita = i.strCod_cita
    FROM inserted i;

    UPDATE [dbo].[BU_CITA]
    SET strEstado_cita = 'Atendido', dtFechaLog = GETDATE()
    WHERE strCod_cita = @CodigoCita;
END;
GO




-- Eliminar el procedimiento almacenado si ya existe
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertarDetalleCita]') AND type in (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[spInsertarDetalleCita];
END
GO

-- Crear el procedimiento almacenado
CREATE PROCEDURE [dbo].[spInsertarDetalleCita]
    @strCod_detacita VARCHAR(200),
    @strCod_cita VARCHAR(200),
    @strDescripcion VARCHAR(500),
    @strObservaciones VARCHAR(500),
    @strUserLog VARCHAR(200),
    @dtFechaLog DATETIME,
    @success BIT OUTPUT  -- Variable de salida para indicar éxito
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO [dbo].[BU_DETALLE_CITA] 
        (
            [strCod_detacita],
            [strCod_cita],
            [strDescripcion],
            [strObservaciones],
            [strUserLog],
            [dtFechaLog]
        )
        VALUES
        (
            @strCod_detacita,
            @strCod_cita,
            @strDescripcion,
            @strObservaciones,
            @strUserLog,
            @dtFechaLog
        );
        SET @success = 1;
    END TRY
    BEGIN CATCH
        SET @success = 0;
    END CATCH
END
GO


-- Eliminar el procedimiento almacenado si ya existe
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spActualizarDetalleCita]') AND type in (N'P', N'PC'))
BEGIN
    DROP PROCEDURE [dbo].[spActualizarDetalleCita];
END
GO

-- Crear el procedimiento almacenado para actualizar detalles de la cita
CREATE PROCEDURE [dbo].[spActualizarDetalleCita]
    @strCod_detacita VARCHAR(200),
    @strCod_cita VARCHAR(200),
    @strDescripcion VARCHAR(500),
    @strObservaciones VARCHAR(500),
    @strUserLog VARCHAR(200),
    @dtFechaLog DATETIME,
    @RowsAffected INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[BU_DETALLE_CITA]
    SET
        [strDescripcion] = @strDescripcion,
        [strObservaciones] = @strObservaciones,
        [strUserLog] = @strUserLog,
        [dtFechaLog] = @dtFechaLog
    WHERE [strCod_cita] = @strCod_cita;

    SET @RowsAffected = @@ROWCOUNT;
END
GO

DECLARE @RowsAffected INT;
DECLARE @CurrentDate DATETIME = GETDATE();  -- Asignar la fecha actual a una variable

-- Ejecutar el procedimiento almacenado
EXEC [dbo].[spActualizarDetalleCita]
    @strCod_detacita = '',  -- NO QUIERO PONER 
    @strCod_cita = 'CITA-JG38N0',     -- Reemplaza con un código de cita existente
    @strDescripcion = 'Nueva descripciónasdwdwdw',
    @strObservaciones = 'Nuevas observaciones',
    @strUserLog = 'usuario_actual',
    @dtFechaLog = @CurrentDate,  -- Usar la variable en lugar de llamar directamente a GETDATE()
    @RowsAffected = @RowsAffected OUTPUT;

-- Verificar el número de filas afectadas
SELECT @RowsAffected AS RowsAffected;
