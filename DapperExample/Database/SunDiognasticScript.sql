USE [master]
GO
/****** Object:  Database [SUNDIGNOSTIC]    Script Date: 23-12-2021 07:57:10 ******/
CREATE DATABASE [SUNDIGNOSTIC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SUNDIGNOSTIC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SUNDIGNOSTIC.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SUNDIGNOSTIC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SUNDIGNOSTIC_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SUNDIGNOSTIC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SUNDIGNOSTIC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SUNDIGNOSTIC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET ARITHABORT OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET  MULTI_USER 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SUNDIGNOSTIC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SUNDIGNOSTIC]
GO
/****** Object:  Table [dbo].[ReferalDoctor]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReferalDoctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferalDoctorName] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ReferalDoctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_BillingMaster]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_BillingMaster](
	[BilIingId] [int] IDENTITY(1,1) NOT NULL,
	[PId] [int] NULL,
	[Amount] [decimal](18, 2) NULL,
	[Paid] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 0) NULL,
	[Expenses] [decimal](18, 0) NULL,
	[ReferalPercentage] [decimal](18, 0) NULL,
	[ReferalAmount] [decimal](18, 0) NULL,
	[DUE] [decimal](18, 0) NULL,
	[CollectedById] [int] NULL,
	[BillNumber] [varchar](50) NULL,
	[Status] [bit] NULL CONSTRAINT [DF__tbl_Billi__Statu__3E1D39E1]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK__tbl_Bill__4473BF9A68C9D675] PRIMARY KEY CLUSTERED 
(
	[BilIingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_BillingReport]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BillingReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillId] [int] NULL,
	[ReportId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_CenterSettings]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_CenterSettings](
	[CenterId] [int] IDENTITY(1,1) NOT NULL,
	[CenterName] [varchar](50) NULL,
	[FullAddress] [varchar](max) NULL,
	[BranchLocation] [varchar](50) NULL,
	[Logo] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_Doctor] PRIMARY KEY CLUSTERED 
(
	[CenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [int] NULL,
	[serumCholestrol] [varchar](50) NULL,
	[hdlCholestrol] [varchar](50) NULL,
	[LDLCholestrol] [varchar](50) NULL,
	[VLDLCholestrol] [varchar](50) NULL,
	[serumTriglyceride] [varchar](50) NULL,
	[THDL] [varchar](50) NULL,
	[LDLHDL] [varchar](50) NULL,
	[titalLipid] [varchar](50) NULL,
	[Name] [varchar](150) NULL,
	[ReportTypeId] [int] NULL,
	[DoctorName] [varchar](100) NULL,
	[Qualification] [varchar](100) NULL,
	[Designation] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_ClinicalBiochemistoryReportLTF] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ClinicalBiochemistoryReportLTF]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ClinicalBiochemistoryReportLTF](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [int] NULL,
	[serumBilirubin] [varchar](50) NULL,
	[serumBilirubinD] [varchar](50) NULL,
	[serumBilirubinID] [varchar](50) NULL,
	[serumAsparateAminoTransferase] [varchar](50) NULL,
	[serumAlanineAminoTransferase] [varchar](50) NULL,
	[serumTotalProtein] [varchar](50) NULL,
	[serumAlbumin] [varchar](50) NULL,
	[serumGlubulin] [varchar](50) NULL,
	[AGRation] [varchar](50) NULL,
	[serumAlkalinePhosphatse] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Name] [varchar](150) NULL,
	[ReportTypeId] [int] NULL,
	[Qualification] [varchar](100) NULL,
	[Designation] [varchar](100) NULL,
	[DoctorName] [varchar](150) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_ClinicalBiochemistoryReportLIPIDProfile] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Collected]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Collected](
	[CollectedById] [int] IDENTITY(1,1) NOT NULL,
	[CollectedByName] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_Collected] PRIMARY KEY CLUSTERED 
(
	[CollectedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ComputerBloodPictureReport]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ComputerBloodPictureReport](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [int] NULL,
	[Date] [datetime] NULL,
	[Haemoglobin] [varchar](50) NULL,
	[ErythrocyteCount] [varchar](50) NULL,
	[TotalWBCCount] [varchar](50) NULL,
	[Neutrophils] [varchar](50) NULL,
	[Lymphocytes] [varchar](50) NULL,
	[Eosinophils] [varchar](50) NULL,
	[Monocytes] [varchar](50) NULL,
	[Basophils] [varchar](50) NULL,
	[Rbcs] [varchar](50) NULL,
	[PlateletCount] [varchar](50) NULL,
	[Name] [varchar](150) NULL,
	[ReportTypeId] [int] NULL,
	[Designation] [varchar](100) NULL,
	[Qualification] [varchar](100) NULL,
	[DoctorName] [varchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_ComputerBloodPictureReport] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Doctor]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Doctor](
	[DocId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](50) NULL,
	[Specilization] [varchar](max) NULL,
	[Signature] [varchar](max) NULL,
	[Qualification] [varchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_Doctor_1] PRIMARY KEY CLUSTERED 
(
	[DocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_OtherReport]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_OtherReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportTypeId] [int] NULL,
	[PId] [int] NULL,
	[TestName] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_OtherReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_PatientInfo]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_PatientInfo](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Pname] [varchar](50) NULL,
	[SurName] [varchar](50) NULL,
	[Age] [tinyint] NULL,
	[YMD] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[RefDocId] [int] NULL,
	[MobileNo] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_PatientInfo] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Printer]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Printer](
	[Printer_id] [int] IDENTITY(1,1) NOT NULL,
	[Printer_Name] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Printer] PRIMARY KEY CLUSTERED 
(
	[Printer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ReportType]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ReportType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportType] [varchar](max) NULL,
	[ShortName] [varchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_ReportType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Service]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Service](
	[ServiceNo] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](600) NULL,
	[ShortName] [varchar](100) NULL,
	[OP] [int] NULL,
	[LDSL] [int] NULL,
	[Method] [varchar](500) NULL,
	[Sample] [varchar](500) NULL,
	[Schedule] [varchar](500) NULL,
	[CutOfTime] [varchar](50) NULL,
	[TAT] [varchar](50) NULL,
	[Vacutainer] [varchar](500) NULL,
 CONSTRAINT [PK_tbl_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_UserLogin]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_UserLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Passward] [varchar](50) NULL,
	[Status] [bit] NULL,
	[Center] [int] NULL,
	[RoleId] [int] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_UserLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tble_Employee]    Script Date: 23-12-2021 07:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tble_Employee](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tble_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_BillingMaster] ON 

INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, 1, CAST(200.00 AS Decimal(18, 2)), NULL, CAST(12 AS Decimal(18, 0)), CAST(130 AS Decimal(18, 0)), CAST(60 AS Decimal(18, 0)), CAST(120 AS Decimal(18, 0)), CAST(122 AS Decimal(18, 0)), 1, N'32145', 1, 2, 1, CAST(N'2021-10-03 11:11:06.837' AS DateTime), CAST(N'2021-10-16 23:18:51.287' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 2, CAST(N'2021-10-03 15:33:56.650' AS DateTime), CAST(N'2021-10-03 15:33:56.650' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 2, CAST(N'2021-10-03 16:01:08.280' AS DateTime), CAST(N'2021-10-03 16:01:08.280' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 2, CAST(N'2021-10-03 16:02:12.450' AS DateTime), CAST(N'2021-10-03 16:02:12.450' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (5, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 2, CAST(N'2021-10-03 16:05:45.620' AS DateTime), CAST(N'2021-10-03 16:05:45.620' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 2, CAST(N'2021-10-03 16:08:50.643' AS DateTime), CAST(N'2021-10-03 16:08:50.643' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 2, CAST(N'2021-10-03 16:09:42.667' AS DateTime), CAST(N'2021-10-03 16:09:42.667' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 2, CAST(N'2021-10-03 16:48:38.140' AS DateTime), CAST(N'2021-10-03 16:48:38.140' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (9, 3, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, 0, 2, 2, CAST(N'2021-10-02 16:50:16.383' AS DateTime), CAST(N'2021-10-02 19:19:05.247' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (10, 4, CAST(120.00 AS Decimal(18, 2)), NULL, CAST(45 AS Decimal(18, 0)), CAST(66 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), CAST(6 AS Decimal(18, 0)), CAST(32 AS Decimal(18, 0)), NULL, NULL, 1, 2, 2, CAST(N'2021-10-03 19:24:31.187' AS DateTime), CAST(N'2021-10-03 23:31:28.043' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 2, CAST(N'2021-10-03 23:44:02.460' AS DateTime), CAST(N'2021-10-03 23:44:02.460' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (12, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-10-03 23:56:40.340' AS DateTime), CAST(N'2021-10-03 23:56:40.340' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-10-03 23:56:53.687' AS DateTime), CAST(N'2021-10-03 23:56:53.687' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (14, 6, CAST(1000.00 AS Decimal(18, 2)), NULL, CAST(10 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), NULL, NULL, 0, 1, 2, CAST(N'2021-10-03 23:57:45.077' AS DateTime), CAST(N'2021-10-04 01:22:49.047' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (15, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 2, 2, CAST(N'2021-10-04 01:38:16.950' AS DateTime), CAST(N'2021-10-04 01:38:16.950' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1011, 1005, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 2, 2, CAST(N'2021-10-11 03:39:43.330' AS DateTime), CAST(N'2021-10-11 03:39:43.330' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1012, 1006, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 2, 2, CAST(N'2021-10-12 11:39:19.440' AS DateTime), CAST(N'2021-10-12 11:39:19.440' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1013, 1007, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'012345', 0, 2, 2, CAST(N'2021-10-14 00:00:11.163' AS DateTime), CAST(N'2021-10-14 00:00:11.163' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1014, 1008, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'11111', 0, 2, 2, CAST(N'2021-10-14 15:01:13.500' AS DateTime), CAST(N'2021-10-14 15:01:13.500' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2014, 2008, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'8777', 0, 2, 2, CAST(N'2021-10-16 16:31:47.970' AS DateTime), CAST(N'2021-10-16 16:31:47.970' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2015, 2008, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'8777', 0, 2, 2, CAST(N'2021-10-16 16:32:11.870' AS DateTime), CAST(N'2021-10-16 16:32:11.870' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2016, 2009, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, CAST(100 AS Decimal(18, 0)), 0, N'98765', 0, 2, 2, CAST(N'2021-10-16 19:14:41.657' AS DateTime), CAST(N'2021-10-16 19:14:41.657' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2017, 2010, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, CAST(1000 AS Decimal(18, 0)), 0, N'98765', 0, 2, 2, CAST(N'2021-10-16 20:38:30.520' AS DateTime), CAST(N'2021-10-16 20:38:30.520' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2018, 2010, CAST(9999.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, CAST(999 AS Decimal(18, 0)), 0, N'9999', 0, 2, 2, CAST(N'2021-10-16 20:39:40.537' AS DateTime), CAST(N'2021-10-16 20:39:40.537' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2019, 2011, CAST(9999.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, CAST(1000 AS Decimal(18, 0)), 0, N'98765', 0, 2, 2, CAST(N'2021-10-16 20:58:46.090' AS DateTime), CAST(N'2021-10-16 20:58:46.090' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2020, 1008, CAST(10000.00 AS Decimal(18, 2)), CAST(5678.00 AS Decimal(18, 2)), CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(5000 AS Decimal(18, 0)), 0, N'012345', 1, 2, 2, CAST(N'2021-10-16 21:25:09.803' AS DateTime), CAST(N'2021-10-18 20:06:52.843' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2021, 0, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, CAST(500 AS Decimal(18, 0)), 0, N'01234556', 0, 2, 2, CAST(N'2021-10-16 21:48:28.560' AS DateTime), CAST(N'2021-10-16 21:48:28.560' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2022, 0, CAST(900.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, CAST(66 AS Decimal(18, 0)), 0, N'012345', 0, 2, 2, CAST(N'2021-10-16 22:56:31.363' AS DateTime), CAST(N'2021-10-16 22:56:31.363' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2023, 3011, CAST(1000.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(0 AS Decimal(18, 0)), NULL, NULL, NULL, CAST(500 AS Decimal(18, 0)), 0, N'111', 0, 2, 2, CAST(N'2021-10-17 19:44:05.140' AS DateTime), CAST(N'2021-10-18 20:56:25.200' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2024, 3012, CAST(500.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(100 AS Decimal(18, 0)), NULL, NULL, NULL, CAST(100 AS Decimal(18, 0)), 0, N'12345', 0, 2, 2, CAST(N'2021-10-19 12:53:36.900' AS DateTime), CAST(N'2021-10-19 12:55:42.900' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2025, 3013, CAST(500.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(50 AS Decimal(18, 0)), NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), 0, N'2121', 0, 2, 2, CAST(N'2021-10-19 13:05:56.047' AS DateTime), CAST(N'2021-10-19 13:08:14.740' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3024, 4012, CAST(8888.00 AS Decimal(18, 2)), CAST(2322.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(500 AS Decimal(18, 0)), 0, N'1112', 0, 2, 2, CAST(N'2021-10-21 13:25:17.957' AS DateTime), CAST(N'2021-10-21 13:25:17.957' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3025, 0, CAST(8888.00 AS Decimal(18, 2)), CAST(9999.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(1000 AS Decimal(18, 0)), 0, N'767667', 0, 2, 2, CAST(N'2021-10-21 13:27:29.033' AS DateTime), CAST(N'2021-10-21 13:27:29.033' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3026, 4014, CAST(8888.00 AS Decimal(18, 2)), CAST(9999.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(1000 AS Decimal(18, 0)), 0, N'767667', 0, 2, 2, CAST(N'2021-10-21 13:28:56.130' AS DateTime), CAST(N'2021-10-21 13:28:56.130' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3027, 4015, CAST(8888.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(500 AS Decimal(18, 0)), 0, N'5455', 0, 2, 2, CAST(N'2021-10-21 13:32:30.030' AS DateTime), CAST(N'2021-10-21 13:32:30.030' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3028, 4016, CAST(8888.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(500 AS Decimal(18, 0)), 0, N'5455', 0, 2, 2, CAST(N'2021-10-21 13:33:00.863' AS DateTime), CAST(N'2021-10-21 13:33:00.863' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3029, 4017, CAST(8888.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(500 AS Decimal(18, 0)), 0, N'445', 0, 2, 2, CAST(N'2021-10-21 13:36:09.717' AS DateTime), CAST(N'2021-10-21 13:36:09.717' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3030, 4018, CAST(1000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(7000 AS Decimal(18, 0)), 0, N'444', 0, 2, 2, CAST(N'2021-10-21 13:39:34.910' AS DateTime), CAST(N'2021-10-21 13:39:34.910' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3031, 4017, CAST(8888.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(7000 AS Decimal(18, 0)), 0, N'12345', 0, 2, 2, CAST(N'2021-10-21 13:43:56.090' AS DateTime), CAST(N'2021-10-21 13:43:56.090' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Paid], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [BillNumber], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3032, 1005, CAST(8888.00 AS Decimal(18, 2)), CAST(9999.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(500 AS Decimal(18, 0)), 0, N'99992', 0, 2, 2, CAST(N'2021-10-21 13:57:22.110' AS DateTime), CAST(N'2021-10-21 13:57:22.110' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_BillingMaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_BillingReport] ON 

INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, 1, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIOCHEMISTRY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholesterol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirable &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology: CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Dr. Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-03 11:11:06.850' AS DateTime), CAST(N'2021-10-03 16:18:05.983' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2, 1, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-03 11:11:06.873' AS DateTime), CAST(N'2021-10-03 11:11:06.873' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1012, 1011, 3, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-11 03:39:43.347' AS DateTime), CAST(N'2021-10-11 03:39:43.347' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1023, 1014, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-14 15:01:13.567' AS DateTime), CAST(N'2021-10-14 15:01:13.567' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3, 2, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-03 15:33:56.657' AS DateTime), CAST(N'2021-10-03 15:33:56.657' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (5, 4, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-03 16:02:12.453' AS DateTime), CAST(N'2021-10-03 16:02:12.453' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2023, 2015, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-16 16:32:11.977' AS DateTime), CAST(N'2021-10-16 16:32:11.977' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2042, 2020, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-16 21:25:09.813' AS DateTime), CAST(N'2021-10-16 21:25:09.813' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4038, 3026, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-21 13:29:09.353' AS DateTime), CAST(N'2021-10-21 13:29:09.353' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4, 3, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-03 16:01:08.283' AS DateTime), CAST(N'2021-10-03 16:01:08.283' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4043, 3030, 3, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-21 13:39:50.483' AS DateTime), CAST(N'2021-10-21 13:39:50.483' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4045, 3031, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">15 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-21 13:43:58.973' AS DateTime), CAST(N'2021-11-12 09:10:37.033' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (6, 5, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-03 16:05:45.623' AS DateTime), CAST(N'2021-10-03 16:05:45.623' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (12, 11, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-03 23:44:02.467' AS DateTime), CAST(N'2021-10-03 23:44:02.467' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (14, 14, 3, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-10-03 23:57:45.087' AS DateTime), CAST(N'2021-10-03 23:57:45.087' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (15, 15, 8, N'<h1 style="text-align: center;"><strong>Test ESR</strong></h1>
<h1><strong style="mso-bidi-font-weight: normal;"><em style="mso-bidi-font-style: normal;"><u><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt;">REPORT ON THE EXAMINATION OF URINE </span></u></em></strong></h1>
<h1><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><em style="mso-bidi-font-style: normal;"><u><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt;">PHYSICAL EXAMINA0TION<span style="mso-spacerun: yes;">&nbsp; </span></span></u></em></h1>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Quantity<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>25 &ndash; ml </span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Colour<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>L. Yellow</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Transparency<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Clear<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Deposits<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Present<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Reaction<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Acidic <span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>
<h1 style="line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Specific Gravity<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Q.N.S.<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span></h1>
<p class="MsoNormal" style="line-height: 150%;"><em style="mso-bidi-font-style: normal;"><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><u>CHEMICAL EXAMINATION </u></span></em></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Albumin<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Trace<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Sugar<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent </span></p>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Bile Salt<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>NEGATIVE</h1>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>Bile Pigments<span style="mso-spacerun: yes;"> &nbsp;</span>:<span style="mso-spacerun: yes;"> &nbsp; </span>NEGATIVE</h1>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Ketone Bodies<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp; &nbsp; </span>---------</h1>
<h2><span style="mso-spacerun: yes;">&nbsp; &nbsp; &nbsp; </span><u>MICROSCOPIC EXAMINATION </u></h2>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Pus Cells<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>6 &ndash; 8 /HPF </span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>R.B.C&rsquo;S<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Absent</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Epithelial Cells<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>2 &ndash; 4 /HPF<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Crystals<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Casts<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<h1><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Others<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Absent</h1>
<p class="MsoNormal"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt;">&nbsp;</span></p>
<p class="MsoNormal"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>
<p class="MsoNormal"><strong style="mso-bidi-font-weight: normal;"><em style="mso-bidi-font-style: normal;"><span style="font-size: 16.0pt; mso-bidi-font-size: 10.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 2;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Pathologist</span></em></strong></p>', 2, 2, CAST(N'2021-10-04 01:38:16.963' AS DateTime), CAST(N'2021-10-04 01:38:16.963' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (7, 6, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-03 16:08:50.647' AS DateTime), CAST(N'2021-10-03 16:08:50.647' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (8, 7, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-03 16:09:42.670' AS DateTime), CAST(N'2021-10-03 16:09:42.670' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2024, 2016, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-16 19:14:41.670' AS DateTime), CAST(N'2021-10-16 19:14:41.670' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2026, 2017, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-16 20:38:30.597' AS DateTime), CAST(N'2021-10-16 20:38:30.597' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2027, 2017, 3, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-16 20:38:30.637' AS DateTime), CAST(N'2021-10-16 20:38:30.637' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2028, 2017, 4, NULL, 2, 2, CAST(N'2021-10-16 20:38:30.640' AS DateTime), CAST(N'2021-10-16 20:38:30.640' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (9, 8, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-03 16:48:38.163' AS DateTime), CAST(N'2021-10-03 16:48:38.163' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (10, 9, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-03 16:50:16.387' AS DateTime), CAST(N'2021-10-03 16:50:16.387' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2031, 2017, 7, N'<p>test44</p>', 2, 2, CAST(N'2021-10-16 20:38:30.647' AS DateTime), CAST(N'2021-10-16 20:38:30.647' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2032, 2017, 8, N'<h1 style="text-align: center;"><strong>Test ESR</strong></h1>
<h1><strong style="mso-bidi-font-weight: normal;"><em style="mso-bidi-font-style: normal;"><u><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt;">REPORT ON THE EXAMINATION OF URINE </span></u></em></strong></h1>
<h1><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><em style="mso-bidi-font-style: normal;"><u><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt;">PHYSICAL EXAMINA0TION<span style="mso-spacerun: yes;">&nbsp; </span></span></u></em></h1>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Quantity<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>25 &ndash; ml </span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Colour<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>L. Yellow</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Transparency<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Clear<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Deposits<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Present<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Reaction<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Acidic <span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>
<h1 style="line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Specific Gravity<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Q.N.S.<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span></h1>
<p class="MsoNormal" style="line-height: 150%;"><em style="mso-bidi-font-style: normal;"><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><u>CHEMICAL EXAMINATION </u></span></em></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Albumin<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Trace<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Sugar<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent </span></p>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Bile Salt<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>NEGATIVE</h1>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>Bile Pigments<span style="mso-spacerun: yes;"> &nbsp;</span>:<span style="mso-spacerun: yes;"> &nbsp; </span>NEGATIVE</h1>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Ketone Bodies<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp; &nbsp; </span>---------</h1>
<h2><span style="mso-spacerun: yes;">&nbsp; &nbsp; &nbsp; </span><u>MICROSCOPIC EXAMINATION </u></h2>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Pus Cells<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>6 &ndash; 8 /HPF </span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>R.B.C&rsquo;S<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Absent</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Epithelial Cells<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>2 &ndash; 4 /HPF<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Crystals<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Casts<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<h1><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Others<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Absent</h1>
<p class="MsoNormal"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt;">&nbsp;</span></p>
<p class="MsoNormal"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>
<p class="MsoNormal"><strong style="mso-bidi-font-weight: normal;"><em style="mso-bidi-font-style: normal;"><span style="font-size: 16.0pt; mso-bidi-font-size: 10.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 2;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Pathologist</span></em></strong></p>', 2, 2, CAST(N'2021-10-16 20:38:30.650' AS DateTime), CAST(N'2021-10-16 20:38:30.650' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2039, 2018, 7, N'<p>test44</p>', 2, 2, CAST(N'2021-10-16 20:39:40.580' AS DateTime), CAST(N'2021-10-16 20:39:40.580' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (11, 10, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Dr Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-03 19:24:31.260' AS DateTime), CAST(N'2021-10-03 19:26:40.537' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2040, 2018, 8, N'<h1 style="text-align: center;"><strong>Test ESR</strong></h1>
<h1><strong style="mso-bidi-font-weight: normal;"><em style="mso-bidi-font-style: normal;"><u><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt;">REPORT ON THE EXAMINATION OF URINE </span></u></em></strong></h1>
<h1><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><em style="mso-bidi-font-style: normal;"><u><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt;">PHYSICAL EXAMINA0TION<span style="mso-spacerun: yes;">&nbsp; </span></span></u></em></h1>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Quantity<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>25 &ndash; ml </span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Colour<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>L. Yellow</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Transparency<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Clear<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Deposits<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Present<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Reaction<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Acidic <span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>
<h1 style="line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Specific Gravity<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Q.N.S.<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span></h1>
<p class="MsoNormal" style="line-height: 150%;"><em style="mso-bidi-font-style: normal;"><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><u>CHEMICAL EXAMINATION </u></span></em></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Albumin<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Trace<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Sugar<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent </span></p>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Bile Salt<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>NEGATIVE</h1>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>Bile Pigments<span style="mso-spacerun: yes;"> &nbsp;</span>:<span style="mso-spacerun: yes;"> &nbsp; </span>NEGATIVE</h1>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Ketone Bodies<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp; &nbsp; </span>---------</h1>
<h2><span style="mso-spacerun: yes;">&nbsp; &nbsp; &nbsp; </span><u>MICROSCOPIC EXAMINATION </u></h2>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Pus Cells<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>6 &ndash; 8 /HPF </span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>R.B.C&rsquo;S<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Absent</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Epithelial Cells<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>2 &ndash; 4 /HPF<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Crystals<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Casts<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<h1><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Others<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Absent</h1>
<p class="MsoNormal"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt;">&nbsp;</span></p>
<p class="MsoNormal"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>
<p class="MsoNormal"><strong style="mso-bidi-font-weight: normal;"><em style="mso-bidi-font-style: normal;"><span style="font-size: 16.0pt; mso-bidi-font-size: 10.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 2;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Pathologist</span></em></strong></p>', 2, 2, CAST(N'2021-10-16 20:39:40.580' AS DateTime), CAST(N'2021-10-16 20:39:40.580' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (13, 13, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 2, CAST(N'2021-10-03 23:56:53.707' AS DateTime), CAST(N'2021-10-04 01:19:56.470' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1013, 1012, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-12 11:39:19.510' AS DateTime), CAST(N'2021-10-12 11:39:19.510' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1014, 1012, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-12 11:39:19.577' AS DateTime), CAST(N'2021-10-12 11:39:19.577' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1015, 1012, 3, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-12 11:39:19.613' AS DateTime), CAST(N'2021-10-12 11:39:19.613' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1016, 1012, 4, NULL, 2, 2, CAST(N'2021-10-12 11:39:19.617' AS DateTime), CAST(N'2021-10-12 11:39:19.617' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1017, 1012, 5, N'<p>Test For Kidney</p>', 2, 2, CAST(N'2021-10-12 11:39:19.620' AS DateTime), CAST(N'2021-10-12 11:39:19.620' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1018, 1012, 6, N'<p style="text-align: center;"><strong>Blood Uria&nbsp;</strong></p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ajaz</strong></p>
<p style="text-align: left;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Pathology</strong></p>
<p style="text-align: center;">&nbsp;</p>
<p style="text-align: center;">&nbsp;</p>', 2, 2, CAST(N'2021-10-12 11:39:19.620' AS DateTime), CAST(N'2021-10-12 11:39:19.620' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1019, 1012, 7, N'<p>test44</p>', 2, 2, CAST(N'2021-10-12 11:39:19.620' AS DateTime), CAST(N'2021-10-12 11:39:19.620' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1020, 1012, 8, N'<h1 style="text-align: center;"><strong>Test ESR</strong></h1>
<h1><strong style="mso-bidi-font-weight: normal;"><em style="mso-bidi-font-style: normal;"><u><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt;">REPORT ON THE EXAMINATION OF URINE </span></u></em></strong></h1>
<h1><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><em style="mso-bidi-font-style: normal;"><u><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt;">PHYSICAL EXAMINA0TION<span style="mso-spacerun: yes;">&nbsp; </span></span></u></em></h1>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Quantity<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>25 &ndash; ml </span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Colour<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>L. Yellow</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Transparency<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Clear<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Deposits<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Present<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Reaction<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Acidic <span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>
<h1 style="line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Specific Gravity<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Q.N.S.<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span></h1>
<p class="MsoNormal" style="line-height: 150%;"><em style="mso-bidi-font-style: normal;"><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><u>CHEMICAL EXAMINATION </u></span></em></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Albumin<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Trace<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Sugar<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent </span></p>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Bile Salt<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>NEGATIVE</h1>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>Bile Pigments<span style="mso-spacerun: yes;"> &nbsp;</span>:<span style="mso-spacerun: yes;"> &nbsp; </span>NEGATIVE</h1>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Ketone Bodies<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp; &nbsp; </span>---------</h1>
<h2><span style="mso-spacerun: yes;">&nbsp; &nbsp; &nbsp; </span><u>MICROSCOPIC EXAMINATION </u></h2>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Pus Cells<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>6 &ndash; 8 /HPF </span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>R.B.C&rsquo;S<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Absent</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Epithelial Cells<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>2 &ndash; 4 /HPF<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Crystals<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Casts<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<h1><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Others<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Absent</h1>
<p class="MsoNormal"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt;">&nbsp;</span></p>
<p class="MsoNormal"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>
<p class="MsoNormal"><strong style="mso-bidi-font-weight: normal;"><em style="mso-bidi-font-style: normal;"><span style="font-size: 16.0pt; mso-bidi-font-size: 10.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 2;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Pathologist</span></em></strong></p>', 2, 2, CAST(N'2021-10-12 11:39:19.623' AS DateTime), CAST(N'2021-10-12 11:39:19.623' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2029, 2017, 5, N'<p>Test For Kidney</p>', 2, 2, CAST(N'2021-10-16 20:38:30.643' AS DateTime), CAST(N'2021-10-16 20:38:30.643' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2030, 2017, 6, N'<p style="text-align: center;"><strong>Blood Uria&nbsp;</strong></p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ajaz</strong></p>
<p style="text-align: left;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Pathology</strong></p>
<p style="text-align: center;">&nbsp;</p>
<p style="text-align: center;">&nbsp;</p>', 2, 2, CAST(N'2021-10-16 20:38:30.643' AS DateTime), CAST(N'2021-10-16 20:38:30.643' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2038, 2018, 6, N'<p style="text-align: center;"><strong>Blood Uria&nbsp;</strong></p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ajaz</strong></p>
<p style="text-align: left;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Pathology</strong></p>
<p style="text-align: center;">&nbsp;</p>
<p style="text-align: center;">&nbsp;</p>', 2, 2, CAST(N'2021-10-16 20:39:40.580' AS DateTime), CAST(N'2021-10-16 20:39:40.580' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1021, 1013, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-14 00:00:11.213' AS DateTime), CAST(N'2021-10-14 00:00:11.213' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1022, 1013, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-14 00:00:11.227' AS DateTime), CAST(N'2021-10-14 00:00:11.227' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2025, 2017, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-16 20:38:30.533' AS DateTime), CAST(N'2021-10-16 20:38:30.533' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4039, 3028, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-21 13:33:13.830' AS DateTime), CAST(N'2021-10-21 13:33:13.830' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4041, 3029, 3, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-21 13:36:23.527' AS DateTime), CAST(N'2021-10-21 13:36:23.527' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2033, 2018, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-16 20:39:40.540' AS DateTime), CAST(N'2021-10-16 20:39:40.540' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2034, 2018, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-16 20:39:40.543' AS DateTime), CAST(N'2021-10-16 20:39:40.543' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2035, 2018, 3, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-16 20:39:40.547' AS DateTime), CAST(N'2021-10-16 20:39:40.547' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2036, 2018, 4, NULL, 2, 2, CAST(N'2021-10-16 20:39:40.573' AS DateTime), CAST(N'2021-10-16 20:39:40.573' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2037, 2018, 5, N'<p>Test For Kidney</p>', 2, 2, CAST(N'2021-10-16 20:39:40.577' AS DateTime), CAST(N'2021-10-16 20:39:40.577' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2041, 2019, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-16 20:58:46.097' AS DateTime), CAST(N'2021-10-16 20:58:46.097' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3033, 2023, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-17 19:44:05.147' AS DateTime), CAST(N'2021-10-17 19:44:05.147' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3034, 2023, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-17 19:44:05.150' AS DateTime), CAST(N'2021-10-17 19:44:05.150' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3035, 2024, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-19 12:53:36.940' AS DateTime), CAST(N'2021-10-19 12:53:36.940' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3036, 2024, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-19 12:53:36.963' AS DateTime), CAST(N'2021-10-19 12:53:36.963' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3038, 2025, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-19 13:05:56.080' AS DateTime), CAST(N'2021-10-19 13:05:56.080' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3037, 2025, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-19 13:05:56.073' AS DateTime), CAST(N'2021-10-19 13:05:56.073' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4035, 2025, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', NULL, NULL, CAST(N'2021-10-21 13:19:02.477' AS DateTime), CAST(N'2021-10-21 13:19:02.477' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4036, 2025, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', NULL, NULL, CAST(N'2021-10-21 13:20:23.293' AS DateTime), CAST(N'2021-10-21 13:20:23.293' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4037, 3024, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-21 13:25:17.967' AS DateTime), CAST(N'2021-10-21 13:25:17.967' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4040, 3029, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-21 13:36:19.690' AS DateTime), CAST(N'2021-10-21 13:36:19.690' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4042, 3030, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-21 13:39:49.387' AS DateTime), CAST(N'2021-10-21 13:39:49.387' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4044, 3031, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-21 13:43:58.100' AS DateTime), CAST(N'2021-10-21 13:43:58.100' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4046, 3032, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 2, 2, CAST(N'2021-10-21 13:57:24.060' AS DateTime), CAST(N'2021-10-21 13:57:24.060' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_BillingReport] OFF
SET IDENTITY_INSERT [dbo].[tbl_CenterSettings] ON 

INSERT [dbo].[tbl_CenterSettings] ([CenterId], [CenterName], [FullAddress], [BranchLocation], [Logo], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Akbar', N'H.No. 4-18-26/A , Opp Noorani Masjid, Hassan Nagar, Hyderabad, T.S.', N'Hyderabad', NULL, N'test', 1, NULL, 1, NULL)
INSERT [dbo].[tbl_CenterSettings] ([CenterId], [CenterName], [FullAddress], [BranchLocation], [Logo], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Sun', N'H.No. 4-18-26/A , Opp Noorani Masjid, Hassan Nagar, Hyderabad, T.S.', N'Pune', NULL, N'test', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_CenterSettings] OFF
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ON 

INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 10, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', N'ClinicalBiochemistoryReportLIPIDProfile', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 5, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', N'ClinicalBiochemistoryReportLIPIDProfile', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 2, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', N'ClinicalBiochemistoryReportLIPIDProfile', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 4, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', N'ClinicalBiochemistoryReportLIPIDProfile', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, 1, N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', NULL, 1, NULL, NULL, NULL, 12, CAST(N'2021-09-04 16:16:19.120' AS DateTime), 12, CAST(N'2021-09-04 16:16:19.120' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, 1, N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', NULL, 1, NULL, NULL, NULL, 12, CAST(N'2021-09-05 18:09:40.803' AS DateTime), 12, CAST(N'2021-09-05 18:09:40.803' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, 27, N'123', N'123', N'123', N'123', N'123', N'123', N'123', N'123', NULL, 1, NULL, NULL, NULL, 123, CAST(N'2021-09-05 20:14:25.797' AS DateTime), 123, CAST(N'2021-09-05 20:14:25.797' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, 27, N'42', N'11', N'32', N'22', N'11', N'11', N'22', N'33', NULL, 1, NULL, NULL, NULL, 33, CAST(N'2021-09-05 22:03:09.737' AS DateTime), 33, CAST(N'2021-09-05 22:03:09.737' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, 27, N'62', N'11', N'62', N'22', N'11', N'11', N'22', N'33', NULL, 1, NULL, NULL, NULL, 33, CAST(N'2021-09-05 22:05:12.493' AS DateTime), 33, CAST(N'2021-09-05 22:05:12.493' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, 27, N'66', N'11', N'44', N'33', N'33', N'55', N'22', N'77', NULL, 1, NULL, NULL, NULL, 77, CAST(N'2021-09-05 22:08:24.210' AS DateTime), 77, CAST(N'2021-09-05 22:08:24.210' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, 29, N'10', N'14', N'11', N'15', N'12', N'16', N'13', N'17', NULL, 1, NULL, NULL, NULL, 17, CAST(N'2021-09-06 02:29:30.250' AS DateTime), 17, CAST(N'2021-09-06 02:29:30.250' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, 30, N'123', N'12', N'12', N'15', N'12', N'16', N'12', N'12', NULL, 1, NULL, NULL, NULL, 12, CAST(N'2021-09-06 08:48:44.233' AS DateTime), 12, CAST(N'2021-09-06 08:48:44.233' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (13, 27, N'12', N'12', N'12', N'12', N'11', NULL, N'12', N'12', NULL, 1, NULL, NULL, NULL, 12, CAST(N'2021-09-21 17:24:04.990' AS DateTime), 12, CAST(N'2021-09-21 17:24:04.990' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (14, 545454, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-23 17:52:19.940' AS DateTime), 1, CAST(N'2021-09-23 17:52:19.940' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1014, 92111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-24 17:07:02.097' AS DateTime), 1, CAST(N'2021-09-24 17:07:02.097' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] OFF
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ON 

INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 4, N'0.7', N'0.2', N'0.5', N'13', N'15', N'6.8', N'3.9', N'2.9', N'1.3', N'66', CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'ClinicalBiochemistoryReportLTF', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 10, N'0.7', N'0.2', N'0.5', N'13', N'15', N'6.8', N'3.9', N'2.9', N'1.3', N'66', CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'ClinicalBiochemistoryReportLTF', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 1, N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', NULL, NULL, 2, NULL, NULL, NULL, NULL, CAST(N'2021-09-04 16:27:09.660' AS DateTime), NULL, CAST(N'2021-09-04 16:27:09.660' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 27, N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', NULL, NULL, 2, NULL, NULL, NULL, 1, CAST(N'2021-09-06 02:11:36.330' AS DateTime), 1, CAST(N'2021-09-06 02:11:36.330' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, 545454, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-23 17:52:19.947' AS DateTime), 1, CAST(N'2021-09-23 17:52:19.947' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1005, 92111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-24 17:07:02.137' AS DateTime), 1, CAST(N'2021-09-24 17:07:02.137' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2005, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-26 15:33:46.760' AS DateTime), 1, CAST(N'2021-09-26 15:33:46.760' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] OFF
SET IDENTITY_INSERT [dbo].[tbl_Collected] ON 

INSERT [dbo].[tbl_Collected] ([CollectedById], [CollectedByName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'test123', 1, CAST(N'2021-10-03 14:59:58.970' AS DateTime), 2, CAST(N'2021-10-19 13:10:36.393' AS DateTime))
INSERT [dbo].[tbl_Collected] ([CollectedById], [CollectedByName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'janu', 1, CAST(N'2021-10-03 15:03:12.473' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_Collected] ([CollectedById], [CollectedByName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'janu', 1, CAST(N'2021-10-03 15:03:56.573' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_Collected] ([CollectedById], [CollectedByName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, N'test4', 2, CAST(N'2021-10-17 23:11:26.150' AS DateTime), 2, CAST(N'2021-10-17 23:11:26.150' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Collected] OFF
SET IDENTITY_INSERT [dbo].[tbl_ComputerBloodPictureReport] ON 

INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 4, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0 ', N'3.9 ', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic
', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 0, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 0, CAST(N'2021-09-02 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 0, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, 1, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, 5, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, 6, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, 7, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, 8, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, 9, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, 10, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, NULL, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11', N'233', N'123', N'232', N'322', N'23', N'11', N'23', N'22', N'23', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (13, 27, NULL, N'21', N'11', N'22', N'33', N'12', N'22', N'33', N'11', N'11', N'22', NULL, 3, NULL, NULL, NULL, NULL, CAST(N'2021-09-05 22:46:34.387' AS DateTime), NULL, CAST(N'2021-09-05 22:46:34.387' AS DateTime))
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (14, 545454, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-23 17:52:19.950' AS DateTime), 1, CAST(N'2021-09-23 17:52:19.950' AS DateTime))
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1014, 92111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-24 17:07:02.137' AS DateTime), 1, CAST(N'2021-09-24 17:07:02.137' AS DateTime))
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2014, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-26 15:33:46.807' AS DateTime), 1, CAST(N'2021-09-26 15:33:46.807' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ComputerBloodPictureReport] OFF
SET IDENTITY_INSERT [dbo].[tbl_Doctor] ON 

INSERT [dbo].[tbl_Doctor] ([DocId], [DoctorName], [Specilization], [Signature], [Qualification], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'DR. Aijaz Ahmed', NULL, NULL, NULL, 2, CAST(N'2021-10-03 02:16:14.927' AS DateTime), 1, CAST(N'2021-10-03 23:53:34.100' AS DateTime))
INSERT [dbo].[tbl_Doctor] ([DocId], [DoctorName], [Specilization], [Signature], [Qualification], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Dr Surya  ', NULL, NULL, NULL, 2, CAST(N'2021-10-03 02:16:32.140' AS DateTime), 2, CAST(N'2021-10-03 12:03:49.200' AS DateTime))
INSERT [dbo].[tbl_Doctor] ([DocId], [DoctorName], [Specilization], [Signature], [Qualification], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1002, N'Dr Azam', NULL, NULL, NULL, 2, CAST(N'2021-10-03 12:04:47.843' AS DateTime), 2, CAST(N'2021-10-03 12:05:45.243' AS DateTime))
INSERT [dbo].[tbl_Doctor] ([DocId], [DoctorName], [Specilization], [Signature], [Qualification], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1003, N'Dr  Prakash', NULL, NULL, NULL, 2, CAST(N'2021-10-03 12:06:17.170' AS DateTime), 2, CAST(N'2021-10-03 12:06:17.170' AS DateTime))
INSERT [dbo].[tbl_Doctor] ([DocId], [DoctorName], [Specilization], [Signature], [Qualification], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1004, N'Dr.Ritu Vyas', NULL, NULL, NULL, 1, CAST(N'2021-10-03 23:53:49.963' AS DateTime), 1, CAST(N'2021-10-03 23:54:11.260' AS DateTime))
INSERT [dbo].[tbl_Doctor] ([DocId], [DoctorName], [Specilization], [Signature], [Qualification], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1005, N'Dr.Bilal Ahmed', NULL, NULL, NULL, 2, CAST(N'2021-10-04 01:26:14.770' AS DateTime), 2, CAST(N'2021-10-04 01:26:53.337' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Doctor] OFF
SET IDENTITY_INSERT [dbo].[tbl_PatientInfo] ON 

INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Oria', N'Miss', 20, N'years', N'Female', 1005, N'12345', NULL, 2, CAST(N'2021-10-03 11:11:06.773' AS DateTime), 2, CAST(N'2021-10-04 01:38:16.950' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'azam', NULL, 20, NULL, N'Male', 1, N'1234567', NULL, 2, CAST(N'2021-10-03 16:02:12.447' AS DateTime), 2, CAST(N'2021-10-03 16:08:50.640' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Meghna', NULL, 20, NULL, N'Male', 1003, N'90007', NULL, 2, CAST(N'2021-10-03 16:50:16.383' AS DateTime), 2, CAST(N'2021-10-03 16:50:16.383' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, N'Rohan', NULL, 12, NULL, N'Male', 1, N'9876', NULL, 2, CAST(N'2021-10-03 19:24:30.967' AS DateTime), 2, CAST(N'2021-10-03 19:24:30.967' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, N'Oria', NULL, 20, NULL, N'Female', 1, NULL, NULL, 1, CAST(N'2021-10-03 23:56:40.327' AS DateTime), 1, CAST(N'2021-10-03 23:56:40.327' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, N'chiko', NULL, 20, NULL, N'Female', 1004, N'0909', NULL, 1, CAST(N'2021-10-03 23:57:45.063' AS DateTime), 1, CAST(N'2021-10-03 23:57:45.063' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1005, N'Rohan', N'Mr.', 21, NULL, N'Male', 1, N'92112', NULL, 2, CAST(N'2021-10-11 03:39:43.210' AS DateTime), 2, CAST(N'2021-10-21 13:57:22.110' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1006, N'Meghna', NULL, 12, NULL, N'Male', 1, N'1234511', NULL, 2, CAST(N'2021-10-12 11:39:19.410' AS DateTime), 2, CAST(N'2021-10-12 11:39:19.410' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1007, N'Rohan', NULL, 12, N'months', N'Male', 1002, N'12345990', NULL, 2, CAST(N'2021-10-14 00:00:11.090' AS DateTime), 2, CAST(N'2021-10-14 00:00:11.090' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1008, N'khalid', N'Mr.', 12, N'years', N'Male', 1, N'12345111', NULL, 2, CAST(N'2021-10-14 15:01:13.470' AS DateTime), 2, CAST(N'2021-10-16 21:25:09.800' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2008, N'khaja', N'Mr.', 21, N'years', N'Male', 1, N'9951751787', NULL, 2, CAST(N'2021-10-16 16:31:47.940' AS DateTime), 2, CAST(N'2021-10-16 16:32:11.863' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2009, N'Rasheed', N'Mr.', 21, N'years', N'Male', 1, N'1234577', NULL, 2, CAST(N'2021-10-16 19:14:41.653' AS DateTime), 2, CAST(N'2021-10-16 19:14:41.653' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2010, N'game', N'Mr.', 12, N'years', N'Male', 1, N'0999', NULL, 2, CAST(N'2021-10-16 20:38:30.517' AS DateTime), 2, CAST(N'2021-10-16 20:39:40.537' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2011, N'khalid', N'Mr.', 12, N'days', N'Male', 1, N'11321', NULL, 2, CAST(N'2021-10-16 20:58:46.087' AS DateTime), 2, CAST(N'2021-10-16 20:58:46.087' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2012, NULL, N'Mr.', NULL, N'months', NULL, 1002, NULL, NULL, 2, CAST(N'2021-10-16 21:48:28.557' AS DateTime), 2, CAST(N'2021-10-16 21:48:28.557' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2013, N'Oria', N'Miss', 20, N'years', N'Female', 1, NULL, NULL, 2, CAST(N'2021-10-16 22:56:31.360' AS DateTime), 2, CAST(N'2021-10-16 22:56:31.360' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3011, N'lava', N'Mr.', 21, N'years', N'Male', 1, N'7777', NULL, 2, CAST(N'2021-10-17 19:44:05.140' AS DateTime), 2, CAST(N'2021-10-17 19:44:05.140' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3012, N'rashed', N'Mr.', 12, N'months', N'Male', 1, N'890', NULL, 2, CAST(N'2021-10-19 12:53:36.897' AS DateTime), 2, CAST(N'2021-10-19 12:53:36.897' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3013, N'talha', N'Mr.', 21, N'years', N'Male', 1, N'810810', NULL, 2, CAST(N'2021-10-19 13:05:56.047' AS DateTime), 2, CAST(N'2021-10-19 13:05:56.047' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4012, N'khalid', N'Mr.', 12, N'days', N'Male', 1, N'23111', NULL, 2, CAST(N'2021-10-21 13:25:17.953' AS DateTime), 2, CAST(N'2021-10-21 13:25:17.953' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4013, N'khalid', N'Mr.', 12, N'days', N'Male', 1, NULL, NULL, 2, CAST(N'2021-10-21 13:27:29.030' AS DateTime), 2, CAST(N'2021-10-21 13:27:29.030' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4014, N'khalid', N'Mr.', 12, N'days', N'Male', 1, N'1234335', NULL, 2, CAST(N'2021-10-21 13:28:56.117' AS DateTime), 2, CAST(N'2021-10-21 13:28:56.117' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4015, N'Rohan', N'Mr.', 12, N'days', N'Female', 1, N'9392447742', NULL, 2, CAST(N'2021-10-21 13:32:30.027' AS DateTime), 2, CAST(N'2021-10-21 13:32:30.027' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4016, N'Rohan', N'Mr.', 12, N'days', N'Female', 1, N'5445', NULL, 2, CAST(N'2021-10-21 13:33:00.860' AS DateTime), 2, CAST(N'2021-10-21 13:33:00.860' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4017, N'khalid', N'Mr.', 21, N'years', N'Male', 1, N'4545', NULL, 2, CAST(N'2021-10-21 13:36:09.683' AS DateTime), 2, CAST(N'2021-10-21 13:43:56.080' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [SurName], [Age], [YMD], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4018, N'khalid', N'Mr.', 21, N'years', N'Male', 1, N'5454', NULL, 2, CAST(N'2021-10-21 13:39:34.910' AS DateTime), 2, CAST(N'2021-10-21 13:39:34.910' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_PatientInfo] OFF
SET IDENTITY_INSERT [dbo].[tbl_Printer] ON 

INSERT [dbo].[tbl_Printer] ([Printer_id], [Printer_Name]) VALUES (1, N'Samsung SCX-3400 Series
')
SET IDENTITY_INSERT [dbo].[tbl_Printer] OFF
SET IDENTITY_INSERT [dbo].[tbl_ReportType] ON 

INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Clinical Biochemistory Report LIPID Profile', N'LPID', N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, CAST(N'2021-09-04 14:17:39.570' AS DateTime), 1, CAST(N'2021-09-26 15:46:41.560' AS DateTime))
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Clinical Biochemistory Report LTF', N'LTF', N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, CAST(N'2021-09-04 14:17:39.570' AS DateTime), 1, CAST(N'2021-09-26 15:48:51.907' AS DateTime))
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Computer Blood Picture Report', N'CBP', N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, CAST(N'2021-09-04 14:17:39.570' AS DateTime), 1, CAST(N'2021-09-26 15:48:18.973' AS DateTime))
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, N'Other', N'Other', NULL, 1, CAST(N'2021-09-04 14:17:39.570' AS DateTime), 1, CAST(N'2021-09-04 14:17:39.570' AS DateTime))
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, N'Kidney Test', N'KB', N'<p>Test For Kidney</p>', 1, CAST(N'2021-09-28 02:08:49.440' AS DateTime), 1, CAST(N'2021-09-28 02:08:49.440' AS DateTime))
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, N'Uria', N'UR', N'<p style="text-align: center;"><strong>Blood Uria&nbsp;</strong></p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ajaz</strong></p>
<p style="text-align: left;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Pathology</strong></p>
<p style="text-align: center;">&nbsp;</p>
<p style="text-align: center;">&nbsp;</p>', 1, CAST(N'2021-09-28 03:01:20.050' AS DateTime), 1, CAST(N'2021-09-28 03:01:34.207' AS DateTime))
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, N'Test34', N'Test23', N'<p>test44</p>', 2, CAST(N'2021-10-03 13:59:18.893' AS DateTime), 1, CAST(N'2021-10-03 23:55:08.853' AS DateTime))
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, N'ELectro Segmentry Rate', N'ESR', N'<h1 style="text-align: center;"><strong>Test ESR</strong></h1>
<h1><strong style="mso-bidi-font-weight: normal;"><em style="mso-bidi-font-style: normal;"><u><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt;">REPORT ON THE EXAMINATION OF URINE </span></u></em></strong></h1>
<h1><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><em style="mso-bidi-font-style: normal;"><u><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt;">PHYSICAL EXAMINA0TION<span style="mso-spacerun: yes;">&nbsp; </span></span></u></em></h1>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Quantity<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>25 &ndash; ml </span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Colour<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>L. Yellow</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Transparency<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Clear<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Deposits<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Present<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Reaction<span style="mso-spacerun: yes;">&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Acidic <span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>
<h1 style="line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Specific Gravity<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Q.N.S.<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span></h1>
<p class="MsoNormal" style="line-height: 150%;"><em style="mso-bidi-font-style: normal;"><span style="font-size: 14.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><u>CHEMICAL EXAMINATION </u></span></em></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Albumin<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Trace<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Sugar<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent </span></p>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Bile Salt<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>NEGATIVE</h1>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>Bile Pigments<span style="mso-spacerun: yes;"> &nbsp;</span>:<span style="mso-spacerun: yes;"> &nbsp; </span>NEGATIVE</h1>
<h1 style="line-height: 150%; tab-stops: 189.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Ketone Bodies<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp; &nbsp; </span>---------</h1>
<h2><span style="mso-spacerun: yes;">&nbsp; &nbsp; &nbsp; </span><u>MICROSCOPIC EXAMINATION </u></h2>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Pus Cells<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>6 &ndash; 8 /HPF </span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>R.B.C&rsquo;S<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Absent</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Epithelial Cells<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>2 &ndash; 4 /HPF<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Crystals<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent</span></p>
<p class="MsoNormal" style="line-height: 150%;"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt; line-height: 150%;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Casts<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Absent<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>
<h1><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Others<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Absent</h1>
<p class="MsoNormal"><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt;">&nbsp;</span></p>
<p class="MsoNormal"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size: 12.0pt; mso-bidi-font-size: 10.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>
<p class="MsoNormal"><strong style="mso-bidi-font-weight: normal;"><em style="mso-bidi-font-style: normal;"><span style="font-size: 16.0pt; mso-bidi-font-size: 10.0pt;"><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-tab-count: 2;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun: yes;">&nbsp;</span>Pathologist</span></em></strong></p>', 2, CAST(N'2021-10-04 01:33:36.257' AS DateTime), 2, CAST(N'2021-10-04 01:36:47.083' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ReportType] OFF
SET IDENTITY_INSERT [dbo].[tbl_Role] ON 

INSERT [dbo].[tbl_Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName]) VALUES (2, N'Employee')
SET IDENTITY_INSERT [dbo].[tbl_Role] OFF
SET IDENTITY_INSERT [dbo].[tbl_Service] ON 

INSERT [dbo].[tbl_Service] ([ServiceNo], [ServiceName], [ShortName], [OP], [LDSL], [Method], [Sample], [Schedule], [CutOfTime], [TAT], [Vacutainer]) VALUES (1, N'test', N'te', 34, 44, N'test', N'test', N'4pm', N'56', N'5hr', N'test')
INSERT [dbo].[tbl_Service] ([ServiceNo], [ServiceName], [ShortName], [OP], [LDSL], [Method], [Sample], [Schedule], [CutOfTime], [TAT], [Vacutainer]) VALUES (2, N'test1', NULL, 45, 55, N'test1', N'test1', N'6pm', N'78', N'6hr', N'test2')
INSERT [dbo].[tbl_Service] ([ServiceNo], [ServiceName], [ShortName], [OP], [LDSL], [Method], [Sample], [Schedule], [CutOfTime], [TAT], [Vacutainer]) VALUES (3, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Service] ([ServiceNo], [ServiceName], [ShortName], [OP], [LDSL], [Method], [Sample], [Schedule], [CutOfTime], [TAT], [Vacutainer]) VALUES (4, N'test3', NULL, 1, 12, N'test3', N'test3', N'test3', N'test3', N'test3', N'test3')
INSERT [dbo].[tbl_Service] ([ServiceNo], [ServiceName], [ShortName], [OP], [LDSL], [Method], [Sample], [Schedule], [CutOfTime], [TAT], [Vacutainer]) VALUES (5, N'tes444', NULL, 1, 12, N'test3', N'test56', N'test3', N'test53', N'test5', N'test5')
INSERT [dbo].[tbl_Service] ([ServiceNo], [ServiceName], [ShortName], [OP], [LDSL], [Method], [Sample], [Schedule], [CutOfTime], [TAT], [Vacutainer]) VALUES (6, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Service] ([ServiceNo], [ServiceName], [ShortName], [OP], [LDSL], [Method], [Sample], [Schedule], [CutOfTime], [TAT], [Vacutainer]) VALUES (7, N'tes444', NULL, 3, 3, N'asdf', N'asdfa', N'sdfasd', N'asdfas', N'asdf', N'asdf')
INSERT [dbo].[tbl_Service] ([ServiceNo], [ServiceName], [ShortName], [OP], [LDSL], [Method], [Sample], [Schedule], [CutOfTime], [TAT], [Vacutainer]) VALUES (8, N'Test8', NULL, 1, 1, N'Test8', N'Test8', N'Test7', N'Test7', N'Test7', N'Test7sdfgsdf')
INSERT [dbo].[tbl_Service] ([ServiceNo], [ServiceName], [ShortName], [OP], [LDSL], [Method], [Sample], [Schedule], [CutOfTime], [TAT], [Vacutainer]) VALUES (9, N'tes444', NULL, 33, 34, N'test3', N'test3', N'test3', N'asdfas', N'Test7', N'Test7')
INSERT [dbo].[tbl_Service] ([ServiceNo], [ServiceName], [ShortName], [OP], [LDSL], [Method], [Sample], [Schedule], [CutOfTime], [TAT], [Vacutainer]) VALUES (10, N'tes49', NULL, 2, 2, N'tes49', N'tes49', N'tes49', N'tes49', N'tes49', N'tes49')
INSERT [dbo].[tbl_Service] ([ServiceNo], [ServiceName], [ShortName], [OP], [LDSL], [Method], [Sample], [Schedule], [CutOfTime], [TAT], [Vacutainer]) VALUES (11, N'tes50', NULL, 12, 13, N'tes50', N'tes50', N'tes50', N'tes50', N'tes50', N'tes50')
INSERT [dbo].[tbl_Service] ([ServiceNo], [ServiceName], [ShortName], [OP], [LDSL], [Method], [Sample], [Schedule], [CutOfTime], [TAT], [Vacutainer]) VALUES (12, N'Test777', N'Te79', 1, 1, N'test3', N'Test777', N'Test777', N'2pm', N'6hours', N'test7')
SET IDENTITY_INSERT [dbo].[tbl_Service] OFF
SET IDENTITY_INSERT [dbo].[tbl_UserLogin] ON 

INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [RoleId], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, N'Namrata', N'n@gmail.com', N'123', 1, 1, 2, 1, 1, NULL, NULL)
INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [RoleId], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2, N'yawar', N'yawarali17@gmail.com', N'123', 0, 0, 1, 1, 1, CAST(N'2021-09-05 20:11:45.503' AS DateTime), CAST(N'2021-09-05 20:11:45.503' AS DateTime))
INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [RoleId], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3, N'Meghna', N'Meghna@gmail.com', N'123', 0, 1, 2, 1, NULL, CAST(N'2021-09-06 02:21:23.810' AS DateTime), CAST(N'2021-09-06 02:21:23.810' AS DateTime))
INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [RoleId], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (5, N'Omer', N'Omer@gmail.com', N'123', 0, 1, 2, NULL, NULL, CAST(N'2021-10-12 12:44:24.833' AS DateTime), CAST(N'2021-10-12 12:44:24.833' AS DateTime))
INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [RoleId], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (6, N'Jiva', N'Jiva@gmail.com', N'123', 0, 1, 1, NULL, NULL, CAST(N'2021-10-12 12:45:25.533' AS DateTime), CAST(N'2021-10-12 12:45:25.533' AS DateTime))
INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [RoleId], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (8, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, CAST(N'2021-10-12 12:48:05.980' AS DateTime), CAST(N'2021-10-12 12:48:05.980' AS DateTime))
INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [RoleId], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (11, NULL, N' ', NULL, 0, 1, 0, NULL, NULL, CAST(N'2021-10-12 12:51:48.863' AS DateTime), CAST(N'2021-10-12 12:51:48.863' AS DateTime))
INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [RoleId], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (13, N'mohammed asif', N'asif@gmail.com', NULL, 0, 1, 0, NULL, NULL, CAST(N'2021-10-12 13:02:40.073' AS DateTime), CAST(N'2021-10-12 13:02:40.073' AS DateTime))
INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [RoleId], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (14, N'mohammed asif', N'asif@asdfasdgmail.com', N'asdfasd', 0, 1, 0, NULL, NULL, CAST(N'2021-10-12 13:03:19.403' AS DateTime), CAST(N'2021-10-12 13:03:19.403' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_UserLogin] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [uniqueEmail]    Script Date: 23-12-2021 07:57:11 ******/
ALTER TABLE [dbo].[tbl_UserLogin] ADD  CONSTRAINT [uniqueEmail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[_usp_getServiceDetails]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[_usp_getServiceDetails]asBeginSelect *from tbl_serviceEnd

GO
/****** Object:  StoredProcedure [dbo].[AddBillingTransaction]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddBillingTransaction]  
(  
   
   @ReportId varchar(500),
   @Pid varchar(500),
   @CreatedBy int ,  
   @UpdatedBy int 
)  
as  
begin 
 declare  @BillID int =0;
 declare @Description nvarchar(max)=Null
   select @BillID= MAX(BilIingId) from tbl_BillingMaster --where Pid=@Pid
   print @BillID
   Select @Description=Description from tbl_ReportType where Id=@ReportId
    Insert into tbl_BillingReport   
   (
BillId,
ReportId,
Description,
CreatedBy,
UpdatedBy,
CreatedOn,
UpdatedOn)
values(
@BillID,
@ReportId,
@Description, 
@CreatedBy,
@UpdatedBy,  
getdate(),
getdate()
)  

  select cast(@BillID as int)
  
End
 

 
 

GO
/****** Object:  StoredProcedure [dbo].[AddNewClinicalBiochemistoryReportLIPIDProfileDetails]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNewClinicalBiochemistoryReportLIPIDProfileDetails]  
(  
   @Pid int,      
   @serumCholestrol varchar (50),
   @hdlCholestrol varchar(50),
   @LDLCholestrol varchar(50),
   @VLDLCholestrol varchar(50),
   @serumTriglyceride varchar(50),
   @THDL varchar(50),
   @LDLHDL varchar(50),
   @titalLipid varchar(50),
   @CreatedBy int,
   @UpdatedBy int
)  
as  
begin  
   Insert into tbl_ClinicalBiochemistoryReportLIPIDProfile 
   (
   Pid,
   serumCholestrol,
   hdlCholestrol,
   LDLCholestrol,
   VLDLCholestrol,
   serumTriglyceride,
   THDL,
   LDLHDL,
   titalLipid,
   ReportTypeId, 
   CreatedBy, 
   CreatedOn, 
   UpdatedBy,  
   UpdatedOn  
   )
   values(
   @Pid,
   @serumCholestrol,
   @hdlCholestrol,
   @LDLCholestrol,
   @VLDLCholestrol,
   @serumTriglyceride,
   @THDL,
   @LDLHDL,
   @titalLipid,
   '1', 
   @CreatedBy, 
   getdate(), 
   @UpdatedBy,  
   getdate() 
   )  
End 
GO
/****** Object:  StoredProcedure [dbo].[AddNewClinicalBiochemistoryReportLTFDetails]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNewClinicalBiochemistoryReportLTFDetails]  
(  
    @Pid int,      
    @serumBilirubin varchar (50),
    @serumBilirubinD varchar(50),
    @serumBilirubinID varchar(50),
    @serumAsparateAminoTransferase varchar(50),
    @serumAlanineAminoTransferase varchar(50),
    @serumTotalProtein varchar(50),
    @serumAlbumin varchar(50),
    @serumGlubulin varchar(50),
    @AGRation varchar(50),
    @serumAlkalinePhosphatse varchar(50),
	@DoctorName varchar(100),
	@Designation varchar(100),
	@Qualification varchar(100),
    @CreatedBy int,
    @UpdatedBy int
    )  
as  
begin  
   Insert into dbo.tbl_ClinicalBiochemistoryReportLTF(
    Pid      
   ,serumBilirubin  
   ,serumBilirubinD  
   ,serumBilirubinID  
   ,serumAsparateAminoTransferase  
   ,serumAlanineAminoTransferase  
   ,serumTotalProtein 
   ,serumAlbumin  
   ,serumGlubulin  
   ,AGRation  
   ,serumAlkalinePhosphatse ,
    ReportTypeId,
	DoctorName,
	Designation,
	Qualification,
    CreatedBy,
    CreatedOn,
    UpdatedBy,
    UpdatedOn)
  

    values(
    @Pid,
    @serumBilirubin,
	@serumBilirubinD,
	@serumBilirubinID,
	@serumAsparateAminoTransferase,
	@serumAlanineAminoTransferase,
	@serumTotalProtein,
	@serumAlbumin,
	@serumGlubulin,
	@AGRation,
	@serumAlkalinePhosphatse,
	@DoctorName,
	@Designation,
	@Qualification,
	'2',
    @CreatedBy,
    GetDate(),
    @UpdatedBy,
    Getdate())
  
End 
GO
/****** Object:  StoredProcedure [dbo].[AddNewComputerBloodPictureReportDetails]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNewComputerBloodPictureReportDetails]  
(  
   @Pid int,      
   @Haemoglobin varchar (50),
   @ErythrocyteCount varchar (50),
   @TotalWBCCount varchar(50),
   @Neutrophils varchar(50),
   @Lymphocytes varchar(50),
   @Eosinophils varchar(50),
   @Monocytes varchar(50),
   @Basophils varchar(50),
   @Rbcs varchar(50),
   @PlateletCount varchar(50),
   @CreatedBy int,
   @UpdatedBy int
)  
as  
begin  
   Insert into tbl_ComputerBloodPictureReport(pid,
   Haemoglobin,
   ErythrocyteCount,
   TotalWBCCount,
   Neutrophils,
   Lymphocytes,
   Eosinophils,
   Monocytes,
   Basophils,
   Rbcs,
   PlateletCount,
   ReportTypeId,
   CreatedBy,
   CreatedOn,
   UpdatedBy,
   UpdatedOn)

   values(
   @Pid,
   @Haemoglobin,
   @ErythrocyteCount,
   @TotalWBCCount,
   @Neutrophils,
   @Lymphocytes,
   @Eosinophils,
   @Monocytes,
   @Basophils,
   @Rbcs,
   @PlateletCount,
   '3',
   @CreatedBy,
   GetDate(),
   @UpdatedBy,
   Getdate())
   

End 
GO
/****** Object:  StoredProcedure [dbo].[AddNewPatientInfoDetails]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNewPatientInfoDetails]  
(  
   
   
   @Pname varchar (50),
   @Age tinyint,
   @Gender varchar(10),
   @RefDocId int,
   @mobileNo varchar(15),
   @BillNumber varchar(50),
   @CollectedById int,
   @ymd varchar(50),
   @surname varchar(50),
   @Total decimal(18,0),
   @Paid decimal(18,0),
   @Due decimal(18,0),
   @CreatedBy int ,  
   @UpdatedBy int 
  
 
)  
as  
begin 
 declare @Pid int=0, @BillID int =0;
 IF((Select COUNT(*) From tbl_PatientInfo Where mobileNo=@mobileNo)=0)
 BEGIN 
   Insert into tbl_PatientInfo(Pname,Age,Gender,RefDocId,mobileNo,ymd,surname,CreatedBy,CreatedOn,UpdatedBy,UpdatedOn)
    values(@Pname,@Age,@Gender,@RefDocId,@mobileNo, @ymd,@surname,@CreatedBy,getdate(),@UpdatedBy,getdate()) 
   SELECT mobileNo FROM tbl_PatientInfo WHERE mobileNo=@mobileNo
   
   END

   Else
   BEGIn
			Update tbl_PatientInfo set Pname=@Pname,Age=@Age,Gender=@Gender,RefDocId=@RefDocId,mobileNo=@mobileNo,surname=@surname,UpdatedBy=@UpdatedBy,UpdatedOn=getdate()
			WHERE mobileNo=@mobileNo
			print 'pid'
			 print @Pid 
   END

  
 select @Pid=  Pid From tbl_PatientInfo Where mobileNo=@mobileNo
 print 'after update pid'
 print @Pid 
  Insert into tbl_BillingMaster
   (
   Pid,
   CollectedById,
   BillNumber,
   Amount,
   Paid,
   DUE,
   CreatedBy,
   CreatedOn,
   UpdatedBy,  
   UpdatedOn  
   )
   values(
   @Pid,
   @CollectedById,
   @BillNumber,
   @Total,
   @Paid,
   @Due,
   @CreatedBy,
   getdate(),
   @UpdatedBy,  
   getdate()
   )  

    
	select (cast(@Pid as int))
End 


GO
/****** Object:  StoredProcedure [dbo].[AddReportType_Details]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddReportType_Details]  (  @Pid int,   @Date datetime ,     @Pname varchar (50),   @RefByDoc varchar(250),   @ReportType varchar(100))  as  begin    Insert into tbl_ReportType values(@Pid,@ReportType,@Pname,@RefByDoc,@Date)       SELECT @@IDENTITY AS INT   End


GO
/****** Object:  StoredProcedure [dbo].[Doc_Pati_Registration]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Doc_Pati_Registration](@Name varchar(50),@Email varchar(50),@Passward varchar(50),@conformPassward varchar(50))asbegininsert into Doctor_Patient_Registration([Name],	Email,	Passward,	ConformPassward,	CreatedBy,	UpdatedBy)values(@Name,@Email,@Passward,@conformPassward,'','');End


GO
/****** Object:  StoredProcedure [dbo].[GetClinicalBiochemistoryReportLIPIDProfileDetails]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetClinicalBiochemistoryReportLIPIDProfileDetails]    
(
@Pid int,
@ReportId int
)
as    
begin    
   select 
   pt.Pid,
   pt.Pname,
   d.DoctorName,
   pt.Pid as Srno,
   pt.Age,
   pt.Gender,
   d.DoctorName as RefByDoc,
   d.Specilization,
   d.Qualification,
   d.signature,
   
   lpd.hdlCholestrol,
   lpd.LDLCholestrol,
   lpd.VLDLCholestrol,
   lpd.serumTriglyceride,
   lpd.THDL,
   lpd.LDLHDL,
   lpd.titalLipid
   from tbl_ClinicalBiochemistoryReportLIPIDProfile lpd
   inner join tbl_PatientInfo pt on lpd.Pid=pt.Pid
   inner join tbl_Doctor d on d.docid=pt.RefDocId
   left join tbl_UserLogin us on us.CreatedBy=pt.CreatedBy 
   WHERE pt.Pid=@Pid and lpd.ReportId=@ReportId
End


GO
/****** Object:  StoredProcedure [dbo].[GetClinicalBiochemistoryReportLTFDetail]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetClinicalBiochemistoryReportLTFDetail]    
(
 @Pid int
,@ReportId int
)
as    
begin    
   select 
   pt.Pid,
   pt.Pname,
   d.DoctorName,
   pt.Pid as Srno,
   pt.Age,
   pt.Gender,
   d.DoctorName as RefByDoc,
   d.Specilization,
   d.Qualification,
   d.signature,
   ltf.serumBilirubin,
   ltf.serumBilirubinD,
   ltf.serumBilirubinID,
   ltf.serumAsparateAminoTransferase,
   ltf.serumAlanineAminoTransferase,
   ltf.serumTotalProtein,
   ltf.serumAlbumin,
   ltf.serumGlubulin,
   ltf.AGRation,
   ltf.serumAlkalinePhosphatse
   from tbl_ClinicalBiochemistoryReportLTF  ltf
   inner join tbl_PatientInfo pt on ltf.Pid=pt.Pid
   inner join tbl_Doctor d on d.docid=pt.RefDocId
   left join tbl_UserLogin us on us.CreatedBy=pt.CreatedBy 
   inner join tbl_CenterSettings cs on cs.CenterId=us.Center
   WHERE pt.Pid=@Pid and ltf.ReportId=@ReportId
End


GO
/****** Object:  StoredProcedure [dbo].[GetComputerBloodPictureReportDetails]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetComputerBloodPictureReportDetails]    (@Pid int,
@ReportId int)as    begin       select    pt.Pid,   pt.Pname,   d.DoctorName,   pt.Pid as Srno,   pt.Age,   pt.Gender,   d.DoctorName as RefByDoc,   d.Specilization,   d.Qualification,   d.signature,   cb.CreatedOn as date,   Haemoglobin,   ErythrocyteCount,   TotalWBCCount,   Neutrophils,   Lymphocytes,   Eosinophils,   Monocytes,   Basophils,   Rbcs,   PlateletCount    from tbl_ComputerBloodPictureReport  cb   inner join tbl_PatientInfo pt on cb.Pid=pt.Pid   inner join tbl_Doctor d on d.docid=pt.RefDocId   left join tbl_UserLogin us on us.CreatedBy=pt.CreatedBy 
   WHERE pt.Pid=@Pid and cb.ReportId=@ReportIdEnd



GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetEmployees]    
as    
begin    
   select Id as Empid,Name,City,Address from tbl_doc  
End 



GO
/****** Object:  StoredProcedure [dbo].[getReports]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getReports]
@BillId int=null,
@BeginDate nvarchar(50)=NULL,
@EndDate nvarchar(50)=NULL
As
BEGIN 
WITH BillList (BillID,Pname,Amount,Discount,Expenses,ReferalAmount,ShortName,CreatedOn,status,due,DoctorName) as  
  
(  
  
select distinct br.BillId,pt.Pname as PatientName,bm.Amount,bm.Discount,bm.Expenses,bm.ReferalAmount,rt.ShortName,bm.CreatedOn as Date,bm.status,bm.due,dc.DoctorName from dbo.tbl_BillingReport  br
  
left outer join tbl_ReportType  rt
  
on rt.Id=br.ReportId
  
left outer join  
  
tbl_BillingMaster  bm
  
on br.BillId =bm.BilIingId

left outer join  
tbl_PatientInfo pt
on pt.Pid=bm.PId  
left outer join
tbl_Doctor dc
on dc.DocId=pt.RefDocId
   
 where 
   br.BillId= (case when @BillId is null then br.BillId  ELSE  @BillId END)
 and bm.CreatedOn between (case when @BeginDate is null then bm.CreatedOn else @BeginDate END) 
 and (case when @EndDate is null then bm.CreatedOn else @EndDate END)
  or bm.CreatedOn=  DATEADD(day, -15, convert(date,GETDATE())) 

		   
),  
  
AllBillList as(  
  
SELECT  BillID ,Pname as PatientName,Amount,Discount ,Expenses,ReferalAmount,  LEFT(RptList , LEN(RptList)-1) AS ReportName , CreatedOn  as Date ,status,due,DoctorName
  
FROM BillList AS extern  
  
CROSS APPLY  
  
(  
  
SELECT ShortName + ' , '  
  
FROM BillList AS intern  
  
WHERE extern.BillID = intern.BillID  
  
FOR XML PATH('')  
  
)pre_trimmed(RptList)  
  
Group by BillID,Pname,Amount,Discount ,Expenses,ReferalAmount,RptList,CreatedOn,status,due,DoctorName
    
)  
  
  
SELECT  * FROM AllBillList order by 1 desc


		  END


GO
/****** Object:  StoredProcedure [dbo].[getReports_RoleTest]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getReports_RoleTest]
@BillId int=null,
@BeginDate nvarchar(50)=NULL,
@EndDate nvarchar(50)=NULL,
@RoleId int=Null
As
BEGIN 
WITH BillList (BillID,Pname,Amount,Discount,Expenses,ReferalAmount,ShortName,CreatedOn,status,due,DoctorName,ReferalPercentage) as  
  
(  
  
select distinct br.BillId,pt.Pname as PatientName,bm.Amount,bm.Discount,bm.Expenses,bm.ReferalAmount,rt.ShortName,bm.CreatedOn as Date,bm.status,bm.due,dc.DoctorName,bm.ReferalPercentage from dbo.tbl_BillingReport  br
  
left outer join tbl_ReportType  rt
  
on rt.Id=br.ReportId
  
left outer join  
  
tbl_BillingMaster  bm
  
on br.BillId =bm.BilIingId

left outer join  
tbl_PatientInfo pt
on pt.Pid=bm.PId  
left outer join
tbl_Doctor dc
on dc.DocId=pt.RefDocId
  left outer join
tbl_UserLogin usr
on bm.createdby=usr.Id 
 where 
   br.BillId= (case when @BillId is null and @RoleId=1  then br.BillId  ELSE  @BillId END)
 and bm.CreatedOn between (case when @BeginDate is null then bm.CreatedOn else @BeginDate END) 
 and (case when @EndDate is null then bm.CreatedOn else @EndDate END)
  or bm.CreatedOn=  DATEADD(day, -15, convert(date,GETDATE())) 

		   
),  
  
AllBillList as(  
  
SELECT  BillID ,Pname as PatientName,Amount,Discount ,Expenses,ReferalAmount,  LEFT(RptList , LEN(RptList)-1) AS ReportName , CreatedOn  as Date ,status,due,DoctorName,ReferalPercentage
  
FROM BillList AS extern  
  
CROSS APPLY  
  
(  
  
SELECT ShortName + ' , '  
  
FROM BillList AS intern  
  
WHERE extern.BillID = intern.BillID  
  
FOR XML PATH('')  
  
)pre_trimmed(RptList)  
  
Group by BillID,Pname,Amount,Discount ,Expenses,ReferalAmount,RptList,CreatedOn,status,due,DoctorName,ReferalPercentage
    
)  
  
  
SELECT  * FROM AllBillList order by 1 desc


		  END


GO
/****** Object:  StoredProcedure [dbo].[getReports_test]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getReports_test]
@BillId int=null,
@BeginDate nvarchar(50)=NULL,
@EndDate nvarchar(50)=NULL,
@RoleId int=Null
As
BEGIN 
WITH BillList (BillID,Pname,Amount,Paid,Discount,Expenses,ReferalAmount,ShortName,CreatedOn,status,due,DoctorName,ReferalPercentage,BillNumber,age,ymd,surname,gender) as  
  
(  
  
select distinct br.BillId,pt.Pname as PatientName,bm.Amount,bm.paid,bm.Discount,bm.Expenses,bm.ReferalAmount,rt.ShortName,bm.CreatedOn as Date,bm.status,bm.due,dc.DoctorName,bm.ReferalPercentage,bm.BillNumber,pt.Age,pt.YMD,pt.surname,pt.gender from dbo.tbl_BillingReport  br
  
left outer join tbl_ReportType  rt
  
on rt.Id=br.ReportId
  
left outer join  
  
tbl_BillingMaster  bm
  
on br.BillId =bm.BilIingId

left outer join  
tbl_PatientInfo pt
on pt.Pid=bm.PId  
left outer join
tbl_Doctor dc
on dc.DocId=pt.RefDocId
  left outer join
tbl_UserLogin usr
on bm.createdby=usr.Id 
 where 
   br.BillId= (case when @BillId is null and @RoleId=1  then br.BillId  ELSE  @BillId END)
 and bm.CreatedOn between (case when @BeginDate is null or @BeginDate='' then bm.CreatedOn else @BeginDate END) 
 and (case when @EndDate is null  or @EndDate='' then bm.CreatedOn else @EndDate END)
  or bm.CreatedOn=  DATEADD(day, -15, convert(date,GETDATE())) 
  or bm.billnumber=@BillId
		   
),  
  
AllBillList as(  
  
SELECT  BillID ,Pname as PatientName,Amount,Discount,Paid,Expenses,ReferalAmount,  LEFT(RptList , LEN(RptList)-1) AS ReportName , CreatedOn  as Date ,status,due,DoctorName,ReferalPercentage,BillNumber,age,ymd,surname,gender
  
FROM BillList AS extern  
  
CROSS APPLY  
  
(  
  
SELECT ShortName + ' , '  
  
FROM BillList AS intern  
  
WHERE extern.BillID = intern.BillID  
  
FOR XML PATH('')  
  
)pre_trimmed(RptList)  
  
Group by BillID,Pname,Amount,Discount,Paid,Expenses,ReferalAmount,RptList,CreatedOn,status,due,DoctorName,ReferalPercentage,BillNumber,age,ymd,surname,gender
    
)  
  
  
SELECT  * FROM AllBillList order by 1 desc


		  END


GO
/****** Object:  StoredProcedure [dbo].[getReportsByBillAndCreatedDate]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getReportsByBillAndCreatedDate]
@BilIingId int=null,
@BeginDate nvarchar(50)=NULL,
@EndDate nvarchar(50)=NULL
As
BEGIN 
SELECT D.BilIingId, 
D.Amount,
D.Discount,
D.Expenses,
D.DUE,
D.ReferalAmount,
D.CreatedOn as Date,
c.pid,
c.pName,
 X.ReportList FROM    
tbl_patientinfo C
inner Join tbl_BillingMaster D on d.PId=c.Pid 

CROSS APPLY    
(    
SELECT STUFF    
            (    
                (    
                    SELECT ',' +e.shortname FROM dbo.tbl_BillingReport AS P      
  INNER JOIN dbo.tbl_BillingMaster AS CP ON P.BillId=CP.BilIingId  
  Inner Join tbl_ReportType e on e.Id=P.ReportId
                    WHERE CP.PId=C.Pid    
                    FOR XML PATH('')    
                )        
            ,1,1,'') as ReportList    
) as X

		 where  (D.BilIingId=@BilIingId or D.createdOn BETWEEN @BeginDate and  @EndDate )
		    or 
		    (@BilIingId is null and    @BeginDate is null and  @EndDate is null )

		  END

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteReportById]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DeleteReportById]

@Rid int
AS
BEGIN
	Delete from tbl_ReportType where Id=@Rid;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getLogin]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_getLogin]  (  @Email varchar(50),  @Passward varchar(50)  )  as  declare @Cnt int;  begin  if exists(select * from tbl_UserLogin where Email=@Email and Passward=@Passward)   begin   select * from tbl_UserLogin where Email=@Email and Passward=@Passward end  else   begin   set @Cnt=0;   end   select @Cnt;End




GO
/****** Object:  StoredProcedure [dbo].[sp_getReports]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getReports]
As
BEGIN
SELECT 
r.id,
r.ReportType,
r.ShortName,
r.Description,
r.createdBy,
r.UpdatedBy,
createdlogin.Name as CreatedName,upldatedlogin.Name as UpdatedName
From tbl_ReportType r

inner join tbl_UserLogin createdlogin
on createdlogin.id=r.CreatedBy
inner join tbl_UserLogin upldatedlogin
on upldatedlogin.id=r.UpdatedBy



END
GO
/****** Object:  StoredProcedure [dbo].[sp_ReferDoctorById]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ReferDoctorById] @Rid int  AS   BEGIN  SELECT *  FROM [SUNDIGNOSTIC].[dbo].tbl_Doctor     where DocId=@Rid  END
GO
/****** Object:  StoredProcedure [dbo].[sp_ReportById]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ReportById]
@Rid int
AS
BEGIN
	Select * from tbl_ReportType where Id=@Rid;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_SaveReport]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SaveReport]
@RName varchar(max),
@ShortName varchar(max),
@Description nvarchar(max),
@CreatedBy int,
@UpdatedBy int
As
BEGIN
INSERT INTO tbl_ReportType(ReportType,ShortName,Description,Createdby,CreatedOn,UpdatedBy,UpdatedOn) Values(@RName,@ShortName,@Description,@CreatedBy,GETDATE(),@UpdatedBy,GetDate()) 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateReferDoctorById]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_UpdateReferDoctorById]@DocId int,@DoctorName varchar(50),@UpdatedBy intAsBEGINUPDATE tbl_Doctor set DoctorName=@DoctorName,UpdatedOn=GetDate(),UpdatedBy=@UpdatedBywhere DocId=@DocIdEND

GO
/****** Object:  StoredProcedure [dbo].[usp_AddService]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AddService]@DDLVALUE varchar(50),@STRINGVALUE varchar(500)	ASBEGIN Declare @Query varchar(max) set @Query=' select ServiceNo,ServiceName,OP,LDSL,Method,	Sample,Schedule,CutOfTime,TAT,Vacutainer from tbl_Service where '+@DDLVALUE+'='''+cast(@STRINGVALUE as varchar(100))+'''' 		 Execute(@Query)	   print @QueryEND
GO
/****** Object:  StoredProcedure [dbo].[usp_getAllReportsByPatientId]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getAllReportsByPatientId](@Pid int)AS BEGINSELECTbm.Pid,pat.Pname as PatientName,br.ReportId,rpt.ReportType as Name,br.ReportId,br.BillId,br.CreatedOn,br.UpdatedOn,br.CreatedBy,br.UpdatedBy,createdlogin.Name as CreatedName,upldatedlogin.Name as UpdatedNameFROM tbl_BillingReport br inner join tbl_ReportType rpt on br.ReportId= rpt.idinner join tbl_BillingMaster bmon bm.BilIingId=br.BillId
inner join tbl_UserLogin createdlogin
on createdlogin.id=br.CreatedBy
inner join tbl_UserLogin upldatedlogin
on upldatedlogin.id=br.UpdatedBy
left join tbl_PatientInfo pat
on bm.PId=pat.pid
where bm.PId=@Pid order by br.UpdatedBy
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getBillingTransactByBillId]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE  PROCEDURE   [dbo].[usp_getBillingTransactByBillId]
@BillId int
AS
BEGIN
SELECT  
       bill.BillId 
      ,bill.PId 
      ,bill.ReportId 
      ,bill.Amount 
      ,bill.Discount 
      ,bill.Expenses 
      ,bill.ReferalAmount
      ,bill.ReferalAmount
	  ,bill.due 
	  ,Rptype.id 
	  ,Rptype.ShortName  as ReportName
	  ,pat.Pname  as PatientName
      ,bill.Status 
      ,bill.CreatedBy
      ,bill.UpdatedBy
      ,bill.CreatedOn
      ,bill.UpdatedOn
  FROM [SUNDIGNOSTIC].[dbo].[tbl_BillingTransaction] bill
  INNER JOIN 
   tbl_ReportType  Rptype
   on Rptype.Id=bill.ReportId
    INNER JOIN 
   tbl_PatientInfo  pat
   on pat.Pid=bill.PId
  WHERE BillId=@BillId
  END
GO
/****** Object:  StoredProcedure [dbo].[usp_getCenter]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getCenter]
AS
BEGIN
SELECT * FROM tbl_CenterSettings
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getCollectedById]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[usp_getCollectedById]
  @CollectedById int
  AS
  BEGIN
  SELECT * FROM tbl_Collected WHERE CollectedById=@CollectedById
  END
GO
/****** Object:  StoredProcedure [dbo].[usp_getPatientByBillStatus]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[usp_getPatientByBillStatus]
  As
  BEGIN
  select Distinct p.PId,p.PName from [tbl_PatientInfo] p
  inner join tbl_billingtransaction b
  on p.pid=b.pid
  where b.status=0
  END
GO
/****** Object:  StoredProcedure [dbo].[usp_getPatientById]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create PROCEDURE [dbo].[usp_getPatientById](
  @Pid int)
  As
  BEGIN
  select * from [tbl_PatientInfo]   where Pid=@Pid
  
  END
GO
/****** Object:  StoredProcedure [dbo].[usp_getReferDoc]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_getReferDoc] --@DocId int  AS   BEGIN  SELECT   d.DocId,  d.DoctorName,  d.createdOn,  d.UpdatedOn,  usrcreated.Name as CreatedName,  usrupdated.Name as UpdatedName  FROM [SUNDIGNOSTIC].[dbo].tbl_Doctor d   inner join   tbl_UserLogin usrcreated  on d.createdBy=usrcreated.id  inner join   tbl_UserLogin usrupdated  on d.updatedBy=usrupdated.id    --where DocId=@DocId  END

GO
/****** Object:  StoredProcedure [dbo].[usp_getReportsByBill]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getReportsByBill]
@BilIingId int=null,
@BeginDate nvarchar(50)=NULL,
@EndDate nvarchar(50)=NULL
As
BEGIN
Declare @SQL  varchar(max);
Declare @Where  varchar(max);
IF(@BilIingId IS NOT NULL)
BEGIN

set @Where='where bm.BilIingId='+@BilIingId
 print @Where
END
ELSE IF(@BeginDate IS NOT NULL and @EndDate IS NOT NULL )
BEGIN
set @Where='where bm.createdOn BETWEEN '''+@BeginDate+''' and '''+ @EndDate+''''
END
ELSE  
BEGIN
set @Where=''
END
set @SQL='SELECT 
    pat.PId,
    pat.Pname as PatientName,
    bm.BilIingId as BillId,
    bm.Amount,
	bm.Discount, 
	bm.Expenses,
	bm.ReferalAmount,
	bm.DUE,
	bm.Status,
	bm.createdOn as Date,
   STUFF((SELECT '', '' +rt.ShortName  
          FROM tbl_ReportType  Rt 
          inner join 
		  tbl_BillingReport br
		  on Rt.Id=br.ReportId
      ORDER BY rt.ReportType
           FOR XML PATH('''')), 1, 1, '''') Investigation
FROM   tbl_BillingMaster bm 
INNER Join tbl_PatientInfo pat
on bm.PId=pat.PId '+@Where+'

GROUP BY 
bm.BilIingId,
bm.Amount,
bm.Discount, 
bm.Expenses,
bm.ReferalAmount,
bm.DUE,
bm.Status,
 pat.PId,
 pat.Pname,
 bm.createdOn'
  print @Sql;
 exec(@Sql)
 END


GO
/****** Object:  StoredProcedure [dbo].[usp_getReportsByBill_old]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[usp_getReportsByBill_old]
@MobileNumber int=Null
As
BEGIN
SELECT 
    pat.PId,
    pat.Pname,
    bm.BilIingId,
    bm.Amount,
	bm.Discount, 
	bm.Expenses,
	bm.ReferalAmount,
	bm.DUE,
	bm.Status,
	bm.createdOn as CreatedDate,
   STUFF((SELECT ', ' +rt.ReportType  
          FROM tbl_ReportType  Rt 
          inner join 
		  tbl_BillingReport br
		  on br.ReportId=Rt.Id
      ORDER BY rt.ReportType
           FOR XML PATH('')), 1, 1, '') Investigation
FROM   tbl_BillingMaster bm 
INNER Join tbl_PatientInfo pat
on bm.PId=pat.PId
 where pat.MobileNo=@MobileNumber or pat.MobileNo=''
GROUP BY 
bm.BilIingId,
bm.Amount,
bm.Discount, 
bm.Expenses,
bm.ReferalAmount,
bm.DUE,
bm.Status,
 pat.PId,
 pat.Pname,
 bm.createdOn
 END 
   
GO
/****** Object:  StoredProcedure [dbo].[usp_getServiceDetails]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_getServiceDetails]asBeginSelect *from tbl_serviceEnd

GO
/****** Object:  StoredProcedure [dbo].[usp_GetServiceDetailsByColumnNames]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetServiceDetailsByColumnNames]@DDLVALUE varchar(50),@STRINGVALUE varchar(500)	ASBEGIN BEGIN TRY Declare @Query varchar(max) BEGIN set @Query=' select ServiceNo,ServiceName,ShortName,OP,LDSL,Method,	Sample,Schedule,CutOfTime,TAT,Vacutainer from tbl_Service where '+@DDLVALUE+'='''+cast(@STRINGVALUE as varchar(100))+'''' 		 Execute(@Query)	   print @QueryEND
END TRY BEGIN  CATCH
  declare @ErrorMessage Nvarchar(4000);
  declare @ErrorSeverity INT;
  declare @ErrorState INT;

  SELECT @ErrorMessage =Error_MESSAGE() ,@ErrorSeverity=Error_SEVERITY(),@ErrorState=ERROR_STATE();
  raiserror (@ErrorMessage,@ErrorSeverity,@ErrorState)
  END CATCH;
  END
GO
/****** Object:  StoredProcedure [dbo].[usp_getUserLogin]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getUserLogin](@Name varchar(50),@Email varchar(50),@Passward varchar(50),@RoleId int,@Status bit,@CenterId int)AsBegininsert into tbl_UserLogin    ([Name],	Email,	Passward,	RoleId,	Status,	Center,	CreatedOn,	UpdatedOn)	values	(@Name,	 @Email,	 @Passward,	 @RoleId,	 @Status,	 @CenterId,	 GETDATE(),	 GETDATE()	 )		 End

GO
/****** Object:  StoredProcedure [dbo].[USP_Ins_Update_Services]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_Ins_Update_Services] (@serviceNo int=null,@serviceName varchar(600),@shortName varchar(100),@op int,@ldsl int, @method Varchar(500),@sample Varchar(500),@schedule Varchar(500),@cutOfTime varchar(50),@tat varchar(50),@vacutainer varchar(500))ASBEGINif not exists (select ServiceNo from  [dbo].[tbl_Service]  where ServiceNo=@serviceNo)begininsert into [dbo].[tbl_Service](ServiceName,shortName,OP,LDSL,Method,Sample,Schedule,CutOfTime,TAT,Vacutainer) values(@serviceName,@shortName,@op,@ldsl,@method,@sample,@schedule,@cutOfTime,@tat,@vacutainer);select @@identity as intend  else  update [dbo].[tbl_Service] set ServiceName=@serviceName,ShortName=@shortName,OP=@op,LDSL=@ldsl,Method=@method,      Sample=@sample,Schedule=@schedule,CutOfTime=@cutOfTime, TAT=@tat,Vacutainer=@vacutainer where ServiceNo=@serviceNo;select @serviceNo as intEND

GO
/****** Object:  StoredProcedure [dbo].[usp_PrintReport]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_PrintReport]    (@Pid int,@ReportId int,@BillId int)as    begin       select    pt.Pid,   pt.Pname,    pt.surname as SurName,  d.DoctorName,   pt.Pid as Srno,   pt.Age,   pt.YMD,   pt.Gender,   d.DoctorName as RefByDoc,   br.Description,   bm.BillNumber,    br.BillId,br.ReportId,br.createdon,   bm.CollectedById as CollectedBy,  ('ADC'+'/'+convert(varchar, getdate(), 112)+'/'+  cast((CASE LEN(bm.BilIingId) WHEN 0 THEN '000'   WHEN 1 THEN '00'+bm.BilIingId   WHEN 2 THEN '0'+bm.BilIingId    WHEN 3 THEN bm.BilIingId else bm.BilIingId END) as varchar)) as BillingID       FROM tbl_BillingReport br   inner join tbl_BillingMaster bm on bm.BilIingId=br.BillId   inner join tbl_PatientInfo pt on bm.Pid=pt.Pid left join tbl_Doctor d on d.docid=pt.RefDocIdinner join tbl_UserLogin us on us.id=pt.CreatedBy    WHERE pt.Pid=@Pid    and br.ReportId=@ReportId	 and br.BillId=@BillIdEnd
GO
/****** Object:  StoredProcedure [dbo].[usp_ServiceColumnName]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ServiceColumnName] 	ASBEGIN	SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNSWHERE TABLE_NAME = 'tbl_Service'ORDER BY ORDINAL_POSITIONEND
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateBilling]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_UpdateBilling]
@BillId int,
@Amount decimal(18,2),
@Discount decimal(18,2),
@Expenses decimal(18,2),
@ReferalAmount decimal(18,2),
@ReferalPercentage decimal(18,2),
@Status bit,
@DUE decimal(18,2),
@UpdatedBy int
As
BEGIN
UPDATE [dbo].[tbl_BillingMaster] set 
Amount=@Amount,
Discount=@Discount,
Expenses=@Expenses,
ReferalAmount=@ReferalAmount,
ReferalPercentage=@ReferalPercentage,
Due=@DUE,
status=@Status,
UpdatedOn=GetDate(),
UpdatedBy=@UpdatedBy
where BilIingId=@BillId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateBillingFromPatientScreen]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_UpdateBillingFromPatientScreen]
@BillId int,
@Amount decimal(18,2),
@Discount decimal(18,2),
@Paid decimal(18,2),
@DUE decimal(18,2),
@UpdatedBy int
As
BEGIN
UPDATE [dbo].[tbl_BillingMaster] set 
Amount=@Amount,
Discount=@Discount,
Due=@DUE,
Paid=@Paid,
UpdatedOn=GetDate(),
UpdatedBy=@UpdatedBy
where BilIingId=@BillId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateCollectedByName]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[usp_UpdateCollectedByName]
 (
  @CollectedById int,
  @CollectedByName varchar(50),
  @UpdatedBy int)
  As
  BEGIN
  Update tbl_Collected set CollectedByName=@CollectedByName,UpdatedBy=@UpdatedBy,UpdatedOn=getdate() where CollectedById=@CollectedById
  END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatePrintReportById]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE Procedure [dbo].[usp_UpdatePrintReportById]
 @BillID int,
 @RptID int,
 @Description nvarchar(max),
 @UpdatedBy int

  As
  BEGIN
  Update  [dbo].[tbl_BillingReport]
  set  
      [Description]=@Description,updatedBy=@UpdatedBy,updatedOn=getdate()

	  where [BillId]= @BillID
       and [ReportId]=@RptID

  END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateReportById]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_UpdateReportById](@Rid int,@RName varchar(50),@Description nvarchar(MAX),@ShortName nvarchar(MAX),@UpdatedBy int,@UpdatedOn datetime)AsBeginupdate tbl_ReportType set ReportType=@RName, Description=@Description, ShortName=@ShortName, UpdatedBy=@UpdatedBy ,UpdatedOn=@UpdatedOn  where Id=@Ridend

GO
/****** Object:  StoredProcedure [dbo].[uspAddDoctor]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspAddDoctor] @DoctorName varchar(200),@CreatedBy int,@UpdatedBy int ASBEGIN	INSERT INTO  tbl_Doctor(DoctorName,	CreatedBy,	UpdatedBy,	CreatedOn,	UpdatedOn)	 values(	 @DoctorName,	 @CreatedBy,	 @UpdatedBy,	 GetDate(),	 GetDate())END

GO
/****** Object:  StoredProcedure [dbo].[uspGetCollectedByList]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetCollectedByList]  AS  BEGIN   -- SET NOCOUNT ON added to prevent extra result sets from   -- interfering with SELECT statements.   SET NOCOUNT ON;        -- Insert statements for procedure here   SELECT * FROM tbl_Collected END  

GO
/****** Object:  StoredProcedure [dbo].[uspGetDashborad]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[uspGetDashborad]
(
@Name_Mobile varchar(50)
)
AS 
BEGIN
Select distinct p.pid,p.pname,p.surname,p.age,p.refDocId,p.gender,p.mobileNo,p.ymd,p.createdOn,p.Createdby,p.updatedOn,p.UpdatedBy From tbl_PatientInfo p
inner join tbl_BillingMaster bm
on p.Pid=bm.pid
WHERE p.Pname=@Name_Mobile OR p.mobileNo=@Name_Mobile or bm.BillNumber=@Name_Mobile
order by  p.CREATEDON desc
END

 
GO
/****** Object:  StoredProcedure [dbo].[uspGetDoctotList]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetDoctotList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM tbl_Doctor
END


GO
/****** Object:  StoredProcedure [dbo].[uspInsertCollectedByName]    Script Date: 23-12-2021 07:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspInsertCollectedByName]
 (
  @CollectedByName varchar(50),
  @CreatedBy int,
  @UpdatedBy int)
  As
  BEGIN
  INSERT INTO tbl_Collected(CollectedByName,CreatedBy,CreatedOn,UpdatedBy,UpdatedOn) Values(@CollectedByName,@CreatedBy,GetDate(),@UpdatedBy,Getdate())
  END
GO
USE [master]
GO
ALTER DATABASE [SUNDIGNOSTIC] SET  READ_WRITE 
GO
