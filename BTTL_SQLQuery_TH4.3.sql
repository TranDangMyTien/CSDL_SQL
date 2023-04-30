CREATE DATABASE QUANLYBANHANG;
USE QUANLYBANHANG;

CREATE TABLE KHACHHANG
(
	MaKH char(10) primary key, 
	HoTen nvarchar(30), 
	DiaChi nvarchar(30),
	SDT varchar(10),
	NgaySinh date, 
	DoanhSo float, 
	NgayDK date

);

CREATE TABLE NHANVIEN 
(
	MaNV char(10) primary key,
	HoTen nvarchar(30),
	NgayVaoLam date,
	SDT varchar(10),
);

CREATE TABLE SANPHAM 
(
	MaSP char(10) primary key, 
	TenSP nvarchar(10), 
	DonVi nvarchar(30),
	NuocSX nvarchar(30),
	Gia decimal(8,2)
);

CREATE TABLE HOADON 
(
	SoHD char(10) primary key, 
	NgayMua date, 
	MaKH char(10),
	MaNV char(10),
	TriGia decimal(8,2),
	foreign key (MaKH) references KHACHHANG(MaKH),
	foreign key (MaNV) references NHANVIEN(MaNV)
);

CREATE TABLE CTHD
(
	SoHD char(10), 
	MaSP char(10), 
	SoLuong int, 
	foreign key (MaSP) references SANPHAM(MaSP), 
	foreign key (SoHD) references HOADON(SoHD)
);

--RANG BUOC 
alter table SANPHAM add GhiChu varchar(20);
alter table KHACHHANG add LoaiKH tinyint;
alter table KHACHHANG drop constraint LoaiKH;
-- alter table KHACHHANG drop column LoaiKH;
alter table KHACHHANG alter column LoaiKH varchar(100);
alter table SANPHAM alter column GhiChu varchar(100);
alter table SANPHAM drop column GhiChu; 
alter table KHACHHANG add constraint check_LoaiKH check(LoaiKH in('ThanThiet','KhachLe','CongTy'));
-- alter table KHACHHANG drop constraint check_LoaiKH;
alter table SANPHAM add constraint check_dv check(DonVi in('Chai','Thung', 'Lon', 'Loc'));
alter table CTHD add constraint check_sl check(SoLuong >= 1);
alter table KHACHHANG add constraint check_ngay check (NgayDK > NgaySinh); 
alter table SANPHAM add constraint default_gia default 100000 for Gia;
alter table HOADON add constraint check_ngaymua check(NgayMua < getdate());
alter table SANPHAM add constraint checkSX check(NuocSX in ('Phap','My','Canada','VietNam'));
alter table SANPHAM drop constraint checkSX;
alter table SANPHAM add constraint defaultNuocsx default 'VietNam' for NuocSX;

--NHAP DL 
--KhachHang--
insert into KHACHHANG 
Values ('1','ABC','Quan 1','123','2005/12/14',100000,'2019/12/08','ThanThiet'),
		('2','BCD','Quan 2','567','2001/12/14',200000,'2020/12/08','CongTy'),
		('3','CDE','Quan 3','890','2003/12/14',300000,'2017/12/08','KhachLe'),
		('4','EDF','Quan 7','156','2000/12/14',400000,'2016/12/08','ThanThiet'),
		('5','GHJ','Quan 6','222','2002/12/14',120000,'2017/07/08','ThanThiet');


--NhanVien--
insert into NHANVIEN 
Values  ('1','ABC','2019/12/05','0000'),
		 ('2','BCD','2019/12/05','0000'),
		  ('3','CDE','2019/12/05','0000'),
		   ('4','DEF','2019/12/05','0000'),
		    ('5','EFG','2019/12/05','0000');
--SanPham--
insert into SANPHAM 
Values ('1','ABC','Lon','Phap',20000),
('2','CDD','Lon','VietNam',30000),
('3','EDDF','Loc','My',40000),
('4','ABCD','Thung','Canada',10000),
('5','ABCE','Chai','Phap',70000);