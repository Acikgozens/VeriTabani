USE [master]
GO
/****** Object:  Database [DbOkul_TT]    Script Date: 2.12.2021 19:08:53 ******/
CREATE DATABASE [DbOkul_TT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbOkul_TT', FILENAME = N'D:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DbOkul_TT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbOkul_TT_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DbOkul_TT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DbOkul_TT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbOkul_TT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbOkul_TT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbOkul_TT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbOkul_TT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbOkul_TT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbOkul_TT] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbOkul_TT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbOkul_TT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbOkul_TT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbOkul_TT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbOkul_TT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbOkul_TT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbOkul_TT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbOkul_TT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbOkul_TT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbOkul_TT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbOkul_TT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbOkul_TT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbOkul_TT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbOkul_TT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbOkul_TT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbOkul_TT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbOkul_TT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbOkul_TT] SET RECOVERY FULL 
GO
ALTER DATABASE [DbOkul_TT] SET  MULTI_USER 
GO
ALTER DATABASE [DbOkul_TT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbOkul_TT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbOkul_TT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbOkul_TT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbOkul_TT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbOkul_TT] SET QUERY_STORE = OFF
GO
USE [DbOkul_TT]
GO
/****** Object:  User [bprlab2021B1O]    Script Date: 2.12.2021 19:08:53 ******/
CREATE USER [bprlab2021B1O] FOR LOGIN [bprlab2021B1O] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [bprlab2021A]    Script Date: 2.12.2021 19:08:53 ******/
CREATE USER [bprlab2021A] FOR LOGIN [bprlab2021A] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [bprlab2021B1O]
GO
ALTER ROLE [db_datareader] ADD MEMBER [bprlab2021B1O]
GO
ALTER ROLE [db_owner] ADD MEMBER [bprlab2021A]
GO
/****** Object:  Table [dbo].[tblOgrenci]    Script Date: 2.12.2021 19:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOgrenci](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Soyadi] [nvarchar](50) NULL,
	[Email] [varchar](100) NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[DogumTarihi] [date] NULL,
	[Cinsiyet] [char](1) NULL,
	[Durumu] [bit] NULL,
	[Numara] [char](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOgretmen]    Script Date: 2.12.2021 19:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOgretmen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Soyadi] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DogumTarihi] [date] NULL,
	[Cisniyet] [char](1) NULL,
	[MedeniDurumu] [char](1) NULL,
	[Durumu] [bit] NULL,
	[Bransi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDersler]    Script Date: 2.12.2021 19:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDersler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[Durumu] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOgrencininDersleri]    Script Date: 2.12.2021 19:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOgrencininDersleri](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OgretmenId] [int] NULL,
	[OgrenciId] [int] NULL,
	[DersId] [int] NULL,
	[VizeNotu] [decimal](5, 2) NULL,
	[FinalNotu] [decimal](5, 2) NULL,
	[DonemSonu] [decimal](5, 2) NULL,
	[GecmeNotu] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_DersinAlanOgrenciler]    Script Date: 2.12.2021 19:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[V_DersinAlanOgrenciler]
as
select tblOgrenci.Id as OgrenciId, tblOgrenci.Adi as OgrenciAdi, tblOgrenci.Soyadi as OgrenciSoyadi, tblOgretmen.Id as OgretmenId, tblOgrencininDersleri.VizeNotu,tblOgrencininDersleri.FinalNotu,tblOgrencininDersleri.GecmeNotu,
			tblOgretmen.Adi as OgretmenAdi,tblOgretmen.Soyadi as OgretmenSoyadi,  tblDersler.Id as DersId,tblDersler.Adi as DersAdi
from tblOgrenci inner join tblOgrencininDersleri on tblOgrenci.Id = tblOgrencininDersleri.OgrenciId 
				inner join  tblOgretmen on tblOgrencininDersleri.OgretmenId = tblOgretmen.Id
				inner join tblDersler on tblDersler.Id = tblOgrencininDersleri.DersId
GO
/****** Object:  View [dbo].[V_TumBilgiler]    Script Date: 2.12.2021 19:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[V_TumBilgiler]
as
select tblOgrenci.Id as OgrenciId, tblOgrenci.Adi as OgrenciAdı, tblOgrenci.Soyadi as OgrenciSoyadı,
       tblOgretmen.Id as OgretmenId, tblOgretmen.Adi as OgretmenAdı, tblOgretmen.Soyadi as OgretmenSoyadı,
	   tblDersler.Id as DersId, tblDersler.Adi as DersAdı,
	   tblOgrencininDersleri.GecmeNotu
from tblOgrenci inner join tblOgrencininDersleri on tblOgrenci.Id = tblOgrencininDersleri.OgrenciId
                inner join tblOgretmen on tblOgretmen.Id = tblOgrencininDersleri.OgretmenId
				inner join tblDersler on tblOgrencininDersleri.DersId =tblDersler.Id
GO
/****** Object:  View [dbo].[V_TümBilgiler]    Script Date: 2.12.2021 19:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create View [dbo].[V_TümBilgiler]
as
select tblOgrenci.Id as OgrenciId, tblOgrenci.Adi as OgrenciAdi, tblOgrenci.Soyadi as OgrenciSoyadi,
	   tblOgretmen.Id as OgretmenId, tblOgretmen.Adi as OgretmenAdi, tblOgretmen.Soyadi as OgretmenSoyadi,
	   tblDersler.Id as DersId, tblDersler.Adi as DersAdi,
	   tblOgrencininDersleri.GecmeNotu
from tblOgrenci inner join tblOgrencininDersleri on tblOgrenci.Id = tblOgrencininDersleri.OgrenciId
				inner join tblOgretmen			 on tblOgretmen.Id = tblOgrencininDersleri.OgretmenId 
				inner join tblDersler			 on tblOgrencininDersleri.DersId = tblDersler.Id
GO
SET IDENTITY_INSERT [dbo].[tblDersler] ON 

INSERT [dbo].[tblDersler] ([Id], [Adi], [Aciklama], [Durumu]) VALUES (1, N'Fizik 1', N'Fiziki Dersleri', 1)
INSERT [dbo].[tblDersler] ([Id], [Adi], [Aciklama], [Durumu]) VALUES (2, N'Fizik 2', N'Fizik 2', 1)
INSERT [dbo].[tblDersler] ([Id], [Adi], [Aciklama], [Durumu]) VALUES (3, N'Matematik', NULL, 1)
INSERT [dbo].[tblDersler] ([Id], [Adi], [Aciklama], [Durumu]) VALUES (4, N'Mateamatik 2', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblDersler] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOgrenci] ON 

INSERT [dbo].[tblOgrenci] ([Id], [Adi], [Soyadi], [Email], [OlusturmaTarihi], [DogumTarihi], [Cinsiyet], [Durumu], [Numara]) VALUES (2, N'FAruk', N'Çetin', N'faruk@hotmail.com', CAST(N'2021-11-18T20:34:09.700' AS DateTime), CAST(N'2000-12-30' AS Date), N'E', 1, N'H5      ')
INSERT [dbo].[tblOgrenci] ([Id], [Adi], [Soyadi], [Email], [OlusturmaTarihi], [DogumTarihi], [Cinsiyet], [Durumu], [Numara]) VALUES (4, N'Fatma', N'Çetin', N'fatma@gmail.com', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-01' AS Date), N'K', 1, N'H545445 ')
INSERT [dbo].[tblOgrenci] ([Id], [Adi], [Soyadi], [Email], [OlusturmaTarihi], [DogumTarihi], [Cinsiyet], [Durumu], [Numara]) VALUES (5, N'Ayşe', N'aykol', N'ayseaykol@gmail.coö', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'0200-05-05' AS Date), N'K', 1, N'H5454   ')
SET IDENTITY_INSERT [dbo].[tblOgrenci] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOgrencininDersleri] ON 

INSERT [dbo].[tblOgrencininDersleri] ([Id], [OgretmenId], [OgrenciId], [DersId], [VizeNotu], [FinalNotu], [DonemSonu], [GecmeNotu]) VALUES (1, 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(50.00 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), N'A ')
INSERT [dbo].[tblOgrencininDersleri] ([Id], [OgretmenId], [OgrenciId], [DersId], [VizeNotu], [FinalNotu], [DonemSonu], [GecmeNotu]) VALUES (2, 1, 4, 3, CAST(50.00 AS Decimal(5, 2)), CAST(60.00 AS Decimal(5, 2)), CAST(50.00 AS Decimal(5, 2)), N'B ')
INSERT [dbo].[tblOgrencininDersleri] ([Id], [OgretmenId], [OgrenciId], [DersId], [VizeNotu], [FinalNotu], [DonemSonu], [GecmeNotu]) VALUES (3, 3, 2, 4, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), NULL)
INSERT [dbo].[tblOgrencininDersleri] ([Id], [OgretmenId], [OgrenciId], [DersId], [VizeNotu], [FinalNotu], [DonemSonu], [GecmeNotu]) VALUES (4, 10, 7, 2, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), NULL)
SET IDENTITY_INSERT [dbo].[tblOgrencininDersleri] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOgretmen] ON 

INSERT [dbo].[tblOgretmen] ([Id], [Adi], [Soyadi], [Email], [DogumTarihi], [Cisniyet], [MedeniDurumu], [Durumu], [Bransi]) VALUES (1, N'Ali', N'Demir', N'ali@gmail.com', CAST(N'2021-01-01' AS Date), N'E', N'E', 1, N'Matematik')
INSERT [dbo].[tblOgretmen] ([Id], [Adi], [Soyadi], [Email], [DogumTarihi], [Cisniyet], [MedeniDurumu], [Durumu], [Bransi]) VALUES (2, N'Tuncay', N'Tanin', N'tuncay@gmail.cm', CAST(N'1990-01-01' AS Date), N'E', N'N', 1, N'Fizik')
INSERT [dbo].[tblOgretmen] ([Id], [Adi], [Soyadi], [Email], [DogumTarihi], [Cisniyet], [MedeniDurumu], [Durumu], [Bransi]) VALUES (3, N'Ayşe', N'Çakır', N'ayse@gmail.com', CAST(N'1995-01-01' AS Date), N'K', N'B', 1, N'Tarih')
SET IDENTITY_INSERT [dbo].[tblOgretmen] OFF
GO
ALTER TABLE [dbo].[tblOgrenci] ADD  DEFAULT (getdate()) FOR [OlusturmaTarihi]
GO
ALTER TABLE [dbo].[tblOgrenci] ADD  DEFAULT ('B') FOR [Cinsiyet]
GO
ALTER TABLE [dbo].[tblOgrencininDersleri] ADD  DEFAULT ((0)) FOR [VizeNotu]
GO
ALTER TABLE [dbo].[tblOgrencininDersleri] ADD  DEFAULT ((0)) FOR [FinalNotu]
GO
ALTER TABLE [dbo].[tblOgrencininDersleri] ADD  DEFAULT ((0)) FOR [DonemSonu]
GO
ALTER TABLE [dbo].[tblOgretmen] ADD  DEFAULT ('B') FOR [Cisniyet]
GO
ALTER TABLE [dbo].[tblOgretmen] ADD  DEFAULT ('B') FOR [MedeniDurumu]
GO
ALTER TABLE [dbo].[tblOgretmen] ADD  DEFAULT ((1)) FOR [Durumu]
GO
USE [master]
GO
ALTER DATABASE [DbOkul_TT] SET  READ_WRITE 
GO
