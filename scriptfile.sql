USE [master]
GO
/****** Object:  Database [Dormitory]    Script Date: 19.03.2025 0:54:52 ******/
CREATE DATABASE [Dormitory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dormitory', FILENAME = N'I:\SQLServer\MSSQL16.MSSQLSERVER\MSSQL\DATA\Dormitory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Dormitory_log', FILENAME = N'I:\SQLServer\MSSQL16.MSSQLSERVER\MSSQL\DATA\Dormitory_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Dormitory] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dormitory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dormitory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dormitory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dormitory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dormitory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dormitory] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dormitory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dormitory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dormitory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dormitory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dormitory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dormitory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dormitory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dormitory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dormitory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dormitory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dormitory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dormitory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dormitory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dormitory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dormitory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dormitory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dormitory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dormitory] SET RECOVERY FULL 
GO
ALTER DATABASE [Dormitory] SET  MULTI_USER 
GO
ALTER DATABASE [Dormitory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dormitory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dormitory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dormitory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Dormitory] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Dormitory] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Dormitory', N'ON'
GO
ALTER DATABASE [Dormitory] SET QUERY_STORE = ON
GO
ALTER DATABASE [Dormitory] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Dormitory]
GO
/****** Object:  Table [dbo].[Акт_решения_проблемы]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Акт_решения_проблемы](
	[Номер_акта] [int] NOT NULL,
	[Дата_акта] [date] NOT NULL,
	[Номер_заявки] [int] NULL,
	[Описание] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_акта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[График_дежурства_сотрудников]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[График_дежурства_сотрудников](
	[Номер_записи] [int] NOT NULL,
	[Дата_начала] [date] NOT NULL,
	[Дата_окончания] [date] NOT NULL,
	[Примечание] [text] NULL,
	[Код_сотрудника] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_записи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Должности]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должности](
	[Код_должности] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_должности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Журнал_задержек_решения]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Журнал_задержек_решения](
	[Номер_записи] [int] NOT NULL,
	[Дата_записи] [date] NOT NULL,
	[Срок_задержки] [int] NULL,
	[Код_причины] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_записи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Журнал_нарушений]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Журнал_нарушений](
	[Номер_нарушения] [int] NOT NULL,
	[Дата_нарушения] [date] NOT NULL,
	[Описание] [text] NULL,
	[Место_нарушения] [varchar](200) NULL,
	[Код_студента] [int] NULL,
	[Код_типа_нарушения] [int] NULL,
	[Код_источника] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_нарушения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявки_на_ремонт]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявки_на_ремонт](
	[Номер_заявки_на_ремонт] [int] NOT NULL,
	[Дата_заявки] [date] NOT NULL,
	[Описание] [text] NULL,
	[Номер_заявки] [int] NULL,
	[Код_типа_ремонта] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_заявки_на_ремонт] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявки_на_устранения_проблемы]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявки_на_устранения_проблемы](
	[Номер_заявки] [int] NOT NULL,
	[Дата_заявки] [date] NOT NULL,
	[Срок_устранения] [date] NULL,
	[Примечание] [text] NULL,
	[Номер_нарушения] [int] NULL,
	[Код_статуса] [int] NULL,
	[Код_уровня] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Источники_жалоб]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Источники_жалоб](
	[Код_источника] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_источника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Комнаты]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Комнаты](
	[Номер_комнаты] [varchar](20) NOT NULL,
	[Наименование] [varchar](50) NULL,
	[Этаж] [int] NOT NULL,
	[Код_общежития] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_комнаты] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Назначение_сотрудников]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Назначение_сотрудников](
	[Номер_назначения] [int] NOT NULL,
	[Номер_заявки] [int] NULL,
	[Код_сотрудника] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_назначения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Общежития]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Общежития](
	[Код_общежития] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
	[Адрес] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_общежития] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Оплаты_студентов]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оплаты_студентов](
	[Номер_оплаты] [int] NOT NULL,
	[Дата_оплаты] [date] NOT NULL,
	[Сумма_оплаты] [decimal](10, 2) NOT NULL,
	[Код_студента] [int] NULL,
	[Номер_нарушения] [int] NULL,
	[Код_типа] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_оплаты] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Причины_задержки]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Причины_задержки](
	[Код_причины] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_причины] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники_общежития]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники_общежития](
	[Код_сотрудника] [int] NOT NULL,
	[ФИО] [varchar](150) NOT NULL,
	[Телефон] [varchar](20) NULL,
	[Код_должности] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Справка_об_отмене_заявки]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Справка_об_отмене_заявки](
	[Номер_справки] [int] NOT NULL,
	[Дата_справки] [date] NOT NULL,
	[Описание] [text] NULL,
	[Номер_заявки] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_справки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Справки_о_результате_ремонта]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Справки_о_результате_ремонта](
	[Номер_справки] [int] NOT NULL,
	[Дата_справки] [date] NOT NULL,
	[Результат_ремонта] [text] NULL,
	[Стоимость] [decimal](10, 2) NULL,
	[Примечание] [text] NULL,
	[Номер_заявки_на_ремонт] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_справки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статусы_заявок]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статусы_заявок](
	[Код_статуса] [int] NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_статуса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Студенты]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Студенты](
	[Код_студента] [int] NOT NULL,
	[ФИО] [varchar](150) NOT NULL,
	[Телефон] [varchar](20) NULL,
	[Номер_комнаты] [varchar](20) NULL,
	[Код_факультета] [int] NULL,
	[Код_формы] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_студента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип_ремонта]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип_ремонта](
	[Код_типа_ремонта] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_типа_ремонта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Типы_нарушений]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Типы_нарушений](
	[Код_типа_нарушения] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
	[Код_типа_проблемы] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_типа_нарушения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Типы_платежей]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Типы_платежей](
	[Код_типа] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_типа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Типы_проблем]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Типы_проблем](
	[Код_типа_проблемы] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_типа_проблемы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Уровни_срочности]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Уровни_срочности](
	[Код_уровня] [int] NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_уровня] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Факультеты]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Факультеты](
	[Код_факультета] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_факультета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Формы_обучения]    Script Date: 19.03.2025 0:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Формы_обучения](
	[Код_формы_обучения] [int] NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_формы_обучения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Акт_решения_проблемы] ([Номер_акта], [Дата_акта], [Номер_заявки], [Описание]) VALUES (1, CAST(N'2025-01-17' AS Date), 1, N'Мусор убран')
INSERT [dbo].[Акт_решения_проблемы] ([Номер_акта], [Дата_акта], [Номер_заявки], [Описание]) VALUES (2, CAST(N'2025-01-22' AS Date), 2, N'Стул заменен')
INSERT [dbo].[Акт_решения_проблемы] ([Номер_акта], [Дата_акта], [Номер_заявки], [Описание]) VALUES (3, CAST(N'2025-01-27' AS Date), 3, N'Шум устранен')
INSERT [dbo].[Акт_решения_проблемы] ([Номер_акта], [Дата_акта], [Номер_заявки], [Описание]) VALUES (4, CAST(N'2025-02-01' AS Date), 4, N'Оплата получена')
INSERT [dbo].[Акт_решения_проблемы] ([Номер_акта], [Дата_акта], [Номер_заявки], [Описание]) VALUES (5, CAST(N'2025-02-08' AS Date), 5, N'Нарушение устранено')
INSERT [dbo].[Акт_решения_проблемы] ([Номер_акта], [Дата_акта], [Номер_заявки], [Описание]) VALUES (6, CAST(N'2025-02-13' AS Date), 6, N'Окно заменено')
INSERT [dbo].[Акт_решения_проблемы] ([Номер_акта], [Дата_акта], [Номер_заявки], [Описание]) VALUES (7, CAST(N'2025-02-18' AS Date), 7, N'Штраф оплачен')
INSERT [dbo].[Акт_решения_проблемы] ([Номер_акта], [Дата_акта], [Номер_заявки], [Описание]) VALUES (8, CAST(N'2025-02-23' AS Date), 8, N'Оплата произведена')
INSERT [dbo].[Акт_решения_проблемы] ([Номер_акта], [Дата_акта], [Номер_заявки], [Описание]) VALUES (9, CAST(N'2025-02-28' AS Date), 9, N'Тишина восстановлена')
INSERT [dbo].[Акт_решения_проблемы] ([Номер_акта], [Дата_акта], [Номер_заявки], [Описание]) VALUES (10, CAST(N'2025-03-04' AS Date), 10, N'Кровать отремонтирована')
GO
INSERT [dbo].[График_дежурства_сотрудников] ([Номер_записи], [Дата_начала], [Дата_окончания], [Примечание], [Код_сотрудника]) VALUES (1, CAST(N'2025-01-10' AS Date), CAST(N'2025-01-17' AS Date), N'Ночная смена', 1)
INSERT [dbo].[График_дежурства_сотрудников] ([Номер_записи], [Дата_начала], [Дата_окончания], [Примечание], [Код_сотрудника]) VALUES (2, CAST(N'2025-01-18' AS Date), CAST(N'2025-01-25' AS Date), N'Дневная смена', 2)
INSERT [dbo].[График_дежурства_сотрудников] ([Номер_записи], [Дата_начала], [Дата_окончания], [Примечание], [Код_сотрудника]) VALUES (3, CAST(N'2025-01-26' AS Date), CAST(N'2025-02-02' AS Date), N'Уборка', 3)
INSERT [dbo].[График_дежурства_сотрудников] ([Номер_записи], [Дата_начала], [Дата_окончания], [Примечание], [Код_сотрудника]) VALUES (4, CAST(N'2025-02-03' AS Date), CAST(N'2025-02-10' AS Date), N'Ремонт', 4)
INSERT [dbo].[График_дежурства_сотрудников] ([Номер_записи], [Дата_начала], [Дата_окончания], [Примечание], [Код_сотрудника]) VALUES (5, CAST(N'2025-02-11' AS Date), CAST(N'2025-02-18' AS Date), N'Обход', 5)
INSERT [dbo].[График_дежурства_сотрудников] ([Номер_записи], [Дата_начала], [Дата_окончания], [Примечание], [Код_сотрудника]) VALUES (6, CAST(N'2025-02-19' AS Date), CAST(N'2025-02-26' AS Date), N'Ночная смена', 1)
INSERT [dbo].[График_дежурства_сотрудников] ([Номер_записи], [Дата_начала], [Дата_окончания], [Примечание], [Код_сотрудника]) VALUES (7, CAST(N'2025-02-27' AS Date), CAST(N'2025-03-06' AS Date), N'Дневная смена', 2)
INSERT [dbo].[График_дежурства_сотрудников] ([Номер_записи], [Дата_начала], [Дата_окончания], [Примечание], [Код_сотрудника]) VALUES (8, CAST(N'2025-03-07' AS Date), CAST(N'2025-03-14' AS Date), N'Уборка', 3)
INSERT [dbo].[График_дежурства_сотрудников] ([Номер_записи], [Дата_начала], [Дата_окончания], [Примечание], [Код_сотрудника]) VALUES (9, CAST(N'2025-03-15' AS Date), CAST(N'2025-03-22' AS Date), N'Ремонт', 4)
INSERT [dbo].[График_дежурства_сотрудников] ([Номер_записи], [Дата_начала], [Дата_окончания], [Примечание], [Код_сотрудника]) VALUES (10, CAST(N'2025-03-23' AS Date), CAST(N'2025-03-30' AS Date), N'Обход', 5)
GO
INSERT [dbo].[Должности] ([Код_должности], [Наименование]) VALUES (1, N'Комендант')
INSERT [dbo].[Должности] ([Код_должности], [Наименование]) VALUES (2, N'Охранник')
INSERT [dbo].[Должности] ([Код_должности], [Наименование]) VALUES (3, N'Уборщик')
INSERT [dbo].[Должности] ([Код_должности], [Наименование]) VALUES (4, N'Электрик')
INSERT [dbo].[Должности] ([Код_должности], [Наименование]) VALUES (5, N'Сантехник')
GO
INSERT [dbo].[Журнал_задержек_решения] ([Номер_записи], [Дата_записи], [Срок_задержки], [Код_причины]) VALUES (1, CAST(N'2025-01-14' AS Date), 2, 1)
INSERT [dbo].[Журнал_задержек_решения] ([Номер_записи], [Дата_записи], [Срок_задержки], [Код_причины]) VALUES (2, CAST(N'2025-01-19' AS Date), 3, 2)
INSERT [dbo].[Журнал_задержек_решения] ([Номер_записи], [Дата_записи], [Срок_задержки], [Код_причины]) VALUES (3, CAST(N'2025-01-24' AS Date), 1, 3)
INSERT [dbo].[Журнал_задержек_решения] ([Номер_записи], [Дата_записи], [Срок_задержки], [Код_причины]) VALUES (4, CAST(N'2025-01-29' AS Date), 4, 4)
INSERT [dbo].[Журнал_задержек_решения] ([Номер_записи], [Дата_записи], [Срок_задержки], [Код_причины]) VALUES (5, CAST(N'2025-02-05' AS Date), 2, 5)
INSERT [dbo].[Журнал_задержек_решения] ([Номер_записи], [Дата_записи], [Срок_задержки], [Код_причины]) VALUES (6, CAST(N'2025-02-09' AS Date), 3, 1)
INSERT [dbo].[Журнал_задержек_решения] ([Номер_записи], [Дата_записи], [Срок_задержки], [Код_причины]) VALUES (7, CAST(N'2025-02-14' AS Date), 1, 2)
INSERT [dbo].[Журнал_задержек_решения] ([Номер_записи], [Дата_записи], [Срок_задержки], [Код_причины]) VALUES (8, CAST(N'2025-02-19' AS Date), 2, 3)
INSERT [dbo].[Журнал_задержек_решения] ([Номер_записи], [Дата_записи], [Срок_задержки], [Код_причины]) VALUES (9, CAST(N'2025-02-24' AS Date), 5, 4)
INSERT [dbo].[Журнал_задержек_решения] ([Номер_записи], [Дата_записи], [Срок_задержки], [Код_причины]) VALUES (10, CAST(N'2025-03-01' AS Date), 3, 5)
GO
INSERT [dbo].[Журнал_нарушений] ([Номер_нарушения], [Дата_нарушения], [Описание], [Место_нарушения], [Код_студента], [Код_типа_нарушения], [Код_источника]) VALUES (1, CAST(N'2025-01-10' AS Date), N'Мусор на полу', N'Комната 101', 1, 1, 1)
INSERT [dbo].[Журнал_нарушений] ([Номер_нарушения], [Дата_нарушения], [Описание], [Место_нарушения], [Код_студента], [Код_типа_нарушения], [Код_источника]) VALUES (2, CAST(N'2025-01-15' AS Date), N'Сломан стул', N'Комната 202', 2, 2, 2)
INSERT [dbo].[Журнал_нарушений] ([Номер_нарушения], [Дата_нарушения], [Описание], [Место_нарушения], [Код_студента], [Код_типа_нарушения], [Код_источника]) VALUES (3, CAST(N'2025-01-20' AS Date), N'Громкая музыка', N'Комната 305', 3, 3, 3)
INSERT [dbo].[Журнал_нарушений] ([Номер_нарушения], [Дата_нарушения], [Описание], [Место_нарушения], [Код_студента], [Код_типа_нарушения], [Код_источника]) VALUES (4, CAST(N'2025-01-25' AS Date), N'Не оплачено проживание', N'Комната 408', 4, 4, 2)
INSERT [dbo].[Журнал_нарушений] ([Номер_нарушения], [Дата_нарушения], [Описание], [Место_нарушения], [Код_студента], [Код_типа_нарушения], [Код_источника]) VALUES (5, CAST(N'2025-02-01' AS Date), N'Посторонний в комнате', N'Комната 510', 5, 5, 4)
INSERT [dbo].[Журнал_нарушений] ([Номер_нарушения], [Дата_нарушения], [Описание], [Место_нарушения], [Код_студента], [Код_типа_нарушения], [Код_источника]) VALUES (6, CAST(N'2025-02-05' AS Date), N'Разбито окно', N'Комната 101', 1, 2, 1)
INSERT [dbo].[Журнал_нарушений] ([Номер_нарушения], [Дата_нарушения], [Описание], [Место_нарушения], [Код_студента], [Код_типа_нарушения], [Код_источника]) VALUES (7, CAST(N'2025-02-10' AS Date), N'Курение в комнате', N'Комната 202', 2, 3, 3)
INSERT [dbo].[Журнал_нарушений] ([Номер_нарушения], [Дата_нарушения], [Описание], [Место_нарушения], [Код_студента], [Код_типа_нарушения], [Код_источника]) VALUES (8, CAST(N'2025-02-15' AS Date), N'Задержка оплаты', N'Комната 305', 3, 4, 2)
INSERT [dbo].[Журнал_нарушений] ([Номер_нарушения], [Дата_нарушения], [Описание], [Место_нарушения], [Код_студента], [Код_типа_нарушения], [Код_источника]) VALUES (9, CAST(N'2025-02-20' AS Date), N'Нарушение тишины', N'Комната 408', 4, 3, 1)
INSERT [dbo].[Журнал_нарушений] ([Номер_нарушения], [Дата_нарушения], [Описание], [Место_нарушения], [Код_студента], [Код_типа_нарушения], [Код_источника]) VALUES (10, CAST(N'2025-02-25' AS Date), N'Сломана кровать', N'Комната 510', 5, 2, 4)
GO
INSERT [dbo].[Заявки_на_ремонт] ([Номер_заявки_на_ремонт], [Дата_заявки], [Описание], [Номер_заявки], [Код_типа_ремонта]) VALUES (1, CAST(N'2025-01-15' AS Date), N'Замена розетки', 2, 1)
INSERT [dbo].[Заявки_на_ремонт] ([Номер_заявки_на_ремонт], [Дата_заявки], [Описание], [Номер_заявки], [Код_типа_ремонта]) VALUES (2, CAST(N'2025-01-20' AS Date), N'Ремонт крана', 3, 2)
INSERT [dbo].[Заявки_на_ремонт] ([Номер_заявки_на_ремонт], [Дата_заявки], [Описание], [Номер_заявки], [Код_типа_ремонта]) VALUES (3, CAST(N'2025-01-25' AS Date), N'Ремонт стула', 4, 3)
INSERT [dbo].[Заявки_на_ремонт] ([Номер_заявки_на_ремонт], [Дата_заявки], [Описание], [Номер_заявки], [Код_типа_ремонта]) VALUES (4, CAST(N'2025-01-30' AS Date), N'Покраска стены', 5, 4)
INSERT [dbo].[Заявки_на_ремонт] ([Номер_заявки_на_ремонт], [Дата_заявки], [Описание], [Номер_заявки], [Код_типа_ремонта]) VALUES (5, CAST(N'2025-02-06' AS Date), N'Проверка проводки', 6, 1)
INSERT [dbo].[Заявки_на_ремонт] ([Номер_заявки_на_ремонт], [Дата_заявки], [Описание], [Номер_заявки], [Код_типа_ремонта]) VALUES (6, CAST(N'2025-02-11' AS Date), N'Замена трубы', 7, 2)
INSERT [dbo].[Заявки_на_ремонт] ([Номер_заявки_на_ремонт], [Дата_заявки], [Описание], [Номер_заявки], [Код_типа_ремонта]) VALUES (7, CAST(N'2025-02-16' AS Date), N'Ремонт стола', 8, 3)
INSERT [dbo].[Заявки_на_ремонт] ([Номер_заявки_на_ремонт], [Дата_заявки], [Описание], [Номер_заявки], [Код_типа_ремонта]) VALUES (8, CAST(N'2025-02-21' AS Date), N'Штукатурка', 9, 4)
INSERT [dbo].[Заявки_на_ремонт] ([Номер_заявки_на_ремонт], [Дата_заявки], [Описание], [Номер_заявки], [Код_типа_ремонта]) VALUES (9, CAST(N'2025-02-26' AS Date), N'Профилактика', 10, 5)
INSERT [dbo].[Заявки_на_ремонт] ([Номер_заявки_на_ремонт], [Дата_заявки], [Описание], [Номер_заявки], [Код_типа_ремонта]) VALUES (10, CAST(N'2025-03-02' AS Date), N'Замена лампы', 1, 1)
GO
INSERT [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки], [Дата_заявки], [Срок_устранения], [Примечание], [Номер_нарушения], [Код_статуса], [Код_уровня]) VALUES (1, CAST(N'2025-01-11' AS Date), CAST(N'2025-01-15' AS Date), N'Срочно убрать', 1, 1, 2)
INSERT [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки], [Дата_заявки], [Срок_устранения], [Примечание], [Номер_нарушения], [Код_статуса], [Код_уровня]) VALUES (2, CAST(N'2025-01-16' AS Date), CAST(N'2025-01-20' AS Date), N'Заменить стул', 2, 2, 3)
INSERT [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки], [Дата_заявки], [Срок_устранения], [Примечание], [Номер_нарушения], [Код_статуса], [Код_уровня]) VALUES (3, CAST(N'2025-01-21' AS Date), CAST(N'2025-01-25' AS Date), N'Предупреждение', 3, 3, 4)
INSERT [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки], [Дата_заявки], [Срок_устранения], [Примечание], [Номер_нарушения], [Код_статуса], [Код_уровня]) VALUES (4, CAST(N'2025-01-26' AS Date), CAST(N'2025-02-01' AS Date), N'Ожидание оплаты', 4, 1, 3)
INSERT [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки], [Дата_заявки], [Срок_устранения], [Примечание], [Номер_нарушения], [Код_статуса], [Код_уровня]) VALUES (5, CAST(N'2025-02-02' AS Date), CAST(N'2025-02-05' AS Date), N'Проверка охраны', 5, 2, 2)
INSERT [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки], [Дата_заявки], [Срок_устранения], [Примечание], [Номер_нарушения], [Код_статуса], [Код_уровня]) VALUES (6, CAST(N'2025-02-06' AS Date), CAST(N'2025-02-10' AS Date), N'Замена окна', 6, 1, 1)
INSERT [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки], [Дата_заявки], [Срок_устранения], [Примечание], [Номер_нарушения], [Код_статуса], [Код_уровня]) VALUES (7, CAST(N'2025-02-11' AS Date), CAST(N'2025-02-15' AS Date), N'Штраф', 7, 3, 3)
INSERT [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки], [Дата_заявки], [Срок_устранения], [Примечание], [Номер_нарушения], [Код_статуса], [Код_уровня]) VALUES (8, CAST(N'2025-02-16' AS Date), CAST(N'2025-02-20' AS Date), N'Уведомление', 8, 2, 4)
INSERT [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки], [Дата_заявки], [Срок_устранения], [Примечание], [Номер_нарушения], [Код_статуса], [Код_уровня]) VALUES (9, CAST(N'2025-02-21' AS Date), CAST(N'2025-02-25' AS Date), N'Проверка', 9, 1, 2)
INSERT [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки], [Дата_заявки], [Срок_устранения], [Примечание], [Номер_нарушения], [Код_статуса], [Код_уровня]) VALUES (10, CAST(N'2025-02-26' AS Date), CAST(N'2025-03-01' AS Date), N'Ремонт кровати', 10, 2, 3)
GO
INSERT [dbo].[Источники_жалоб] ([Код_источника], [Наименование]) VALUES (1, N'Соседи по комнате')
INSERT [dbo].[Источники_жалоб] ([Код_источника], [Наименование]) VALUES (2, N'Комендант')
INSERT [dbo].[Источники_жалоб] ([Код_источника], [Наименование]) VALUES (3, N'Студенческий совет')
INSERT [dbo].[Источники_жалоб] ([Код_источника], [Наименование]) VALUES (4, N'Охрана')
INSERT [dbo].[Источники_жалоб] ([Код_источника], [Наименование]) VALUES (5, N'Самостоятельное обращение')
GO
INSERT [dbo].[Комнаты] ([Номер_комнаты], [Наименование], [Этаж], [Код_общежития]) VALUES (N'101', N'Комната 101', 1, 1)
INSERT [dbo].[Комнаты] ([Номер_комнаты], [Наименование], [Этаж], [Код_общежития]) VALUES (N'202', N'Комната 202', 2, 2)
INSERT [dbo].[Комнаты] ([Номер_комнаты], [Наименование], [Этаж], [Код_общежития]) VALUES (N'305', N'Комната 305', 3, 3)
INSERT [dbo].[Комнаты] ([Номер_комнаты], [Наименование], [Этаж], [Код_общежития]) VALUES (N'408', N'Комната 408', 4, 4)
INSERT [dbo].[Комнаты] ([Номер_комнаты], [Наименование], [Этаж], [Код_общежития]) VALUES (N'510', N'Комната 510', 5, 5)
GO
INSERT [dbo].[Назначение_сотрудников] ([Номер_назначения], [Номер_заявки], [Код_сотрудника]) VALUES (1, 1, 1)
INSERT [dbo].[Назначение_сотрудников] ([Номер_назначения], [Номер_заявки], [Код_сотрудника]) VALUES (2, 2, 4)
INSERT [dbo].[Назначение_сотрудников] ([Номер_назначения], [Номер_заявки], [Код_сотрудника]) VALUES (3, 3, 2)
INSERT [dbo].[Назначение_сотрудников] ([Номер_назначения], [Номер_заявки], [Код_сотрудника]) VALUES (4, 4, 3)
INSERT [dbo].[Назначение_сотрудников] ([Номер_назначения], [Номер_заявки], [Код_сотрудника]) VALUES (5, 5, 5)
INSERT [dbo].[Назначение_сотрудников] ([Номер_назначения], [Номер_заявки], [Код_сотрудника]) VALUES (6, 6, 4)
INSERT [dbo].[Назначение_сотрудников] ([Номер_назначения], [Номер_заявки], [Код_сотрудника]) VALUES (7, 7, 2)
INSERT [dbo].[Назначение_сотрудников] ([Номер_назначения], [Номер_заявки], [Код_сотрудника]) VALUES (8, 8, 3)
INSERT [dbo].[Назначение_сотрудников] ([Номер_назначения], [Номер_заявки], [Код_сотрудника]) VALUES (9, 9, 1)
INSERT [dbo].[Назначение_сотрудников] ([Номер_назначения], [Номер_заявки], [Код_сотрудника]) VALUES (10, 10, 5)
GO
INSERT [dbo].[Общежития] ([Код_общежития], [Наименование], [Адрес]) VALUES (1, N'Общежитие №1', N'ул. Ленина, 10')
INSERT [dbo].[Общежития] ([Код_общежития], [Наименование], [Адрес]) VALUES (2, N'Общежитие №2', N'ул. Мира, 25')
INSERT [dbo].[Общежития] ([Код_общежития], [Наименование], [Адрес]) VALUES (3, N'Общежитие №3', N'ул. Победы, 5')
INSERT [dbo].[Общежития] ([Код_общежития], [Наименование], [Адрес]) VALUES (4, N'Общежитие №4', N'ул. Студенческая, 15')
INSERT [dbo].[Общежития] ([Код_общежития], [Наименование], [Адрес]) VALUES (5, N'Общежитие №5', N'ул. Университетская, 30')
GO
INSERT [dbo].[Оплаты_студентов] ([Номер_оплаты], [Дата_оплаты], [Сумма_оплаты], [Код_студента], [Номер_нарушения], [Код_типа]) VALUES (1, CAST(N'2025-01-12' AS Date), CAST(500.00 AS Decimal(10, 2)), 1, 1, 1)
INSERT [dbo].[Оплаты_студентов] ([Номер_оплаты], [Дата_оплаты], [Сумма_оплаты], [Код_студента], [Номер_нарушения], [Код_типа]) VALUES (2, CAST(N'2025-01-17' AS Date), CAST(2000.00 AS Decimal(10, 2)), 2, 2, 3)
INSERT [dbo].[Оплаты_студентов] ([Номер_оплаты], [Дата_оплаты], [Сумма_оплаты], [Код_студента], [Номер_нарушения], [Код_типа]) VALUES (3, CAST(N'2025-01-22' AS Date), CAST(1000.00 AS Decimal(10, 2)), 3, 3, 1)
INSERT [dbo].[Оплаты_студентов] ([Номер_оплаты], [Дата_оплаты], [Сумма_оплаты], [Код_студента], [Номер_нарушения], [Код_типа]) VALUES (4, CAST(N'2025-01-27' AS Date), CAST(5000.00 AS Decimal(10, 2)), 4, 4, 2)
INSERT [dbo].[Оплаты_студентов] ([Номер_оплаты], [Дата_оплаты], [Сумма_оплаты], [Код_студента], [Номер_нарушения], [Код_типа]) VALUES (5, CAST(N'2025-02-03' AS Date), CAST(300.00 AS Decimal(10, 2)), 5, 5, 1)
INSERT [dbo].[Оплаты_студентов] ([Номер_оплаты], [Дата_оплаты], [Сумма_оплаты], [Код_студента], [Номер_нарушения], [Код_типа]) VALUES (6, CAST(N'2025-02-07' AS Date), CAST(1500.00 AS Decimal(10, 2)), 1, 6, 3)
INSERT [dbo].[Оплаты_студентов] ([Номер_оплаты], [Дата_оплаты], [Сумма_оплаты], [Код_студента], [Номер_нарушения], [Код_типа]) VALUES (7, CAST(N'2025-02-12' AS Date), CAST(700.00 AS Decimal(10, 2)), 2, 7, 1)
INSERT [dbo].[Оплаты_студентов] ([Номер_оплаты], [Дата_оплаты], [Сумма_оплаты], [Код_студента], [Номер_нарушения], [Код_типа]) VALUES (8, CAST(N'2025-02-17' AS Date), CAST(4500.00 AS Decimal(10, 2)), 3, 8, 2)
INSERT [dbo].[Оплаты_студентов] ([Номер_оплаты], [Дата_оплаты], [Сумма_оплаты], [Код_студента], [Номер_нарушения], [Код_типа]) VALUES (9, CAST(N'2025-02-22' AS Date), CAST(600.00 AS Decimal(10, 2)), 4, 9, 1)
INSERT [dbo].[Оплаты_студентов] ([Номер_оплаты], [Дата_оплаты], [Сумма_оплаты], [Код_студента], [Номер_нарушения], [Код_типа]) VALUES (10, CAST(N'2025-02-27' AS Date), CAST(1800.00 AS Decimal(10, 2)), 5, 10, 3)
GO
INSERT [dbo].[Причины_задержки] ([Код_причины], [Наименование]) VALUES (1, N'Отсутствие материалов')
INSERT [dbo].[Причины_задержки] ([Код_причины], [Наименование]) VALUES (2, N'Нет свободных сотрудников')
INSERT [dbo].[Причины_задержки] ([Код_причины], [Наименование]) VALUES (3, N'Сложность ремонта')
INSERT [dbo].[Причины_задержки] ([Код_причины], [Наименование]) VALUES (4, N'Ожидание согласования')
INSERT [dbo].[Причины_задержки] ([Код_причины], [Наименование]) VALUES (5, N'Форс-мажор')
GO
INSERT [dbo].[Сотрудники_общежития] ([Код_сотрудника], [ФИО], [Телефон], [Код_должности]) VALUES (1, N'Кузнецов Сергей Петрович', N'+79998765432', 1)
INSERT [dbo].[Сотрудники_общежития] ([Код_сотрудника], [ФИО], [Телефон], [Код_должности]) VALUES (2, N'Морозова Ольга Ивановна', N'+79997654321', 2)
INSERT [dbo].[Сотрудники_общежития] ([Код_сотрудника], [ФИО], [Телефон], [Код_должности]) VALUES (3, N'Васильев Дмитрий Николаевич', N'+79996543210', 3)
INSERT [dbo].[Сотрудники_общежития] ([Код_сотрудника], [ФИО], [Телефон], [Код_должности]) VALUES (4, N'Лебедев Андрей Викторович', N'+79995432109', 4)
INSERT [dbo].[Сотрудники_общежития] ([Код_сотрудника], [ФИО], [Телефон], [Код_должности]) VALUES (5, N'Попова Екатерина Александровна', N'+79994321098', 5)
GO
INSERT [dbo].[Справка_об_отмене_заявки] ([Номер_справки], [Дата_справки], [Описание], [Номер_заявки]) VALUES (1, CAST(N'2025-01-13' AS Date), N'Студент убрал мусор', 1)
INSERT [dbo].[Справка_об_отмене_заявки] ([Номер_справки], [Дата_справки], [Описание], [Номер_заявки]) VALUES (2, CAST(N'2025-01-18' AS Date), N'Стул заменен', 2)
INSERT [dbo].[Справка_об_отмене_заявки] ([Номер_справки], [Дата_справки], [Описание], [Номер_заявки]) VALUES (3, CAST(N'2025-01-23' AS Date), N'Шум прекращен', 3)
INSERT [dbo].[Справка_об_отмене_заявки] ([Номер_справки], [Дата_справки], [Описание], [Номер_заявки]) VALUES (4, CAST(N'2025-01-28' AS Date), N'Оплата получена', 4)
INSERT [dbo].[Справка_об_отмене_заявки] ([Номер_справки], [Дата_справки], [Описание], [Номер_заявки]) VALUES (5, CAST(N'2025-02-04' AS Date), N'Нарушение устранено', 5)
INSERT [dbo].[Справка_об_отмене_заявки] ([Номер_справки], [Дата_справки], [Описание], [Номер_заявки]) VALUES (6, CAST(N'2025-02-08' AS Date), N'Окно заменено', 6)
INSERT [dbo].[Справка_об_отмене_заявки] ([Номер_справки], [Дата_справки], [Описание], [Номер_заявки]) VALUES (7, CAST(N'2025-02-13' AS Date), N'Штраф оплачен', 7)
INSERT [dbo].[Справка_об_отмене_заявки] ([Номер_справки], [Дата_справки], [Описание], [Номер_заявки]) VALUES (8, CAST(N'2025-02-18' AS Date), N'Оплата произведена', 8)
INSERT [dbo].[Справка_об_отмене_заявки] ([Номер_справки], [Дата_справки], [Описание], [Номер_заявки]) VALUES (9, CAST(N'2025-02-23' AS Date), N'Тишина восстановлена', 9)
INSERT [dbo].[Справка_об_отмене_заявки] ([Номер_справки], [Дата_справки], [Описание], [Номер_заявки]) VALUES (10, CAST(N'2025-02-28' AS Date), N'Кровать отремонтирована', 10)
GO
INSERT [dbo].[Справки_о_результате_ремонта] ([Номер_справки], [Дата_справки], [Результат_ремонта], [Стоимость], [Примечание], [Номер_заявки_на_ремонт]) VALUES (1, CAST(N'2025-01-16' AS Date), N'Розетка заменена', CAST(500.00 AS Decimal(10, 2)), N'Успешно', 1)
INSERT [dbo].[Справки_о_результате_ремонта] ([Номер_справки], [Дата_справки], [Результат_ремонта], [Стоимость], [Примечание], [Номер_заявки_на_ремонт]) VALUES (2, CAST(N'2025-01-21' AS Date), N'Кран починен', CAST(700.00 AS Decimal(10, 2)), N'Гарантия 1 месяц', 2)
INSERT [dbo].[Справки_о_результате_ремонта] ([Номер_справки], [Дата_справки], [Результат_ремонта], [Стоимость], [Примечание], [Номер_заявки_на_ремонт]) VALUES (3, CAST(N'2025-01-26' AS Date), N'Стул отремонтирован', CAST(300.00 AS Decimal(10, 2)), N'Успешно', 3)
INSERT [dbo].[Справки_о_результате_ремонта] ([Номер_справки], [Дата_справки], [Результат_ремонта], [Стоимость], [Примечание], [Номер_заявки_на_ремонт]) VALUES (4, CAST(N'2025-01-31' AS Date), N'Стена покрашена', CAST(1000.00 AS Decimal(10, 2)), N'Без замечаний', 4)
INSERT [dbo].[Справки_о_результате_ремонта] ([Номер_справки], [Дата_справки], [Результат_ремонта], [Стоимость], [Примечание], [Номер_заявки_на_ремонт]) VALUES (5, CAST(N'2025-02-07' AS Date), N'Проводка проверена', CAST(400.00 AS Decimal(10, 2)), N'Успешно', 5)
INSERT [dbo].[Справки_о_результате_ремонта] ([Номер_справки], [Дата_справки], [Результат_ремонта], [Стоимость], [Примечание], [Номер_заявки_на_ремонт]) VALUES (6, CAST(N'2025-02-12' AS Date), N'Труба заменена', CAST(800.00 AS Decimal(10, 2)), N'Гарантия 2 месяца', 6)
INSERT [dbo].[Справки_о_результате_ремонта] ([Номер_справки], [Дата_справки], [Результат_ремонта], [Стоимость], [Примечание], [Номер_заявки_на_ремонт]) VALUES (7, CAST(N'2025-02-17' AS Date), N'Стол отремонтирован', CAST(350.00 AS Decimal(10, 2)), N'Успешно', 7)
INSERT [dbo].[Справки_о_результате_ремонта] ([Номер_справки], [Дата_справки], [Результат_ремонта], [Стоимость], [Примечание], [Номер_заявки_на_ремонт]) VALUES (8, CAST(N'2025-02-22' AS Date), N'Штукатурка выполнена', CAST(1200.00 AS Decimal(10, 2)), N'Без замечаний', 8)
INSERT [dbo].[Справки_о_результате_ремонта] ([Номер_справки], [Дата_справки], [Результат_ремонта], [Стоимость], [Примечание], [Номер_заявки_на_ремонт]) VALUES (9, CAST(N'2025-02-27' AS Date), N'Профилактика завершена', CAST(200.00 AS Decimal(10, 2)), N'Успешно', 9)
INSERT [dbo].[Справки_о_результате_ремонта] ([Номер_справки], [Дата_справки], [Результат_ремонта], [Стоимость], [Примечание], [Номер_заявки_на_ремонт]) VALUES (10, CAST(N'2025-03-03' AS Date), N'Лампа заменена', CAST(150.00 AS Decimal(10, 2)), N'Успешно', 10)
GO
INSERT [dbo].[Статусы_заявок] ([Код_статуса], [Наименование]) VALUES (1, N'Новая')
INSERT [dbo].[Статусы_заявок] ([Код_статуса], [Наименование]) VALUES (2, N'В работе')
INSERT [dbo].[Статусы_заявок] ([Код_статуса], [Наименование]) VALUES (3, N'Выполнена')
INSERT [dbo].[Статусы_заявок] ([Код_статуса], [Наименование]) VALUES (4, N'Отменена')
INSERT [dbo].[Статусы_заявок] ([Код_статуса], [Наименование]) VALUES (5, N'Отложена')
GO
INSERT [dbo].[Студенты] ([Код_студента], [ФИО], [Телефон], [Номер_комнаты], [Код_факультета], [Код_формы]) VALUES (1, N'Иванов Иван Иванович', N'+79991234567', N'101', 1, 1)
INSERT [dbo].[Студенты] ([Код_студента], [ФИО], [Телефон], [Номер_комнаты], [Код_факультета], [Код_формы]) VALUES (2, N'Петрова Анна Сергеевна', N'+79992345678', N'202', 2, 1)
INSERT [dbo].[Студенты] ([Код_студента], [ФИО], [Телефон], [Номер_комнаты], [Код_факультета], [Код_формы]) VALUES (3, N'Сидоров Петр Алексеевич', N'+79993456789', N'305', 3, 2)
INSERT [dbo].[Студенты] ([Код_студента], [ФИО], [Телефон], [Номер_комнаты], [Код_факультета], [Код_формы]) VALUES (4, N'Козлова Мария Викторовна', N'+79994567890', N'408', 4, 1)
INSERT [dbo].[Студенты] ([Код_студента], [ФИО], [Телефон], [Номер_комнаты], [Код_факультета], [Код_формы]) VALUES (5, N'Смирнов Алексей Павлович', N'+79995678901', N'510', 5, 3)
GO
INSERT [dbo].[Тип_ремонта] ([Код_типа_ремонта], [Наименование]) VALUES (1, N'Электрический')
INSERT [dbo].[Тип_ремонта] ([Код_типа_ремонта], [Наименование]) VALUES (2, N'Сантехнический')
INSERT [dbo].[Тип_ремонта] ([Код_типа_ремонта], [Наименование]) VALUES (3, N'Мебельный')
INSERT [dbo].[Тип_ремонта] ([Код_типа_ремонта], [Наименование]) VALUES (4, N'Строительный')
INSERT [dbo].[Тип_ремонта] ([Код_типа_ремонта], [Наименование]) VALUES (5, N'Профилактический')
GO
INSERT [dbo].[Типы_нарушений] ([Код_типа_нарушения], [Наименование], [Код_типа_проблемы]) VALUES (1, N'Мусор в комнате', 1)
INSERT [dbo].[Типы_нарушений] ([Код_типа_нарушения], [Наименование], [Код_типа_проблемы]) VALUES (2, N'Сломанная мебель', 2)
INSERT [dbo].[Типы_нарушений] ([Код_типа_нарушения], [Наименование], [Код_типа_проблемы]) VALUES (3, N'Шум после 23:00', 3)
INSERT [dbo].[Типы_нарушений] ([Код_типа_нарушения], [Наименование], [Код_типа_проблемы]) VALUES (4, N'Неуплата за проживание', 4)
INSERT [dbo].[Типы_нарушений] ([Код_типа_нарушения], [Наименование], [Код_типа_проблемы]) VALUES (5, N'Нарушение пропускного режима', 5)
GO
INSERT [dbo].[Типы_платежей] ([Код_типа], [Наименование]) VALUES (1, N'Штраф')
INSERT [dbo].[Типы_платежей] ([Код_типа], [Наименование]) VALUES (2, N'Оплата за проживание')
INSERT [dbo].[Типы_платежей] ([Код_типа], [Наименование]) VALUES (3, N'Компенсация ущерба')
INSERT [dbo].[Типы_платежей] ([Код_типа], [Наименование]) VALUES (4, N'Дополнительные услуги')
INSERT [dbo].[Типы_платежей] ([Код_типа], [Наименование]) VALUES (5, N'Пени')
GO
INSERT [dbo].[Типы_проблем] ([Код_типа_проблемы], [Наименование]) VALUES (1, N'Санитарные нарушения')
INSERT [dbo].[Типы_проблем] ([Код_типа_проблемы], [Наименование]) VALUES (2, N'Технические неисправности')
INSERT [dbo].[Типы_проблем] ([Код_типа_проблемы], [Наименование]) VALUES (3, N'Поведенческие нарушения')
INSERT [dbo].[Типы_проблем] ([Код_типа_проблемы], [Наименование]) VALUES (4, N'Финансовые нарушения')
INSERT [dbo].[Типы_проблем] ([Код_типа_проблемы], [Наименование]) VALUES (5, N'Административные вопросы')
GO
INSERT [dbo].[Уровни_срочности] ([Код_уровня], [Наименование]) VALUES (1, N'Критический')
INSERT [dbo].[Уровни_срочности] ([Код_уровня], [Наименование]) VALUES (2, N'Высокий')
INSERT [dbo].[Уровни_срочности] ([Код_уровня], [Наименование]) VALUES (3, N'Средний')
INSERT [dbo].[Уровни_срочности] ([Код_уровня], [Наименование]) VALUES (4, N'Низкий')
INSERT [dbo].[Уровни_срочности] ([Код_уровня], [Наименование]) VALUES (5, N'Плановый')
GO
INSERT [dbo].[Факультеты] ([Код_факультета], [Наименование]) VALUES (1, N'Факультет информационных технологий')
INSERT [dbo].[Факультеты] ([Код_факультета], [Наименование]) VALUES (2, N'Факультет экономики')
INSERT [dbo].[Факультеты] ([Код_факультета], [Наименование]) VALUES (3, N'Факультет иностранных языков')
INSERT [dbo].[Факультеты] ([Код_факультета], [Наименование]) VALUES (4, N'Факультет права')
INSERT [dbo].[Факультеты] ([Код_факультета], [Наименование]) VALUES (5, N'Факультет биологии')
GO
INSERT [dbo].[Формы_обучения] ([Код_формы_обучения], [Наименование]) VALUES (1, N'Очная')
INSERT [dbo].[Формы_обучения] ([Код_формы_обучения], [Наименование]) VALUES (2, N'Заочная')
INSERT [dbo].[Формы_обучения] ([Код_формы_обучения], [Наименование]) VALUES (3, N'Вечерняя')
INSERT [dbo].[Формы_обучения] ([Код_формы_обучения], [Наименование]) VALUES (4, N'Дистанционная')
INSERT [dbo].[Формы_обучения] ([Код_формы_обучения], [Наименование]) VALUES (5, N'Очно-заочная')
GO
ALTER TABLE [dbo].[Акт_решения_проблемы]  WITH CHECK ADD FOREIGN KEY([Номер_заявки])
REFERENCES [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки])
GO
ALTER TABLE [dbo].[График_дежурства_сотрудников]  WITH CHECK ADD FOREIGN KEY([Код_сотрудника])
REFERENCES [dbo].[Сотрудники_общежития] ([Код_сотрудника])
GO
ALTER TABLE [dbo].[Журнал_задержек_решения]  WITH CHECK ADD FOREIGN KEY([Код_причины])
REFERENCES [dbo].[Причины_задержки] ([Код_причины])
GO
ALTER TABLE [dbo].[Журнал_нарушений]  WITH CHECK ADD FOREIGN KEY([Код_источника])
REFERENCES [dbo].[Источники_жалоб] ([Код_источника])
GO
ALTER TABLE [dbo].[Журнал_нарушений]  WITH CHECK ADD FOREIGN KEY([Код_студента])
REFERENCES [dbo].[Студенты] ([Код_студента])
GO
ALTER TABLE [dbo].[Журнал_нарушений]  WITH CHECK ADD FOREIGN KEY([Код_типа_нарушения])
REFERENCES [dbo].[Типы_нарушений] ([Код_типа_нарушения])
GO
ALTER TABLE [dbo].[Заявки_на_ремонт]  WITH CHECK ADD FOREIGN KEY([Код_типа_ремонта])
REFERENCES [dbo].[Тип_ремонта] ([Код_типа_ремонта])
GO
ALTER TABLE [dbo].[Заявки_на_ремонт]  WITH CHECK ADD FOREIGN KEY([Номер_заявки])
REFERENCES [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки])
GO
ALTER TABLE [dbo].[Заявки_на_устранения_проблемы]  WITH CHECK ADD FOREIGN KEY([Код_статуса])
REFERENCES [dbo].[Статусы_заявок] ([Код_статуса])
GO
ALTER TABLE [dbo].[Заявки_на_устранения_проблемы]  WITH CHECK ADD FOREIGN KEY([Код_уровня])
REFERENCES [dbo].[Уровни_срочности] ([Код_уровня])
GO
ALTER TABLE [dbo].[Заявки_на_устранения_проблемы]  WITH CHECK ADD FOREIGN KEY([Номер_нарушения])
REFERENCES [dbo].[Журнал_нарушений] ([Номер_нарушения])
GO
ALTER TABLE [dbo].[Комнаты]  WITH CHECK ADD FOREIGN KEY([Код_общежития])
REFERENCES [dbo].[Общежития] ([Код_общежития])
GO
ALTER TABLE [dbo].[Назначение_сотрудников]  WITH CHECK ADD FOREIGN KEY([Код_сотрудника])
REFERENCES [dbo].[Сотрудники_общежития] ([Код_сотрудника])
GO
ALTER TABLE [dbo].[Назначение_сотрудников]  WITH CHECK ADD FOREIGN KEY([Номер_заявки])
REFERENCES [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки])
GO
ALTER TABLE [dbo].[Оплаты_студентов]  WITH CHECK ADD FOREIGN KEY([Код_студента])
REFERENCES [dbo].[Студенты] ([Код_студента])
GO
ALTER TABLE [dbo].[Оплаты_студентов]  WITH CHECK ADD FOREIGN KEY([Код_типа])
REFERENCES [dbo].[Типы_платежей] ([Код_типа])
GO
ALTER TABLE [dbo].[Оплаты_студентов]  WITH CHECK ADD FOREIGN KEY([Номер_нарушения])
REFERENCES [dbo].[Журнал_нарушений] ([Номер_нарушения])
GO
ALTER TABLE [dbo].[Сотрудники_общежития]  WITH CHECK ADD FOREIGN KEY([Код_должности])
REFERENCES [dbo].[Должности] ([Код_должности])
GO
ALTER TABLE [dbo].[Справка_об_отмене_заявки]  WITH CHECK ADD FOREIGN KEY([Номер_заявки])
REFERENCES [dbo].[Заявки_на_устранения_проблемы] ([Номер_заявки])
GO
ALTER TABLE [dbo].[Справки_о_результате_ремонта]  WITH CHECK ADD FOREIGN KEY([Номер_заявки_на_ремонт])
REFERENCES [dbo].[Заявки_на_ремонт] ([Номер_заявки_на_ремонт])
GO
ALTER TABLE [dbo].[Студенты]  WITH CHECK ADD FOREIGN KEY([Код_факультета])
REFERENCES [dbo].[Факультеты] ([Код_факультета])
GO
ALTER TABLE [dbo].[Студенты]  WITH CHECK ADD FOREIGN KEY([Код_формы])
REFERENCES [dbo].[Формы_обучения] ([Код_формы_обучения])
GO
ALTER TABLE [dbo].[Студенты]  WITH CHECK ADD FOREIGN KEY([Номер_комнаты])
REFERENCES [dbo].[Комнаты] ([Номер_комнаты])
GO
ALTER TABLE [dbo].[Типы_нарушений]  WITH CHECK ADD FOREIGN KEY([Код_типа_проблемы])
REFERENCES [dbo].[Типы_проблем] ([Код_типа_проблемы])
GO
USE [master]
GO
ALTER DATABASE [Dormitory] SET  READ_WRITE 
GO
