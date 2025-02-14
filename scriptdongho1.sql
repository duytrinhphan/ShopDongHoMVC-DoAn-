create database [DongHoShopMVC]
go
USE [DongHoShopMVC]
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[MaHH] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiamGia] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHH] [int] IDENTITY(1,1) NOT NULL,
	[TenHH] [nvarchar](50) NOT NULL,
	[TenAlias] [nvarchar](50) NULL,
	[MaLoai] [int] NOT NULL,
	[MoTaDonVi] [nvarchar](50) NULL,
	[DonGia] [float] NULL,
	[Hinh] [nvarchar](max) NULL,
	[NgaySX] [datetime] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[SoLanXem] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaNCC] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vChiTietHoaDon]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vChiTietHoaDon]
AS 
	SELECT cthd.*, TenHH
	FROM ChiTietHD cthd JOIN HangHoa hh 
		ON hh.MaHH = cthd.MaHH


GO
/****** Object:  Table [dbo].[BanBe]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanBe](
	[MaBB] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NULL,
	[MaHH] [int] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[NgayGui] [datetime] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[MaBB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenCD] [nvarchar](50) NULL,
	[MaNV] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GopY]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GopY](
	[MaGY] [nvarchar](50) NOT NULL,
	[MaCD] [int] NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayGY] [date] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[CanTraLoi] [bit] NOT NULL,
	[TraLoi] [nvarchar](50) NULL,
	[NgayTL] [date] NULL,
 CONSTRAINT [PK_GopY] PRIMARY KEY CLUSTERED 
(
	[MaGY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[NgayCan] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](60) NOT NULL,
	[CachThanhToan] [nvarchar](50) NOT NULL,
	[CachVanChuyen] [nvarchar](50) NOT NULL,
	[PhiVanChuyen] [float] NOT NULL,
	[MaTrangThai] [int] NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](24) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDap]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDap](
	[MaHD] [int] NOT NULL,
	[CauHoi] [nvarchar](50) NOT NULL,
	[TraLoi] [nvarchar](50) NOT NULL,
	[NgayDua] [date] NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HoiDap] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[DiaChi] [nvarchar](60) NULL,
	[DienThoai] [nvarchar](24) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Hinh] [nvarchar](50) NULL,
	[HieuLuc] [bit] NOT NULL,
	[VaiTro] [int] NOT NULL,
	[RandomKey] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[TenLoaiAlias] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenCongTy] [nvarchar](50) NOT NULL,
	[Logo] [nvarchar](50) NOT NULL,
	[NguoiLienLac] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPC] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[MaPB] [varchar](7) NOT NULL,
	[NgayPC] [datetime] NULL,
	[HieuLuc] [bit] NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MaPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaPQ] [int] IDENTITY(1,1) NOT NULL,
	[MaPB] [varchar](7) NULL,
	[MaTrang] [int] NULL,
	[Them] [bit] NOT NULL,
	[Sua] [bit] NOT NULL,
	[Xoa] [bit] NOT NULL,
	[Xem] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [varchar](7) NOT NULL,
	[TenPB] [nvarchar](50) NOT NULL,
	[ThongTin] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] NOT NULL,
	[TenTrangThai] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangWeb]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangWeb](
	[MaTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TrangWeb] PRIMARY KEY CLUSTERED 
(
	[MaTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThich]    Script Date: 16-Apr-24 2:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThich](
	[MaYT] [int] IDENTITY(1,1) NOT NULL,
	[MaHH] [int] NULL,
	[MaKH] [nvarchar](20) NULL,
	[NgayChon] [datetime] NULL,
	[MoTa] [nvarchar](255) NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[MaYT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHD] ON 

INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (1, 1, 6, 716000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (2, 2, 8, 716000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (3, 5, 6, 716000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (4, 11, 8, 716000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (5, 12, 8, 716000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (6, 13, 8, 716000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (7, 14, 11, 938000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (8, 15, 12, 1865000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (9, 16, 19, 3000000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (10, 17, 15, 5224000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (11, 18, 18, 3828000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (12, 19, 16, 16880000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (13, 20, 18, 3828000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (14, 21, 6, 716000, 1, 0)
SET IDENTITY_INSERT [dbo].[ChiTietHD] OFF
GO
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (6, N'Casio MTP-V001L-1BUDF', N'casiomtp', 1, N'ASP', 716000, N'https://image.donghohaitrieu.com/wp-content/uploads/2023/09/MTP-1314L-8AVDF.jpg', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 70000, 111, NULL, N'1')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (8, N'Casio EFR-539L-5AVUDF', N'casioefr', 1, N'ASP', 716000, N'https://image.donghohaitrieu.com/wp-content/uploads/2023/09/EFR-539L-5AVUDF.jpg', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 40000, 112, NULL, N'1')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (9, N'Casio World Time AE-1200WHD-1AVDF ', N'casioworldtime', 1, N'ASP', 1506000, N'https://image.donghohaitrieu.com/wp-content/uploads/2023/09/AE-1200WHD-1AVDF.jpg', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 600000, 300, NULL, N'1')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (11, N'Casio A158WA-1DF', N'casioa158', 1, N'ASP', 938000, N'https://image.donghohaitrieu.com/wp-content/uploads/2023/09/1_A158WA-1DF-1.jpg', CAST(N'2023-01-02T00:00:00.000' AS DateTime), 500000, 2000, NULL, N'1')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (12, N'Casio MTP-1381D-1AVDF', N'Casio MTP-1381D-1AVDF', 1, N'ASP', 1865000, N'https://image.donghohaitrieu.com/wp-content/uploads/2023/09/34_MTP-1381D-1AVDF-1.jpg', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 1000000, 1000, NULL, N'1')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (14, N'Casio Edifice EFR-526D-1AVUDF', N'Casio Edifice EFR-526D-1AVUDF', 1, N'ASP', 3610000, N'https://image.donghohaitrieu.com/wp-content/uploads/2023/09/EFR-526D-1AVUDF.jpg', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 2000000, 2000, NULL, N'1')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (15, N'Saga Stella 53555-SVMWSV-2', N'Saga Stella 53555-SVMWSV-2', 2, N'ASP', 5224000, N'https://image.donghohaitrieu.com/wp-content/uploads/2023/09/3_53555-SVMWSV-2.jpg', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 3000000, 100, NULL, N'1')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (16, N'Saga Long Xing Da Da 13665-SVPEBK-3LH ', N'Saga Long Xing Da Da 13665-SVPEBK-3LH ', 2, N'ASP', 16880000, N'https://image.donghohaitrieu.com/wp-content/uploads/2024/01/Saga-Long-Xing-Da-Da-13665-SVPEBK-3LH-1.jpg', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 4000000, 10, NULL, N'1')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (18, N'G-Shock DW-5600BB-1DR', N'G-Shock DW-5600BB-1DR', 6, N'ASP', 3828000, N'https://image.donghohaitrieu.com/wp-content/uploads/2023/09/18_DW-5600BB-1DR.jpg', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 500000, 200, NULL, N'1')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (19, N'G-Shock GA-2100-1A1DR ', N'G-Shock GA-2100-1A1DR ', 6, N'ASP', 3000000, N'https://image.donghohaitrieu.com/wp-content/uploads/2023/09/25_GA-2100-1A1DR.jpg', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 600000, 2000, NULL, N'1')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (20, N'G-Shock GA-B2100FC-3ADR', N'G-Shock GA-B2100FC-3ADR', 6, N'ASP', 5000000, N'https://image.donghohaitrieu.com/wp-content/uploads/2024/02/G-Shock-GA-B2100FC-3ADR.jpg', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 5000000, 212, NULL, N'1')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (25, N'G-Shock GBA-900-1ADR ', N'G-Shock GBA-900-1ADR ', 6, N'ASP', 30000000, N'https://image.donghohaitrieu.com/wp-content/uploads/2023/09/GBA-900-1ADR.1.jpg', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 500000, 100, NULL, N'1')
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (1, N'duytrinh', CAST(N'2024-03-31T14:52:38.817' AS DateTime), CAST(N'2024-03-31T14:52:38.967' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'duytrinhphan', N'75Thas', N'COD', N'GRAB', 0, 0, NULL, N'ne', N'0398298855')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (2, N'duytrinh', CAST(N'2024-03-31T14:56:14.490' AS DateTime), CAST(N'2024-03-31T14:56:14.673' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'duytrinhphan', N'45 nè', N'COD', N'GRAB', 0, 0, NULL, N'Khong có', N'0398298857888')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (5, N'duytrinh', CAST(N'2024-04-01T00:31:41.933' AS DateTime), CAST(N'2024-04-01T00:31:42.110' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'duytrinhphan', N'75Thas', N'COD', N'GRAB', 0, 0, NULL, NULL, N'0398298855')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (11, N'duytrinh', CAST(N'2024-04-01T01:05:37.740' AS DateTime), CAST(N'2024-04-01T01:05:37.890' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'duytrinhphan', N'75Thas', N'VnPay', N'GRAB', 0, 0, NULL, N'', N'0398298855')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (12, N'duytrinh', CAST(N'2024-04-01T01:07:47.940' AS DateTime), CAST(N'2024-04-01T01:07:48.097' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'duytrinhphan', N'75Thas', N'VnPay', N'GRAB', 0, 0, NULL, N'', N'0398298855')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (13, N'admin@HoH.com', CAST(N'2024-04-05T08:44:50.740' AS DateTime), CAST(N'2024-04-05T08:44:51.007' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Admin', N'HoHCompany', N'COD', N'GRAB', 0, 0, NULL, N'đây nè', N'0345678978')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (14, N'admin@HoH.com', CAST(N'2024-04-05T08:45:37.173' AS DateTime), CAST(N'2024-04-05T08:45:37.177' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Admin', N'HoHCompany', N'VnPay', N'GRAB', 0, 0, NULL, N'', N'0345678978')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (15, N'admin@HoH.com', CAST(N'2024-04-16T10:47:16.307' AS DateTime), CAST(N'2024-04-16T10:47:16.433' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Admin', N'HoHCompany', N'VnPay', N'GRAB', 0, 0, NULL, N'', N'0345678978')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (16, N'admin@HoH.com', CAST(N'2024-04-16T10:56:00.173' AS DateTime), CAST(N'2024-04-16T10:56:00.310' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Admin', N'HoHCompany', N'VnPay', N'GRAB', 0, 0, NULL, N'', N'0345678978')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (17, N'admin@HoH.com', CAST(N'2024-04-16T11:01:34.047' AS DateTime), CAST(N'2024-04-16T11:01:34.190' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Admin', N'HoHCompany', N'COD', N'GRAB', 0, 0, NULL, N'Test Database ne', N'0345678978')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (18, N'admin@HoH.com', CAST(N'2024-04-16T11:02:50.073' AS DateTime), CAST(N'2024-04-16T11:02:50.077' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Admin', N'HoHCompany', N'VnPay', N'GRAB', 0, 0, NULL, N'', N'0345678978')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (19, N'admin@HoH.com', CAST(N'2024-04-16T11:11:54.180' AS DateTime), CAST(N'2024-04-16T11:11:54.313' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Admin', N'HoHCompany', N'VnPay', N'GRAB', 0, 0, NULL, N'', N'0345678978')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (20, N'admin@HoH.com', CAST(N'2024-04-16T14:28:38.510' AS DateTime), CAST(N'2024-04-16T14:28:38.640' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Admin', N'HoHCompany', N'VnPay', N'GRAB', 0, 0, NULL, N'', N'0345678978')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu], [DienThoai]) VALUES (21, N'admin@HoH.com', CAST(N'2024-04-16T14:31:53.080' AS DateTime), CAST(N'2024-04-16T14:31:53.087' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Admin', N'HoHCompany', N'COD', N'GRAB', 0, 0, NULL, N'fd', N'0345678978')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'admin@HoH.com', N'0295ee32227ee7d1688a8be1aa4ffeff', N'Admin', 1, CAST(N'2003-07-06T03:30:00.000' AS DateTime), N'HoHCompany', N'0345678978', N'admin@HoHCompany.com', N'WIN_20230728_10_28_39_Pro.jpg', 1, 1, N'tRrTr')
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'duytrinh', N'7aa61d6d56c72ec7d8177e57a1ad98bd', N'duytrinhphan', 1, CAST(N'2003-07-06T11:22:00.000' AS DateTime), N'75Thas', N'0398298855', N'duytrinhphan451@gmail.com', N'', 1, 0, N'eJULR')
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'duytrinhne', N'67cdc44e6bb69b4799eb97022fbf18cb', N'duytrinhphan', 1, CAST(N'2003-07-06T03:30:00.000' AS DateTime), N'75Thas', N'0398298855', N'duytrinhphan451@gmail.com', N'', 1, 0, N'HJrKH')
GO
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1, N'Casio', N'casio', NULL, NULL)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (2, N'Saga', N'saga', NULL, NULL)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (3, N'Tissot', N'tissot', NULL, NULL)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (4, N'Rado', N'rado', NULL, NULL)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (5, N'Citizen', N'citizen', NULL, NULL)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (6, N'G-Shock', N'gshock', NULL, NULL)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (7, N'Bayby-G', N'babyg', NULL, NULL)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (8, N'Calvin Klein', N'Calvinklein', NULL, NULL)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (9, N'Đồng hồ Thụy Sỹ', N'dhthuysy', NULL, NULL)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (10, N'Đồng hồ Nhật Bản', N'dhnhatban', NULL, NULL)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (11, N'Đồng hồ phiên bản giới hạn', N'dhphienbangioihan', NULL, NULL)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (12, N'Đồng hồ điện tử', N'dhdientu', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Loai] OFF
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'1', N'Công ty đồng hồ', N'eeww', N'Phan Dương Quốc', N'phanduongquoc111@gmail.com', N'0886111620', N'Kiên Giang', NULL)
GO
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (-1, N'Khách đã hủy đơn', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (0, N'Mới đặt hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (1, N'Đã thanh toán', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (2, N'Chờ giao hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (3, N'Đã giao hàng', NULL)
GO
ALTER TABLE [dbo].[BanBe] ADD  CONSTRAINT [DF_Promotions_Sent]  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_NgayGY]  DEFAULT (getdate()) FOR [NgayGY]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_CanTraLoi]  DEFAULT ((0)) FOR [CanTraLoi]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [NgaySX]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Votes]  DEFAULT ((0)) FOR [SoLanXem]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_RequireDate]  DEFAULT (getdate()) FOR [NgayCan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippedDate]  DEFAULT (((1)/(1))/(1900)) FOR [NgayGiao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_PaymentMethod]  DEFAULT (N'Cash') FOR [CachThanhToan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippingMethod]  DEFAULT (N'Airline') FOR [CachVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [PhiVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [MaTrangThai]
GO
ALTER TABLE [dbo].[HoiDap] ADD  CONSTRAINT [DF_HoiDap_NgayDua]  DEFAULT (getdate()) FOR [NgayDua]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Gender]  DEFAULT ((0)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Birthday]  DEFAULT (getdate()) FOR [NgaySinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Hinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Active]  DEFAULT ((0)) FOR [HieuLuc]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_UserLevel]  DEFAULT ((0)) FOR [VaiTro]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Them]  DEFAULT ((0)) FOR [Them]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Sua]  DEFAULT ((0)) FOR [Sua]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xoa]  DEFAULT ((0)) FOR [Xoa]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xem]  DEFAULT ((0)) FOR [Xem]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_BanBe_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_BanBe_KhachHang]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_QuangBa_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_QuangBa_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[ChuDe]  WITH CHECK ADD  CONSTRAINT [FK_ChuDe_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChuDe] CHECK CONSTRAINT [FK_ChuDe_NhanVien]
GO
ALTER TABLE [dbo].[GopY]  WITH CHECK ADD  CONSTRAINT [FK_GopY_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuDe] ([MaCD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GopY] CHECK CONSTRAINT [FK_GopY_ChuDe]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TrangThai] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TrangThai]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TrangWeb] FOREIGN KEY([MaTrang])
REFERENCES [dbo].[TrangWeb] ([MaTrang])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TrangWeb]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_Favorites_Customers]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_YeuThich_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_YeuThich_HangHoa]
GO
