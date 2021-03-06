USE [DAWEBTHOITRANG]
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 2020-11-25 2:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaCTHD] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NULL,
	[MaSP] [char](5) NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 2020-11-25 2:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayLap] [datetime] NULL,
	[GhiChu] [nvarchar](255) NULL,
 CONSTRAINT [PK__HoaDon__2725A6E04A567405] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2020-11-25 2:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[SDT] [char](10) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [varchar](50) NULL,
	[TenDN] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 2020-11-25 2:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [char](2) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 2020-11-25 2:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [char](5) NOT NULL,
	[TenNCC] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SDT] [char](10) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 2020-11-25 2:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [char](5) NOT NULL,
	[TenSP] [nvarchar](255) NULL,
	[GiaBan] [float] NULL,
	[GiamGia] [float] NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaNCC] [char](5) NULL,
	[MaLoai] [char](2) NULL,
	[Anh] [nvarchar](max) NULL,
	[AnhCT] [nvarchar](max) NULL,
	[Size] [varchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [Email], [TenDN], [Pass]) VALUES (1, N'Nguyễn Sỹ Thành', CAST(0x75240B00 AS Date), N'0334561123', N'Quảng Bình', N'thanhns2000@gmail.com', N'nguyensythanh', N'thanh123')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [Email], [TenDN], [Pass]) VALUES (2, N'Trần Thị Như Yến', CAST(0xEB240B00 AS Date), N'0114756998', N'Bình Chánh, TPHCM', N'yenttn2000@gmail.com', N'tranthinhuyen', N'yen123')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [Email], [TenDN], [Pass]) VALUES (3, N'Chu Nguyễn Gia Hân', CAST(0x84240B00 AS Date), N'0478955356', N'Bình Chánh, TPHCM', N'hancng2000@gmail.com', N'chunguyengiahan', N'han123')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [DiaChi], [Email], [TenDN], [Pass]) VALUES (4, N'Phạm Mộng Kha', CAST(0xA3240B00 AS Date), N'0334125572', N'Bến Tre', N'khapm2000@gmail.com', N'phammongkha', N'kha123')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'BG', N'Bé Gái')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'BT', N'Bé Trai')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'N1', N'Nam')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'N2', N'Nữ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC01', N'Phúc An', N'Long An', N'0113697745')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC02', N'Long Ẩn', N'Cà Mau', N'0117563314')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC03', N'Ngọc Đạt', N'TPHCM', N'0336458873')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'BG001', N'Đầm thun bé gái Hồng sen', 99000, 85000, N'Chất liệu mềm mại, đường may kỹ lưỡng chắc chắn, bé thoải mái vận động. -Kiểu dáng dễ thương họa tiết đáng yêu -Giúp bé thêm phần thời trang và xinh xắn.', N'NCC01', N'BG', N'17.jpg', N'17_2.jpg, 17_3.jpg, 17_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'BG002', N'Đầm thun bé gái Hồng cam', 99000, 85000, N'Chất liệu mềm mại, đường may kỹ lưỡng chắc chắn, bé thoải mái vận động. -Kiểu dáng dễ thương họa tiết đáng yêu -Giúp bé thêm phần thời trang và xinh xắn.', N'NCC01', N'BG', N'18.jpg', N'18_2.jpg, 18_3.jpg, 18_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'BG003', N'Đầm vải bé gái  Xanh', 99000, 85000, N'Chất liệu mềm mại, đường may kỹ lưỡng chắc chắn, bé thoải mái vận động. -Kiểu dáng dễ thương họa tiết đáng yêu -Giúp bé thêm phần thời trang và xinh xắn.', N'NCC02', N'BG', N'19.jpg', N'19_2.jpg, 19_3.jpg, 19_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'BG004', N'Áo khoác len bé gái Xanh', 299000, 269000, N'Sản xuất tại Việt Nam. -Chất liệu mềm mại, thấm hút mồ hôi -Đường may kỹ lưỡng chắc chắn, bé thoải mái vận động. -Kiểu dáng dễ thương với những đường cắt và chi tiết tinh xảo, đáng yêu sẽ giúp bé thêm phần thời trang và xinh xắn.', N'NCC01', N'BG', N'20.jpg', N'20_2.jpg, 20_3.jpg, 20_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'BT001', N'Bộ thun bé trai dài', 199000, 169000, N'Sản phẩm với chất liệu mềm mại, thấm hút mồ hôi. -Đường may kỹ lưỡng chắc chắn sẽ giúp bé thoải mái vận động. -Kiểu dáng dễ thương họa tiết đáng yêu sẽ giúp bé thêm phần thời trang và xinh xắn.', N'NCC01', N'BT', N'21.jpg', N'21_2.jpg, 21_3.jpg, 21_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'BT002', N'Bộ thun bé trai dài Vàng', 199000, 169000, N'Sản phẩm với chất liệu mềm mại, thấm hút mồ hôi, đường may kỹ lưỡng chắc chắn sẽ giúp bé thoải mái vận động. -Kiểu dáng dễ thương họa tiết đáng yêu sẽ giúp bé thêm phần thời trang và xinh xắn.', N'NCC02', N'BT', N'22.jpg', N'22_2.jpg, 22_3.jpg, 22_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'BT003', N'Áo thun bé trai sát nách Xanh', 129000, 119000, N'Sản phẩm với chất liệu mềm mại, thấm hút mồ hôi, đường may kỹ lưỡng chắc chắn sẽ giúp bé thoải mái vận động. -Kiểu dáng dễ thương họa tiết đáng yêu sẽ giúp bé thêm phần thời trang và xinh xắn.', N'NCC03', N'BT', N'23.jpg', N'23_2.jpg, 23_3.jpg, 23_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'BT004', N'Áo thun tay ngắn Trắng', 89000, 69000, N'Sản phẩm với chất liệu mềm mại, thấm hút mồ hôi, đường may kỹ lưỡng chắc chắn sẽ giúp bé thoải mái vận động. -Kiểu dáng dễ thương họa tiết đáng yêu sẽ giúp bé thêm phần thời trang và xinh xắn.', N'NCC01', N'BT', N'24.jpg', N'24_2.jpg, 24_3.jpg, 24_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N1001', N'Áo Thun Thiết Kế', 150000, 135000, N'Chất liệu: Cotton 2 chiều
