USE [biblioteca]
GO
/****** Object:  Table [dbo].[BookLoans]    Script Date: 25.04.2025 13:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookLoans](
	[LoanID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NULL,
	[CardID] [int] NULL,
	[EmployeeID] [int] NULL,
	[LoanDate] [date] NOT NULL,
	[ReturnDate] [date] NULL,
	[Status] [nvarchar](20) NULL DEFAULT ('На руках'),
PRIMARY KEY CLUSTERED 
(
	[LoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 25.04.2025 13:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[YearPublished] [int] NULL,
	[ISBN] [nvarchar](20) NULL,
	[DepartmentID] [int] NULL,
	[Available] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 25.04.2025 13:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 25.04.2025 13:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](100) NULL,
	[HireDate] [date] NULL,
	[Password] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LibraryCards]    Script Date: 25.04.2025 13:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibraryCards](
	[CardID] [int] IDENTITY(1,1) NOT NULL,
	[ReaderID] [int] NULL,
	[IssueDate] [date] NOT NULL,
	[ExpiryDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Readers]    Script Date: 25.04.2025 13:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Readers](
	[ReaderID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[Password] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BookLoans] ON 

INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (1, 1, 1, 1, CAST(N'2023-01-15' AS Date), CAST(N'2023-01-29' AS Date), N'Возвращена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (2, 2, 2, 2, CAST(N'2023-02-20' AS Date), CAST(N'2023-03-06' AS Date), N'На руках')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (3, 3, 3, 3, CAST(N'2023-03-25' AS Date), CAST(N'2023-04-25' AS Date), N'Возвращена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (4, 4, 4, 4, CAST(N'2023-04-10' AS Date), CAST(N'2023-04-24' AS Date), N'Просрочена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (5, 5, 5, 5, CAST(N'2023-05-17' AS Date), CAST(N'2023-06-17' AS Date), N'Возвращена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (6, 6, 6, 6, CAST(N'2023-06-22' AS Date), CAST(N'2023-07-06' AS Date), N'На руках')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (7, 7, 7, 7, CAST(N'2023-07-27' AS Date), CAST(N'2023-08-27' AS Date), N'Возвращена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (8, 8, 8, 8, CAST(N'2023-08-05' AS Date), CAST(N'2023-08-19' AS Date), N'Просрочена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (9, 9, 9, 9, CAST(N'2023-09-19' AS Date), CAST(N'2023-10-19' AS Date), N'Возвращена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (10, 10, 10, 10, CAST(N'2023-10-30' AS Date), CAST(N'2023-11-13' AS Date), N'На руках')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (11, 11, 11, 11, CAST(N'2023-11-08' AS Date), CAST(N'2023-12-08' AS Date), N'Возвращена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (12, 12, 12, 12, CAST(N'2023-12-15' AS Date), CAST(N'2023-12-29' AS Date), N'Просрочена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (13, 13, 13, 13, CAST(N'2024-01-20' AS Date), CAST(N'2024-02-20' AS Date), N'Возвращена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (14, 14, 14, 14, CAST(N'2024-02-25' AS Date), CAST(N'2024-03-10' AS Date), N'На руках')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (15, 15, 15, 15, CAST(N'2024-03-10' AS Date), CAST(N'2024-03-24' AS Date), N'Возвращена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (16, 15, 1, 1, CAST(N'2025-04-24' AS Date), CAST(N'2025-05-08' AS Date), N'На руках')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (17, 14, 1, 1, CAST(N'2025-04-24' AS Date), CAST(N'2025-04-24' AS Date), N'Возвращена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (18, 12, 15, 1, CAST(N'2025-04-24' AS Date), CAST(N'2025-05-08' AS Date), N'На руках')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (19, 5, 1, 1, CAST(N'2025-04-24' AS Date), CAST(N'2025-05-08' AS Date), N'На руках')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (20, 14, 16, 1, CAST(N'2025-04-24' AS Date), CAST(N'2025-04-24' AS Date), N'Возвращена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (21, 14, 16, 1, CAST(N'2025-04-24' AS Date), CAST(N'2025-04-25' AS Date), N'Возвращена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (22, 3, 17, 1, CAST(N'2025-04-24' AS Date), CAST(N'2025-04-24' AS Date), N'Возвращена')
INSERT [dbo].[BookLoans] ([LoanID], [BookID], [CardID], [EmployeeID], [LoanDate], [ReturnDate], [Status]) VALUES (23, 1, 16, 1, CAST(N'2025-04-25' AS Date), CAST(N'2025-05-09' AS Date), N'На руках')
SET IDENTITY_INSERT [dbo].[BookLoans] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (1, N'Война и мир', N'Лев Толстой', 1869, N'978-5-389-06256-6', 1, 0)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (2, N'1984', N'Джордж Оруэлл', 1949, N'978-5-17-090484-4', 1, 1)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (3, N'Гарри Поттер и философский камень', N'Дж. К. Роулинг', 1997, N'978-5-389-07435-4', 3, 1)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (4, N'Краткая история времени', N'Стивен Хокинг', 1988, N'978-5-17-041917-4', 2, 1)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (5, N'Игра престолов', N'Джордж Мартин', 1996, N'978-5-17-090637-4', 3, 0)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (6, N'Мастер и Маргарита', N'Михаил Булгаков', 1967, N'978-5-17-090637-5', 1, 1)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (7, N'Sapiens: Краткая история человечества', N'Юваль Ной Харари', 2011, N'978-5-17-090637-6', 2, 1)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (8, N'Атлант расправил плечи', N'Айн Рэнд', 1957, N'978-5-17-090637-7', 1, 1)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (9, N'Чистый код', N'Роберт Мартин', 2008, N'978-5-17-090637-8', 7, 1)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (10, N'Грокаем алгоритмы', N'Адитья Бхаргава', 2016, N'978-5-17-090637-9', 7, 1)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (11, N'Тонкое искусство пофигизма', N'Марк Мэнсон', 2016, N'978-5-17-090638-0', 6, 1)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (12, N'Богатый папа, бедный папа', N'Роберт Кийосаки', 1997, N'978-5-17-090638-1', 11, 0)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (13, N'Монах, который продал свой феррари', N'Робин Шарма', 1997, N'978-5-17-090638-2', 6, 1)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (14, N'Код да Винчи', N'Дэн Браун', 2003, N'978-5-17-090638-3', 1, 1)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [YearPublished], [ISBN], [DepartmentID], [Available]) VALUES (15, N'Гарри Поттер и Тайная комната', N'Дж. К. Роулинг', 1998, N'978-5-389-07436-1', 3, 1)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (1, N'Художественная литература', N'Классика и современная проза')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (2, N'Научная литература', N'Книги по физике, математике, биологии')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (3, N'Фэнтези и фантастика', N'Миры магии и будущего')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (4, N'История', N'Исторические исследования и мемуары')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (5, N'Детская литература', N'Книги для детей и подростков')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (6, N'Психология', N'Работы по психологии и саморазвитию')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (7, N'Техника и IT', N'Программирование, инженерия, технологии')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (8, N'Искусство', N'Живопись, музыка, архитектура')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (9, N'Кулинария', N'Кулинарные книги и рецепты')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (10, N'Путешествия', N'Гид по странам и культурам')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (11, N'Экономика', N'Финансы, бизнес, маркетинг')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (12, N'Философия', N'Труды философов разных эпох')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (13, N'Юмор', N'Сатира, комедии, анекдоты')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (14, N'Спорт', N'Книги о спорте и здоровье')
INSERT [dbo].[Departments] ([DepartmentID], [Name], [Description]) VALUES (15, N'Религия', N'Религиозные тексты и исследования')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (1, N'Иван', N'Иванов', N'Библиотекарь', CAST(N'2015-03-10' AS Date), N'123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (2, N'Евгения', N'Петрова', N'Администратор', CAST(N'2016-05-15' AS Date), N'Petrova123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (3, N'Артем', N'Сидоров', N'Каталогизатор', CAST(N'2017-01-20' AS Date), N'Sidorov123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (4, N'Юлия', N'Кузнецова', N'Библиотекарь', CAST(N'2018-07-05' AS Date), N'Kuznetsova123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (5, N'Константин', N'Смирнов', N'Директор', CAST(N'2010-09-01' AS Date), N'Smirnov123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (6, N'Алина', N'Васильева', N'Библиотекарь', CAST(N'2019-11-12' AS Date), N'Vasileva123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (7, N'Роман', N'Павлов', N'IT-специалист', CAST(N'2020-02-18' AS Date), N'Pavlov123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (8, N'Светлана', N'Семенова', N'Библиотекарь', CAST(N'2017-04-22' AS Date), N'Semenova123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (9, N'Игорь', N'Федоров', N'Охранник', CAST(N'2018-08-30' AS Date), N'Fedorov123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (10, N'Валерия', N'Николаева', N'Библиотекарь', CAST(N'2019-06-14' AS Date), N'Nikolaeva123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (11, N'Григорий', N'Морозов', N'Уборщик', CAST(N'2021-03-05' AS Date), N'Morozov123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (12, N'Людмила', N'Волкова', N'Библиотекарь', CAST(N'2016-10-11' AS Date), N'Volkova123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (13, N'Станислав', N'Белов', N'Кассир', CAST(N'2018-12-03' AS Date), N'Belov123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (14, N'Ангелина', N'Медведева', N'Библиотекарь', CAST(N'2020-09-25' AS Date), N'Medvedeva123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [HireDate], [Password]) VALUES (15, N'Владислав', N'Козлов', N'Курьер', CAST(N'2021-01-07' AS Date), N'Kozlov123')
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[LibraryCards] ON 

INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (1, 1, CAST(N'2023-01-10' AS Date), CAST(N'2024-01-10' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (2, 2, CAST(N'2023-02-15' AS Date), CAST(N'2024-02-15' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (3, 3, CAST(N'2023-03-20' AS Date), CAST(N'2024-03-20' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (4, 4, CAST(N'2023-04-05' AS Date), CAST(N'2024-04-05' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (5, 5, CAST(N'2023-05-12' AS Date), CAST(N'2024-05-12' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (6, 6, CAST(N'2023-06-18' AS Date), CAST(N'2024-06-18' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (7, 7, CAST(N'2023-07-22' AS Date), CAST(N'2024-07-22' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (8, 8, CAST(N'2023-08-30' AS Date), CAST(N'2024-08-30' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (9, 9, CAST(N'2023-09-14' AS Date), CAST(N'2024-09-14' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (10, 10, CAST(N'2023-10-25' AS Date), CAST(N'2024-10-25' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (11, 11, CAST(N'2023-11-03' AS Date), CAST(N'2024-11-03' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (12, 12, CAST(N'2023-12-10' AS Date), CAST(N'2024-12-10' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (13, 13, CAST(N'2024-01-15' AS Date), CAST(N'2025-01-15' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (14, 14, CAST(N'2024-02-20' AS Date), CAST(N'2025-02-20' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (15, 15, CAST(N'2024-03-05' AS Date), CAST(N'2025-03-05' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (16, 19, CAST(N'2025-04-24' AS Date), CAST(N'2026-04-24' AS Date))
INSERT [dbo].[LibraryCards] ([CardID], [ReaderID], [IssueDate], [ExpiryDate]) VALUES (17, 20, CAST(N'2025-04-24' AS Date), CAST(N'2026-04-24' AS Date))
SET IDENTITY_INSERT [dbo].[LibraryCards] OFF
SET IDENTITY_INSERT [dbo].[Readers] ON 

INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (1, N'Иван', N'Иванов', N'+7 (123) 456-7890', N'ivan@mail.com', N'ул. Ленина, 1', N'12345')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (2, N'Петр', N'Петров', N'+7 (234) 567-8901', N'petr@mail.com', N'ул. Пушкина, 10', N'123')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (3, N'Анна', N'Сидорова', N'+7 (345) 678-9012', N'anna@mail.com', N'ул. Гагарина, 5', N'12')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (4, N'Мария', N'Кузнецова', N'+7 (456) 789-0123', N'maria@mail.com', N'ул. Мира, 15', N'1')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (5, N'Сергей', N'Смирнов', N'+7 (567) 890-1234', N'sergey@mail.com', N'пр. Космонавтов, 20', N'8690')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (6, N'Ольга', N'Васильева', N'+7 (678) 901-2345', N'olga@mail.com', N'ул. Советская, 30', N'648')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (7, N'Дмитрий', N'Павлов', N'+7 (789) 012-3456', N'dmitry@mail.com', N'ул. Кирова, 7', N'7049235')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (8, N'Елена', N'Семенова', N'+7 (890) 123-4567', N'elena@mail.com', N'ул. Горького, 12', N'4573049')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (9, N'Алексей', N'Федоров', N'+7 (901) 234-5678', N'alex@mail.com', N'ул. Лермонтова, 8', N'9852')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (10, N'Наталья', N'Николаева', N'+7 (012) 345-6789', N'natalya@mail.com', N'ул. Чехова, 3', N'4697408')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (11, N'Андрей', N'Морозов', N'+7 (123) 456-7891', N'andrey@mail.com', N'ул. Маяковского, 9', N'747392')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (12, N'Татьяна', N'Волкова', N'+7 (234) 567-8902', N'tatyana@mail.com', N'ул. Дзержинского, 11', N'75749')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (13, N'Виктор', N'Белов', N'+7 (345) 678-9013', N'viktor@mail.com', N'ул. Лесная, 4', N'30457')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (14, N'Екатерина', N'Медведева', N'+7 (456) 789-0124', N'ekaterina@mail.com', N'ул. Садовая, 6', N'574839')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (15, N'Михаил', N'Козлов', N'+7 (567) 890-1235', N'mikhail@mail.com', N'ул. Юбилейная, 2', N'67394805')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (18, N'Дарина', N'Ильина', N'89600699971', N'dar@gmail.com', N'пупкино12б', N'123')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (19, N'Дариночка', N'Ильина', N'850394534', N'123', N'залупкино', N'123')
INSERT [dbo].[Readers] ([ReaderID], [FirstName], [LastName], [Phone], [Email], [Address], [Password]) VALUES (20, N'ттт', N'ббб', N'000', N'...', N'...', N'...')
SET IDENTITY_INSERT [dbo].[Readers] OFF
ALTER TABLE [dbo].[BookLoans]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[BookLoans]  WITH CHECK ADD FOREIGN KEY([CardID])
REFERENCES [dbo].[LibraryCards] ([CardID])
GO
ALTER TABLE [dbo].[BookLoans]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[LibraryCards]  WITH CHECK ADD FOREIGN KEY([ReaderID])
REFERENCES [dbo].[Readers] ([ReaderID])
GO
