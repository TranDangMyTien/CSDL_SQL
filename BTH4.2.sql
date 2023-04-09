create database BatDongSan;

create table VanPhong
(
	MaVP varchar(5) PRIMARY KEY,
	DiaDiem nvarchar(30) NOT NULL,
);

alter table VanPhong 
	alter column DiaDiem nvarchar(30) NOT NULL

create table NhanVien 
(
	MaNV varchar(5) PRIMARY KEY,
	TenNV nvarchar(10) NOT NULL,
	MaVP varchar(5) NOT NULL REFERENCES VanPhong(MaVP),
);

create table ThanNhan
(
	MaTN varchar(5) PRIMARY KEY,
	TenThanNhan nvarchar(10) NOT NULL,
	MoiQuanHe nvarchar(5) NOT NULL,
	MaNV varchar(5) NOT NULL REFERENCES NhanVien(MaNV),
);

create table ChuSoHuu
(
	MaChuSoHuu varchar(5) PRIMARY KEY,
	TenChuSoHuu nvarchar(10) NOT NULL,
	SoDienThoai varchar (11) NOT NULL,
);

create table BatDongSan
(
	MaBDS varchar(5) PRIMARY KEY,
	DiaChi nvarchar(30) NOT NULL,
	MaVP varchar(5) NOT NULL REFERENCES VanPhong(MaVP),
	MaChuSoHuu varchar(5) NOT NULL REFERENCES ChuSoHuu(MaChuSoHuu),
);

alter table ChuSoHuu add constraint uniqueSDT unique(SoDienThoai);

alter table ThanNhan add constraint checkMoiQuanHe check ( MoiQuanHe IN ('Vợ', 'Chồng', 'Con'));

alter table ThanNhan add constraint defaultMQH default 'NguoiPhuThuoc' for MoiQuanHe;

INSERT INTO VANPHONG(MaVP, DiaDiem) VALUES
('VP01', 'Bình Định'),
('VP02', 'Bắc Giang'),
('VP03', 'Hà Nội'),
('VP04', 'Bình Dương'),
('VP05', 'Đồng Tháp')

INSERT INTO NhanVien(MaNV, TenNV, MaVP) VALUES
('NV01', 'Bình', 'VP01'),
('NV02', 'Hoàng', 'VP02'),
('NV03', 'Nhi', 'VP03'),
('NV04', 'Khánh', 'VP04'),
('NV05', 'Lan', 'VP05')

INSERT INTO ThanNhan(MaTN, TenThanNhan, MoiQuanHe, MaNV) VALUES
('TN01', 'Hồng', 'Vợ', 'NV01'),
('TN02', 'Thủy', 'Vợ', 'NV02'),
('TN03', 'Thúy', 'Con', 'NV03'),
('TN04', 'Hùng', 'Con', 'NV04'),
('TN05', 'Cường', 'Chồng', 'NV05')

INSERT INTO ChuSoHuu(MaChuSoHuu, TenChuSoHuu, SoDienThoai) VALUES
('SH01', 'Ý', '05874698123'),
('SH02', 'Vân', '05418756243'),
('SH03', 'Nghĩa', '04158752463'),
('SH04', 'Trâm', '09874515874'),
('SH05', 'Mai', '09563248156')

INSERT INTO BatDongSan(MaBDS, DiaChi, MaVP, MaChuSoHuu) VALUES
('BDS01', 'TP.HCM', 'VP01', 'SH01'),
('BDS02', 'Nà Nội', 'VP02', 'SH02'),
('BDS03', 'Đà Nẵng', 'VP03', 'SH03'),
('BDS04', 'Huế', 'VP04', 'SH04'),
('BDS05', 'Quy Nhơn', 'VP05', 'SH05')


SELECT * FROM BatDongSan