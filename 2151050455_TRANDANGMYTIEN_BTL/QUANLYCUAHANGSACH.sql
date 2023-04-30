create database QUANLYNHASACH;

use QUANLYNHASACH;

CREATE TABLE TACGIA (
MaTG CHAR(5) PRIMARY KEY, --KHOA CHINH --
TenTG NVARCHAR(255) NOT NULL,
Web VARCHAR(255) NOT NULL,
GhiChu NVARCHAR(255) NOT NULL
);

CREATE TABLE THELOAI (
MaTL CHAR(5) PRIMARY KEY,
TenTL NVARCHAR(255) NOT NULL
);

CREATE TABLE NXB (
MaNXB CHAR(5) PRIMARY KEY,  --KHOA CHINH --
TenNXB NVARCHAR(255) NOT NULL,
DC NVARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL,
ThTinDD NVARCHAR(255) NOT NULL
);

CREATE TABLE NCC (
MaNCC CHAR(5) PRIMARY KEY,  --KHOA CHINH --
TenNCC NVARCHAR(255) NOT NULL,
DC NVARCHAR(255) NOT NULL,
SDT VARCHAR(11) NOT NULL
);

CREATE TABLE SACH (
MaS CHAR(5) PRIMARY KEY,  --KHOA CHINH --
TenS NVARCHAR(255) NOT NULL,
MaTG CHAR(5),
FOREIGN KEY (MaTG) REFERENCES TACGIA(MaTG), --KHOA NGOAI --
MaTL CHAR(5),
FOREIGN KEY (MaTL) REFERENCES THELOAI(MaTL), --KHOA NGOAI --
MaNXB CHAR(5),
FOREIGN KEY (MaNXB) REFERENCES NXB(MaNXB), --KHOA NGOAI --
NamXB INT NOT NULL,
);

CREATE TABLE NHANVIEN (
MaNV CHAR(5) PRIMARY KEY, --KHOA CHINH --
HoTen NVARCHAR(255) NOT NULL,
NgSinh DATE NOT NULL,
SDT VARCHAR(11) NOT NULL
);

CREATE TABLE KHACHHANG (
MaKH CHAR(5) PRIMARY KEY, --KHOA CHINH --
TenKH NVARCHAR(255) NOT NULL,
SDT VARCHAR(11) NOT NULL,
DC NVARCHAR(255) NOT NULL
);

CREATE TABLE PHIEUNHAP (
MaPN CHAR(5) PRIMARY KEY, --KHOA CHINH --
MaNV CHAR(5),
MaNCC CHAR(5),
NgNhap DATE NOT NULL,
FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV), --KHOA NGOAI --
FOREIGN KEY (MaNCC) REFERENCES NCC(MaNCC) --KHOA NGOAI --
);

CREATE TABLE CHITIETPN (
MaPN CHAR(5),
MaS CHAR(5),
SoLuong INT NOT NULL,
DonGia FLOAT NOT NULL,
FOREIGN KEY (MaPN) REFERENCES PHIEUNHAP(MaPN), --KHOA NGOAI --
FOREIGN KEY (MaS) REFERENCES SACH(MaS) --KHOA NGOAI --
);

CREATE TABLE PHIEUXUAT (
MaPX CHAR(5) PRIMARY KEY, --KHOA CHINH --
MaNV CHAR(5),
MaKH CHAR(5),
NgXuat DATE NOT NULL,
FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV), --KHOA NGOAI --
FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH) --KHOA NGOAI --
);

CREATE TABLE CHITIETPX (
MaPX CHAR(5),
MaS CHAR(5),
SoLuong INT NOT NULL,
DonGia FLOAT NOT NULL,
FOREIGN KEY (MaPX) REFERENCES PHIEUXUAT(MaPX), --KHOA NGOAI --
FOREIGN KEY (MaS) REFERENCES SACH(MaS) --KHOA NGOAI --
);

-- TAO RANG BUOC --- 
ALTER TABLE SACH
ADD CONSTRAINT check_NXB CHECK (NamXB > 2017 );

ALTER TABLE TACGIA
ADD CONSTRAINT check_TacGia CHECK (TenTG IN ('Tony','Brain', 'Jeffrey Archer', 'Sasaki Fumio', 'Han Na'));

ALTER TABLE CHITIETPN
ADD CONSTRAINT check_soluong CHECK (SoLuong >= 1);

ALTER TABLE PHIEUNHAP
ADD CONSTRAINT ngay_Nhap CHECK (NgNhap < getDate()); 

