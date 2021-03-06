USE [master]
GO
/****** Object:  Database [Room_ReservationDB]    Script Date: 3/15/2016 6:33:53 PM ******/
CREATE DATABASE [Room_ReservationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Room_ReservationDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Room_ReservationDB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Room_ReservationDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Room_ReservationDB_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Room_ReservationDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Room_ReservationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Room_ReservationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Room_ReservationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Room_ReservationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Room_ReservationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Room_ReservationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Room_ReservationDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Room_ReservationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Room_ReservationDB] SET  MULTI_USER 
GO
ALTER DATABASE [Room_ReservationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Room_ReservationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Room_ReservationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Room_ReservationDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Room_ReservationDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Room_ReservationDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/15/2016 6:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 3/15/2016 6:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReservedFrom] [datetime] NOT NULL,
	[ReservedTo] [datetime] NOT NULL,
	[UserAccountId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Reservations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 3/15/2016 6:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Capacity] [int] NOT NULL,
	[HasTV] [bit] NOT NULL,
	[HasProjector] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAccounts]    Script Date: 3/15/2016 6:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[ConfirmPassword] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserAccounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (1, N'Room 1', 30, 1, 0)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (2, N'Room 2', 30, 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (3, N'Room 3', 15, 1, 0)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (4, N'Room 4', 15, 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (5, N'Room 5', 15, 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (6, N'Room 6 ', 10, 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (7, N'Room 7', 10, 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (8, N'Room 8', 10, 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (9, N'Room 9', 10, 0, 0)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (10, N'Romm 10', 10, 0, 0)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
/****** Object:  Index [IX_RoomId]    Script Date: 3/15/2016 6:33:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoomId] ON [dbo].[Reservations]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserAccountId]    Script Date: 3/15/2016 6:33:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserAccountId] ON [dbo].[Reservations]
(
	[UserAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Reservations_dbo.Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_dbo.Reservations_dbo.Rooms_RoomId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Reservations_dbo.UserAccounts_ReservedById] FOREIGN KEY([UserAccountId])
REFERENCES [dbo].[UserAccounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_dbo.Reservations_dbo.UserAccounts_ReservedById]
GO
USE [master]
GO
ALTER DATABASE [Room_ReservationDB] SET  READ_WRITE 
GO
