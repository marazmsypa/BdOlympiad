USE [master]
GO
/****** Object:  Database [TransportSystemDataBase]    Script Date: 15.12.2022 1:14:22 ******/
CREATE DATABASE [TransportSystemDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TransportSystemDataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TransportSystemDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TransportSystemDataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TransportSystemDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TransportSystemDataBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TransportSystemDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TransportSystemDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TransportSystemDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TransportSystemDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TransportSystemDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TransportSystemDataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET RECOVERY FULL 
GO
ALTER DATABASE [TransportSystemDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [TransportSystemDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TransportSystemDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TransportSystemDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TransportSystemDataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TransportSystemDataBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TransportSystemDataBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TransportSystemDataBase', N'ON'
GO
ALTER DATABASE [TransportSystemDataBase] SET QUERY_STORE = OFF
GO
USE [TransportSystemDataBase]
GO
/****** Object:  User [SimpleUser]    Script Date: 15.12.2022 1:14:23 ******/
CREATE USER [SimpleUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [SuperAdmin]    Script Date: 15.12.2022 1:14:23 ******/
CREATE ROLE [SuperAdmin]
GO
/****** Object:  DatabaseRole [RouteManager]    Script Date: 15.12.2022 1:14:23 ******/
CREATE ROLE [RouteManager]
GO
/****** Object:  DatabaseRole [role_name]    Script Date: 15.12.2022 1:14:23 ******/
CREATE ROLE [role_name]
GO
/****** Object:  DatabaseRole [Operator]    Script Date: 15.12.2022 1:14:23 ******/
CREATE ROLE [Operator]
GO
/****** Object:  DatabaseRole [Admin]    Script Date: 15.12.2022 1:14:23 ******/
CREATE ROLE [Admin]
GO
ALTER ROLE [Admin] ADD MEMBER [SimpleUser]
GO
/****** Object:  Schema [Admin]    Script Date: 15.12.2022 1:14:23 ******/
CREATE SCHEMA [Admin]
GO
/****** Object:  Schema [Operator]    Script Date: 15.12.2022 1:14:23 ******/
CREATE SCHEMA [Operator]
GO
/****** Object:  Schema [SuperAdmin]    Script Date: 15.12.2022 1:14:23 ******/
CREATE SCHEMA [SuperAdmin]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 15.12.2022 1:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[RouteId] [int] NOT NULL,
	[RouteNumber] [int] NULL,
	[RouteTime] [time](2) NULL,
	[CarrierId] [int] NULL,
	[TransportTypeId] [int] NULL,
	[ActiveDaysId] [int] NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED 
(
	[RouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportShedule]    Script Date: 15.12.2022 1:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportShedule](
	[TransportSheduleId] [int] NOT NULL,
	[DriverId] [int] NULL,
	[ControllerId] [int] NULL,
	[WorkStartTime] [time](2) NULL,
	[WorkEndTime] [time](2) NULL,
	[WorkDate] [date] NULL,
	[RouteId] [int] NULL,
 CONSTRAINT [PK_TransportShedule] PRIMARY KEY CLUSTERED 
(
	[TransportSheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SheduleChanges]    Script Date: 15.12.2022 1:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SheduleChanges](
	[SheduleChangeId] [int] NOT NULL,
	[SheduleId] [int] NULL,
	[NewStartTime] [time](2) NULL,
	[NewEndTime] [time](2) NULL,
	[NewWorkDate] [date] NULL,
	[ChangeReason] [nvarchar](200) NULL,
	[IsDeclined] [bit] NULL,
 CONSTRAINT [PK_SheduleChanges] PRIMARY KEY CLUSTERED 
(
	[SheduleChangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[СanceledShedules]    Script Date: 15.12.2022 1:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[СanceledShedules] as 
select Routes.RouteNumber, TransportShedule.WorkStartTime, 
TransportShedule.WorkEndTime, TransportShedule.WorkDate, SheduleChanges.NewStartTime, SheduleChanges.NewEndTime, SheduleChanges.NewWorkDate,
SheduleChanges.ChangeReason from TransportShedule
left join Routes on TransportShedule.RouteId = Routes.RouteId
left join SheduleChanges on SheduleChanges.SheduleId = TransportShedule.TransportSheduleId
where SheduleChanges.IsDeclined = 1;
GO
/****** Object:  Table [dbo].[Carriers]    Script Date: 15.12.2022 1:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carriers](
	[CarrierId] [int] NOT NULL,
	[CarrierName] [nvarchar](50) NULL,
	[CarierUrAdr] [nvarchar](100) NULL,
 CONSTRAINT [PK_Carriers] PRIMARY KEY CLUSTERED 
(
	[CarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Controllers]    Script Date: 15.12.2022 1:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Controllers](
	[ControllerId] [int] NOT NULL,
	[StaffId] [int] NULL,
 CONSTRAINT [PK_Controllers] PRIMARY KEY CLUSTERED 
(
	[ControllerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 15.12.2022 1:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[DriverId] [int] NOT NULL,
	[StaffId] [int] NULL,
 CONSTRAINT [PK_Drivers] PRIMARY KEY CLUSTERED 
(
	[DriverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoutesDays]    Script Date: 15.12.2022 1:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoutesDays](
	[RouteDaysId] [int] NOT NULL,
	[RouteDaysName] [nvarchar](50) NULL,
 CONSTRAINT [PK_RoutesDays] PRIMARY KEY CLUSTERED 
(
	[RouteDaysId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoutesStations]    Script Date: 15.12.2022 1:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoutesStations](
	[RoutesStationsId] [int] NOT NULL,
	[RouteId] [int] NULL,
	[StationId] [int] NULL,
	[StationInRoute] [int] NULL,
 CONSTRAINT [PK_RoutesStations] PRIMARY KEY CLUSTERED 
(
	[RoutesStationsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffInfo]    Script Date: 15.12.2022 1:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffInfo](
	[TransportStaffId] [int] NOT NULL,
	[StaffName] [nvarchar](50) NULL,
	[StaffSurname] [nvarchar](50) NULL,
	[StaffPatronymic] [nvarchar](50) NULL,
	[StaffDateOfBirth] [date] NULL,
	[CarierId] [int] NULL,
 CONSTRAINT [PK_StaffInfo] PRIMARY KEY CLUSTERED 
(
	[TransportStaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stations]    Script Date: 15.12.2022 1:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stations](
	[StationId] [int] NOT NULL,
	[StationName] [nvarchar](50) NULL,
	[StationLocation] [nvarchar](50) NULL,
	[StationPavilion] [bit] NULL,
	[PreviousStationDistanse] [nvarchar](50) NULL,
	[PreviousStationTime] [time](2) NULL,
 CONSTRAINT [PK_Stations] PRIMARY KEY CLUSTERED 
(
	[StationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportTypes]    Script Date: 15.12.2022 1:14:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportTypes](
	[TransportTypeId] [int] NOT NULL,
	[TransportTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_TransportTypes] PRIMARY KEY CLUSTERED 
(
	[TransportTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarierUrAdr]) VALUES (1, N'РЖД', N'Г. Екатеринбург, ул. Московская, дом 30, офис 2')
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarierUrAdr]) VALUES (2, N'Авиасейлс', N'Г. Москва, ул. Строителей, дом 30, офис 8')
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarierUrAdr]) VALUES (3, N'Движение', N'Г. Ульяновск, ул. Домовая, дом 30, офис 9')
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarierUrAdr]) VALUES (4, N'Вверх', N'Г. Кировский, ул. Кирова, дом 30, офис 20')
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarierUrAdr]) VALUES (5, N'МосТранс', N'Г. Владимир, ул. Мичурина, дом 30, офис 18')
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarierUrAdr]) VALUES (6, N'ГосАвто', N'Г. Оренбург, ул. Крауля, дом 30, офис 44')
GO
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (1, 2)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (2, 4)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (3, 6)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (4, 8)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (5, 10)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (6, 12)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (7, 14)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (8, 16)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (9, 18)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (10, 20)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (11, 22)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (12, 24)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (13, 26)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (14, 28)
INSERT [dbo].[Controllers] ([ControllerId], [StaffId]) VALUES (15, 30)
GO
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (1, 1)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (2, 3)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (3, 5)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (4, 7)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (5, 9)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (6, 11)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (7, 13)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (8, 15)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (9, 17)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (10, 19)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (11, 21)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (12, 23)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (13, 25)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (14, 27)
INSERT [dbo].[Drivers] ([DriverId], [StaffId]) VALUES (15, 29)
GO
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (1, 23, CAST(N'04:00:00' AS Time), 1, 1, 1)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (2, 34, CAST(N'10:00:00' AS Time), 2, 3, 4)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (3, 54, CAST(N'08:00:00' AS Time), 3, 2, 5)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (4, 3, CAST(N'03:00:00' AS Time), 4, 1, 4)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (5, 12, CAST(N'06:00:00' AS Time), 3, 4, 3)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (6, 4, CAST(N'08:00:00' AS Time), 3, 4, 2)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (7, 56, CAST(N'07:00:00' AS Time), 4, 2, 2)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (8, 32, CAST(N'03:00:00' AS Time), 4, 3, 4)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (9, 19, CAST(N'08:00:00' AS Time), 5, 1, 3)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (10, 11, CAST(N'03:00:00' AS Time), 5, 5, 3)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (11, 67, CAST(N'09:00:00' AS Time), 6, 2, 1)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (12, 22, CAST(N'04:00:00' AS Time), 6, 1, 5)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (13, 1, CAST(N'02:00:00' AS Time), 6, 3, 3)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (14, 15, CAST(N'01:00:00' AS Time), 6, 4, 2)
INSERT [dbo].[Routes] ([RouteId], [RouteNumber], [RouteTime], [CarrierId], [TransportTypeId], [ActiveDaysId]) VALUES (15, 25, CAST(N'12:00:00' AS Time), 6, 2, 1)
GO
INSERT [dbo].[RoutesDays] ([RouteDaysId], [RouteDaysName]) VALUES (1, N'Полная неделя')
INSERT [dbo].[RoutesDays] ([RouteDaysId], [RouteDaysName]) VALUES (2, N'Рабочие дни')
INSERT [dbo].[RoutesDays] ([RouteDaysId], [RouteDaysName]) VALUES (3, N'Выходные дни')
INSERT [dbo].[RoutesDays] ([RouteDaysId], [RouteDaysName]) VALUES (4, N'Понедельник, среда, пятница')
INSERT [dbo].[RoutesDays] ([RouteDaysId], [RouteDaysName]) VALUES (5, N'Вторник, четверг')
GO
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (1, 1, 1, 1)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (2, 1, 2, 2)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (3, 1, 3, 3)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (4, 1, 4, 4)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (5, 2, 2, 1)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (6, 2, 6, 2)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (7, 2, 7, 3)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (8, 2, 8, 4)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (9, 2, 9, 5)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (10, 3, 1, 1)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (11, 3, 4, 2)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (12, 3, 5, 3)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (13, 3, 9, 4)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (14, 4, 1, 1)
INSERT [dbo].[RoutesStations] ([RoutesStationsId], [RouteId], [StationId], [StationInRoute]) VALUES (15, 4, 2, 2)
GO
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (1, 1, CAST(N'10:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'2022-12-18' AS Date), N'Транспорт неисправен', 1)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (2, 2, CAST(N'11:00:00' AS Time), CAST(N'23:00:00' AS Time), CAST(N'2022-12-22' AS Date), N'Кондуктор заболел', 1)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (3, 3, CAST(N'10:00:00' AS Time), CAST(N'23:40:00' AS Time), CAST(N'2022-12-06' AS Date), N'Кондуктор опоздал', 0)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (4, 4, CAST(N'10:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'2022-12-09' AS Date), N'Водитель опоздал', 0)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (5, 5, CAST(N'10:00:00' AS Time), CAST(N'23:00:00' AS Time), CAST(N'2022-12-04' AS Date), N'Водитель опоздал', 0)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (6, 6, CAST(N'10:30:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'2022-12-18' AS Date), N'Водитель заболел', 1)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (7, 7, CAST(N'11:00:00' AS Time), CAST(N'23:40:00' AS Time), CAST(N'2022-12-22' AS Date), N'Водитель опоздал', 0)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (8, 8, CAST(N'10:30:00' AS Time), CAST(N'23:00:00' AS Time), CAST(N'2022-12-18' AS Date), N'Кондуктор опоздал', 0)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (9, 9, CAST(N'10:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'2022-12-05' AS Date), N'Транспорт неисправен', 1)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (10, 10, CAST(N'10:30:00' AS Time), CAST(N'23:40:00' AS Time), CAST(N'2022-12-18' AS Date), N'Транспорт неисправен', 1)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (11, 11, CAST(N'11:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'2022-12-18' AS Date), N'Водитель опоздал', 0)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (12, 12, CAST(N'10:00:00' AS Time), CAST(N'23:40:00' AS Time), CAST(N'2022-12-08' AS Date), N'Транспорт неисправен', 1)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (13, 13, CAST(N'10:30:00' AS Time), CAST(N'23:00:00' AS Time), CAST(N'2022-12-18' AS Date), N'Кондуктор опоздал', 0)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (14, 14, CAST(N'10:30:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'2022-12-23' AS Date), N'Водитель опоздал', 0)
INSERT [dbo].[SheduleChanges] ([SheduleChangeId], [SheduleId], [NewStartTime], [NewEndTime], [NewWorkDate], [ChangeReason], [IsDeclined]) VALUES (15, 15, CAST(N'11:00:00' AS Time), CAST(N'23:40:00' AS Time), CAST(N'2022-12-18' AS Date), N'Водитель заболел', 1)
GO
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (1, N'Анастасия', N'Смирнова', N'Алексеевна', CAST(N'1980-08-20' AS Date), 1)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (2, N'Кирилл', N'Иванов', N'Антонович', CAST(N'1988-04-22' AS Date), 1)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (3, N'Николай', N'Ершов', N'Аркадьевич', CAST(N'1972-02-11' AS Date), 1)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (4, N'Александр', N'Сидоров', N'Богданович', CAST(N'1960-07-13' AS Date), 1)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (5, N'Дарья', N'Соколова', N'Борисовна', CAST(N'1990-12-18' AS Date), 2)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (6, N'Мария', N'Попова', N'Викторовна', CAST(N'1999-06-23' AS Date), 2)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (7, N'Станислав', N'Петров', N'Данилович', CAST(N'1995-09-25' AS Date), 2)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (8, N'Святслав', N'Волков', N'Владимирович', CAST(N'1982-10-01' AS Date), 2)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (9, N'Юрий', N'Голубев', N'Витальевич', CAST(N'1960-11-04' AS Date), 2)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (10, N'Владимир', N'Богданов', N'Антонович', CAST(N'1976-12-08' AS Date), 2)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (11, N'Александр', N'Белов', N'Тарасович', CAST(N'1993-01-11' AS Date), 3)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (12, N'Сергей', N'Беляев', N'Федорович', CAST(N'1998-04-15' AS Date), 3)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (13, N'Егор', N'Телесов', N'Матвеевич', CAST(N'1974-06-16' AS Date), 3)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (14, N'Даниил', N'Орлов', N'Георгиевич', CAST(N'1967-03-17' AS Date), 3)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (15, N'Илья', N'Киселев', N'Григорьевич', CAST(N'1998-02-19' AS Date), 4)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (16, N'Роман', N'Легкий', N'Олегович', CAST(N'1982-06-26' AS Date), 4)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (17, N'Артем', N'Андреев', N'Юрьевич', CAST(N'1975-02-23' AS Date), 4)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (18, N'Юлия', N'Ильина', N'Николаевна', CAST(N'1974-07-28' AS Date), 4)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (19, N'Денис', N'Титов', N'Ильич', CAST(N'1996-01-09' AS Date), 5)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (20, N'Екатерина', N'Кузьмина', N'Евгенеевна', CAST(N'1978-08-14' AS Date), 5)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (21, N'Наталия', N'Боброва', N'Ивановна', CAST(N'1998-11-15' AS Date), 5)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (22, N'Анна', N'Фролова', N'Сергеевна', CAST(N'1954-12-23' AS Date), 5)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (23, N'Даниил', N'Аксенов', N'Васильевич', CAST(N'1997-10-27' AS Date), 6)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (24, N'Владислав', N'Алехин', N'Тимофеевич', CAST(N'1983-03-29' AS Date), 6)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (25, N'Владимир', N'Орехов', N'Владиславович', CAST(N'1982-09-04' AS Date), 6)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (26, N'Дмитрий', N'Евсеев', N'Святославович', CAST(N'1994-04-06' AS Date), 6)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (27, N'Максим', N'Брагин', N'Юрьевич', CAST(N'1997-01-02' AS Date), 6)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (28, N'Олег', N'Зыков', N'Степанович', CAST(N'1993-03-22' AS Date), 6)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (29, N'Макар', N'Авдеев', N'Робертович', CAST(N'1975-07-21' AS Date), 6)
INSERT [dbo].[StaffInfo] ([TransportStaffId], [StaffName], [StaffSurname], [StaffPatronymic], [StaffDateOfBirth], [CarierId]) VALUES (30, N'Никита', N'Князев', N'Петрович', CAST(N'1994-06-23' AS Date), 6)
GO
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (1, N'Вторчермет', N'Ул. Бардина 60082', 1, N'8км', CAST(N'00:40:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (2, N'Сухоложская', N'Ул. Радищева 60054', 1, N'3км', CAST(N'00:30:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (3, N'Братская', N'Ул. Малышева 60345', 1, N'2км', CAST(N'00:25:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (4, N'Завод Рти', N'Ул. Татищева 60098', 0, N'1км', CAST(N'00:30:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (5, N'Рижская', N'Ул. Ленина 60154', 0, N'7км', CAST(N'00:40:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (6, N'Ювелирная', N'Ул. Крауля 60343', 1, N'9км', CAST(N'00:20:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (7, N'Шварца', N'Ул. Березняка 60082', 0, N'4км', CAST(N'00:10:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (8, N'Южная', N'Ул. Строителей 60348', 0, N'4км', CAST(N'00:50:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (9, N'Автовокзал', N'Ул. Трактористов 60476', 0, N'10км', CAST(N'00:50:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (10, N'Фрунзе', N'Ул. Фрунзе 60343', 1, N'5км', CAST(N'01:00:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (11, N'Большакова', N'Ул. Большакова 60347', 1, N'8км', CAST(N'00:40:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (12, N'Декабристов', N'Ул. Декабристов 60583', 0, N'9км', CAST(N'00:40:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (13, N'Цирк', N'Ул. Калинина 60485', 1, N'2км', CAST(N'00:30:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (14, N'Радищева', N'Ул. Радищева 60957', 0, N'1км', CAST(N'00:20:00' AS Time))
INSERT [dbo].[Stations] ([StationId], [StationName], [StationLocation], [StationPavilion], [PreviousStationDistanse], [PreviousStationTime]) VALUES (15, N'Московская', N'Ул. Московская 60487', 1, N'8км', CAST(N'00:23:00' AS Time))
GO
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (1, 1, 1, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'2022-12-05' AS Date), 1)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (2, 3, 3, CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), CAST(N'2022-11-22' AS Date), 2)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (3, 6, 7, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'2022-12-13' AS Date), 3)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (4, 8, 8, CAST(N'08:00:00' AS Time), CAST(N'21:00:00' AS Time), CAST(N'2022-12-05' AS Date), 4)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (5, 2, 2, CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), CAST(N'2022-11-27' AS Date), 1)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (6, 4, 3, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'2022-12-05' AS Date), 2)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (7, 6, 6, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'2022-12-05' AS Date), 3)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (8, 7, 7, CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'2022-12-09' AS Date), 3)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (9, 5, 4, CAST(N'06:00:00' AS Time), CAST(N'21:00:00' AS Time), CAST(N'2022-11-12' AS Date), 2)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (10, 1, 1, CAST(N'07:00:00' AS Time), CAST(N'21:00:00' AS Time), CAST(N'2022-11-17' AS Date), 1)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (11, 9, 9, CAST(N'08:00:00' AS Time), CAST(N'23:00:00' AS Time), CAST(N'2022-12-02' AS Date), 4)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (12, 1, 2, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'2022-12-05' AS Date), 1)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (13, 5, 4, CAST(N'07:00:00' AS Time), CAST(N'21:00:00' AS Time), CAST(N'2022-11-09' AS Date), 2)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (14, 2, 2, CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'2022-12-05' AS Date), 1)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (15, 7, 7, CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), CAST(N'2022-12-10' AS Date), 3)
INSERT [dbo].[TransportShedule] ([TransportSheduleId], [DriverId], [ControllerId], [WorkStartTime], [WorkEndTime], [WorkDate], [RouteId]) VALUES (16, 1, 1, CAST(N'06:00:00' AS Time), CAST(N'20:00:00' AS Time), CAST(N'2022-12-17' AS Date), 1)
GO
INSERT [dbo].[TransportTypes] ([TransportTypeId], [TransportTypeName]) VALUES (1, N'Электропоезд')
INSERT [dbo].[TransportTypes] ([TransportTypeId], [TransportTypeName]) VALUES (2, N'Автобус')
INSERT [dbo].[TransportTypes] ([TransportTypeId], [TransportTypeName]) VALUES (3, N'Трамвай')
INSERT [dbo].[TransportTypes] ([TransportTypeId], [TransportTypeName]) VALUES (4, N'Троллейбус')
INSERT [dbo].[TransportTypes] ([TransportTypeId], [TransportTypeName]) VALUES (5, N'Маршрутное такси')
GO
ALTER TABLE [dbo].[Controllers]  WITH CHECK ADD  CONSTRAINT [FK_Controllers_StaffInfo] FOREIGN KEY([StaffId])
REFERENCES [dbo].[StaffInfo] ([TransportStaffId])
GO
ALTER TABLE [dbo].[Controllers] CHECK CONSTRAINT [FK_Controllers_StaffInfo]
GO
ALTER TABLE [dbo].[Drivers]  WITH CHECK ADD  CONSTRAINT [FK_Drivers_StaffInfo] FOREIGN KEY([StaffId])
REFERENCES [dbo].[StaffInfo] ([TransportStaffId])
GO
ALTER TABLE [dbo].[Drivers] CHECK CONSTRAINT [FK_Drivers_StaffInfo]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Carriers] FOREIGN KEY([CarrierId])
REFERENCES [dbo].[Carriers] ([CarrierId])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Carriers]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_RoutesDays] FOREIGN KEY([ActiveDaysId])
REFERENCES [dbo].[RoutesDays] ([RouteDaysId])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_RoutesDays]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_TransportTypes] FOREIGN KEY([TransportTypeId])
REFERENCES [dbo].[TransportTypes] ([TransportTypeId])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_TransportTypes]
GO
ALTER TABLE [dbo].[RoutesStations]  WITH CHECK ADD  CONSTRAINT [FK_RoutesStations_Routes] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Routes] ([RouteId])
GO
ALTER TABLE [dbo].[RoutesStations] CHECK CONSTRAINT [FK_RoutesStations_Routes]
GO
ALTER TABLE [dbo].[RoutesStations]  WITH CHECK ADD  CONSTRAINT [FK_RoutesStations_Stations] FOREIGN KEY([StationId])
REFERENCES [dbo].[Stations] ([StationId])
GO
ALTER TABLE [dbo].[RoutesStations] CHECK CONSTRAINT [FK_RoutesStations_Stations]
GO
ALTER TABLE [dbo].[SheduleChanges]  WITH CHECK ADD  CONSTRAINT [FK_SheduleChanges_TransportShedule] FOREIGN KEY([SheduleId])
REFERENCES [dbo].[TransportShedule] ([TransportSheduleId])
GO
ALTER TABLE [dbo].[SheduleChanges] CHECK CONSTRAINT [FK_SheduleChanges_TransportShedule]
GO
ALTER TABLE [dbo].[StaffInfo]  WITH CHECK ADD  CONSTRAINT [FK_StaffInfo_Carriers] FOREIGN KEY([CarierId])
REFERENCES [dbo].[Carriers] ([CarrierId])
GO
ALTER TABLE [dbo].[StaffInfo] CHECK CONSTRAINT [FK_StaffInfo_Carriers]
GO
ALTER TABLE [dbo].[TransportShedule]  WITH CHECK ADD  CONSTRAINT [FK_TransportShedule_Controllers] FOREIGN KEY([ControllerId])
REFERENCES [dbo].[Controllers] ([ControllerId])
GO
ALTER TABLE [dbo].[TransportShedule] CHECK CONSTRAINT [FK_TransportShedule_Controllers]
GO
ALTER TABLE [dbo].[TransportShedule]  WITH CHECK ADD  CONSTRAINT [FK_TransportShedule_Drivers] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Drivers] ([DriverId])
GO
ALTER TABLE [dbo].[TransportShedule] CHECK CONSTRAINT [FK_TransportShedule_Drivers]
GO
ALTER TABLE [dbo].[TransportShedule]  WITH CHECK ADD  CONSTRAINT [FK_TransportShedule_Routes] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Routes] ([RouteId])
GO
ALTER TABLE [dbo].[TransportShedule] CHECK CONSTRAINT [FK_TransportShedule_Routes]
GO
USE [master]
GO
ALTER DATABASE [TransportSystemDataBase] SET  READ_WRITE 
GO
