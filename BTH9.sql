
create database QuanLyHangKhong;




create table MAYBAY (
	MaMB int,
	Loai varchar(50),
	TamBay int,
	constraint MAYBAY_PK primary key (MaMB)
);

create table NHANVIEN (
	MaNV char(9),
	Ten varchar(50),
	Luong int,
	constraint NHANVIEN_PK primary key (MaNV)
);

create table CHUYENBAY (
	MaCB char(5),
	GaDi varchar(50),
	GaDen varchar(50),
	DoDai int,
	GioDi datetime,
	GioDen datetime,
	ChiPhi int,
	MaNV char(9),
	MaMB int,
	constraint CHUYENBAY_PK primary key (MaCB),
	foreign key(MaNV) references NHANVIEN (MaNV),
	foreign key(MaMB) references MAYBAY (MaMB)
);

create table CHUNGNHAN (
	MaNV char(9),
	MaMB int,
	constraint CHUNGNHAN_PK primary key (MaNV, MaMB),
	constraint CHUNGNHAN_NHANVIEN_FK foreign key (MaNV) references NHANVIEN (MaNV),
	constraint CHUNGNHAN_MAYBAY_FK foreign key (MaMB) references MAYBAY (MaMB)
);


-- chen du lieu NHANVIEN
insert into NHANVIEN values ('242518965','Tran Van Son',120433);
insert into NHANVIEN values ('141582651','Doan Thi Mai',178345);
insert into NHANVIEN values ('011564812','Ton Van Quy',153972);
insert into NHANVIEN values ('567354612','Quan Cam Ly',256481);
insert into NHANVIEN values ('552455318','La Que',101745);
insert into NHANVIEN values ('550156548','Nguyen Thi Cam',205187);
insert into NHANVIEN values ('390487451','Le Van Luat',212156);
insert into NHANVIEN values ('274878974','Mai Quoc Minh',99890);
insert into NHANVIEN values ('254099823','Nguyen Thi Quynh',24450);
insert into NHANVIEN values ('356187925','Nguyen Vinh Bao',44740);
insert into NHANVIEN values ('355548984','Tran Thi Hoai An',212156);
insert into NHANVIEN values ('310454876','Ta Van Do',212156);
insert into NHANVIEN values ('489456522','Nguyen Thi Quy Linh',127984);
insert into NHANVIEN values ('489221823','Bui Quoc Chinh',23980);
insert into NHANVIEN values ('548977562','Le Van Quy',84476);
insert into NHANVIEN values ('310454877','Tran Van Hao',33546);
insert into NHANVIEN values ('142519864','Nguyen Thi Xuan Dao',227489);
insert into NHANVIEN values ('269734834','Truong Tuan Anh',289950);
insert into NHANVIEN values ('287321212','Duong Van Minh',48090);
insert into NHANVIEN values ('552455348','Bui Thi Dung',92013);
insert into NHANVIEN values ('248965255','Tran Thi Ba',43723);
insert into NHANVIEN values ('159542516','Le Van Ky',48250);
insert into NHANVIEN values ('348121549','Nguyen Van Thanh',32899);
insert into NHANVIEN values ('574489457','Bui Van Lap',20);


-- chen du lieu MAYBAY
insert into MAYBAY values (747,'Boeing 747 - 400',13488);
insert into MAYBAY values (737,'Boeing 737 - 800',5413);
insert into MAYBAY values (380,'Airbus A380 - 500',15000);
insert into MAYBAY values (340,'Airbus A340 - 300',11392);
insert into MAYBAY values (757,'Boeing 757 - 300',6416);
insert into MAYBAY values (777,'Boeing 777 - 300',10306);
insert into MAYBAY values (767,'Boeing 767 - 400ER',10360);
insert into MAYBAY values (320,'Airbus A320',4168);
insert into MAYBAY values (319,'Airbus A319',2888);
insert into MAYBAY values (727,'Boeing 727',2406);
insert into MAYBAY values (154,'Tupolev 154',6565);


