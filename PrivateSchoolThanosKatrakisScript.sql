USE [master]
GO
/****** Object:  Database [PrivateSchoolThanosKatrakis]    Script Date: 2/5/2020 2:58:25 AM ******/
CREATE DATABASE [PrivateSchoolThanosKatrakis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PrivateSchoolThanosKatrakis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PrivateSchoolThanosKatrakis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PrivateSchoolThanosKatrakis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PrivateSchoolThanosKatrakis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PrivateSchoolThanosKatrakis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET ARITHABORT OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET  MULTI_USER 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET QUERY_STORE = OFF
GO
USE [PrivateSchoolThanosKatrakis]
GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 2/5/2020 2:58:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment](
	[AssignmentID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Discription] [nvarchar](50) NOT NULL,
	[SubmissionDate] [date] NOT NULL,
	[OralMark] [int] NOT NULL,
	[TotalMark] [int] NOT NULL,
 CONSTRAINT [PK_Assignment] PRIMARY KEY CLUSTERED 
(
	[AssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignmentPerCoursePerStudent]    Script Date: 2/5/2020 2:58:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentPerCoursePerStudent](
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[AssignmentID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2/5/2020 2:58:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Stream] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/5/2020 2:58:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[TuitionFees] [int] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainer]    Script Date: 2/5/2020 2:58:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainer](
	[TrainerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED 
(
	[TrainerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerPerCourse]    Script Date: 2/5/2020 2:58:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerPerCourse](
	[TrainerID] [int] NOT NULL,
	[CourseID] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assignment] ON 

INSERT [dbo].[Assignment] ([AssignmentID], [Title], [Discription], [SubmissionDate], [OralMark], [TotalMark]) VALUES (1, N'Individual Project Part A', N'Design A Basic App Of Your Choise', CAST(N'2020-03-01' AS Date), 30, 100)
INSERT [dbo].[Assignment] ([AssignmentID], [Title], [Discription], [SubmissionDate], [OralMark], [TotalMark]) VALUES (5, N'Individual Project Part B', N'Design Database For your App', CAST(N'2020-06-01' AS Date), 20, 100)
INSERT [dbo].[Assignment] ([AssignmentID], [Title], [Discription], [SubmissionDate], [OralMark], [TotalMark]) VALUES (6, N'Individual Project Part C', N'Design UX/UI For Your App', CAST(N'2020-09-01' AS Date), 40, 100)
INSERT [dbo].[Assignment] ([AssignmentID], [Title], [Discription], [SubmissionDate], [OralMark], [TotalMark]) VALUES (7, N'Individual Project Part D', N'Implement Your App For Different Operating Systems', CAST(N'2020-12-01' AS Date), 20, 100)
SET IDENTITY_INSERT [dbo].[Assignment] OFF
INSERT [dbo].[AssignmentPerCoursePerStudent] ([StudentID], [CourseID], [AssignmentID]) VALUES (1, 2, 1)
INSERT [dbo].[AssignmentPerCoursePerStudent] ([StudentID], [CourseID], [AssignmentID]) VALUES (2, 5, 5)
INSERT [dbo].[AssignmentPerCoursePerStudent] ([StudentID], [CourseID], [AssignmentID]) VALUES (3, 6, 6)
INSERT [dbo].[AssignmentPerCoursePerStudent] ([StudentID], [CourseID], [AssignmentID]) VALUES (4, 7, 7)
INSERT [dbo].[AssignmentPerCoursePerStudent] ([StudentID], [CourseID], [AssignmentID]) VALUES (5, 2, 1)
INSERT [dbo].[AssignmentPerCoursePerStudent] ([StudentID], [CourseID], [AssignmentID]) VALUES (6, 5, 5)
INSERT [dbo].[AssignmentPerCoursePerStudent] ([StudentID], [CourseID], [AssignmentID]) VALUES (7, 6, 6)
INSERT [dbo].[AssignmentPerCoursePerStudent] ([StudentID], [CourseID], [AssignmentID]) VALUES (8, 7, 7)
INSERT [dbo].[AssignmentPerCoursePerStudent] ([StudentID], [CourseID], [AssignmentID]) VALUES (8, 5, 5)
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (2, N'Programming in C# ', N'Full Stack Development', N'Evening Classes', CAST(N'2020-01-01' AS Date), CAST(N'2021-01-01' AS Date))
INSERT [dbo].[Course] ([CourseID], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (5, N'Programming in C# ', N'Full Stack Development', N'Morning Classes', CAST(N'2020-01-01' AS Date), CAST(N'2021-01-01' AS Date))
INSERT [dbo].[Course] ([CourseID], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (6, N'Programming in Java', N'Full Stack Development', N'Evening Classes', CAST(N'2020-01-01' AS Date), CAST(N'2021-01-01' AS Date))
INSERT [dbo].[Course] ([CourseID], [Title], [Stream], [Type], [StartDate], [EndDate]) VALUES (7, N'Programming In Java', N'Full Stack Development', N'Morning Classes', CAST(N'2020-01-01' AS Date), CAST(N'2021-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [TuitionFees], [DateOfBirth]) VALUES (1, N'Thanos', N'Katrakis', 3500, CAST(N'1990-07-09' AS Date))
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [TuitionFees], [DateOfBirth]) VALUES (2, N'Anna', N'Petrou', 3500, CAST(N'1989-08-07' AS Date))
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [TuitionFees], [DateOfBirth]) VALUES (3, N'Eleni', N'Papadopoulou', 3500, CAST(N'2000-05-04' AS Date))
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [TuitionFees], [DateOfBirth]) VALUES (4, N'Lina', N'Saka', 3500, CAST(N'1995-06-03' AS Date))
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [TuitionFees], [DateOfBirth]) VALUES (5, N'Takis', N'Hahamis', 3500, CAST(N'1975-05-05' AS Date))
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [TuitionFees], [DateOfBirth]) VALUES (6, N'Liza', N'Vouleli', 3500, CAST(N'1993-07-09' AS Date))
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [TuitionFees], [DateOfBirth]) VALUES (7, N'Nasos', N'Petrakis', 3500, CAST(N'1997-02-01' AS Date))
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [TuitionFees], [DateOfBirth]) VALUES (8, N'Giorgos', N'Lagos', 7000, CAST(N'1990-04-05' AS Date))
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Trainer] ON 

