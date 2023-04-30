create database QUANLYTHUESACH;
use QUANLYTHUESACH;

create table SACH
(
	MaSach Char(10) primary key, --Khóa chính --
	TenSach NVarChar(50) not null,
	TacGia NVarChar(50) not null,
	TenNhaXuatBan NVarChar(50) not null,
	GiaMuaVao Decimal (8,2) not null,
	GhiChu Nvarchar(MAX)

);

create table KHACHHANG
(
	MaKH INT IDENTITY(1,1) primary key, --auto number --
	TenKH NVarChar(50),
	DiaChi NvarChar (100) not null,
	SoDT NVarChar(12) not null,
	LoaiSachYT NVarChar(100),
	GhiChu NVarChar(MAX),

);

create table THUESACH
(
	MaKH INT IDENTITY(1,1),
	MaSach Char(10),
	NgayMuon DATETIME,
	NgayTra DATETIME not null,
	TienThu decimal(8,2),
	GhiChu NVarChar(MAX),
	primary key(MaKH, MaSach, NgayMuon), -- Tạo khóa chính gồm 3 thuộc tính -- 
	FOREIGN KEY (MaKH) References KHACHHANG(MaKH), -- Khóa ngoại --
	FOREIGN KEY (MaSach) References SACH(MaSach) --Khóa ngoại --- 
);

 GO
  -- Thêm vào một thuộc tính TomTat cho bảng SÁCH với kiểu dữ liệu nchar(250).
	ALTER TABLE SACH ADD TOMTAT NChar(250);
  -- Tạo ràng buộc default cho thuộc tính Giá mua vào trong bảng SÁCH = 20000.
	ALTER TABLE SACH ADD CONSTRAINT df_gia DEFAULT 2000 FOR GiaMuaVao;
  -- Tạo ràng buộc cho thuộc tính Nhà xuất bản chỉ nhận được các giá trị: NXBVH,NXBTRE, NXBGD
	ALTER TABLE SACH ADD CONSTRAINT chek_nxb CHECK(TenNhaXuatBan in ('NXBVH', 'NXBTRE', 'NXBGD'));
  -- Tạo ràng buộc NOT NULL cho thuộc tính Tên khách hàng trong bảng KHÁCH HÀNG.
	ALTER TABLE KHACHHANG ALTER COLUMN TenKH NvarChar(50) NOT NULL;
  -- Tạo ràng buộc UNIQUE thuộc tính cho Số điện thoại trong bảng KHÁCH HÀNG
	ALTER TABLE KHACHHANG ADD CONSTRAINT unique_sdt UNIQUE(SoDT);
  -- Tạo ràng buộc NULL cho thuộc tính Loại sách yêu thích trong bảng KHÁCH HÀNG.
	ALTER TABLE KHACHHANG ALTER COLUMN LoaiSachYT NVarchar null;
  -- Tạo ràng buộc DEFAULT là ngày hiện tại cho thuộc tính Ngày mượn trong bảng THUÊ SÁCH.
	ALTER TABLE THUESACH ADD CONSTRAINT df_ngaymuon DEFAULT GETDATE() FOR NgayMuon;
  -- Tạo ràng buộc cho thuộc tính Số tiền thu phải là số dương
	ALTER TABLE THUESACH ADD CONSTRAINT chk_sotienthu CHECK(TienThu > 0);
  -- Tạo ràng buộc cho thuộc tính Ngày trả sách: Ngày Trả > Ngày Mượn.
	ALTER TABLE THUESACH ADD CONSTRAINT chk_ngaytra CHECK(NgayTra > NgayMuon);
  -- Thay đổi kiểu dữ liệu của thuộc tính Ghi chú trong bảng KHÁCH HÀNG thành nvarchar(200).
	ALTER TABLE KHACHHANG ALTER COLUMN GhiChu NVARCHAR(200);
  -- Xóa thuộc tính Ghi chú trong bảng THUÊ SÁCH
	ALTER TABLE THUESACH DROP COLUMN GhiChu;