-- chen du lieu CHUYENBAY
insert into CHUYENBAY values ('VN431','SGN','CAH',3693,'05:55:00','06:55:00',236,'242518965',380);
insert into CHUYENBAY values ('VN320','SGN','DAD',2798,'06:00:00','07:10:00',221,'567354612',319);
insert into CHUYENBAY values ('VN464','SGN','DLI',2002,'07:20:00','08:05:00',225,'574489457',319);
insert into CHUYENBAY values ('VN216','SGN','DIN',4170,'10:30:00','14:20:00',262,'574489457',777);
insert into CHUYENBAY values ('VN280','SGN','HPH',11979,'06:00:00','08:00:00',1279,'242518965',777);
insert into CHUYENBAY values ('VN254','SGN','HUI',8765,'18:40:00','20:00:00',781,'548977562',380);
insert into CHUYENBAY values ('VN338','SGN','BMV',4081,'15:25:00','16:25:00',375,'269734834',319);
insert into CHUYENBAY values ('VN440','SGN','BMV',4081,'18:30:00','19:30:00',426,'548977562',380);
insert into CHUYENBAY values ('VN651','DAD','SGN',2798,'19:30:00','08:00:00',221,'242518965',319);
insert into CHUYENBAY values ('VN276','DAD','CXR',1283,'09:00:00','12:00:00',203,'390487451',154);
insert into CHUYENBAY values ('VN374','HAN','VII',510,'11:40:00','13:25:00',120,'567354612',757);
insert into CHUYENBAY values ('VN375','VII','CXR',752,'14:15:00','16:00:00',181,'390487451',747);
insert into CHUYENBAY values ('VN269','HAN','CXR',1262,'14:10:00','15:50:00',202,'390487451',320);
insert into CHUYENBAY values ('VN315','HAN','DAD',134,'11:45:00','13:00:00',112,'310454877',320);
insert into CHUYENBAY values ('VN317','HAN','UIH',827,'15:00:00','16:15:00',190,'552455348',727);
insert into CHUYENBAY values ('VN741','HAN','PXU',395,'06:30:00','08:30:00',120,'552455348',767);
insert into CHUYENBAY values ('VN474','PXU','PQC',1586,'08:40:00','11:20:00',102,'552455348',767);
insert into CHUYENBAY values ('VN476','UIH','PQC',485,'09:15:00','11:50:00',117,'552455348',767);


-- chen du lieu CHUNGNHAN
insert into CHUNGNHAN values ('567354612',747);
insert into CHUNGNHAN values ('567354612',737);
insert into CHUNGNHAN values ('567354612',757);
insert into CHUNGNHAN values ('567354612',777);
insert into CHUNGNHAN values ('567354612',767);
insert into CHUNGNHAN values ('567354612',727);
insert into CHUNGNHAN values ('567354612',340);
insert into CHUNGNHAN values ('552455318',737);
insert into CHUNGNHAN values ('552455318',319);
insert into CHUNGNHAN values ('552455318',747);
insert into CHUNGNHAN values ('552455318',767);
insert into CHUNGNHAN values ('390487451',340);
insert into CHUNGNHAN values ('390487451',320);
insert into CHUNGNHAN values ('390487451',319);
insert into CHUNGNHAN values ('274878974',757);
insert into CHUNGNHAN values ('274878974',767);
insert into CHUNGNHAN values ('355548984',154);
insert into CHUNGNHAN values ('310454876',154);
insert into CHUNGNHAN values ('142519864',747);
insert into CHUNGNHAN values ('142519864',757);
insert into CHUNGNHAN values ('142519864',777);
insert into CHUNGNHAN values ('142519864',767);
insert into CHUNGNHAN values ('142519864',737);
insert into CHUNGNHAN values ('142519864',340);
insert into CHUNGNHAN values ('142519864',320);
insert into CHUNGNHAN values ('269734834',747);
insert into CHUNGNHAN values ('269734834',737);
insert into CHUNGNHAN values ('269734834',340);
insert into CHUNGNHAN values ('269734834',757);
insert into CHUNGNHAN values ('269734834',777);
insert into CHUNGNHAN values ('269734834',767);
insert into CHUNGNHAN values ('269734834',320);
insert into CHUNGNHAN values ('269734834',319);
insert into CHUNGNHAN values ('269734834',727);
insert into CHUNGNHAN values ('269734834',154);
insert into CHUNGNHAN values ('242518965',737);
insert into CHUNGNHAN values ('242518965',757);
insert into CHUNGNHAN values ('141582651',737);
insert into CHUNGNHAN values ('141582651',757);
insert into CHUNGNHAN values ('141582651',767);
insert into CHUNGNHAN values ('011564812',737);
insert into CHUNGNHAN values ('011564812',757);
insert into CHUNGNHAN values ('574489457',154);