INSERT [dbo].[Trainer] ([TrainerID], [FirstName], [LastName], [Subject]) VALUES (1, N'Ektoras', N'Gatsos', N'OOP Basics')
INSERT [dbo].[Trainer] ([TrainerID], [FirstName], [LastName], [Subject]) VALUES (2, N'Kostas', N'Strogilos', N'TSQL Databases')
INSERT [dbo].[Trainer] ([TrainerID], [FirstName], [LastName], [Subject]) VALUES (3, N'Kostantinos ', N'Zitis', N'Front End')
INSERT [dbo].[Trainer] ([TrainerID], [FirstName], [LastName], [Subject]) VALUES (4, N'Panagiotis', N'Mpozas', N'MVC')
SET IDENTITY_INSERT [dbo].[Trainer] OFF
INSERT [dbo].[TrainerPerCourse] ([TrainerID], [CourseID]) VALUES (1, 2)
INSERT [dbo].[TrainerPerCourse] ([TrainerID], [CourseID]) VALUES (2, 5)
INSERT [dbo].[TrainerPerCourse] ([TrainerID], [CourseID]) VALUES (3, 6)
INSERT [dbo].[TrainerPerCourse] ([TrainerID], [CourseID]) VALUES (4, 7)
ALTER TABLE [dbo].[AssignmentPerCoursePerStudent]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentPerCoursePerStudent_Assignment] FOREIGN KEY([AssignmentID])
REFERENCES [dbo].[Assignment] ([AssignmentID])
GO
ALTER TABLE [dbo].[AssignmentPerCoursePerStudent] CHECK CONSTRAINT [FK_AssignmentPerCoursePerStudent_Assignment]
GO
ALTER TABLE [dbo].[AssignmentPerCoursePerStudent]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentPerCoursePerStudent_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[AssignmentPerCoursePerStudent] CHECK CONSTRAINT [FK_AssignmentPerCoursePerStudent_Course]
GO
ALTER TABLE [dbo].[AssignmentPerCoursePerStudent]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentPerCoursePerStudent_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[AssignmentPerCoursePerStudent] CHECK CONSTRAINT [FK_AssignmentPerCoursePerStudent_Student]
GO
ALTER TABLE [dbo].[TrainerPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_TrainerPerCourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[TrainerPerCourse] CHECK CONSTRAINT [FK_TrainerPerCourse_Course]
GO
ALTER TABLE [dbo].[TrainerPerCourse]  WITH CHECK ADD  CONSTRAINT [FK_TrainerPerCourse_Trainer] FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainer] ([TrainerID])
GO
ALTER TABLE [dbo].[TrainerPerCourse] CHECK CONSTRAINT [FK_TrainerPerCourse_Trainer]
GO
USE [master]
GO
ALTER DATABASE [PrivateSchoolThanosKatrakis] SET  READ_WRITE 
GO
