USE [master]
GO
/****** Object:  Database [JOBPORTAL_NEW]    Script Date: 12/20/2023 10:55:52 PM ******/
CREATE DATABASE [JOBPORTAL_NEW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JOB PORTAL 3', FILENAME = N'D:\App_Data\JOB PORTAL 3.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JOB PORTAL 3_log', FILENAME = N'D:\App_Data\JOB PORTAL 3_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JOBPORTAL_NEW] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JOBPORTAL_NEW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JOBPORTAL_NEW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET ARITHABORT OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET  MULTI_USER 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JOBPORTAL_NEW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [JOBPORTAL_NEW] SET DELAYED_DURABILITY = DISABLED 
GO
USE [JOBPORTAL_NEW]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 12/20/2023 10:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[Id] [int] NOT NULL,
	[FullName] [text] NULL,
	[Email] [text] NULL,
	[Phone] [text] NULL,
	[Message] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employer]    Script Date: 12/20/2023 10:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employer](
	[EmployerId] [int] IDENTITY(1,1) NOT NULL,
	[EmployerUsername] [varchar](100) NOT NULL,
	[EmployerName] [varchar](100) NOT NULL,
	[EmployerContactNo] [varchar](100) NOT NULL,
	[EmployerEmail] [varchar](100) NOT NULL,
	[EmployerPassword] [varchar](100) NOT NULL,
	[ProfilePictureName] [text] NULL,
	[CompanyName] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployerSelectsSeeker]    Script Date: 12/20/2023 10:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployerSelectsSeeker](
	[EmployerSelectsSeekerID] [int] IDENTITY(1,1) NOT NULL,
	[EmployerId] [int] NULL,
	[JobSeekerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployerSelectsSeekerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 12/20/2023 10:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[JobName] [varchar](100) NOT NULL,
	[JobRequirements] [varchar](300) NOT NULL,
	[JobDescription] [varchar](300) NOT NULL,
	[JobPosition] [varchar](100) NOT NULL,
	[JobLocation] [varchar](100) NOT NULL,
	[JobSalary] [money] NULL,
	[JobWorkingHour] [float] NOT NULL,
	[EmployerId] [int] NOT NULL,
	[JobCategoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobAppoinment]    Script Date: 12/20/2023 10:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobAppoinment](
	[JobAppoinmentID] [int] IDENTITY(1,1) NOT NULL,
	[JobID] [int] NOT NULL,
	[JobSeekerId] [int] NULL,
	[EmployerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[JobAppoinmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobCategory]    Script Date: 12/20/2023 10:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobCategory](
	[JobCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[JobCategoryName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JobCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobSeeked]    Script Date: 12/20/2023 10:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSeeked](
	[JobSeekedID] [int] IDENTITY(1,1) NOT NULL,
	[JobSeekerId] [int] NULL,
	[JobID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JobSeekedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobSeeker]    Script Date: 12/20/2023 10:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSeeker](
	[JobSeekerId] [int] IDENTITY(1,1) NOT NULL,
	[JobSeekerUsername] [varchar](100) NOT NULL,
	[JobSeekerName] [varchar](100) NOT NULL,
	[JobSeekerContactNo] [varchar](100) NOT NULL,
	[JobSeekerEmail] [varchar](100) NOT NULL,
	[JobSeekerPassword] [varchar](100) NOT NULL,
	[EmployerId] [int] NOT NULL,
	[EducationalQualification] [text] NULL,
	[ResumeFileName] [text] NULL,
	[ProfilePictureName] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[JobSeekerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resume]    Script Date: 12/20/2023 10:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resume](
	[ResumeId] [int] IDENTITY(1,1) NOT NULL,
	[ResumePath] [text] NULL,
	[ResumeUploadDate] [date] NOT NULL,
	[ResumeLastModifiedDate] [date] NULL,
	[JobSeekerId] [int] NOT NULL,
	[CvFile] [varbinary](max) NULL,
	[CvFileText] [text] NULL,
	[CvFileName] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ResumeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 12/20/2023 10:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[Id] [int] NOT NULL,
	[Full Name] [text] NULL,
	[Email] [text] NULL,
	[Phone] [text] NULL,
	[Message] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ContactUs] ([Id], [FullName], [Email], [Phone], [Message]) VALUES (0, N'asf', N'1tra@sdgg.com', N'asgg', N'jjh')
GO
SET IDENTITY_INSERT [dbo].[Employer] ON 

INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (1, N'Faisal', N'Faisal Ahmed', N'1111111', N'faisalrtlsnk@gmail.com', N'fickle', N'person_4.jpg', N'Beximco')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (2, N'Tahmeed', N'Tahmeed Asaad', N'222222', N'tahmeed@gmail.com', N'tahmeed', N'person_4.jpg', N'Aristopharma')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (3, N'Saad', N'Saad Chowdhury', N'33333312', N'saad@gmail.com', N'saad', N'0.jpg', N'ACI')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (4, N'Kevin', N'Kevin Owens', N'444444', N'ko@gmail.com', N'keven', NULL, N'NAVANA')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (5, N'Tamim', N'Tamim', N'555555', N'tamim@gmail.com', N'tamim', NULL, N'BASHUNDHARA')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (6, N'GoribIshrak123', N'Cristiano Ronaldo11', N'233411', N'cr@goal.com', N'1234', NULL, N'SQUARE')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (7, N'KAKA', N'Lionel Messi', N'23341144', N'lm@barca.com', N'12345', N'person_2.jpg', N'PARTEX')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (8, N'austin', N'Stone Cold Steve Austin', N'1234', N'austin@gmail.com', N'1234', NULL, N'UNILEVER')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (9, N'Rattlesnake', N'Austin', N'1234', N'rattlesnake@gmail.com', N'1234', NULL, N'Nestle')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (10, N's', N's', N'1234', N's@gmail.com', N'1234', NULL, N'Chevron')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (11, N'Kazi', N'Kazi Nayeer', N'016805998081', N'kazi@gmail.com', N'1234', NULL, N'Standard Chartered')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (12, N'aj', N'aj', N'1234', N'aj@gmail.com', N'1234', NULL, N'Grameenphone')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (13, N'123', N'afa', N'afa', N'qwrfq', N'sgsaga', NULL, N'HSBC')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (14, N'dybala', N'paulo dybala', N'1333', N'lm@barca.com', N'1234', NULL, N'Microsoft')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (18, N'Paulo', N'Dybala', N'pd10', N'lm@barca.com', N'1234', N'11.jpg', N'Google')
INSERT [dbo].[Employer] ([EmployerId], [EmployerUsername], [EmployerName], [EmployerContactNo], [EmployerEmail], [EmployerPassword], [ProfilePictureName], [CompanyName]) VALUES (19, N'Umesh', N'shomesh', N'9840063881', N'shomeshverma@gmail.com', N'123', N'face1.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Employer] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployerSelectsSeeker] ON 

INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (1, 2, 11)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (2, 2, 11)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (4, 2, 6)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (5, 2, 5)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (6, 2, 10)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (7, 2, 11)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (8, 3, 5)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (9, 3, 8)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (10, 3, 9)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (11, 1, 1)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (12, 1, 4)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (13, 1, 9)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (14, 4, 13)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (15, 4, 12)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (16, 4, 11)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (17, 5, 4)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (18, 5, 2)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (19, 11, 7)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (20, 11, 11)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (21, 11, 1)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (23, 2, 12)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (25, 1, 3)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (27, 1, 1)
INSERT [dbo].[EmployerSelectsSeeker] ([EmployerSelectsSeekerID], [EmployerId], [JobSeekerId]) VALUES (28, 1, 1)
SET IDENTITY_INSERT [dbo].[EmployerSelectsSeeker] OFF
GO
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (1, N'Graphics Designer', N'Graphics Designer', N'Graphics Designer', N'Graphics Designer', N'Dhanmondi', 24000.0000, 8, 1, 1)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (2, N'Font-end Developer', N'Font-end Developer', N'Font-end Developer', N'Font-end Developer', N'Uttora', 30000.0000, 8, 2, 2)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (3, N'Back-end Developer', N'Back-end Designer', N'Back-end Designer', N'Back-end Designer', N'Mohammodpur', 40000.0000, 7, 3, 3)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (4, N'Accountant', N'Accountant', N'Accountant', N'Accountant', N'Gulshan', 350000.0000, 6, 4, 4)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (5, N'Medical Assistant', N'Medical Assistant', N'Medical Assistant', N'Medical Assistant', N'DMC', 15000.0000, 6, 5, 5)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (6, N'Accounting Clerk', N'B.Sc. in Accounting', N'ABCD', N'Clerk', N'1901 Gateway Dr #200, Irving, TX 75038, USA', 24400.0000, 6, 1, 1)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (7, N'Bus Driver', N'ABC', N'Join Transdev at Loudoun County (located in Leesburg, VA) and become a part of the largest private-sector operator of transportation in North America – one that cares about its employees, passengers ...', N'Junior Driver', N' 720 E. Butterfield Rd. Suite 300 Lombard, IL 60148', 12345.0000, 12, 3, 15)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (13, N'Accounting Clerk12', N'B.Sc. in Accounting', N'They are looking for this candidate to support the Accounting department, and grow with the organization. They are specifically looking for candidates who are eager and motivated to learn.', N'12441', N' 720 E. Butterfield Rd. Suite 300 Lombard, IL 60148', 12.0000, 3, 5, 8)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (18, N'Department Manager', N'B.Sc. in Accounting', N'Department Managers oversee the functioning and productivity of a company division.', N'Full Time', N'42,Khilgaon', 1423.0000, 1, 3, 1)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (26, N'Accounting Clerk12', N'B.Sc. in Accounting', N'They are looking for this candidate to support the Accounting department, and grow with the organization. They are specifically looking for candidates who are eager and motivated to learn.', N'etasg', N' 720 E. Butterfield Rd. Suite 300 Lombard, IL 60148', 1423.0000, 12, 3, 8)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (27, N'Bus Driver123', N'B.Sc. in Accounting', N'They are looking for this candidate to support the Accounting department, and grow with the organization. They are specifically looking for candidates who are eager and motivated to learn.', N'14', N' 720 E. Butterfield Rd. Suite 300 Lombard, IL 60148', 1423.0000, 14, 4, 11)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (28, N'Bus Driver123', N'B.Sc. in Accounting', N'They are looking for this candidate to support the Accounting department, and grow with the organization. They are specifically looking for candidates who are eager and motivated to learn.', N'14', N' 720 E. Butterfield Rd. Suite 300 Lombard, IL 60148', 1423.0000, 14, 2, 11)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (30, N'Data Entry Clerks', N'B.Sc. in Accounting', N'Data Entry Clerks gather data and capture the information into databases. This may include gathering documents from various sources. This may also include extracting information from these materials, capturing data into databases and storing hard copies.', N'Senior', N' 720 E. Butterfield Rd. Suite 300 Lombard, IL 60148', 1423.0000, 3, 3, 1)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (31, N'Accounting Clerk', N'B.Sc. in Accounting', N'They are looking for this candidate to support the Accounting department, and grow with the organization. They are specifically looking for candidates who are eager and motivated to learn.', N'14', N' 720 E. Butterfield Rd. Suite 300 Lombard, IL 60148', 2213.0000, 14, 2, 1)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (32, N'Bus Driver123', N'B.Sc. in Accounting', N'They are looking for this candidate to support the Accounting department, and grow with the organization. They are specifically looking for candidates who are eager and motivated to learn.', N'14', N' 720 E. Butterfield Rd. Suite 300 Lombard, IL 60148', 1423.0000, 1, 1, 1)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (35, N'Documentation Specialist', N'B.Sc. in Accounting', N'Documentation Specialists are administrative workers who manage office documents. Their primary responsibilities include organizing an archiving system, retrieving documents upon request and outlining a long-term storage strategy.', N'CEO', N'43,Niketon', 142322.0000, 2, 3, 14)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (36, N'Software Engineer', N'B.Sc. in CSE', N'ABCD', N'Junior Engineer', N'Adabor,Mohammadpur', 70000.0000, 6, 1, 2)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (37, N'Teacher', N'Honours', N'ABCDERF', N'Senior Teacher', N'Dhanmondi', 40000.0000, 7, 2, 5)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (38, N'Bank Officer', N'Honours', N'Count Money', N'Junior Banker', N'Tejgaon', 12000.0000, 12, 1, 7)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (39, N'Android Development', N'Minimun 1 month of experience of android development', N'Full Time', N'Junior Developer', N'Dhaka', 22000000.0000, 2, 3, 2)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (41, N'Project Manager', N'B.Sc. in Accounting', N'Part Time', N'Chief Executive', N'Khilgaon,Badda,Rampura', 40000.0000, 14, 3, 8)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (42, N'fk', N'fk', N'dkf', N'dkf', N'dkfj', 12.0000, 12, 1, 1)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (43, N'kfkd', N'dfj', N'dfk', N'dfk', N'd', 3.0000, 4, 1, 10)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (44, N'a', N'a', N'a', N'a', N'Adabor,Mohammadpur', 112.0000, 1, 2, 5)
INSERT [dbo].[Job] ([JobId], [JobName], [JobRequirements], [JobDescription], [JobPosition], [JobLocation], [JobSalary], [JobWorkingHour], [EmployerId], [JobCategoryId]) VALUES (45, N'Accountant', N'SLC', N'Test', N'Jubnio', N'Chabhail', 10000.0000, 2, 19, 1)
SET IDENTITY_INSERT [dbo].[Job] OFF
GO
SET IDENTITY_INSERT [dbo].[JobCategory] ON 

INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (1, N'Accounting')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (2, N'Software Development')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (3, N'Goverment')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (4, N'Healtcare')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (5, N'Office and Admin Support')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (6, N'Executive')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (7, N'Banking')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (8, N'Finance')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (9, N'Franchise')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (10, N'Human Resouce')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (11, N'Part time')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (12, N'Retail')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (13, N'Sales and Marketing')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (14, N'Science and Biotech')
INSERT [dbo].[JobCategory] ([JobCategoryId], [JobCategoryName]) VALUES (15, N'Transportation')
SET IDENTITY_INSERT [dbo].[JobCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[JobSeeked] ON 

INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (2, 12, 1)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (3, 12, 5)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (4, 12, 6)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (5, 13, 36)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (6, 13, 37)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (7, 1, 3)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (8, 1, 5)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (9, 2, 13)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (10, 2, 26)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (11, 3, 37)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (12, 3, 36)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (13, 3, 35)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (14, 4, 30)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (15, 4, 31)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (16, 13, 27)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (17, 23, 1)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (18, 23, 36)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (19, 11, 37)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (21, 12, 1)
INSERT [dbo].[JobSeeked] ([JobSeekedID], [JobSeekerId], [JobID]) VALUES (22, 12, 5)
SET IDENTITY_INSERT [dbo].[JobSeeked] OFF
GO
SET IDENTITY_INSERT [dbo].[JobSeeker] ON 

INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (1, N'Nabil', N'Sifat Nabil', N'11111110', N'sifatnabil@gmail.com', N'nabil', 1, N'Phd in Mathematics', N'Lecture 12 - Sequence Diagram.pdf', N'21.jpg')
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (2, N'Dipta', N'Dipta Das', N'2222220', N'dipta@gmail.com', N'dipta', 2, N'M.phill in Java', N'Lecture 13.1 - From Entity Relationship (ER) Diagram to Relational Model (SQL).pdf', NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (3, N'Arnob', N'Sanzam Syed', N'3333330', N'arnob@gmail.com', N'arnob', 3, N'M.Sc. in Psychology', N'Lecture 07 - Object Oriented Programming (OOP) Concepts.pdf', NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (4, N'Anim', N'Anim Chowdhury', N'4444440', N'anim@gmail.com', N'anim', 4, N'M.Sc. in EEE', N'Lecture 03 - Feasibility Analysis.pdf', NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (5, N'Tonmoy', N'Tonmoy Debnath', N'5555550', N'tonmoy@gmail.com', N'tonmoy', 5, N'B.Sc. in CSE', N'Lecture 10 - Class Diagram.pdf', NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (6, N'NotAwkwardNayeer', N'Abdul', N'12345', N'ninjaturtle@gmail.com', N'12345', 1, N'Bachelors in Business', N'Lecture 02 - Requirement Engineering.pdf', NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (7, N'NJ10', N'Abdul Rahim', N'12345', N'fs@af.com', N'2345', 1, N'Diploma in Acquisition and Contract Management', N'Lecture 11 - Object Diagram.pdf', NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (8, N'seth', N'Seth Rollins', N'1234', N'seth@gmail.com', N'1234', 1, N'BBA - Entrepreneurship', N'Lecture 02 - Requirement Engineering.pdf', NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (9, N'faisal', N'Faisal Ahmed', N'1234', N'faisalrtlsnk@gmail.com', N'1234', 1, N'BBA - Management Concentration', N'Lecture 10 - Class Diagram.pdf', NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (10, N'sabit', N'sabit vai', N'1234', N'sabit@gmail.com', N'1234', 1, N'MBA - Management Concentration', N'Lecture 09 - Use Case Example - Online Occasional Gift Shopping.pdf', NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (11, N'Dracarys', N'Daenerys Targaryean', N'244122', N'khaleesi@motherofdragons.com', N'drogon', 1, N'Jack Welch Executive Master of Business Administration', N'Lecture 02 - Requirement Engineering.pdf', N'tenor.gif')
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (12, N'Littlefinger', N'Lord Petyr Baelish', N'12414', N'chaosisaladder@sansa.com', N'catelyn', 1, N'MS in Criminal Justice', N'Lab 1.pptx', N'1504092155-littlefinger.gif')
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (13, N'Half-Man', N'Tyrion Lannister', N'123823452', N'imp@casterlyrock.com', N'1234', 1, N'MEd in Curriculum & Instruction - Leadership', N'Lecture 12 - Sequence Diagram.pdf', N'3qZ2McT.gif')
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (23, N'KingSlayer', N'Jaime Lannister', N'12345', N'oneHand@gmail.com', N'1234', 1, N'Phd in Mixed Martail Arts', NULL, N'220px-Nikolaj-Coster-Waldau-Game-of-Thrones.jpg')
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (24, N'Aj', N'aj', N'1234', N'aj@gmail.com', N'1234', 1, N'Master of Professional Studies in Information Technology Management', NULL, NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (25, N'tt', N'tt', N'1234', N'tt@gmail.com', N'1234', 1, N'Information Technologies and Network Systems (Bachelor''s)', NULL, NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (26, N'gg', N'gg', N'1234', N'g@gmail.com', N'1234', 1, N'Master of Science in Marketing Analytics', NULL, NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (27, N'y', N'y', N'1234', N'y@gmail.com', N'1234', 1, N'Diploma in Acquisition and Contract Management', NULL, NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (28, N'h', N'h', N'1234', N'tahmeed@gmail.com', N'1234', 1, N'Master of Professional Studies in Cybersecurity Management', NULL, NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (30, N'Shomesh', N'Shomesh', N'12345', N'affsf@af.com', N'123', 1, N'MS in Psychology - Forensic Psychology', NULL, NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (31, N'Nabil1', N'Faisal Khan', N'12414', N'affsf@af.com', N'1234', 1, N'AAS in Legal Support and Services', NULL, NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (32, N'Nabil123', N'Faisal Ahmed', N'12345', N'asf@af.com', N'1234', 1, N'DNP - Doctor of Nursing Practice', NULL, NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (33, N'Half-Man123', N'Jaime Lannister', N'244122', N'oneHand@gmail.com', N'12345', 1, N'BA in Communication Studies', NULL, NULL)
INSERT [dbo].[JobSeeker] ([JobSeekerId], [JobSeekerUsername], [JobSeekerName], [JobSeekerContactNo], [JobSeekerEmail], [JobSeekerPassword], [EmployerId], [EducationalQualification], [ResumeFileName], [ProfilePictureName]) VALUES (34, N'Half-Man1234', N'Jaime Lannister', N'244122', N'oneHand@gmail.com', N'3432', 1, N'AS in Psychology', NULL, NULL)
SET IDENTITY_INSERT [dbo].[JobSeeker] OFF
GO
SET IDENTITY_INSERT [dbo].[Resume] ON 

INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (1, N'E', CAST(N'2016-08-08' AS Date), NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (2, N'D', CAST(N'2017-05-05' AS Date), NULL, 4, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (3, N'E', CAST(N'2018-04-28' AS Date), NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (4, N'C', CAST(N'2008-02-15' AS Date), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (5, N'D', CAST(N'2013-05-19' AS Date), NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (6, N'rrts', CAST(N'2019-03-29' AS Date), NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (7, N'rrts563', CAST(N'2019-03-29' AS Date), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (8, N'eereq', CAST(N'2019-03-29' AS Date), NULL, 11, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (9, N'ggdsa', CAST(N'2019-03-29' AS Date), NULL, 12, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (10, N'h', CAST(N'2019-03-29' AS Date), NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (11, N'u', CAST(N'2019-03-29' AS Date), NULL, 11, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (12, N'rrts', CAST(N'2001-02-02' AS Date), NULL, 11, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (13, N'rrts', CAST(N'2011-02-02' AS Date), NULL, 11, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (14, N'rrts', CAST(N'2001-02-02' AS Date), NULL, 11, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (15, N'u', CAST(N'2011-02-02' AS Date), NULL, 6, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (16, N'rc', CAST(N'2001-02-02' AS Date), NULL, 4, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (17, N'n', CAST(N'2011-02-02' AS Date), NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (18, NULL, CAST(N'2011-02-02' AS Date), NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (19, NULL, CAST(N'2019-03-29' AS Date), NULL, 11, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (20, NULL, CAST(N'2019-03-29' AS Date), NULL, 12, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (21, NULL, CAST(N'2019-03-29' AS Date), NULL, 12, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (22, NULL, CAST(N'2019-04-01' AS Date), NULL, 13, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (23, NULL, CAST(N'2019-04-01' AS Date), NULL, 11, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (24, NULL, CAST(N'2019-04-04' AS Date), NULL, 11, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C7365617263685F75736572206D79206F6E652E747874, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\search_user my one.txt', N'search_user my one.txt')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (25, NULL, CAST(N'2019-04-04' AS Date), NULL, 11, NULL, NULL, NULL)
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (26, NULL, CAST(N'2019-04-04' AS Date), NULL, 12, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C616220312E70707478, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lab 1.pptx', N'Lab 1.pptx')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (27, NULL, CAST(N'2019-04-04' AS Date), NULL, 13, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203031202D20496E74726F64756374696F6E2E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 01 - Introduction.pdf', N'Lecture 01 - Introduction.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (28, NULL, CAST(N'2019-04-04' AS Date), NULL, 13, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C434841505445522038204D41494E204D454D4F52592E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\CHAPTER 8 MAIN MEMORY.pdf', N'CHAPTER 8 MAIN MEMORY.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (29, NULL, CAST(N'2019-04-04' AS Date), NULL, 13, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C434841505445522038204D41494E204D454D4F52592E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\CHAPTER 8 MAIN MEMORY.pdf', N'CHAPTER 8 MAIN MEMORY.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (30, NULL, CAST(N'2019-04-04' AS Date), NULL, 8, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203032202D20526571756972656D656E7420456E67696E656572696E672E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 02 - Requirement Engineering.pdf', N'Lecture 02 - Requirement Engineering.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (31, NULL, CAST(N'2019-04-04' AS Date), NULL, 3, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203037202D204F626A656374204F7269656E7465642050726F6772616D6D696E6720284F4F502920436F6E63657074732E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 07 - Object Oriented Programming (OOP) Concepts.pdf', N'Lecture 07 - Object Oriented Programming (OOP) Concepts.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (32, NULL, CAST(N'2019-04-04' AS Date), NULL, 13, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203130202D20436C617373204469616772616D2E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 10 - Class Diagram.pdf', N'Lecture 10 - Class Diagram.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (33, NULL, CAST(N'2019-04-05' AS Date), NULL, 1, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C556E6976657273697479204D616E6167656D656E742053797374656D202D20526571756972656D656E74732053706563696669636174696F6E2053616D706C652E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\University Management System - Requirements Specification Sample.pdf', N'University Management System - Requirements Specification Sample.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (34, NULL, CAST(N'2019-04-05' AS Date), NULL, 2, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C6563747572652031332E31202D2046726F6D20456E746974792052656C6174696F6E736869702028455229204469616772616D20746F2052656C6174696F6E616C204D6F64656C202853514C292E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 13.1 - From Entity Relationship (ER) Diagram to Relational Model (SQL).pdf', N'Lecture 13.1 - From Entity Relationship (ER) Diagram to Relational Model (SQL).pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (35, NULL, CAST(N'2019-04-05' AS Date), NULL, 4, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203033202D20466561736962696C69747920416E616C797369732E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 03 - Feasibility Analysis.pdf', N'Lecture 03 - Feasibility Analysis.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (36, NULL, CAST(N'2019-04-05' AS Date), NULL, 5, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203130202D20436C617373204469616772616D2E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 10 - Class Diagram.pdf', N'Lecture 10 - Class Diagram.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (37, NULL, CAST(N'2019-04-05' AS Date), NULL, 6, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203032202D20526571756972656D656E7420456E67696E656572696E672E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 02 - Requirement Engineering.pdf', N'Lecture 02 - Requirement Engineering.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (38, NULL, CAST(N'2019-04-05' AS Date), NULL, 9, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203130202D20436C617373204469616772616D2E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 10 - Class Diagram.pdf', N'Lecture 10 - Class Diagram.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (39, NULL, CAST(N'2019-04-05' AS Date), NULL, 10, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203039202D205573652043617365204578616D706C65202D204F6E6C696E65204F63636173696F6E616C20476966742053686F7070696E672E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 09 - Use Case Example - Online Occasional Gift Shopping.pdf', N'Lecture 09 - Use Case Example - Online Occasional Gift Shopping.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (40, NULL, CAST(N'2019-04-05' AS Date), NULL, 7, 0x453A5C332E325C5344204C41425C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203131202D204F626A656374204469616772616D2E706466, N'E:\3.2\SD LAB\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 11 - Object Diagram.pdf', N'Lecture 11 - Object Diagram.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (41, NULL, CAST(N'2019-04-06' AS Date), NULL, 11, 0x453A5C6368726F6D6520646F776E6C6F6164735C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203037202D204F626A656374204F7269656E7465642050726F6772616D6D696E6720284F4F502920436F6E63657074732E706466, N'E:\chrome downloads\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 07 - Object Oriented Programming (OOP) Concepts.pdf', N'Lecture 07 - Object Oriented Programming (OOP) Concepts.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (42, NULL, CAST(N'2019-04-10' AS Date), NULL, 13, 0x453A5C5344204C4142204D56435C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203132202D2053657175656E6365204469616772616D2E706466, N'E:\SD LAB MVC\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 12 - Sequence Diagram.pdf', N'Lecture 12 - Sequence Diagram.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (43, NULL, CAST(N'2019-04-10' AS Date), NULL, 1, 0x453A5C5344204C4142204D56435C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203037202D204F626A656374204F7269656E7465642050726F6772616D6D696E6720284F4F502920436F6E63657074732E706466, N'E:\SD LAB MVC\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 07 - Object Oriented Programming (OOP) Concepts.pdf', N'Lecture 07 - Object Oriented Programming (OOP) Concepts.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (44, NULL, CAST(N'2019-04-10' AS Date), NULL, 1, 0x453A5C5344204C4142204D56435C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203132202D2053657175656E6365204469616772616D2E706466, N'E:\SD LAB MVC\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 12 - Sequence Diagram.pdf', N'Lecture 12 - Sequence Diagram.pdf')
INSERT [dbo].[Resume] ([ResumeId], [ResumePath], [ResumeUploadDate], [ResumeLastModifiedDate], [JobSeekerId], [CvFile], [CvFileText], [CvFileName]) VALUES (45, NULL, CAST(N'2019-04-11' AS Date), NULL, 11, 0x453A5C5344204C4142204D564320315C326E64205375626D697373696F6E5C46414953414C2044455349474E45442041424F5554205553204241434B55505C46414953414C2044455349474E45442041424F55542055535C4A4F42504F5254414C5C4A4F42504F5254414C5C435646494C455C4C656374757265203032202D20526571756972656D656E7420456E67696E656572696E672E706466, N'E:\SD LAB MVC 1\2nd Submission\FAISAL DESIGNED ABOUT US BACKUP\FAISAL DESIGNED ABOUT US\JOBPORTAL\JOBPORTAL\CVFILE\Lecture 02 - Requirement Engineering.pdf', N'Lecture 02 - Requirement Engineering.pdf')
SET IDENTITY_INSERT [dbo].[Resume] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employer__7F3B085B023D5A04]    Script Date: 12/20/2023 10:55:52 PM ******/
ALTER TABLE [dbo].[Employer] ADD UNIQUE NONCLUSTERED 
(
	[EmployerUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__JobSeeke__5D73789108EA5793]    Script Date: 12/20/2023 10:55:52 PM ******/
ALTER TABLE [dbo].[JobSeeker] ADD UNIQUE NONCLUSTERED 
(
	[JobSeekerUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Resume] ADD  DEFAULT ((0)) FOR [CvFile]
GO
ALTER TABLE [dbo].[EmployerSelectsSeeker]  WITH CHECK ADD FOREIGN KEY([EmployerId])
REFERENCES [dbo].[Employer] ([EmployerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployerSelectsSeeker]  WITH CHECK ADD FOREIGN KEY([JobSeekerId])
REFERENCES [dbo].[JobSeeker] ([JobSeekerId])
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD FOREIGN KEY([EmployerId])
REFERENCES [dbo].[Employer] ([EmployerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD FOREIGN KEY([JobCategoryId])
REFERENCES [dbo].[JobCategory] ([JobCategoryId])
GO
ALTER TABLE [dbo].[JobAppoinment]  WITH CHECK ADD FOREIGN KEY([EmployerId])
REFERENCES [dbo].[Employer] ([EmployerId])
GO
ALTER TABLE [dbo].[JobAppoinment]  WITH CHECK ADD FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobAppoinment]  WITH CHECK ADD FOREIGN KEY([JobSeekerId])
REFERENCES [dbo].[JobSeeker] ([JobSeekerId])
GO
ALTER TABLE [dbo].[JobSeeked]  WITH CHECK ADD FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobId])
GO
ALTER TABLE [dbo].[JobSeeked]  WITH CHECK ADD FOREIGN KEY([JobSeekerId])
REFERENCES [dbo].[JobSeeker] ([JobSeekerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobSeeker]  WITH CHECK ADD FOREIGN KEY([EmployerId])
REFERENCES [dbo].[Employer] ([EmployerId])
GO
ALTER TABLE [dbo].[Resume]  WITH CHECK ADD FOREIGN KEY([JobSeekerId])
REFERENCES [dbo].[JobSeeker] ([JobSeekerId])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[DownloadFile]    Script Date: 12/20/2023 10:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DownloadFile]
(
@ResumeId int
)

As select ResumeID,CvFile From Resume where ResumeId=@ResumeId
GO
/****** Object:  StoredProcedure [dbo].[GetFile]    Script Date: 12/20/2023 10:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFile]
AS
Select ResumeId,CvFile from Resume
GO
USE [master]
GO
ALTER DATABASE [JOBPORTAL_NEW] SET  READ_WRITE 
GO
