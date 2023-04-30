create database QuanLyBanHang;



CREATE TABLE KHACHHANG(
    	MaKH varchar(10) PRIMARY KEY,
    	HoTenLot varchar(30),
    	Ten varchar(10),
    	DiaChi varchar(150),
    	Email varchar(30),
    	DienThoai varchar(13)
);


CREATE TABLE SANPHAM(
    	MaSP int PRIMARY KEY,
    	TenSP varchar(50),
    	MoTa varchar(255),
    	SoLuong int,
    	DonGia float
);



CREATE TABLE HOADON(
    	MaHD int PRIMARY KEY,
    	NgayMua date,
    	MaKH varchar(10),
    	TrangThai varchar(30),
    	foreign key (MaKH) references KHACHHANG(MaKH)
);



CREATE TABLE CHITIETHOADON(
	MaHDCT int PRIMARY KEY,
	MaHD int,
        MaSP int,
        SoLuong int,
        FOREIGN KEY (MaHD) references HOADON(MaHD),
        FOREIGN KEY (MaSP) references SANPHAM(MaSP)
);

INSERT INTO KHACHHANG(MAKH, HoTenLot, Ten, DiaChi, Email, DienThoai) VALUES
('KH001', 'Nguyen Van','Teo','123 Nguyen Van Troi','kh001@gmail.com','98765432'),
('KH002','Le Thi','Trang','54 CMT8','kh002@yahoo.com','0908765422'),
('KH003','Tran Chi','Cong','34/17 Phan Chu Trinh','kh003@yahoo.com','0919087654'),
('KH004','Nguyen Thi Thu','Thao','43/1/2 Cong Hoa','kh004@gmail.com','098876543')

INSERT INTO SANPHAM(MaSP, TenSP, MoTa, SoLuong, DonGia) VALUES
('11','Sản phẩm hàng hóa 001','Đây là sản phẩm 001','21','100000'),
('22','Sản phẩm áo quần 002','Đây là sản phẩm thứ 2','102','99000'),
('33','Sản phẩm hoa quả trái cây tươi','Đây là sản phẩm thứ 3','25','95000'),
('44','Sản phẩm hải sản tươi sống','Dây là sản phẩm hải sản','112','150000'),
('55','Sản phẩm điện tử','Đây là sản phẩm thứ 4','54','105000')

INSERT INTO HOADON(MaHD, NgayMua, MaKH, TrangThai) VALUES
('111','2022-1-15','KH009','Da thanh toan'),
('222','2022-2-1','KH0010','Chua thanh toan'),
('333','2022-2-15','KH008','Da thanh toan'),
('444','2022-3-10','KH0011','Da thanh toan')

INSERT INTO CHITIETHOADON(MaHDCT, MaHD, MaSP, SoLuong) VALUES
('1','120955 ','1','10'),
('2','120954 ','2','25'),
('3','120956 ','3','12'),
('4','120956 ','3','15'),
('5','120955 ','1','17')

Update KHACHHANG
Set MaKH = 'KH008',HoTenLot = 'Nguyen Thi', Ten = 'Nga', DiaChi = '15 Quang Trung TP Da Nang'
where MaKH like 'KH001';

Update KHACHHANG
Set MaKH = 'KH009',HoTenLot = 'Tran Cong', Ten = 'Thanh', DiaChi = '234 Le Loi Quang Nam'
where MaKH like 'KH002';

Update KHACHHANG
Set MaKH = 'KH0010',HoTenLot = 'Le Hoang', Ten = 'Nam', DiaChi = '23 Tran Phu TP Hue'
where MaKH like 'KH003';

Update KHACHHANG
Set MaKH = 'KH0011',HoTenLot = 'Vu Ngoc', Ten = 'Hien', DiaChi = '37 Nguyen Thi Thap TP Da Nang'
where MaKH like 'KH0011';

select * from KHACHHANG


Update SANPHAM
Set MaSP = '1', TenSP = 'Samsung Galaxy J7 Pro', SoLuong = '800', DonGia ='6600000' 
where MaSP = '11';

Update SANPHAM
Set MaSP = '2', TenSP = 'iPhone 6 32GB', SoLuong = '500', DonGia ='8990000' 
where MaSP = '22';

Update SANPHAM
Set MaSP = '3', TenSP = 'Laptop Dell Inspiron 3467', SoLuong = '507', DonGia ='11290000' 
where MaSP = '33';

Update SANPHAM
Set MaSP = '4', TenSP = 'Pin sac du phong', SoLuong = '600', DonGia ='200000' 
where MaSP = '44';

Update SANPHAM
Set MaSP = '5', TenSP = 'Nokia 3100', SoLuong = '100', DonGia ='700000' 
where MaSP = '55';

select * from SANPHAM

Update HOADON
Set MaKH = 'KH008', MaHD = '120954', NgayMua = '2016-03-23', TrangThai ='Da thanh toan'
where MaKH = 'KH008';

Update HOADON
Set MaKH = 'KH009', MaHD = '120955', NgayMua = '2016-04-02', TrangThai ='Da thanh toan'
where MaKH = 'KH009';

Update HOADON
Set MaKH = 'KH0011', MaHD = '120956', NgayMua = '2016-07-12', TrangThai ='Chua thanh toan'
where MaKH = 'KH0011';

Update HOADON
Set MaKH = 'KH0010', MaHD = '125957', NgayMua = '2016-12-04', TrangThai ='Chua thanh toan'
where MaKH = 'KH0010';

select * from CHITIETHOADON

Update CHITIETHOADON
Set MaHD = '120954', MaSP = '3', SoLuong = '40'
where MaHDCT = '1';

Update CHITIETHOADON
Set MaHD = '120954', MaSP = '1', SoLuong = '20'
where MaHDCT = '2';

Update CHITIETHOADON
Set MaHD = '120955', MaSP = '2', SoLuong = '100'
where MaHDCT = '3';

Update CHITIETHOADON
Set MaHD = '120956', MaSP = '4', SoLuong = '6'
where MaHDCT = '4';

Update CHITIETHOADON
Set MaHD = '120956', MaSP = '2', SoLuong = '60'
where MaHDCT = '5';