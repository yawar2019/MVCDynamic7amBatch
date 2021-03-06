USE [Employee]
GO
/****** Object:  Table [dbo].[employeeDetails]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employeeDetails](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [varchar](500) NULL,
	[EmpSalary] [int] NULL,
	[DeptId] [int] NULL,
	[Address] [varchar](50) NULL,
	[dob] [datetime] NULL,
	[Mobiles] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_employeeDetails_Status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[MobileNo] [varchar](50) NULL,
	[Available] [bit] NULL,
 CONSTRAINT [PK_employeeDetails] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[employeeDetails] ON 

INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (51033, N'Ritu Varma', 780000, 2, N'hyd', CAST(N'2020-03-03 00:00:00.000' AS DateTime), NULL, 1, 1, N'23223423', 0)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (51035, N'farhan  Querishi                          ', 290000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (55032, N'Balu', 192929, 1, N'Ameerpet2', CAST(N'2021-08-04 07:55:25.000' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (55036, N'tiger', 23455, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (57034, N'Teja Sanjay', 17654, 1, N'sample string 3', CAST(N'2021-09-01 09:01:40.330' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (58032, N'Teja', 34654, 3, N'USA', CAST(N'2021-09-01 09:01:40.330' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (59032, N'chand', 23456, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (59033, N'Abhishek kumar', 50000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (59034, N'Gautham kumar ', 890000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (61032, N'test', 1000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (61033, N'farhan', 250000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (62033, N'Isha G', 290000, 2, N'asdfasdf', CAST(N'2020-03-03 00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (62035, N'Isha G', 290000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (63035, N'sheik', 10000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (63036, N'sheik', 10000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (63037, N'sheik', 10000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (63038, N'sheik', 10000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (63039, N'sheik', 10000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (64036, N'Gautham tesla', 34567, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (64037, N'Gautham tesla', 34567, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (64038, N'Gautham tesla', 34567, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (64040, N'Gautham ', 50000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (65035, N'Usha Rani', 290000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (65036, N's farhan', 290000, 1, N'hyd', CAST(N'2020-03-03 00:00:00.000' AS DateTime), NULL, 1, 1, N'23223423', NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (65038, N'Isha G                                            ', 290000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (66035, N'sample string Testing', 10000, 1, N'sample string 3', CAST(N'2021-11-09 21:50:54.287' AS DateTime), NULL, 1, 1, N'sample string 5', NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (66036, N'sample string Testing', 10000, 1, N'sample string 3', CAST(N'2021-11-09 21:50:54.287' AS DateTime), NULL, 1, 1, N'sample string 5', NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (66037, N'sample string Testing', 10000, 1, N'sample string 3', CAST(N'2021-11-09 21:50:54.287' AS DateTime), NULL, 1, 1, N'sample string 5', NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (66039, N'Preeti', 49000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (66040, N'Abhishek kumar', 35000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (68035, N'Kanupriya', 45000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (68036, N'Brahma', 78000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (68037, N'Brahma', 78000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (68038, N'changaz khan', 45, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (69035, N'RuMeVa890', 34799, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (69037, N'RuMeVaNa888', 888, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (69038, N'RuMeVaNa888', 888, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (69039, N'sample string test27', 27, 27, N'sample string 3', CAST(N'2021-12-12 06:36:04.420' AS DateTime), NULL, 1, 1, N'sample string 5', 1)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (69040, N'Gautham  fanty                               ', 250000, 1, N'hyd', NULL, NULL, 0, NULL, NULL, 1)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (69041, N'don', 390000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (69042, N'Manikanth', 750000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (69043, N'pankaj', 56789, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (70039, N'testTajun', 222, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (71039, N'Abhishek kumar', 50000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (71041, N'Isha G5678', 290000, 1, N'hyd', CAST(N'2020-03-03 00:00:00.000' AS DateTime), NULL, 1, 1, N'111', 1)
INSERT [dbo].[employeeDetails] ([EmpId], [EmpName], [EmpSalary], [DeptId], [Address], [dob], [Mobiles], [Status], [CreatedBy], [MobileNo], [Available]) VALUES (72040, N'KingKong', 750000, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[employeeDetails] OFF
/****** Object:  StoredProcedure [dbo].[sp_AddNeerjaEmployees]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddNeerjaEmployees]
 @EmpName varchar(50)
,@EmpSalary int
As
BEGIN
 Insert into  [Employee].[dbo].[employeeDetails] (EmpName,EmpSalary)values(@EmpName,@EmpSalary)
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreateCompanyEmp]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Sp_CreateCompanyEmp]
As
Begin
select * from employeeDetails
End
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateEmployee]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE Procedure [dbo].[sp_CreateEmployee]
  @EmpName varchar(50),
  @EmpSalary int
  As
  BEGIN
  insert into employeeDetails (EmpName,EmpSalary) values(@EmpName,@EmpSalary)
  
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateEmployee9pm]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create Procedure [dbo].[sp_CreateEmployee9pm]
  @EmpName varchar(50),
  @EmpSalary int
  As
  BEGIN
  insert into employeeDetails (EmpName,EmpSalary) values(@EmpName,@EmpSalary)
  
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteNeerjaEmployees]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteNeerjaEmployees]
  @EmpId int
  
As
BEGIN
 Delete from   [Employee].[dbo].[employeeDetails]   where EmpId=@EmpId
End
GO
/****** Object:  StoredProcedure [dbo].[sp_employee]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_employee]
As
BEGIN

select EmpId,EmpName,EmpSalary from Employee.dbo.employeeDetails
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getDesignation]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[sp_getDesignation]
As
BEGIN
SELECT * From designation
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getEmployee_Rock]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getEmployee_Rock]
AS
BEGIN
SELECT * from [dbo].[employeeDetails]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getGender]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[sp_getGender]
As
BEGIN
SELECT * From Gender
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getNeerjaEmployeeDetailsById]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_getNeerjaEmployeeDetailsById]
@EmpId int
As
BEGIN
SELECT * FROM Employeedetails where EmpId=@EmpId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getNeerjaEmployees]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getNeerjaEmployees]
As
BEGIN
SELECT [EmpId]
      ,[EmpName]
      ,[EmpSalary]
       
  FROM [Employee].[dbo].[employeeDetails]
End
GO
/****** Object:  StoredProcedure [dbo].[sp_getprathimaEmployeeDetails]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getprathimaEmployeeDetails]
As
BEGIN
SELECT * FROM Employeedetails
END

GO
/****** Object:  StoredProcedure [dbo].[sp_getRituEmployees]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getRituEmployees]
As
Begin
  select * from [Employee].[dbo].[employeeDetails]

End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEmployee]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertEmployee]
@EmpName varchar(50),
@EmpSalary int
As
BEGIN
INSERT INTO EmployeeDetails(EmpName,EmpSalary)Values(@EmpName,@EmpSalary)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertRituEmployees]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertRituEmployees]
 @EmpName varchar(100)
,@EmpSalary int
As
Begin
  INSERT INTO [employeeDetails](EmpName,EmpSalary)values(@EmpName,@EmpSalary)

End

GO
/****** Object:  StoredProcedure [dbo].[sp_RajaAddEmployee]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RajaAddEmployee]
@EmpName varchar(50),
@EmpSalary int
As
BEGIN
INSERT INTO [Employee].[dbo].[employeeDetails] ([EmpName],[EmpSalary]) values(@EmpName,@EmpSalary)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RajaDeleteEmployee]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_RajaDeleteEmployee]
@EmpId int
As
BEGIN
Delete from [Employee].[dbo].[employeeDetails]  where EmpId=@EmpId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RajagetEmployee]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RajagetEmployee]
As
BEGIN
SELECT [EmpId]
      ,[EmpName]
      ,[EmpSalary]
FROM [Employee].[dbo].[employeeDetails]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RajagetEmployeeById]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_RajagetEmployeeById]
@EmpId int
As
BEGIN
SELECT [EmpId]
      ,[EmpName]
      ,[EmpSalary]
FROM [Employee].[dbo].[employeeDetails] where empid=@EmpId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RajaUpdateEmployee]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_RajaUpdateEmployee]
@EmpId int,
@EmpName varchar(50),
@EmpSalary int
As
BEGIN
UPDATE  [Employee].[dbo].[employeeDetails] set EmpName=@EmpName,EmpSalary=@EmpSalary where EmpId=@EmpId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateNeerjaEmployees]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateNeerjaEmployees]
  @EmpId int
 ,@EmpName varchar(50)
 ,@EmpSalary int
As
BEGIN
 Update  [Employee].[dbo].[employeeDetails] set EmpName=@EmpName,EmpSalary=@EmpSalary where EmpId=@EmpId
End
GO
/****** Object:  StoredProcedure [dbo].[spr_deleteEmployeeDetails]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[spr_deleteEmployeeDetails]
  @empid int
  AS
  BEGIN
  Delete from employeeDetails  where empid=@empid
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_DeviEmployees]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [dbo].[spr_DeviEmployees]
  AS
  BEGIN
  SELECT * FROM [dbo].[employeeDetails]
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_getEmployeeDetails]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[spr_getEmployeeDetails]
  AS
  BEGIN
  SELECT  * FROM employeeDetails order by 1 desc 
  END

  --Delete  from employeeDetails  where empsalary is null
GO
/****** Object:  StoredProcedure [dbo].[spr_getEmployeeDetailsbyId]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[spr_getEmployeeDetailsbyId]
  @empid int
  AS
  BEGIN
  SELECT * FROM employeeDetails where empid=@empid
  END

GO
/****** Object:  StoredProcedure [dbo].[spr_insertEmpDetails]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[spr_insertEmpDetails]
  @EmpName varchar(50),
  @EmpSalary int

  AS
  BEGIN
  INSERT INTO employeeDetails(EmpName,EmpSalary)values(@EmpName,@EmpSalary) 
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_insertEmployee]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procedure [dbo].[spr_insertEmployee]
  @EmpName char(50) ,
  @EmpSalary int
  AS
  BEGIN
  Insert into employeeDetails(empname,empsalary)values(@EmpName,@EmpSalary)
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_InsertEmployeeDetails]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_InsertEmployeeDetails]
 
  @empname nvarchar(50),
  @empsalary int
  AS
  BEGIN
  insert into  employeeDetails(empname,empsalary)values(@empname,@empsalary)
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_InsertprathimaEmployeeDetails]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[spr_InsertprathimaEmployeeDetails]
  
  @empname nvarchar(50),
  @empsalary int
  AS
  BEGIN
  insert into  employeeDetails(empname,empsalary)values(@empname,@empsalary)
  
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_testAccount_Columns]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spr_testAccount_Columns]
AS
BEGIN
select 'Number' as dataIndex, 'ACT#' text, '300' as width
union
 select 'Name' as dataIndex, 'ActName' text, '250' as width
 union
 select 'City' as dataIndex, 'City' text, '200' as width
END
GO
/****** Object:  StoredProcedure [dbo].[spr_testAccount_Row]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spr_testAccount_Row]
AS
BEGIN
select ACT_NUMBER ,ACT_name , ACT_City  from  ACCOUNT
  
END
GO
/****** Object:  StoredProcedure [dbo].[spr_updateEmployeeDetails]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[spr_updateEmployeeDetails]
  @Empid int,
  @EmpName nvarchar(50),
  @EmpSalary int
  AS
  BEGIN
  update employeeDetails set empname=@EmpName,empsalary=@EmpSalary where empid=@Empid
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_updateEmployeeDetails1]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_updateEmployeeDetails1]
  @empid int,
  @empname nvarchar(50),
  @empsalary int
  AS
  BEGIN
  update employeeDetails set empname=@empname,empsalary=@empsalary where empid=@empid
  END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteEmployeeById]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteEmployeeById]
@EmpId int
AS
BEGIN
Delete from employeeDetails WHERE EmpId=@EmpId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getCustomProperty]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE PROCEDURE [dbo].[usp_getCustomProperty]
AS
BEGIN

SELECT TOP 1000 [PropertyId]
      ,[PropertyName]
      ,[PropertyValue]
      ,[FieldLength]
      ,[IsActive]
      ,[FieldType]
	  ,[OrderId]
	  ,[ReadOnlyProp]
  FROM [Employee].[dbo].[tbl_CustomProperty]

  order by OrderId asc
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getEmployeeDetail9pm]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getEmployeeDetail9pm]
AS
BEGIN
SELECT EmpId,EmpName,EmpSalary FROM dbo.employeeDetails
END

GO
/****** Object:  StoredProcedure [dbo].[usp_getEmployeeDetails]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getEmployeeDetails]
AS
BEGIN

SELECT * FROM employeeDetails

END
GO
/****** Object:  StoredProcedure [dbo].[usp_getEmployeeDetailsTest]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getEmployeeDetailsTest]
AS
BEGIN
SELECT [EmpId] ,[EmpName] ,[EmpSalary] From  [Employee].[dbo].[employeeDetails]
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getEmployeeRegister]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create PROCEDURE [dbo].[usp_getEmployeeRegister]
  
  AS
  BEGIN
 
 
  SELECT  * FROM employeeDetails order by 1 desc 
 
 
  END

GO
/****** Object:  StoredProcedure [dbo].[usp_getEmployees]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_getEmployees]
As
BEGIN
SELECT * FROM employeeDetails
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getEmployeesById]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_getEmployeesById]
@EmpId int
AS
BEGIN
SELECT * from employeeDetails where Empid=@EmpId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getUmeshEmpDetails]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_getUmeshEmpDetails]
As
BEGIN
SELECT EmpId,EmpName,EmpSalary from employeeDetails
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getUmeshEmployeeById]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getUmeshEmployeeById]
@EmpId int
AS
BEGIN
SELECT EmpId,EmpName,EmpSalary from employeeDetails WHERE EmpId=@EmpId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SaveUmeshEmployee]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SaveUmeshEmployee]
@EmpName varchar(50),
@EmpSalary int
AS
BEGIN
INSERT INTO employeeDetails(EmpName,EmpSalary) Values(@EmpName,@EmpSalary)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updateUmeshEmployee]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_updateUmeshEmployee]
@empId int,
@empname varchar(50),
@empsalary int
AS
BEGIN
Update employeeDetails set EmpName=@empname,
                           EmpSalary=@empsalary 
from employeeDetails WHERE EmpId=@empId
END
GO
/****** Object:  StoredProcedure [dbo].[uspgetEmployeeDetails_10pm]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspgetEmployeeDetails_10pm]
AS
BEGIN
select EmpId,EmpName,EmpSalary from [dbo].[employeeDetails]
END
GO
/****** Object:  StoredProcedure [dbo].[uspSaveEmployeeDetails_10pm]    Script Date: 23-12-2021 08:00:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspSaveEmployeeDetails_10pm]
@EmpName varchar(100),
@EmpSalary int
AS
BEGIN
INSERT INTO  [dbo].[employeeDetails](EmpName,EmpSalary)Values(@EmpName,@EmpSalary)
END


GO
