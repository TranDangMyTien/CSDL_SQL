create database QuanLyBanHang;

use QuanLyBanHang;

create table KhachHang
(
	MaKH varchar(5) primary key,
	HoTenLot varchar(30) not null, 
	Ten varchar(10) not null,
	DiaChi varchar(150) not null, 
	Email varchar(30) not null, 
	DienThoai varchar(13) not null
);

create table SanPham
( 
	MaSP nchar(10) primary key,
	MoTa varchar(255) not null, 
	SoLuong int not null, 
	DonGia float not null,
	TenSP varchar(50) not null
);

create table HoaDon
(
	 MaHD nchar(10) primary key, 
	 NgayMua date not null, 
	 MaKH varchar(5), 
	 foreign key (MaKH) references KhachHang (MaKH), 
	 TrangThai varchar(30) not null

);

create table HoaDonCHiTiet 
(
	MaHDCT nchar(10) primary key,
	MaHD nchar(10),
	foreign key (MaHD) references HoaDon (MaHD), 
	MaSP nchar(10), 
	foreign key (MaSP) references SanPham(MaSP),
	SoLuong int 
);

