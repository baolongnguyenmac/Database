USE [18120201]
GO
/****** Object:  Table [dbo].[GIAOVIEN]    Script Date: 28/04/2020 14:55:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIAOVIEN](
	[magv] [char](8) NOT NULL,
	[hoten] [nvarchar](100) NULL,
	[isMale] [bit] NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](300) NULL,
 CONSTRAINT [PK_GV] PRIMARY KEY CLUSTERED 
(
	[magv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCSINH]    Script Date: 28/04/2020 14:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCSINH](
	[mahs] [char](8) NOT NULL,
	[hoten] [nvarchar](100) NULL,
	[isMale] [bit] NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](300) NULL,
	[malop] [char](5) NULL,
 CONSTRAINT [PK_HS] PRIMARY KEY CLUSTERED 
(
	[mahs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOPHOC]    Script Date: 28/04/2020 14:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOPHOC](
	[malop] [char](5) NOT NULL,
	[tenlop] [varchar](10) NULL,
	[nam] [int] NULL,
	[gvcn] [char](8) NULL,
	[loptruong] [char](8) NULL,
 CONSTRAINT [PK_LOP] PRIMARY KEY CLUSTERED 
(
	[malop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[GIAOVIEN] ([magv], [hoten], [isMale], [ngaysinh], [diachi]) VALUES (N'G1      ', N'Nguyễn Giáo Viên a', 1, CAST(N'2000-07-14' AS Date), N'Triều Tiên')
GO
INSERT [dbo].[GIAOVIEN] ([magv], [hoten], [isMale], [ngaysinh], [diachi]) VALUES (N'G2      ', N'Nguyễn Giáo Viên b', 1, CAST(N'2000-07-15' AS Date), N'Đông Triều Tiên')
GO
INSERT [dbo].[GIAOVIEN] ([magv], [hoten], [isMale], [ngaysinh], [diachi]) VALUES (N'G3      ', N'Nguyễn Giáo Viên c', 1, CAST(N'2000-07-16' AS Date), N'Tây Triều Tiên')
GO
INSERT [dbo].[GIAOVIEN] ([magv], [hoten], [isMale], [ngaysinh], [diachi]) VALUES (N'G4      ', N'Nguyễn Giáo Viên d', 1, CAST(N'2000-07-17' AS Date), N'Nam Triều Tiên')
GO
INSERT [dbo].[GIAOVIEN] ([magv], [hoten], [isMale], [ngaysinh], [diachi]) VALUES (N'G5      ', N'Nguyễn Giáo Viên e', 1, CAST(N'2000-07-18' AS Date), N'Bắc Triều Tiên')
GO
INSERT [dbo].[HOCSINH] ([mahs], [hoten], [isMale], [ngaysinh], [diachi], [malop]) VALUES (N'18120201', N'Nguyễn Học Sinh m', 1, CAST(N'2000-07-10' AS Date), N'Lào', N'L1   ')
GO
INSERT [dbo].[HOCSINH] ([mahs], [hoten], [isMale], [ngaysinh], [diachi], [malop]) VALUES (N'18120202', N'Nguyễn Học Sinh n', 1, CAST(N'2000-07-11' AS Date), N'Bắc Lào', N'L2   ')
GO
INSERT [dbo].[HOCSINH] ([mahs], [hoten], [isMale], [ngaysinh], [diachi], [malop]) VALUES (N'18120203', N'Nguyễn Học Sinh p', 1, CAST(N'2000-07-12' AS Date), N'Nam Lào', N'L3   ')
GO
INSERT [dbo].[HOCSINH] ([mahs], [hoten], [isMale], [ngaysinh], [diachi], [malop]) VALUES (N'18120204', N'Nguyễn Học Sinh q', 1, CAST(N'2000-07-13' AS Date), N'Tây Lào', N'L4   ')
GO
INSERT [dbo].[HOCSINH] ([mahs], [hoten], [isMale], [ngaysinh], [diachi], [malop]) VALUES (N'18120205', N'Nguyễn Học Sinh z', 1, CAST(N'2000-07-14' AS Date), N'Đông Lào', N'L5   ')
GO
INSERT [dbo].[LOPHOC] ([malop], [tenlop], [nam], [gvcn], [loptruong]) VALUES (N'L1   ', N'18CTT1', 2000, N'G1      ', N'18120201')
GO
INSERT [dbo].[LOPHOC] ([malop], [tenlop], [nam], [gvcn], [loptruong]) VALUES (N'L2   ', N'18CTT2', 2000, N'G1      ', N'18120202')
GO
INSERT [dbo].[LOPHOC] ([malop], [tenlop], [nam], [gvcn], [loptruong]) VALUES (N'L3   ', N'18CTT3', 2000, N'G1      ', N'18120203')
GO
INSERT [dbo].[LOPHOC] ([malop], [tenlop], [nam], [gvcn], [loptruong]) VALUES (N'L4   ', N'18CTT4', 2000, N'G1      ', N'18120204')
GO
INSERT [dbo].[LOPHOC] ([malop], [tenlop], [nam], [gvcn], [loptruong]) VALUES (N'L5   ', N'18CTT5', 2000, N'G1      ', N'18120205')
GO
ALTER TABLE [dbo].[HOCSINH]  WITH CHECK ADD  CONSTRAINT [FK_HS_LOP] FOREIGN KEY([malop])
REFERENCES [dbo].[LOPHOC] ([malop])
GO
ALTER TABLE [dbo].[HOCSINH] CHECK CONSTRAINT [FK_HS_LOP]
GO
ALTER TABLE [dbo].[LOPHOC]  WITH CHECK ADD  CONSTRAINT [FK_LOP_GV] FOREIGN KEY([gvcn])
REFERENCES [dbo].[GIAOVIEN] ([magv])
GO
ALTER TABLE [dbo].[LOPHOC] CHECK CONSTRAINT [FK_LOP_GV]
GO
ALTER TABLE [dbo].[LOPHOC]  WITH CHECK ADD  CONSTRAINT [FK_LOP_HS] FOREIGN KEY([loptruong])
REFERENCES [dbo].[HOCSINH] ([mahs])
GO
ALTER TABLE [dbo].[LOPHOC] CHECK CONSTRAINT [FK_LOP_HS]
GO
