USE [master]
GO
/****** Object:  Database [quanlycuahangtaphoa]    Script Date: 5/24/2025 5:44:56 PM ******/
CREATE DATABASE [quanlycuahangtaphoa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quanlycuahangtaphoa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\quanlycuahangtaphoa.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quanlycuahangtaphoa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\quanlycuahangtaphoa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [quanlycuahangtaphoa] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quanlycuahangtaphoa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quanlycuahangtaphoa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET ARITHABORT OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET RECOVERY FULL 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET  MULTI_USER 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quanlycuahangtaphoa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quanlycuahangtaphoa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'quanlycuahangtaphoa', N'ON'
GO
ALTER DATABASE [quanlycuahangtaphoa] SET QUERY_STORE = ON
GO
ALTER DATABASE [quanlycuahangtaphoa] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [quanlycuahangtaphoa]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/24/2025 5:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/24/2025 5:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[address] [nvarchar](255) NULL,
	[phone] [char](12) NULL,
 CONSTRAINT [PK__Customer__A4AE64B8153E4A48] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/24/2025 5:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[amount] [bigint] NULL,
	[totalAmount] [bigint] NULL,
	[customerID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/24/2025 5:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[price] [bigint] NULL,
	[quantity] [int] NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK__OrderDet__BAD83E69AE8E2148] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/24/2025 5:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[stockOnHand] [int] NULL,
	[price] [bigint] NULL,
	[imagePath] [nvarchar](255) NULL,
	[categoryID] [int] NOT NULL,
 CONSTRAINT [PK__Product__2D10D14ABC549956] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockIn]    Script Date: 5/24/2025 5:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockIn](
	[productID] [int] NOT NULL,
	[supplierID] [int] NOT NULL,
	[quantity] [int] NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 5/24/2025 5:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[supplierID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/24/2025 5:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NULL,
	[password] [varchar](100) NULL,
	[role] [varchar](10) NULL,
	[phone] [char](12) NULL,
	[fullName] [nvarchar](100) NULL,
	[address] [nvarchar](200) NULL,
	[position] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryID], [name]) VALUES (1, N'Đồ uống')
