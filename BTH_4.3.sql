create database QuanLyBanHang;

create table KhachHang 
(
	MaKH char(10) primary key,
	HoTen Nvarchar(30),
	DiaChi Nvarchar(150),
	SDT Nvarchar(10),
	NgaySinh Date ,
	DoanhSo Float ,
	NgayDK Date
);

create table NhanVien 
(
	MaNV Char(10) primary key,
	HoTen Nvarchar(30),
	NgayVaoLam Date,
	SDT Nvarchar(10)
);

create table SanPham
(
	MaSP Char(10) primary key,
	TenSP Nvarchar(30),
	DonVi Nvarchar(30),
	NuocSX Nvarchar(30),
	Gia Decimal(8,2)
);

create table HoaDon
(
	SoHD Char(10) primary key,
	NgayMua Date,
	MaKH Char(10),
	MaNV Char(10),
	TriGia Decimal(8,2),

	foreign key (MaKH) references KhachHang (MaKH),
	foreign key (MaNV) references NhanVien (MaNV)
);

create table CTHD 
(
	SoHD Char(10),
	MaSP Char(10),
	SoLuong Int,

	foreign key (MaSP) references SanPham (MaSP),
	foreign key (SoHD) references HoaDon (SoHD)
);

Alter table SanPham Add GhiChu varchar(20);

Alter table KhachHang Add LoaiKH tinyInt;

Alter table KhachHang Alter Column LoaiKH varchar(30);

Alter table SanPham Alter Column GhiChu varchar(100);

Alter table SanPham Drop Column GhiChu;

Alter table KhachHang Add Constraint loaiKH Check(LoaiKH in('ThanThiet','KhachLe','CongTy'));

Alter table SanPham Add Constraint donvi Check(DonVi in('Chai','Thung','Lon','Loc'));

Alter table CTHD Add Constraint soluong Check(SoLuong > 1);

Alter table KhachHang Add Constraint ngaydk Check(NgayDK > NgaySinh);

Alter table SanPham Add Constraint df_gia Default 100000 for Gia;

Alter table HoaDon Add Constraint ngayHD Check(NgayMua < GetDate());


Alter table SanPham Add Constraint nuoc_SX Check(NuocSX in('Phap','My','Canada','VietNam'));

Alter table SanPham Add Constraint df_nuocsx Default 'VietNam' for NuocSX;


--KhachHang--
insert into KhachHang
Values ('1','ABC','Quan 1','123','2005/12/14',100000,'2019/12/08','ThanThiet'),
		('2','BCD','Quan 2','567','2001/12/14',200000,'2020/12/08','CongTy'),
		('3','CDE','Quan 3','890','2003/12/14',300000,'2017/12/08','KhachLe'),
		('4','EDF','Quan 7','156','2000/12/14',400000,'2016/12/08','ThanThiet'),
		('5','GHJ','Quan 6','222','2002/12/14',120000,'2017/07/08','ThanThiet');


--NhanVien--
insert into NhanVien
Values  ('1','ABC','2019/12/05','0000'),
		 ('2','BCD','2019/12/05','0000'),
		  ('3','CDE','2019/12/05','0000'),
		   ('4','DEF','2019/12/05','0000'),
		    ('5','EFG','2019/12/05','0000');
--SanPham--
insert into SanPham
Values ('1','ABC','Lon','Phap','20000'),
('2','CDD','Lon','VietNam','30000'),
('3','EDDF','Loc','My','40000'),
('4','ABCD','Thung','Canada','10000'),
('5','ABCE','Chai','Phap','70000');

