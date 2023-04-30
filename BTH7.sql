Create database QuanLyBanHang;


CREATE TABLE KHACHHANG(
    	MaKH varchar(5) PRIMARY KEY,
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
    	DonGia Float
);



CREATE TABLE HOADON(
    	MaHD int PRIMARY KEY,
    	NgayMua date,
    	MaKH varchar(5),
    	TrangThai varchar(30),
    	foreign key (MaKH) references KHACHHANG(MaKH)
);



CREATE TABLE CHITIETHOADON(
	MaHDCT int PRIMARY KEY ,
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
('111','2022-1-15','KH002','Da thanh toan'),
('222','2022-2-1','KH003','Chua thanh toan'),
('333','2022-2-15','KH001','Da thanh toan'),
('444','2022-3-10','KH002','Da thanh toan')

INSERT INTO CHITIETHOADON(MaHDCT, MaHD, MaSP, SoLuong) VALUES
('1','222','11','10'),
('2','111','22','25'),
('3','333','33','12'),
('4','333','33','15'),
('5','222','11','17')


-- 
--1.
Select *
From KHACHHANG

--2.
Select MaKH,HoTenLot, Email, DienThoai
From KHACHHANG

--3.
Select MaSP, TenSP,(DonGia*SoLuong) as TongTien
From SANPHAM
--4.
Select MaKH as maKhachHang, CONCAT(HoTenLot, ' ', Ten) as hoVaTen, DiaChi
From KHACHHANG
Where Ten Like 'H%'

--5.
Select *
From KHACHHANG
Where DiaChi Like '%Cong Hoa%'

--6.
Select *
From SANPHAM
Where SoLuong Between 100 And 500

--7. 
Select *
From HOADON
Where TrangThai = 'Chua thanh toan' and NgayMua like '2022%'

--8.
Select *
From HOADON
Where MaKH in('KH001','KH003','KH006')

--9.
Select Count(*)
From KHACHHANG

--10.
Select MAX(DonGia)
From SANPHAM

--11.
Select Min(Soluong)
From SANPHAM

--12.
Select Sum(SoLuong)
From SANPHAM

--13.
Select COUNT(*)
From HOADON
Where NgayMua Like '%2022%' and TrangThai = 'Chua thanh toan'

--14.
SELECT A.MaHD, COUNT(B.MaSP) as SoLoaiSanPham
FROM HOADON A
JOIN CHITIETHOADON B ON A.MaHD = B.MaHD
GROUP BY A.MaHD

--15.
SELECT A.MaHD, COUNT(B.MaSP) as SoLoaiSanPham
FROM HOADON A
JOIN CHITIETHOADON B ON A.MaHD = B.MaHD
GROUP BY A.MaHD
Having Count(B.MaSP) >= 2
--16.
Select MaHD, NgayMua, MaKH
From HOADON
Order By NgayMua desc

--NÂNG CAO 
--1.
Select A.MaHD, A.MaKH, A.TrangThai, B.MaSP, B.SoLuong, A.NgayMua
From HOADON A
Inner Join CHITIETHOADON B on A.MaHD = B.MaHD

--2.
Select A.MaHD, A.MaKH, A.TrangThai, B.MaSP, B.SoLuong, A.NgayMua
From HOADON A
Inner Join CHITIETHOADON B on A.MaHD = B.MaHD
Where A.MaKH like 'KH001'

--3.
Select A.MaHD, A.NgayMua, C.TenSP, C.DonGia, B.SoLuong, (C.DonGia * C.SoLuong) as ThanhTien
From HOADON A
Inner Join CHITIETHOADON B on A.MaHD = B.MaHD
Inner Join SANPHAM C on C.MaSP = B.MaSP

--4.
Select CONCAT(A.HoTenLot,' ',A.Ten) as HoVaTenKH, A.Email, A.DienThoai, B.MaHD, B.TrangThai, (C.SoLuong * D.DonGia) as TongTien
From KHACHHANG A
Inner Join HOADON B on B.MaKH = A.MaKH
Inner Join CHITIETHOADON C on C.MaHD = B.MaHD
Inner Join SANPHAM D on D.MaSP = C.MaSP
Where B.TrangThai = 'Chua thanh toan'

--5.
Select A.MaHD, A.NgayMua,Sum(B.SoLuong * C.DonGia) As TongTien
From HOADON A
Inner join CHITIETHOADON B on B.MaHD = A.MaHD
Inner Join SANPHAM C on C.MaSP = B.MaSP
Group By A.MaHD, A.NgayMua
Having Sum(B.SoLuong * C.DonGia) >= 500000 
Order By TongTien Desc

--6.
Select *
From KHACHHANG A
Left Join HOADON B on A.MaKH = B.MaKH
And B.NgayMua >= '2022-1-1'
Where B.MaHD Is NULL

--7.
Select A.MaSP, A.TenSP, Sum(B.SoLuong) as LuotMua
From SANPHAM A
Join CHITIETHOADON B on A.MaSP = B.MaSP
Join HOADON C on C.MaHD = B.MaHD
Where C.NgayMua between '2022-2-1' and '2022-2-28'
Group By A.MaSP, A.TenSP
ORDER BY LuotMua DESC
--8.
SELECT A.MaKH, A.Ten, SUM(C.SoLuong * D.DonGia) AS TongTienMua
FROM KHACHHANG A
JOIN HOADON  B ON A.MaKH = B.MaKH
JOIN CHITIETHOADON C ON B.MaHD = C.MaHD
JOIN SANPHAM D ON C.MaSP = D.MaSP
WHERE YEAR(B.NgayMua) = 2022
GROUP BY A.MaKH, A.Ten

--9.
Select Distinct A.*
From KHACHHANG A
join HOADON B on B.MaKH = A.MaKH
Join CHITIETHOADON C on C.MaHD = B.MaHD
Join SANPHAM D on D.MaSP = c.MaSP 
Where  D.TenSP like '%tươi%' AND B.NgayMua between '2022-2-1' and '2022-2-28'

--10. 
Select A.TenSP,COUNT(B.SoLuong) as LuotMua
From SANPHAM A
Join CHITIETHOADON B on A.MaSP = B.MaSP
Group By A.TenSP
Having Count(B.Soluong) < AVG(Count(B.Soluong)) 