ALTER TABLE NXB 
ADD CONSTRAINT dia_Chi CHECK (DC IN ('Hà Nội', 'Hồ Chí Minh'));

ALTER TABLE TACGIA
DROP CONSTRAINT check_TacGia ;
 



-- NHAP LIEU CHO CAC BANG -- 
INSERT INTO TACGIA (MaTG, TenTG, Web, GhiChu)
VALUES 
('TG01', 'Tony', 'https://www.fahasa.com/ca-phe-cung-tony-tai-ban-2022.html', 'GC01' ),
('TG02', 'Brain', 'https://www.fahasa.com/co-hai-con-meo-ngoi-ben-cua-so-tai-ban-2018.html', 'GC02'  ),
('TG03', 'Jeffrey Archer', 'https://www.fahasa.com/hai-so-phan-bia-cung.html', 'GC03'),
('TG04', 'Sasaki Fumio', 'https://www.fahasa.com/loi-song-toi-gian-cua-nguoi-nhat-tai-ban-2021.html', 'GC03' ),
('TG05', 'Han Na', 'https://www.fahasa.com/toi-la-beto-tai-ban-2018.html', 'GC05'  ); 


INSERT INTO THELOAI (MaTL, TenTL)
VALUES 
('TL01', 'Kỹ năng sống' ),
('TL02', 'Tiểu thuyêt'),
('TL03', 'Tác phẩm kinh điển'),
('TL04', 'Kinh dị'),
('TL05', 'Truyện Tranh'); 


INSERT INTO NXB (MaNXB, TenNXB, DC, Email, ThTinDD)
VALUES 
('NXB01', 'NXB Trẻ' , 'Hà Nội' , 'hanoi@gmail.com' , 'A'),
('NXB02', 'NXB Kim Đồng' , 'Hồ Chí Minh' , 'cantho@gmail.com' , 'B'),
('NXB03', 'NXB Văn học' , 'Hồ Chí Minh', 'hcm@gmail.com' , 'C'),
('NXB04', 'NXB Lao Động' ,'Hồ Chí Minh', 'angiang@gmail.com' , 'D'),
('NXB05', 'NXB Già' , 'Hà Nội', 'bentre@gmail.com' , 'E');


INSERT INTO SACH (MaS, TenS, MaTG, MaTL, MaNXB, NamXB)
VALUES 
('S01', 'Cà Phê Cùng Tony' , 'TG01' ,'TL01', 'NXB01' , 	2022),
('S02', 'Có Hai Con Mèo Ngồi Bên Cửa Sổ' , 'TG02' ,'TL05', 'NXB03' , 2018),
('S03', 'Hai Số Phận' , 'TG03' ,'TL04', 'NXB04' , 2019),
('S04', 'Lối Sống Tối Giản Của Người Nhật' , 'TG04' ,'TL03', 'NXB02' , 2023),
('S05', 'Tôi Là Bêtô' , 'TG05' ,'TL02', 'NXB05' , 	2018);


INSERT INTO NHANVIEN (MaNV, HoTen, NgSinh, SDT)
VALUES 
('NV01', 'Nguyễn Văn A', '1990-01-14', '0933238767'),
('NV02', 'Nguyễn Văn B', '1991-02-14', '0967456735'),
('NV03', 'Nguyễn Văn C', '1992-03-14', '0987534265'),
('NV04', 'Nguyễn Văn D', '1993-04-14', '0976313574'),
('NV05', 'Nguyễn Văn E', '1994-05-14', '0976245667');


INSERT INTO KHACHHANG (MaKH, TenKH, SDT, DC)
VALUES 
('KH01', 'Trần Văn A', '0909876543','Quận 1, TP.HCM' ),
('KH02', 'Trần Văn B', '0908884567','Quận 2, TP.HCM' ),
('KH03', 'Trần Văn C', '0976489532','Quận 3, TP.HCM' ),
('KH04', 'Trần Văn D', '0987542356','Quận 4, TP.HCM' ),
('KH05', 'Trần Văn E', '0909834167','Quận 5, TP.HCM' );

INSERT INTO NCC (MaNCC, TenNCC, DC, SDT)
VALUES 
('NCC1', 'Công ty TNHH A', 'Quận 1, TP.HCM', '0987543378'),
('NCC2', 'Công ty TNHH B', 'Quận 2, TP.HCM', '0902345678'),
('NCC3', 'Công ty TNHH C', 'Quận 3, TP.HCM', '0902426379'),
('NCC4', 'Công ty TNHH D', 'Quận 4, TP.HCM', '0904452791'),
('NCC5', 'Công ty TNHH E', 'Quận 4, TP.HCM', '0997545891');