INSERT [dbo].[Category] ([categoryID], [name]) VALUES (2, N'Thực phẩm khô')
INSERT [dbo].[Category] ([categoryID], [name]) VALUES (3, N'Bánh kẹo')
INSERT [dbo].[Category] ([categoryID], [name]) VALUES (4, N'Đồ gia dụng')
INSERT [dbo].[Category] ([categoryID], [name]) VALUES (5, N'Đồ vệ sinh')
INSERT [dbo].[Category] ([categoryID], [name]) VALUES (6, N'Văn phòng phẩm')
INSERT [dbo].[Category] ([categoryID], [name]) VALUES (9, N'Đồ thờ cúng')
INSERT [dbo].[Category] ([categoryID], [name]) VALUES (10, N'Thực phẩm lạnh')
INSERT [dbo].[Category] ([categoryID], [name]) VALUES (11, N'Đồ nóng')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([customerID], [name], [address], [phone]) VALUES (1, N'Nguyễn Văn An', N'15 Lê Đại Hành, Quận Hai Bà Trưng, Hà Nội', N'0901234567  ')
INSERT [dbo].[Customers] ([customerID], [name], [address], [phone]) VALUES (2, N'Trần Thị Bình', N'25 Nguyễn Thị Minh Khai, Quận 1, TP.HCM', N'0912345678  ')
INSERT [dbo].[Customers] ([customerID], [name], [address], [phone]) VALUES (3, N'Lê Văn Cường', N'35 Trần Hưng Đạo, Quận 5, TP.HCM', N'0923456789  ')
INSERT [dbo].[Customers] ([customerID], [name], [address], [phone]) VALUES (4, N'Phạm Thị Dung', N'45 Lý Thường Kiệt, Quận 10, TP.HCM', N'0934567890  ')
INSERT [dbo].[Customers] ([customerID], [name], [address], [phone]) VALUES (5, N'Hoàng Văn Em', N'55 Bà Triệu, Quận Hoàn Kiếm, Hà Nội', N'0945678901  ')
INSERT [dbo].[Customers] ([customerID], [name], [address], [phone]) VALUES (6, N'Huy', N'Đà Nẵng', N'0395546300  ')
INSERT [dbo].[Customers] ([customerID], [name], [address], [phone]) VALUES (7, N'Trang', N'Đà  Nẵng', N'0911855450  ')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (2, NULL, 150000, 2, 2, CAST(N'2025-03-04T17:23:16.990' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (3, NULL, 85000, 3, 3, CAST(N'2025-03-07T17:23:16.990' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (4, NULL, 320000, 4, 4, CAST(N'2025-03-12T17:23:16.990' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (5, NULL, 45000, 5, 5, CAST(N'2025-03-17T17:23:16.990' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (7, 3500, 3500, 6, 3, NULL)
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (8, 3500, 3500, 6, 2, CAST(N'2025-03-24T19:09:17.327' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (9, 132000, 132000, 6, 3, CAST(N'2025-03-24T21:48:26.040' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (10, 34500, 34500, 6, 2, CAST(N'2025-03-25T17:12:12.583' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (12, NULL, 60000, 2, 2, CAST(N'2025-01-10T11:15:16.000' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (13, NULL, 70000, 3, 3, CAST(N'2025-02-01T09:20:16.000' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (15, NULL, 90000, 5, 2, CAST(N'2025-03-10T13:00:16.000' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (16, NULL, 100000, 6, 3, CAST(N'2025-03-15T12:35:16.000' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (18, NULL, 120000, 2, 2, CAST(N'2025-04-05T10:10:16.000' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (19, NULL, 130000, 3, 3, CAST(N'2025-05-01T11:45:16.000' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (21, NULL, 150000, 5, 2, CAST(N'2025-06-10T15:30:16.000' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (22, NULL, 160000, 6, 3, CAST(N'2025-06-15T14:20:16.000' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (23, 100000, 100000, 6, 2, CAST(N'2025-03-31T21:29:00.777' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (24, 28500, 28500, 7, 2, CAST(N'2025-04-09T09:37:09.927' AS DateTime))
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [customerID], [userID], [createdAt]) VALUES (25, 21000, 21000, 6, 2, CAST(N'2025-04-09T09:37:43.303' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (2, 6, 120000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (2, 10, 10000, 3, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (3, 5, 3500, 10, 10)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (3, 7, 25000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (3, 9, 22000, 2, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (4, 13, 450000, 1, 15)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (4, 18, 135000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (5, 20, 5000, 6, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (5, 21, 12000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (7, 5, 3500, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (8, 5, 3500, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (9, 4, 12000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (9, 6, 120000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (10, 4, 12000, 2, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (10, 5, 3500, 3, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (12, 3, 12000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (12, 4, 10000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (13, 5, 20000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (13, 6, 35000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (15, 9, 10000, 5, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (15, 10, 5000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (16, 11, 12000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (18, 15, 10000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (18, 16, 30000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (19, 17, 20000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (19, 18, 12500, 3, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (21, 21, 30000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (23, 10, 10000, 10, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (24, 5, 3500, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (24, 7, 25000, 1, 0)
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount]) VALUES (25, 5, 3500, 6, 0)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (1, N'Pepsi 330ml', 331, 100000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\pepsi-lon-330ml.png', 1)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (3, N'Nước suối Aquafina 500ml', 150, 5000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\aquafina-500ml.jpg', 1)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (4, N'Trà xanh 0 độ 500ml', 2, 12000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\traxanh0do.jpg', 1)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (5, N'Mì gói Hảo Hảo', 188, 3500, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\BAG-HAO-HAO-TCC.png', 2)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (6, N'Gạo Tám Thơm 5kg', 39, 120000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\gaotamthom5kg.jpg', 2)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (7, N'Đường trắng 1kg', 49, 25000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\duongtrang1kg.jpg', 2)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (8, N'Muối iốt 500g', 141, 8000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\muoi-iot-ban-lieu-cao-cap-500gam.jpg', 2)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (9, N'Bánh Oreo', 100, 22000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\Banhoreo.jpg', 3)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (10, N'Kẹo Mentos', 90, 10000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\keomentos.jpg', 3)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (11, N'Snack Lays', 75, 12000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\snack.jpg', 3)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (13, N'Nồi cơm điện mini', 10, 450000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\noi-com-dien-mini.jpg', 4)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (14, N'Bộ dao kéo nhà bếp', 15, 120000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\bo-dao-keo-lam-bep.jpg', 4)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (15, N'Ấm đun nước siêu tốc', 8, 220000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\binh-dun-sieu-toc.jpg', 4)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (16, N'Nước giặt Omo 3.5kg', 30, 175000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\botgiatomo3.5kg.jpg', 5)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (17, N'Nước rửa chén Sunlight', 35, 28000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\nuocruatrangsunlight.jpg', 5)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (18, N'Dầu gội đầu Dove 650g', 25, 135000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\daugoidove650g.jpg', 5)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (19, N'Giấy vệ sinh 10 cuộn', 40, 85000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\giayvesinh10cuon.jpg', 5)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (20, N'Bút bi Thiên Long', 200, 5000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\butbithienlong.jpg', 6)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [imagePath], [categoryID]) VALUES (21, N'Vở học sinh 96 trang', 150, 12000, N'D:\File Các Môn Học\Đồ Án CDIO2\LuuTruCode\Nhom4DoAn-HeThongQuanLyCuaHangTapHoa\image\SanPham\vohocsinh96trnag.jpg', 6)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt]) VALUES (1, 1, 501, CAST(N'2025-02-20T16:50:30.603' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt]) VALUES (3, 1, 60, CAST(N'2025-02-22T16:50:30.603' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt]) VALUES (5, 2, 100, CAST(N'2025-02-25T16:50:30.603' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt]) VALUES (6, 2, 20, CAST(N'2025-02-26T16:50:30.603' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt]) VALUES (9, 3, 40, CAST(N'2025-03-02T16:50:30.603' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt]) VALUES (10, 3, 50, CAST(N'2025-03-03T16:50:30.607' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt]) VALUES (13, 4, 5, CAST(N'2025-03-07T16:50:30.607' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt]) VALUES (14, 4, 10, CAST(N'2025-03-08T16:50:30.607' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt]) VALUES (16, 5, 15, CAST(N'2025-03-12T16:50:30.607' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt]) VALUES (18, 5, 15, CAST(N'2025-03-13T16:50:30.607' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt]) VALUES (20, 6, 100, CAST(N'2025-03-17T16:50:30.607' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt]) VALUES (21, 6, 250, CAST(N'2025-03-26T13:40:25.567' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([supplierID], [name], [address]) VALUES (1, N'Công ty TNHH Đồ uống Sài Gòn', N'123 Nguyễn Trãi, Quận 1, TP.HCM')
INSERT [dbo].[Supplier] ([supplierID], [name], [address]) VALUES (2, N'Công ty CP Thực phẩm Miền Bắc', N'45 Lê Lợi, Quận Hoàn Kiếm, Hà Nội')
INSERT [dbo].[Supplier] ([supplierID], [name], [address]) VALUES (3, N'Công ty TNHH Bánh kẹo Bibica', N'67 Nguyễn Huệ, Quận 1, TP.HCM')
INSERT [dbo].[Supplier] ([supplierID], [name], [address]) VALUES (4, N'Công ty CP Điện máy XYZ', N'89 Cách Mạng Tháng 8, Quận 3, TP.HCM')
INSERT [dbo].[Supplier] ([supplierID], [name], [address]) VALUES (5, N'Công ty TNHH Hóa mỹ phẩm ABC', N'234 Phan Chu Trinh, Quận Hoàn Kiếm, Hà Nội')
INSERT [dbo].[Supplier] ([supplierID], [name], [address]) VALUES (6, N'Công ty TNHH Thiên Long', N'456 Đinh Tiên Hoàng, Quận 1, TP.HCM')
INSERT [dbo].[Supplier] ([supplierID], [name], [address]) VALUES (7, N'Công ty TNHH Đồ gia dụng Hòa Phát', N'234 Phạm Hùng, Quận 8, TP.HCM')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userID], [username], [password], [role], [phone], [fullName], [address], [position]) VALUES (1, N'admin', N'123456', N'Admin', N'0987654321  ', N'Phạm Minh Trang', N'Đà Nẵng', N'Giám đốc')
INSERT [dbo].[User] ([userID], [username], [password], [role], [phone], [fullName], [address], [position]) VALUES (2, N'nhanvien1', N'123456', N'Nhân Viên', N'0777851061  ', N'Nguyễn Thành Hậu', N'Đà Nẵng', N'Nhân viên')
INSERT [dbo].[User] ([userID], [username], [password], [role], [phone], [fullName], [address], [position]) VALUES (3, N'nhanvien2', N'123456', N'Nhân Viên', N'0395546300  ', N'Nguyễn Phạm Nhật Huy', N'Đà Nẵng', N'Nhân viên')
INSERT [dbo].[User] ([userID], [username], [password], [role], [phone], [fullName], [address], [position]) VALUES (4, N'nhanvien3', N'123456', N'Nhân Viên', N'0356656253  ', N'Thái Viết Hồng Nhật', N'Đà Nẵng', N'Nhân viên')
INSERT [dbo].[User] ([userID], [username], [password], [role], [phone], [fullName], [address], [position]) VALUES (5, N'nhanvien4', N'123456', N'Nhân Viên', N'0379802393  ', N'Khiếu Thành Doanh', N'Đà Nẵng', N'Nhân viên')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__stockOn__14270015]  DEFAULT ((0)) FOR [stockOnHand]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__price__151B244E]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[StockIn] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__customerI__0A9D95DB] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customers] ([customerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__customerI__0A9D95DB]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__18EBB532] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order__18EBB532]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__produ__19DFD96B] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__produ__19DFD96B]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__categor__160F4887] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__categor__160F4887]
GO
ALTER TABLE [dbo].[StockIn]  WITH CHECK ADD  CONSTRAINT [FK__StockIn__product__22751F6C] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[StockIn] CHECK CONSTRAINT [FK__StockIn__product__22751F6C]
GO
ALTER TABLE [dbo].[StockIn]  WITH CHECK ADD FOREIGN KEY([supplierID])
REFERENCES [dbo].[Supplier] ([supplierID])
GO
USE [master]
GO
ALTER DATABASE [quanlycuahangtaphoa] SET  READ_WRITE 
GO
