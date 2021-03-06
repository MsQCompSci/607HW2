USE [master]
GO
/****** Object:  Database [RottenApples]    Script Date: 2/9/2020 2:26:11 PM ******/
CREATE DATABASE [RottenApples]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RottenApples', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RottenApples.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RottenApples_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RottenApples_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RottenApples] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RottenApples].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RottenApples] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RottenApples] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RottenApples] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RottenApples] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RottenApples] SET ARITHABORT OFF 
GO
ALTER DATABASE [RottenApples] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RottenApples] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RottenApples] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RottenApples] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RottenApples] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RottenApples] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RottenApples] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RottenApples] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RottenApples] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RottenApples] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RottenApples] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RottenApples] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RottenApples] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RottenApples] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RottenApples] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RottenApples] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RottenApples] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RottenApples] SET RECOVERY FULL 
GO
ALTER DATABASE [RottenApples] SET  MULTI_USER 
GO
ALTER DATABASE [RottenApples] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RottenApples] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RottenApples] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RottenApples] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RottenApples] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RottenApples', N'ON'
GO
ALTER DATABASE [RottenApples] SET QUERY_STORE = OFF
GO
USE [RottenApples]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 2/9/2020 2:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[RottenTomatoesRating] [decimal](3, 2) NOT NULL,
	[RottenTomatoesAudienceScore] [decimal](3, 2) NOT NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participant]    Script Date: 2/9/2020 2:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participant](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
 CONSTRAINT [PK_Participant] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParticipantRating]    Script Date: 2/9/2020 2:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParticipantRating](
	[ParticipantID] [int] NOT NULL,
	[RatingID] [int] NULL,
	[MovieID] [int] NOT NULL,
 CONSTRAINT [PK_Rating_Movie] PRIMARY KEY CLUSTERED 
(
	[ParticipantID] ASC,
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 2/9/2020 2:26:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([ID], [Title], [ReleaseDate], [RottenTomatoesRating], [RottenTomatoesAudienceScore]) VALUES (1, N'Avengers Endgame', CAST(N'2019-04-26T00:00:00.000' AS DateTime), CAST(0.94 AS Decimal(3, 2)), CAST(0.90 AS Decimal(3, 2)))
INSERT [dbo].[Movie] ([ID], [Title], [ReleaseDate], [RottenTomatoesRating], [RottenTomatoesAudienceScore]) VALUES (2, N'John Wick: Chapter 3 - Parabellum', CAST(N'2019-05-09T00:00:00.000' AS DateTime), CAST(0.90 AS Decimal(3, 2)), CAST(0.86 AS Decimal(3, 2)))
INSERT [dbo].[Movie] ([ID], [Title], [ReleaseDate], [RottenTomatoesRating], [RottenTomatoesAudienceScore]) VALUES (3, N'Toy Story 4', CAST(N'2019-06-21T00:00:00.000' AS DateTime), CAST(0.97 AS Decimal(3, 2)), CAST(0.94 AS Decimal(3, 2)))
INSERT [dbo].[Movie] ([ID], [Title], [ReleaseDate], [RottenTomatoesRating], [RottenTomatoesAudienceScore]) VALUES (4, N'Joker', CAST(N'2019-10-04T00:00:00.000' AS DateTime), CAST(0.68 AS Decimal(3, 2)), CAST(0.88 AS Decimal(3, 2)))
INSERT [dbo].[Movie] ([ID], [Title], [ReleaseDate], [RottenTomatoesRating], [RottenTomatoesAudienceScore]) VALUES (5, N'Ad Astra', CAST(N'2019-09-20T00:00:00.000' AS DateTime), CAST(0.84 AS Decimal(3, 2)), CAST(0.40 AS Decimal(3, 2)))
INSERT [dbo].[Movie] ([ID], [Title], [ReleaseDate], [RottenTomatoesRating], [RottenTomatoesAudienceScore]) VALUES (6, N'Captain Marvel', CAST(N'2019-03-08T00:00:00.000' AS DateTime), CAST(0.78 AS Decimal(3, 2)), CAST(0.49 AS Decimal(3, 2)))
SET IDENTITY_INSERT [dbo].[Movie] OFF
SET IDENTITY_INSERT [dbo].[Participant] ON 

INSERT [dbo].[Participant] ([ID], [FirstName], [LastName]) VALUES (1, N'Angel', N'Claudio')
INSERT [dbo].[Participant] ([ID], [FirstName], [LastName]) VALUES (2, N'Daniel', N'Rivera')
INSERT [dbo].[Participant] ([ID], [FirstName], [LastName]) VALUES (3, N'London', N'Ferrer')
INSERT [dbo].[Participant] ([ID], [FirstName], [LastName]) VALUES (4, N'Rose', N'Burnell')
INSERT [dbo].[Participant] ([ID], [FirstName], [LastName]) VALUES (5, N'John', N'Smith')
INSERT [dbo].[Participant] ([ID], [FirstName], [LastName]) VALUES (6, N'Jane', N'Smith')
INSERT [dbo].[Participant] ([ID], [FirstName], [LastName]) VALUES (7, N'Angie', N'Abreu')
INSERT [dbo].[Participant] ([ID], [FirstName], [LastName]) VALUES (8, N'Amy', N'Thompson')
INSERT [dbo].[Participant] ([ID], [FirstName], [LastName]) VALUES (9, N'Denys', N'Michell')
INSERT [dbo].[Participant] ([ID], [FirstName], [LastName]) VALUES (10, N'Layla', N'Quinones')
SET IDENTITY_INSERT [dbo].[Participant] OFF
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (1, 4, 1)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (1, 4, 2)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (1, NULL, 3)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (1, 3, 4)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (1, 5, 5)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (1, 3, 6)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (2, 5, 1)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (2, 5, 2)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (2, NULL, 3)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (2, 4, 4)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (2, 2, 5)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (2, 2, 6)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (3, 4, 1)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (3, 4, 2)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (3, 4, 3)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (3, 4, 4)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (3, 3, 5)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (3, 3, 6)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (4, 5, 1)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (4, 4, 2)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (4, 5, 3)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (4, 4, 4)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (4, 2, 5)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (4, 3, 6)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (5, 5, 1)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (5, 5, 2)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (5, 5, 3)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (5, 3, 4)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (5, 2, 5)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (5, 2, 6)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (6, 5, 1)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (6, 5, 2)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (6, NULL, 3)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (6, 4, 4)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (6, 2, 5)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (6, 2, 6)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (7, 4, 1)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (7, 4, 2)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (7, 4, 3)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (7, 4, 4)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (7, 3, 5)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (7, 3, 6)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (8, 5, 1)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (8, 4, 2)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (8, 5, 3)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (8, 4, 4)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (8, 2, 5)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (8, 3, 6)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (9, 5, 1)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (9, 5, 2)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (9, 5, 3)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (9, 3, 4)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (9, 2, 5)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (9, 2, 6)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (10, 5, 1)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (10, 5, 2)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (10, 5, 3)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (10, 3, 4)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (10, 2, 5)
INSERT [dbo].[ParticipantRating] ([ParticipantID], [RatingID], [MovieID]) VALUES (10, 2, 6)
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([ID], [Description], [Value]) VALUES (1, N'1 Star', 1)
INSERT [dbo].[Rating] ([ID], [Description], [Value]) VALUES (2, N'2 Stars', 2)
INSERT [dbo].[Rating] ([ID], [Description], [Value]) VALUES (3, N'3 Stars', 3)
INSERT [dbo].[Rating] ([ID], [Description], [Value]) VALUES (4, N'4 Stars', 4)
INSERT [dbo].[Rating] ([ID], [Description], [Value]) VALUES (5, N'5 Stars', 5)
SET IDENTITY_INSERT [dbo].[Rating] OFF
ALTER TABLE [dbo].[ParticipantRating]  WITH CHECK ADD  CONSTRAINT [FK_ParticipantRating_Movie] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[ParticipantRating] CHECK CONSTRAINT [FK_ParticipantRating_Movie]
GO
ALTER TABLE [dbo].[ParticipantRating]  WITH CHECK ADD  CONSTRAINT [FK_ParticipantRating_Participant] FOREIGN KEY([ParticipantID])
REFERENCES [dbo].[Participant] ([ID])
GO
ALTER TABLE [dbo].[ParticipantRating] CHECK CONSTRAINT [FK_ParticipantRating_Participant]
GO
ALTER TABLE [dbo].[ParticipantRating]  WITH CHECK ADD  CONSTRAINT [FK_ParticipantRating_Rating] FOREIGN KEY([RatingID])
REFERENCES [dbo].[Rating] ([ID])
GO
ALTER TABLE [dbo].[ParticipantRating] CHECK CONSTRAINT [FK_ParticipantRating_Rating]
GO
USE [master]
GO
ALTER DATABASE [RottenApples] SET  READ_WRITE 
GO
