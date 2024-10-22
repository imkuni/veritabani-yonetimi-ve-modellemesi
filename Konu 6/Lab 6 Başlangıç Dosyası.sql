USE [master]
GO

/****** Object:  Database [Zoo]    Script Date: 22.10.2019 15:06:03 ******/
CREATE DATABASE [Zoo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Zoo', FILENAME = N'D:\Zoo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Zoo_log', FILENAME = N'D:\Zoo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Zoo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Zoo] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Zoo] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Zoo] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Zoo] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Zoo] SET ARITHABORT OFF 
GO

ALTER DATABASE [Zoo] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Zoo] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Zoo] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Zoo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Zoo] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Zoo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Zoo] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Zoo] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Zoo] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Zoo] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Zoo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Zoo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Zoo] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Zoo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Zoo] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Zoo] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Zoo] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Zoo] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Zoo] SET  MULTI_USER 
GO

ALTER DATABASE [Zoo] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Zoo] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Zoo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Zoo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Zoo] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Zoo] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Zoo] SET  READ_WRITE 
GO


USE [Zoo]
GO

/****** Object:  Table [dbo].[tbl_AnimalType]    Script Date: 22.10.2019 15:06:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
USE [Zoo]
GO

/****** Object:  Table [dbo].[tbl_FoodType]    Script Date: 22.10.2019 15:06:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_FoodType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
	[parentId] [int] NULL,
 CONSTRAINT [PK_tbl_FoodType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_FoodType]  WITH CHECK ADD  CONSTRAINT [FK_tbl_FoodType_tbl_FoodType] FOREIGN KEY([parentId])
REFERENCES [dbo].[tbl_FoodType] ([id])
GO

ALTER TABLE [dbo].[tbl_FoodType] CHECK CONSTRAINT [FK_tbl_FoodType_tbl_FoodType]
GO



CREATE TABLE [dbo].[tbl_AnimalType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[info] [varchar](50) NULL,
	[ClassTypeId] [int] NULL,
 CONSTRAINT [PK_tbl_AnimalType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_AnimalType]  WITH CHECK ADD  CONSTRAINT [FK_tbl_AnimalType_tbl_AnimalType] FOREIGN KEY([ClassTypeId])
REFERENCES [dbo].[tbl_AnimalType] ([id])
GO

ALTER TABLE [dbo].[tbl_AnimalType] CHECK CONSTRAINT [FK_tbl_AnimalType_tbl_AnimalType]
GO

USE [Zoo]
GO

/****** Object:  Table [dbo].[tbl_VaccineType]    Script Date: 22.10.2019 15:07:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_VaccineType](
	[id] [int] NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_VaccineType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [Zoo]
GO

/****** Object:  Table [dbo].[tbl_StaffRole]    Script Date: 22.10.2019 15:07:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_StaffRole](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[definition] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_StaffRole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [Zoo]
GO

/****** Object:  Table [dbo].[tbl_Animal]    Script Date: 22.10.2019 15:08:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Animal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[arrivalDate] [datetime] NULL,
	[birthDate] [datetime] NULL,
	[animalType_Id] [int] NULL,
 CONSTRAINT [PK_tbl_Animal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_Animal]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Animal_tbl_AnimalType] FOREIGN KEY([animalType_Id])
REFERENCES [dbo].[tbl_AnimalType] ([id])
GO

ALTER TABLE [dbo].[tbl_Animal] CHECK CONSTRAINT [FK_tbl_Animal_tbl_AnimalType]
GO


USE [Zoo]
GO

/****** Object:  Table [dbo].[tbl_Cages]    Script Date: 22.10.2019 15:08:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Cages](
	[id] [int] NOT NULL,
	[descpription] [varchar](50) NULL,
	[capacity] [int] NULL,
 CONSTRAINT [PK_tbl_Cages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [Zoo]
GO

/****** Object:  Table [dbo].[tbl_Parents]    Script Date: 22.10.2019 15:08:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Parents](
	[id] [int] NOT NULL,
	[momId] [int] NOT NULL,
	[fatherID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Parents] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[momId] ASC,
	[fatherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_Parents]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Parents_tbl_Animal] FOREIGN KEY([momId])
REFERENCES [dbo].[tbl_Animal] ([id])
GO

ALTER TABLE [dbo].[tbl_Parents] CHECK CONSTRAINT [FK_tbl_Parents_tbl_Animal]
GO

ALTER TABLE [dbo].[tbl_Parents]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Parents_tbl_Animal1] FOREIGN KEY([fatherID])
REFERENCES [dbo].[tbl_Animal] ([id])
GO

ALTER TABLE [dbo].[tbl_Parents] CHECK CONSTRAINT [FK_tbl_Parents_tbl_Animal1]
GO

ALTER TABLE [dbo].[tbl_Parents]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Parents_tbl_Animal2] FOREIGN KEY([id])
REFERENCES [dbo].[tbl_Animal] ([id])
GO

ALTER TABLE [dbo].[tbl_Parents] CHECK CONSTRAINT [FK_tbl_Parents_tbl_Animal2]
GO


USE [Zoo]
GO

/****** Object:  Table [dbo].[tbl_Staff]    Script Date: 22.10.2019 15:08:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Staff](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[surname] [varchar](50) NULL,
	[birthDate] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[staffRole] [int] NULL,
 CONSTRAINT [PK_tbl_Staff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_Staff]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Staff_tbl_StaffRole] FOREIGN KEY([staffRole])
REFERENCES [dbo].[tbl_StaffRole] ([id])
GO

ALTER TABLE [dbo].[tbl_Staff] CHECK CONSTRAINT [FK_tbl_Staff_tbl_StaffRole]
GO


USE [Zoo]
GO

/****** Object:  Table [dbo].[tbl_VaccineDosage]    Script Date: 22.10.2019 15:08:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_VaccineDosage](
	[id] [int] NOT NULL,
	[vacinneTypeId] [int] NOT NULL,
	[animalTypeId] [int] NOT NULL,
	[time] [date] NULL,
 CONSTRAINT [PK_tbl_VaccineDosage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_VaccineDosage]  WITH CHECK ADD  CONSTRAINT [FK_tbl_VaccineDosage_tbl_AnimalType] FOREIGN KEY([animalTypeId])
REFERENCES [dbo].[tbl_AnimalType] ([id])
GO

ALTER TABLE [dbo].[tbl_VaccineDosage] CHECK CONSTRAINT [FK_tbl_VaccineDosage_tbl_AnimalType]
GO

ALTER TABLE [dbo].[tbl_VaccineDosage]  WITH CHECK ADD  CONSTRAINT [FK_tbl_VaccineDosage_tbl_VaccineType] FOREIGN KEY([vacinneTypeId])
REFERENCES [dbo].[tbl_VaccineType] ([id])
GO

ALTER TABLE [dbo].[tbl_VaccineDosage] CHECK CONSTRAINT [FK_tbl_VaccineDosage_tbl_VaccineType]
GO


insert into tbl_AnimalType Values ( 'Ku�',NULL )
insert into tbl_AnimalType Values ( 'Y�lan',NULL )
insert into tbl_AnimalType Values ( 'Papa�an',1 )
insert into tbl_AnimalType Values ( 'Karga',1 )
insert into tbl_AnimalType Values ( 'Penguen',1 )
insert into tbl_AnimalType Values ( 'Ke�i',1 )
insert into tbl_AnimalType Values ( '��ng�rakl� Y�lan',2 )
insert into tbl_AnimalType Values ( 'Kobra',2 )
insert into tbl_AnimalType Values ( 'Engerek',2 )
insert into tbl_AnimalType Values ( 'Orangutan',NULL )
insert into tbl_AnimalType Values ( '�empanze',NULL )
insert into tbl_AnimalType Values ( 'Ceylan',NULL )
insert into tbl_AnimalType Values ( 'Geyik',NULL )
insert into tbl_AnimalType Values ( 'Ke�i',NULL )

insert into tbl_FoodType Values ( 'Ot',NULL )
insert into tbl_FoodType Values ('Et',NULL )
insert into tbl_FoodType Values ('Ke�i Eti',2 )
insert into tbl_FoodType Values ('Koyun Eti',2 )
insert into tbl_FoodType Values ( 'Balk',NULL )
insert into tbl_FoodType Values ( 'Hamsi',5 )
insert into tbl_FoodType Values ( 'Turna',5 )
insert into tbl_FoodType Values ( 'Yonca',1 )
insert into tbl_FoodType Values ( 'Sebze',NULL )
insert into tbl_FoodType Values ( 'Yulaf',1 )
insert into tbl_FoodType Values ( 'Havu�',9 )
insert into tbl_FoodType Values ( 'Prasa',9 )

insert into tbl_Animal values ( 'k1','2018-10-16',NULL,14 )
insert into tbl_Animal values ( 'k2','2017-10-09',NULL,14 )
insert into tbl_Animal values ( 'k3',NULL,'2019-03-04',14 )
insert into tbl_Animal values ( 'p1','2019-01-01',NULL,3 )
insert into tbl_Animal values ( 'p2','2018-11-05',NULL,3 )
insert into tbl_Animal values ( 'p3','2017-12-04',NULL,3 )
insert into tbl_Animal values ( 'p4','2019-06-03',NULL,3 )
insert into tbl_Animal values ( 'y1','2019-01-02',NULL,2 )
insert into tbl_Animal values ( 'k4',NULL,'2019-10-11',14 )


USE [Zoo]
GO
USE [Zoo]
GO

/****** Object:  Table [dbo].[tbl_Staff_Animal]    Script Date: 10/22/2019 18:57:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Staff_Animal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[staff_id] [int] NULL,
	[animal_id] [int] NULL,
	[start_date] [datetime] NULL,
	[finish_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_Staf_Animal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tbl_Staff_Animal]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Staf_Animal_tbl_Animal] FOREIGN KEY([animal_id])
REFERENCES [dbo].[tbl_Animal] ([id])
GO

ALTER TABLE [dbo].[tbl_Staff_Animal] CHECK CONSTRAINT [FK_tbl_Staf_Animal_tbl_Animal]
GO

ALTER TABLE [dbo].[tbl_Staff_Animal]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Staf_Animal_tbl_Staf] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_Staff] ([id])
GO

ALTER TABLE [dbo].[tbl_Staff_Animal] CHECK CONSTRAINT [FK_tbl_Staf_Animal_tbl_Staf]
GO




insert into tbl_StaffRole values (	'Bakc�'	)
insert into tbl_StaffRole values (	'Temizlik�i'	)
insert into tbl_StaffRole values (	'Veteriner'	)

insert into tbl_Staff values (1,'ali',	'y�lmaz'	,	'1989-05-03 00:00:00.000'	,	'2018-01-01 00:00:00.000'	,	1,NULL)
insert into tbl_Staff values (2,'veli'	,'tetik'	,	'1980-12-03 00:00:00.000'	,	'2018-01-12 00:00:00.000'	,	1,NULL)
insert into tbl_Staff values (3,'deniz',	'Y�lmaz'	,	'1990-02-03 00:00:00.000'	,	'2019-03-25 00:00:00.000',	2,NULL)
insert into tbl_Staff values (4,'ahmet',	'y�ld�r�m',	'1992-06-05 00:00:00.000'	,	'2019-03-25 00:00:00.000'	,	2,NULL)
insert into tbl_Staff values (5,'ay�e'	,	'demir'	,	'1993-06-05 00:00:00.000'	,	'2019-03-25 00:00:00.000'	,	1,NULL)
insert into tbl_Staff values (6,'asl�'	,	'g�ler'	,	'1969-09-15','2018-03-25',3,NULL)




insert into tbl_Staff_Animal values(	1	,	1	,	'03.05.2018',NULL	)
insert into tbl_Staff_Animal values(	1	,	2	,	'03.05.2018',NULL	)
insert into tbl_Staff_Animal values(	2	,	3	,	'03.05.2018',NULL	)
insert into tbl_Staff_Animal values(	1	,	9	,	'03.05.2018',NULL	)
insert into tbl_Staff_Animal values(	5	,	5	,	'03.05.2019',NULL	)
insert into tbl_Staff_Animal values(	5	,	4	,	'03.05.2019',NULL	)