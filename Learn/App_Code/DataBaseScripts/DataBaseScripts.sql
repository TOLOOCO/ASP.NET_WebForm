USE [ASPX]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 01/01/2015 09:27:23 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentId] [int] IDENTITY(0,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[IsCheckedByWriter] [bit] NOT NULL,
	[IsPrivate] [bit] NOT NULL,
	[IsCommentActive] [bit] NOT NULL,
	[URL] [varchar](250) NULL,
	[Email] [varchar](250) NULL,
	[FullName] [nvarchar](50) NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[InsertTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 01/01/2015 09:27:23 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostCategories]    Script Date: 01/01/2015 09:27:23 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCategories](
	[PostCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[PostCategoryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PostCategories] PRIMARY KEY CLUSTERED 
(
	[PostCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 01/01/2015 09:27:23 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PostTypeId] [int] NOT NULL,
	[PostCategoryId] [int] NOT NULL,
	[PostVisitedCount] [int] NOT NULL,
	[IsHot] [bit] NOT NULL,
	[IsPostActive] [bit] NOT NULL,
	[IsCommentEnabled] [bit] NOT NULL,
	[Password] [char](40) NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[ExtendedBody] [nvarchar](max) NULL,
	[Keywords] [nvarchar](max) NOT NULL,
	[InsertTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[PublishTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostTypes]    Script Date: 01/01/2015 09:27:23 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTypes](
	[PostTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PostCategoryId] [int] NOT NULL,
	[PostTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PostTypes] PRIMARY KEY CLUSTERED 
(
	[PostTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 01/01/2015 09:27:23 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Uploads]    Script Date: 01/01/2015 09:27:23 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uploads](
	[UploadId] [int] NOT NULL,
	[UploadFileName] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/01/2015 09:27:23 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Mobile] [char](11) NOT NULL,
	[LoginCount] [int] NOT NULL,
	[IsUserActive] [bit] NOT NULL,
	[IsUserEmailVerified] [bit] NOT NULL,
	[UserEmail] [varchar](250) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Password] [char](40) NOT NULL,
	[UserEmailVerificationKey] [char](32) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[UserDescription] [nvarchar](max) NOT NULL,
	[InsertTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[LastLoginTime] [datetime] NOT NULL,
	[UploadId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CommentsView]    Script Date: 01/01/2015 09:27:23 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CommentsView]
AS
SELECT     dbo.Comments.CommentId, dbo.Comments.PostId, dbo.Comments.IsCheckedByWriter, dbo.Comments.IsPrivate, dbo.Comments.IsCommentActive, 
                      dbo.Comments.FullName, dbo.Comments.InsertTime, dbo.Posts.UserId, dbo.Posts.Title
FROM         dbo.Comments INNER JOIN
                      dbo.Posts ON dbo.Comments.PostId = dbo.Posts.PostId



GO
/****** Object:  View [dbo].[PostsView]    Script Date: 01/01/2015 09:27:23 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PostsView]
AS
SELECT     dbo.Posts.PostId, dbo.Posts.UserId, dbo.Posts.PostTypeId, dbo.Posts.PostCategoryId, dbo.Posts.PostVisitedCount, dbo.Posts.IsHot, dbo.Posts.IsPostActive, 
                      dbo.Posts.IsCommentEnabled, dbo.Posts.Title, dbo.Posts.Body, dbo.Posts.UpdateTime, dbo.Posts.PublishTime,
                          (SELECT     COUNT(*) AS CommentCount
                            FROM          dbo.Comments
                            WHERE      (PostId = dbo.Posts.PostId)) AS PostCommentCount, dbo.Users.FullName
FROM         dbo.Posts INNER JOIN
                      dbo.Users ON dbo.Posts.UserId = dbo.Users.UserId



GO
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([PageID], [PageName]) VALUES (1, N'انتخاب کنید')
INSERT [dbo].[Pages] ([PageID], [PageName]) VALUES (3, N'Contact.html')
INSERT [dbo].[Pages] ([PageID], [PageName]) VALUES (5, N'Help.html')
INSERT [dbo].[Pages] ([PageID], [PageName]) VALUES (7, N'Events.html')
INSERT [dbo].[Pages] ([PageID], [PageName]) VALUES (9, N'About.html')
SET IDENTITY_INSERT [dbo].[Pages] OFF
SET IDENTITY_INSERT [dbo].[PostCategories] ON 

INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName]) VALUES (7, N'انتخاب کنید')
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName]) VALUES (8, N'فارسی')
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName]) VALUES (9, N'انگلیسی')
SET IDENTITY_INSERT [dbo].[PostCategories] OFF
SET IDENTITY_INSERT [dbo].[PostTypes] ON 

INSERT [dbo].[PostTypes] ([PostTypeId], [PostCategoryId], [PostTypeName]) VALUES (26, 7, N'انتخاب کنید')
INSERT [dbo].[PostTypes] ([PostTypeId], [PostCategoryId], [PostTypeName]) VALUES (27, 8, N'انتخاب کنید')
INSERT [dbo].[PostTypes] ([PostTypeId], [PostCategoryId], [PostTypeName]) VALUES (28, 8, N'اخبار سایت')
INSERT [dbo].[PostTypes] ([PostTypeId], [PostCategoryId], [PostTypeName]) VALUES (29, 8, N'خبرنامه سایت')
INSERT [dbo].[PostTypes] ([PostTypeId], [PostCategoryId], [PostTypeName]) VALUES (30, 9, N'انتخاب کنید')
INSERT [dbo].[PostTypes] ([PostTypeId], [PostCategoryId], [PostTypeName]) VALUES (31, 9, N'اخبار سایت')
INSERT [dbo].[PostTypes] ([PostTypeId], [PostCategoryId], [PostTypeName]) VALUES (32, 9, N'خبرنامه سایت')
SET IDENTITY_INSERT [dbo].[PostTypes] OFF
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (100, N'Programmer')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (200, N'Administrator')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (300, N'SuperUser')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (400, N'Manager')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (500, N'Supervisor')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (600, N'Editor')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (700, N'Writer')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (800, N'Reporter')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (900, N'User')
ALTER TABLE [dbo].[PostTypes]  WITH CHECK ADD  CONSTRAINT [FK_PostTypes_PostCategories] FOREIGN KEY([PostCategoryId])
REFERENCES [dbo].[PostCategories] ([PostCategoryId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PostTypes] CHECK CONSTRAINT [FK_PostTypes_PostCategories]
GO
USE [master]
GO
ALTER DATABASE [ASPX] SET  READ_WRITE 
GO
