USE [master]
GO
/****** Object:  Database [TestBankDB]    Script Date: 7/3/2017 4:15:54 AM ******/
CREATE DATABASE [TestBankDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestBankDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TestBankDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestBankDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TestBankDB_log.ldf' , SIZE = 18240KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TestBankDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestBankDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestBankDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestBankDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestBankDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestBankDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestBankDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestBankDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestBankDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestBankDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestBankDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestBankDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestBankDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestBankDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestBankDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestBankDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestBankDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestBankDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestBankDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestBankDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestBankDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestBankDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestBankDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestBankDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestBankDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestBankDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestBankDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestBankDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestBankDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestBankDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TestBankDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TestBankDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/3/2017 4:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Balance] [decimal](18, 0) NOT NULL CONSTRAINT [DF_Account_Balance]  DEFAULT ((0.0)),
	[Currency] [nvarchar](3) NOT NULL,
	[AccountType] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 7/3/2017 4:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountType] [nvarchar](50) NOT NULL,
	[MinimumBalance] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/3/2017 4:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateofBirth] [date] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[NRIC] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 7/3/2017 4:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TransactionType] [int] NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[CurrentBalance] [decimal](18, 0) NOT NULL,
	[RequestCurrency] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 7/3/2017 4:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Id], [CustomerId], [Balance], [Currency], [AccountType]) VALUES (10001232, 1000138, CAST(1000000 AS Decimal(18, 0)), N'THB', 1)
INSERT [dbo].[Account] ([Id], [CustomerId], [Balance], [Currency], [AccountType]) VALUES (10002313, 1000137, CAST(20 AS Decimal(18, 0)), N'IDR', 2)
INSERT [dbo].[Account] ([Id], [CustomerId], [Balance], [Currency], [AccountType]) VALUES (10002342, 1000136, CAST(0 AS Decimal(18, 0)), N'EUR', 2)
INSERT [dbo].[Account] ([Id], [CustomerId], [Balance], [Currency], [AccountType]) VALUES (10003452, 1000132, CAST(451 AS Decimal(18, 0)), N'SGD', 1)
INSERT [dbo].[Account] ([Id], [CustomerId], [Balance], [Currency], [AccountType]) VALUES (10003467, 1000134, CAST(1243 AS Decimal(18, 0)), N'USD', 2)
INSERT [dbo].[Account] ([Id], [CustomerId], [Balance], [Currency], [AccountType]) VALUES (10003478, 1000135, CAST(0 AS Decimal(18, 0)), N'INR', 1)
SET IDENTITY_INSERT [dbo].[AccountType] ON 

INSERT [dbo].[AccountType] ([Id], [AccountType], [MinimumBalance]) VALUES (1, N'SavingsAccount', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[AccountType] ([Id], [AccountType], [MinimumBalance]) VALUES (2, N'RemittanceAccount', CAST(0 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[AccountType] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [DateofBirth], [Address], [NRIC]) VALUES (1000132, N'Alex', N'Bernard', CAST(N'1989-07-16' AS Date), NULL, N'G2342323N')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [DateofBirth], [Address], [NRIC]) VALUES (1000134, N'Jack', N'Will', CAST(N'1994-09-02' AS Date), NULL, N'H2342344D')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [DateofBirth], [Address], [NRIC]) VALUES (1000135, N'Will', N'Smith', CAST(N'1992-02-02' AS Date), NULL, N'G2342333W')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [DateofBirth], [Address], [NRIC]) VALUES (1000136, N'Jim', N'Maersk', CAST(N'1995-03-03' AS Date), NULL, N'I42434234T')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [DateofBirth], [Address], [NRIC]) VALUES (1000137, N'Ben', N'Adams', CAST(N'2015-01-01' AS Date), NULL, N'Y2342343R')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [DateofBirth], [Address], [NRIC]) VALUES (1000138, N'Sanook', N'Mak', CAST(N'2017-03-07' AS Date), NULL, N'T2343433T')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[TransactionType] ON 

INSERT [dbo].[TransactionType] ([Id], [Type]) VALUES (1, N'Deposit')
INSERT [dbo].[TransactionType] ([Id], [Type]) VALUES (2, N'Withdraw')
SET IDENTITY_INSERT [dbo].[TransactionType] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Type] FOREIGN KEY([AccountType])
REFERENCES [dbo].[AccountType] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Type]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Type] FOREIGN KEY([TransactionType])
REFERENCES [dbo].[TransactionType] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Type]
GO
USE [master]
GO
ALTER DATABASE [TestBankDB] SET  READ_WRITE 
GO
