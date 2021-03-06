USE [AngularProject]
GO
/****** Object:  StoredProcedure [dbo].[GetUserInfoByUid]    Script Date: 3/2/2019 4:25:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[GetUserInfoByUid]
	@uid uniqueidentifier
AS
BEGIN
    -- Insert statements for procedure here
	SELECT [uiid]
      ,[firstname]
      ,[lastname]
      ,[dob]
      ,[age]
      ,[location]
      ,[uid] from userinfo where uid=@uid
END

GO
/****** Object:  StoredProcedure [dbo].[GetUserProfileByUIID]    Script Date: 3/2/2019 4:25:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[GetUserProfileByUIID]
	@uiid uniqueidentifier
AS
BEGIN
    -- Insert statements for procedure here
	SELECT [upid]
      ,[skills]
      ,[experience]
      ,[company]
      ,[certificate]
      ,[resume]
      ,[uiid] from userprofile where uiid=@uiid
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUserInfo]    Script Date: 3/2/2019 4:25:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUserInfo]
	@uiid uniqueidentifier	out,
	@firstname nvarchar(100),
	@lastname nvarchar(100),
	@dob date,
	@age int,
	@location nvarchar(100),
	@uid uniqueidentifier
AS
BEGIN
	set @uiid=NEWID()
	insert into UserInfo(uiid,firstname,lastname,dob,age,location,uid)
	values(@uiid,@firstname,@lastname,@dob,@age,@location,@uid)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUserProfile]    Script Date: 3/2/2019 4:25:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUserProfile]
	@upid uniqueidentifier out,
	@skills varchar(1000),
	@experience float,
	@company nvarchar(1000),
	@certificate nvarchar(1000),
	@resume  varchar(200),
	@uiid uniqueidentifier 
	
AS
BEGIN
set @upid=NEWID()
	insert into UserProfile(upid,skills,experience,company,certificate,resume,uiid)
	values (@upid,@skills,@experience,@company,@certificate,@resume,@uiid)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUsers]    Script Date: 3/2/2019 4:25:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUsers]
@uid uniqueidentifier out,
@username varchar(100),
@password varchar(200)

AS
BEGIN
	
	SET @uid=newid()

insert into Users(uid,username,password) values(@uid,@username,@password)
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateUserInfo]    Script Date: 3/2/2019 4:25:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUserInfo]
	@uiid uniqueidentifier,
	@firstname nvarchar(100),
	@lastname nvarchar(100),
	@dob date,
	@age int,
	@location nvarchar(100)
	
AS
BEGIN
	update UserInfo set firstname=@firstname,lastname=@lastname,dob=@dob,age=@age,location=@location
	where uiid=@uiid
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateUserProfile]    Script Date: 3/2/2019 4:25:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUserProfile]
	@upid uniqueidentifier,
	@skills varchar(1000),
	@experience float,
	@company nvarchar(1000),
	@certificate nvarchar(1000),
	@resume  varchar(200)
	
AS
BEGIN
update	UserProfile set skills=@skills,experience=@experience,company=@company
	,certificate=@certificate,resume=@resume where upid=@upid
END

GO
/****** Object:  StoredProcedure [dbo].[VerifyLogin]    Script Date: 3/2/2019 4:25:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VerifyLogin]
	@username varchar(100),
	@password varchar(200)
AS
BEGIN
    -- Insert statements for procedure here
	SELECT username,uid from Users where username=@username and password=@password
END

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 3/2/2019 4:25:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[uiid] [uniqueidentifier] NOT NULL,
	[firstname] [nvarchar](100) NULL,
	[lastname] [nvarchar](100) NULL,
	[dob] [date] NULL,
	[age] [int] NULL,
	[location] [nvarchar](100) NULL,
	[uid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_employeeinfo] PRIMARY KEY CLUSTERED 
(
	[uiid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 3/2/2019 4:25:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[upid] [uniqueidentifier] NOT NULL,
	[skills] [varchar](1000) NULL,
	[experience] [float] NULL,
	[company] [nvarchar](1000) NULL,
	[certificate] [nvarchar](1000) NULL,
	[resume] [varchar](200) NULL,
	[uiid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[upid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/2/2019 4:25:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[uid] [uniqueidentifier] NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_Users] FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_Users]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_UserProfile] FOREIGN KEY([uiid])
REFERENCES [dbo].[UserInfo] ([uiid])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_UserProfile]
GO