Thành phần: 100% Cotton 
-Co dãn 2 chiều 
-Thấm hút mồ hôi tốt mang lại cảm giác thoáng mát', N'NCC01', N'N1', N'1.jpg', N'1_2.jpg, 1_3.jpg, 1_4.jpg', N'S, M, L, XL')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N1002', N'Áo Thun Thiết Kế', 185000, 165000, N'Chất liệu: Cotton 2 chiều
Thành phần: 100% Cotton
- Co dãn 2 chiều
- Thấm hút mồ hôi tốt mang lại cảm giác thoáng mát', N'NCC02', N'N1', N'2.jpg', N'2_2.jpg, 2_3.jpg, 2_4.jpg', N'S, M, L, XL')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N1003', N'Áo Thun Đơn Giản', 185000, 165000, N'Chất liệu: Cotton 100% (2C)
Với thành phần 100% từ sợi thiên nhiên -Áo thun mang lại cảm giác thoáng mát, thấm hút mồ hôi tốt.
', N'NCC03', N'N1', N'3.jpg', N'3_2.jpg, 3_3.jpg, 3_4.jpg', N'S, M, L, XL')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N1004', N'Áo Khoác Hoodie Đơn Giản', 295000, 275000, N'Chất liệu:
MINI ZURRY
 -Thành Phần:
+ 95% COTTON
 -Thân thiện với môi trường
Thoáng mát
+ 5% SPANDEX 
Giúp áo co giãn tối ưu 
- ÉP CỰC QUANG LOGO VXKQ', N'NCC02', N'N1', N'4.jpg', N'4_2.jpg, 4_3.jpg, 4_4.jpg', N'S, M, L, XL')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N1005', N'Áo Khoác Hoodie Đơn Giản', 295000, 275000, N'Chất liệu: Vảy cá chéo
Thành phần: 95%cotton 5%spandex -
Co dãn 4 chiều nên tạo được sự thoải mái khi mặc
 -Vải thấm hút mồ hôi tốt, thoáng khí', N'NCC01', N'N1', N'5.jpg', N'5_2.jpg, 5_3.jp, 5_4.jpg', N'S, M, L, XL')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N1006', N'Áo Khoác Hoodie Thiết Kế', 385000, 355000, N'Chất liệu: Vảy cá chéo
