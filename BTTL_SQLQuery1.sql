﻿--Tạo database 
create database QLDiem; 
--Sử dụng CSDL 
use QLDiem; 
--Tạo bảng 
CREATE TABLE DMKHOA 
(
	MAKHOA CHAR(2) PRIMARY KEY,
	TENKHOA NVARCHAR(20)
)

CREATE TABLE DMSV 
(
	MASV CHAR(3) PRIMARY KEY, 
	HOSV NVARCHAR(30), 
	TENSV NVARCHAR(10), 
	PHAI BIT, 
	NGAYSINH DATE DEFAULT(GETDATE()),--Khong lay gio phut giay. Mac dinh lay ngay hien tai
	NOISINH NVARCHAR(25), 
	MAKH CHAR (2), 
	HOCBONG FLOAT,
	FOREIGN KEY (MAKH) REFERENCES DMKHOA(MAKHOA) --Tao khoa ngoai
)

CREATE TABLE DMMH 
(
	MAMH CHAR(2) PRIMARY KEY, 
	TENMH NVARCHAR(30), 
	SOTIET TINYINT, 

)

CREATE TABLE KETQUA
(
	MASV CHAR (3), 
	MAMH CHAR(2), 
	LANTHI TINYINT,
	DIEM DECIMAL(4,2),
	PRIMARY KEY(MASV, MAMH, LANTHI),
	FOREIGN KEY(MASV) REFERENCES DMSV(MASV),
	FOREIGN KEY(MAMH) REFERENCES DMMH(MAMH)
)


--RANG BUOC 

ALTER TABLE DMSV ADD CONSTRAINT CHEC_HB CHECK(HOCBONG >= 0);
ALTER TABLE DMSV DROP CONSTRAINT CHEC_HB; --XOA RANG BUOC 
ALTER TABLE DMMH ADD CONSTRAINT CHECK_SOTIET CHECK(SOTIET > 0); 
ALTER TABLE DMMH ADD CONSTRAINT CHECK_TENMH UNIQUE(TENMH);
--Dat ten khoa chinh 
--ALTER TABLE DMMH ADD CONSTRAINT PK_DMMH_MAMH PRIMARY KEY(MAMH);
ALTER TABLE KETQUA ADD CONSTRAINT CHECK_DIEM CHECK (DIEM >=0);
ALTER TABLE DMKHOA ADD NamTl int; 
ALTER TABLE DMKHOA ADD CONSTRAINT CHK_DMKHOA_NAMTL CHECK (NamTL >= 1900); 
ALTER TABLE DMKHOA DROP CONSTRAINT CHK_DMKHOA_NAMTL;
ALTER TABLE DMKHOA ALTER COLUMN NamTL smallint; 
EXEC SP_RENAME 'DMK.NamTL', 'NAMTHANHLAP';
ALTER TABLE DMKHOA DROP COLUMN NamTl;
ALTER TABLE DMSV DROP CONSTRAINT FK__DMSV__MAKH__3A81B327; 
ALTER TABLE DMSV ADD CONSTRAINT FK_DMSV_KHOA FOREIGN KEY (MAKH) REFERENCES DMKHOA(MAKHOA);
--XOA DL TRONG BANG 
DELETE FROM DMKHOA 

--NHAP DU LIEU 
INSERT INTO DMKHOA(MAKHOA,TENKHOA) VALUES
('AV', N'Anh Văn'),
('TH', N'Tin Hoc')
INSERT INTO DMMH(MAMH, TENMH, SOTIET) VALUES 
('01', N'Trí tuệ nhân tạo', 45),
('02', N'Cơ sở dữ liệu', 45)
INSERT INTO DMSV VALUES --Nhap theo kieu mac dinh, dung thu tu 
('A01',N'Nguyễn Thị', N'Hải', '1', '1990/02/23',N'Cần Thơ','AV',1),
('A02',N'Lê Nguyễn', N'Hùng', '0', '1995/06/25',N'Long An','TH',2)
INSERT INTO KETQUA(MASV, MAMH,LANTHI,DIEM) VALUES 
('A01','01',1,3),
('A02','02',2,6)