--1
SELECT * FROM CHUYENBAY WHERE GaDi = 'DAD';
--2
SELECT * FROM MAYBAY WHERE TamBay > 10000;
--3
SELECT * FROM NHANVIEN WHERE Luong < 10000;
--4
SELECT * FROM CHUYENBAY WHERE DoDai BETWEEN 8000 AND 10000;
--5
SELECT * FROM CHUYENBAY WHERE GaDi = 'SGN' AND GaDen = 'BMV';
--6
SELECT COUNT(*) AS SoLuongChuyenBay FROM CHUYENBAY WHERE GaDi = 'SGN';
--7
SELECT COUNT(*) AS SoLuongMayBay FROM MAYBAY WHERE Loai LIKE 'Boeing%';
--8
SELECT SUM(Luong) AS TongLuong FROM NHANVIEN;

--9
SELECT DISTINCT A.MaNV
FROM NHANVIEN A
JOIN CHUYENBAY B ON A.MaNV = B.MaNV
JOIN MAYBAY C ON B.MaMB = C.MaMB
WHERE C.Loai = 'Boeing';

--10
SELECT A.*
FROM NHANVIEN A
JOIN CHUNGNHAN B ON A.MaNV = B.MaNV
JOIN MAYBAY C ON B.MaMB = C.MaMB
WHERE C.MaMB like '747';

--11.
SELECT C.MaMB
FROM NHANVIEN A
JOIN CHUNGNHAN B ON A.MaNV = B.MaNV
JOIN MAYBAY C ON B.MaMB = C.MaMB
WHERE A.Ten like 'Nguyen%';

--12.
SELECT MaNV
FROM CHUNGNHAN 
WHERE MaMB IN (
	SELECT MaMB 
	FROM MAYBAY 
	WHERE Loai LIKE '%Boeing%' Or Loai LIKE '%Airbus%')
order by MaNV

--13.
SELECT MaMB
FROM MAYBAY 
WHERE TamBay >= (
	SELECT DoDai 
	FROM CHUYENBAY 
	WHERE MaCB = 'VN280')

--14.
SELECT DISTINCT MaCB 
FROM CHUYENBAY 
WHERE MaMB IN (
	SELECT MaMB 
	FROM MAYBAY 
	WHERE Loai = 'Airbus A320'
);

--15.
SELECT DISTINCT Ten 
FROM NHANVIEN 
WHERE MaNV IN (
	SELECT Distinct MaNV 
	FROM CHUNGNHAN 
	WHERE MaMB IN (
		SELECT MaMB 
		FROM MAYBAY 
		WHERE Loai LIKE '%Boeing%')
);
--16.
SELECT MaNV, Loai, COUNT(*) AS SoPhiCong 
FROM CHUNGNHAN 
INNER JOIN MAYBAY ON CHUNGNHAN.MaMB = MAYBAY.MaMB 
GROUP BY MaNV, Loai;

--17.
SELECT DISTINCT A.MaCB, A.GaDi, B.GaDen
FROM CHUYENBAY A 
INNER JOIN CHUYENBAY B ON A.GaDen = B.GaDi 
WHERE B.GaDen = A.GaDi 
	AND A.GaDi = 'DAD' 
	AND B.GaDen = 'DAD';


--Gom nhom
--18.
SELECT GaDi, COUNT(*) as SoChuyenBay
FROM CHUYENBAY
GROUP BY GaDi;

--19.
SELECT GaDi, Sum(ChiPhi) as TongChiPhi
FROM CHUYENBAY
GROUP BY GaDi;

--20.
SELECT GaDi, COUNT(*) as SoChuyenBay
FROM CHUYENBAY
WHERE GioDi < '12:00:00'
GROUP BY GaDi;

--21.
SELECT DISTINCT MaNV
FROM NHANVIEN
WHERE EXISTS (
    SELECT *
    FROM MAYBAY
    WHERE NHANVIEN.MaNV = MAYBAY.MaMB
        AND Loai IN ('Boeing 747 - 400', 'Boeing 737 - 800', 'Airbus A380 - 500')
    );

--22.

--23.
SELECT A.MaNV, COUNT(DISTINCT C.Loai) AS TongSoLoaiMayBay
FROM NHANVIEN A
JOIN CHUYENBAY B on A.MaNV = B.MaNV
JOIN MAYBAY C ON C.MaMB= B.MaMB
GROUP BY A.MaNV;

--24.0
SELECT A.MaNV
FROM NHANVIEN A
JOIN CHUYENBAY B on A.MaNV = B.MaNV
JOIN MAYBAY C ON C.MaMB = B.MaMB
GROUP BY A.MaNV
Having COUNT(DISTINCT C.Loai)  = MAX(COUNT(DISTINCT C.Loai));