Thành phần: 95%cotton 5%spandex
- Co dãn 4 chiều nên tạo được sự thoải mái khi mặc
- Vải thấm hút mồ hôi tốt, thoáng khí', N'NCC02', N'N1', N'6.jpg', N'6_2.jpg, 6_3.jpg, 6_4.jpg', N'S, M, L, XL')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N1007', N'Sơ Mi Thiết Kế', 325000, 300000, N'Chất liệu: vải polyester -
Thành phần : 100% poly
- Độ bền tốt', N'NCC02', N'N1', N'7.jpg', N'7_2.jpg, 7_3.jpg, 7_4.jpg', N'S, M, L, XL')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N1008', N'Sơ Mi Caro Thiết Kế', 255000, 235000, N'Chất liệu: Kate
Thành phần: Cotton và Polyester. 
- Vải ít nhăn, mặt vải phẳng và mịn 
-Thấm hút ầm tốt 
-Dễ dàng giặt ủi.', N'NCC03', N'N1', N'8.jpg', N'8_2.jpg, 8_3.jpg, 8_4.jpg', N'S, M, L, XL')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N2001', N'Áo Khoác Nữ', 350000, 320000, N'Chất liệu Cotton -Toát vẻ tinh tế thanh lịch -Thấm hút tốt', N'NCC01', N'N2', N'9.jpg', N'9_2.jpg, 9_3.jpg, 9_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N2002', N'Áo Khoác Nữ', 380000, 350000, N'Chất liệu: Kaki -Toát vẻ tinh tế thanh lịch', N'NCC01', N'N2', N'10.jpg', N'10_2.jpg, 10_3.jpg, 10_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N2003', N'Somi Kiểu Tay Dài', 290000, 270000, N'Tông màu trắng tinh khôi cùng chất liệu vải mềm, thoáng mát -Mang đến vẻ đẹp trẻ trung, thanh lịch và hiện đại cho các cô nàng công sở

 -Chất liệu cotton', N'NCC02', N'N2', N'11.jpg', N'11_2.jpg, 11_3.jpg, 11_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N2004', N'Sơmi Tay Dài', 280000, 260000, N'Tông màu nhẹ nhàng, thanh lịch và chất liệu cotton mềm mại, thoáng mát -Mang đến vẻ đẹp trẻ trung, thanh lịch và hiện đại cho các quý cô công sở.

 -Chất liệu 65% cotton, 3% linen', N'NCC01', N'N2', N'12.jpg', N'12_2.jpg, 12_3.jpg, 12_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N2005', N'Sơmi Nữ Tay Lỡ', 220000, 200000, N'Áo sơ mi in caro xanh, trắng mang đến vẻ trẻ trung và hiện đại cho các bạn gái -Thiết kế phù hợp cho phong cách thường ngày của bạn.

 -Chất liệu 100% cotton
 -Cổ lật
, Tay lỡ, Vạt bầu', N'NCC02', N'N2', N'13.jpg', N'13_2.jpg, 13_3.jpg, 13_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N2006', N'Chân Váy', 250000, 220000, N'Chất liệu cotton dày dặn -Mang đến vẻ đẹp trẻ trung, thanh lịch và hiện đại cho các quý cô công sở', N'NCC03', N'N2', N'14.jpg', N'14_2.jpg, 14_3.jpg, 14_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N2007', N'Chân Váy', 330000, 300000, N'Chất liệu kaki dày dặn -Thiết kế phù hợp cho phong cách thường ngày của bạn', N'NCC01', N'N2', N'15.jpg', N'15_2.jpg, 15_3.jpg, 15_4.jpg', N'S, M, L')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [GiamGia], [MoTa], [MaNCC], [MaLoai], [Anh], [AnhCT], [Size]) VALUES (N'N2008', N'Đầm Suông Trễ Vai', 200000, 180000, N'Đầm Miss Blue tôn dáng xinh và trông quyến rũ -Những chiếc đầm dáng suông này rất khéo léo để ăn gian thêm chiều cao các bạn gái nhé -
Thiết kế dây thắt lưng giúp bạn thật thoải mái khi mặc và thắt ôm để khoe vòng eo thon.

 -Chất liệu: 100% cotton', N'NCC02', N'N2', N'16.jpg', N'16_2.jpg, 16_3.jpg, 16_4.jpg', N'S, M, L')
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