INSERT INTO PHIEUNHAP (MaPN, MaNV, MaNCC, NgNhap)
VALUES 
('PN01', 'NV02', 'NCC5', '2022-04-11'),
('PN02', 'NV01', 'NCC4', '2022-04-12'),
('PN03', 'NV03', 'NCC3', '2022-04-13'),
('PN04', 'NV04', 'NCC2', '2022-04-14'),
('PN05', 'NV05', 'NCC1', '2022-04-15');


INSERT INTO CHITIETPN (MaPN, MaS, SoLuong, DonGia)
VALUES 
('PN03', 'S01', 50, 5000),
('PN04', 'S04', 60, 7000),
('PN01', 'S02', 20, 1000),
('PN02', 'S05', 10, 8000),
('PN05', 'S03', 20, 9000);


INSERT INTO PHIEUXUAT (MaPX, MaNV, MaKH, NgXuat)
VALUES 
('PX01', 'NV02', 'KH03', '2023-04-15'),
('PX02', 'NV01', 'KH01', '2023-04-16'),
('PX03', 'NV04', 'KH02', '2023-04-17'),
('PX04', 'NV03', 'KH05', '2023-04-18'),
('PX05', 'NV05', 'KH04', '2023-04-19');


INSERT INTO CHITIETPX (MaPX, MaS, SoLuong, DonGia)
VALUES 
('PX02', 'S04', 20, 10000),
('PX01', 'S03', 15, 20000),
('PX04', 'S02', 25, 30000),
('PX03', 'S01', 20, 25000),
('PX05', 'S05', 10, 15000); 

--TRUY VAN 

--1.Liệt kê tất cả các thể loại sách trong bảng THELOAI
SELECT * FROM THELOAI;

--2.Liệt kê tất cả các sách trong bảng SACH có năm xuất bản lớn hơn hoặc bằng 2017
SELECT * FROM SACH WHERE NamXB >= 2017;

--3.Tìm tên tác giả của cuốn sách có mã sách là 'SO1'
SELECT A.TenTG 
FROM TACGIA A
JOIN SACH B ON A.MaTG = B.MaTG 
WHERE B.MaS = 'S01' ;


--4. Lấy tên các tác giả và số lượng sách mà mỗi tác giả đã viết:
SELECT B.TenTG, COUNT(*) AS 'SoLuongSach'
FROM SACH A
JOIN TACGIA B ON A.MaTG = B.MaTG
GROUP BY B.TenTG;

--5. Lấy tên và địa chỉ email của tất cả các nhà xuất bản có địa chỉ ở Hà Nội:
SELECT TenNXB, Email
FROM NXB
WHERE DC = 'Hà Nội';

--6. Lấy tên của tất cả các khách hàng đã đặt hàng ít nhất 1 lần:
SELECT A.TenKH, COUNT(*) AS 'Number'
FROM KHACHHANG A
JOIN PHIEUXUAT B ON A.MaKH = B.MaKH
GROUP BY A.TenKH
HAVING COUNT(*) >= 1;


--7. Lấy tên của tất cả các tác giả đã viết ít nhất 1 cuốn sách :
SELECT B.TenTG, COUNT(*) AS 'Số sách'
FROM SACH A 
JOIN TACGIA B ON A.MaTG = B.MaTG
GROUP BY B.TenTG
HAVING COUNT(*) >= 1;

--8. Lấy tên của tất cả các tác giả mà đã viết ít nhất một cuốn sách thuộc thể loại 'Kinh dị':
SELECT A.TenTG, C.TenTL
FROM TACGIA A
JOIN SACH B ON A.MaTG = B.MaTG
JOIN THELOAI C ON B.MaTL = C.MaTL
WHERE C.TenTL = 'Kinh dị';

--9. Lấy tên của tất cả các tác giả và số lượng cuốn sách của mỗi tác giả theo từng thể loại, sắp xếp theo tên tác giả:
SELECT A.TenTG, C.TenTL, COUNT(*) AS 'Số lượng sách '
FROM TACGIA A
JOIN SACH B ON A.MaTG = B.MaTG
JOIN THELOAI C ON B.MaTL = C.MaTL
GROUP BY A.TenTG, C.TenTL
ORDER BY A.TenTG;