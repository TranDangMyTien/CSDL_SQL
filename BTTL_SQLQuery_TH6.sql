CREATE DATABASE QuanLyNhanVien;
USE QuanLyNhanVien;


CREATE TABLE PHONG_BAN
(
	MA_PB CHAR(10) PRIMARY KEY,
    TEN_PB VARCHAR(20),
    MA_TRUONGPHONG INT
);

CREATE TABLE NHAN_VIEN
(
	MA_NV INT PRIMARY KEY,
	HO_NV VARCHAR(20),
   	TEN_NV VARCHAR(30),
    NAM_SINH DATE,
	GIOI_TINH VARCHAR(5),
    DIA_CHI VARCHAR(30),
    LUONG FLOAT,
    MA_PB CHAR(10),
    FOREIGN KEY (MA_PB) REFERENCES PHONG_BAN(MA_PB)
);

CREATE TABLE DU_AN
(
	MA_DUAN CHAR(5) PRIMARY KEY,
    TEN_DUAN VARCHAR(30),
    NGAY_BATDAU DATE,
    NGAY_KETTHUC DATE
);



CREATE TABLE QUANLY_DUAN
(
	MA_DUAN CHAR(5),
   	MA_NV INT,
    NGAY_THAM_GIA DATE,
    NGAY_KET_THUC DATE,
    SO_GIO FLOAT,
    VAI_TRO VARCHAR(20),
    PRIMARY KEY (MA_NV, MA_DUAN),--Khóa chính chứa 2 thuộc tính 
    FOREIGN KEY (MA_DUAN) REFERENCES DU_AN(MA_DUAN),
    FOREIGN KEY (MA_NV) REFERENCES NHAN_VIEN(MA_NV)
);




--=============================================================
--Input dữ liệu vào database

INSERT INTO PHONG_BAN(MA_PB, TEN_PB, MA_TRUONGPHONG) VALUES
('PB001','San xuat 1','1'), 
('PB002','San xuat 2','2'), 
('PB003','Quan ly chat luong','5'),
('PB004','Thiet ke','7'),
('PB005','Nghien cuu cong nghe','6'),
('PB006','Kinh doanh','8'),
('PB007','Truyen thong','3')

INSERT INTO NHAN_VIEN(MA_NV, HO_NV, TEN_NV, NAM_SINH, GIOI_TINH, DIA_CHI, LUONG, MA_PB) VALUES
('111','Nguyen','AN','1987-1-1','Nu','15 Nguyen Thi Minh Khai','10000','PB001'),
('222','Le','Bao','1982-3-2','Nam','20 Nguyen Van Troi','8000','PB002'),
('333','Tran','Cuong','1988-4-6','Nam','12 Cach Mang Thang 8','12000','PB001'),
('444','Van','Thanh','1990-7-3','Nu','245/1 Le Thi Rieng','15000','PB004'),
('555','Tran','Cuong','1995-8-1','Nam','43 Le Dai Hanh','5000','PB002'),
('666','Nguyen','Binh','2000-7-8','Nu','67 To Hien Thanh','6500','PB006'),
('777','Le','Phu','2000-9-11','Nam','32 Cao Thang','75000','PB005'),
('778','Nguyen','Hanh','2001-12-11','Nu','65/1 Cao Thang','75000','PB005')


INSERT INTO DU_AN(MA_DUAN, TEN_DUAN,NGAY_BATDAU, NGAY_KETTHUC) VALUES
('DA001','Du an cang Long Thanh','2022-01-02','2023-12-26'),
('DA002','Du an khong hai','2020-05-15','2021-08-11'),
('DA003','Du an quoc lo 1','2021-03-20','2023-09-19'),
('DA004','Du an xay cau nong thon','2022-08-17','2023-11-20');


INSERT INTO QUANLY_DUAN(MA_DUAN, MA_NV,NGAY_THAM_GIA, NGAY_KET_THUC, SO_GIO) VALUES
('DA001','111','2022-01-02','2023-05-26',20.5),
('DA001','222','2022-02-02','2023-06-02',30),
('DA001','333','2022-01-15','2023-04-22',23.5),
('DA002','111','2020-07-15','2021-02-15',20.5),
('DA002','666','2020-05-15','2021-05-21',20.5),
('DA002','333','2020-06-20','2021-07-01',20.5),
('DA004','555','2022-05-01','2023-10-29',40),
('DA004','666','2022-09-10','2023-09-25',34.5),
('DA004','777','2022-03-21','2023-05-11',19.0);

--TRUY VẤN 
select HO_NV, NAM_SINH, LUONG
from NHAN_VIEN 
where LUONG > 6000

select HO_NV, TEN_NV 
from NHAN_VIEN 
where LUONG BETWEEN 10000 AND 15000

select *
from PHONG_BAN 
where TEN_PB LIKE '%San xuat%'

select HO_NV, TEN_NV,LUONG 
from NHAN_VIEN
where MA_PB like 'PB002' and LUONG < 10000

select * 
from NHAN_VIEN 
where HO_NV like 'Ng%' and MA_PB like 'PB006'

select MAX(LUONG) as N'Lương cao nhất'
from NHAN_VIEN

select count(*) as N'Số lượng nhân viên'
from NHAN_VIEN
where MA_PB like 'PB002'

select avg(LUONG) as N'Lương TB'
from NHAN_VIEN
where MA_PB like 'PB001'

select count(*)
from DU_AN 
where NGAY_KETTHUC < '2016-12-31'

select count(*) as N'Số lượng nhân viên'
from NHAN_VIEN
where LUONG = ( select MAX(LUONG) from NHAN_VIEN)

select MA_PB as N'Mã phòng ban', AVG(LUONG) as N'Lương TB'
from NHAN_VIEN
group by MA_PB

select MA_PB, COUNT(*) as N'Số lượng nhân viên'
from NHAN_VIEN
group by MA_PB





















---------------------- THAM KHẢO KHÔNG ĐƯỢC RUN ---------------------------
--1.Cho biết Họ tên, Năm sinh, mức lương của NV có lương trên 6.000.000
Select TEN_NV, HO_NV,NAM_SINH,LUONG
FROM NHAN_VIEN
WHERE LUONG > 6000
--2. Hiển thị họ, tên nhân viên có lương nằm trong khoảng 10tr đến 15tr.
SELECT HO_NV,TEN_NV 
FROM NHAN_VIEN
WHERE LUONG BETWEEN 10000 AND 15000
--3. Cho biêt thông tin của các phòng ban có chứa chuỗi ‘Sản xuất’.
SELECT * 
FROM PHONG_BAN
WHERE TEN_PB LIKE '%San xuat%' -- Chỉ cần chuỗi có chứa từ 'San xuat' thì lấy 
--4. Hiển thị thông tin họ, tên, mức lương của nhân viên thuộc phòng ban ‘PB002 ’có lương dưới 10tr.
SELECT TEN_NV, HO_NV,LUONG
FROM NHAN_VIEN
WHERE (MA_PB LIKE 'PB002') AND (LUONG < 10000)
--5. Hiển thị thông tin nhân viên có họ bắt đầu bằng ‘Ng’ ở phòng ban ‘PB006’
SELECT *
FROM NHAN_VIEN
WHERE (HO_NV LIKE 'Ng%') AND MA_PB LIKE 'PB006'
--6. Cho biết thông tin nhân viên có tên bắt đầu bằng chữ ‘A’ hoặc chữ ‘B’ và có lương trên 12tr.
SELECT *
FROM NHAN_VIEN
WHERE (TEN_NV LIKE 'A%' OR TEN_NV LIKE 'B') AND (LUONG > 12000)
--7. Hiển thị mức lương cao nhất trong bảng nhân viên.
SELECT MAX(LUONG) AS 'LUONG_MAX'
FROM NHAN_VIEN
--8. Đếm số lượng nhân viên của phòng ban có mã ‘PB002’
SELECT COUNT(MA_NV) AS 'COUNT NV PPB002'
FROM NHAN_VIEN
WHERE MA_PB LIKE 'PB002'
--9. Hiển thị mức lương trung bình của các nhân viên phòng ban có mã ‘PB001’.
SELECT AVG(LUONG) AS 'LUONG TB' --Sau AS '___' là cái tên gọi do mình đặt ra 
FROM NHAN_VIEN
WHERE MA_PB LIKE 'PB001'
--10. Hiển thị số lượng dự án có ngày kết thúc trước ngày 31/12/2016
SELECT COUNT(MA_DUAN) AS 'COUNT DUAN'
FROM DU_AN
WHERE NGAY_KETTHUC < '2016-12-32'

--11. Cho biết có bao nhiêu nhân viên có mức lương cao nhất? (HƠI KHÓ) 
SELECT COUNT(MA_NV) AS 'NV LUONG MAX'
FROM NHAN_VIEN
WHERE LUONG = (
			SELECT MAX(LUONG) FROM NHAN_VIEN
);

--12. Tính lương trung bình của từng Phòng Ban.
SELECT AVG(LUONG) AS 'LUONG TB PB', MA_PB AS 'MA PHONG'
FROM NHAN_VIEN
GROUP BY MA_PB



--13. Đếm số lượng nhân viên của từng Phòng.
SELECT COUNT(MA_NV) AS 'COUNT NV IN PB', MA_PB AS 'MA PHONG'
FROM NHAN_VIEN
GROUP BY MA_PB

--14. Tính tổng lương công ty phải trả cho mỗi phòng ban, chỉ hiển thị nhóm nào có tổng >10000
SELECT SUM(LUONG) AS 'SUM LUONG',MA_PB AS 'MA PHONG'
FROM NHAN_VIEN
GROUP BY MA_PB
HAVING SUM(LUONG) > 10000

--15. Tính tổng lương công ty phải trả cho mỗi phòng ban, chỉ nhóm hàng nào có cột lương >700, chỉ hiển thị nhóm nào có tổng >10000
SELECT SUM(LUONG) AS 'SUM LUONG',MA_PB AS 'MA PHONG'
FROM NHAN_VIEN
WHERE LUONG > 700
GROUP BY MA_PB
HAVING SUM(LUONG) > 10000

--16. Trong các phòng ban sau đây: PB001, PB002, PB003 phòng ban nào có số lượng nhân viên >= 10?
SELECT MA_PB AS 'MA PHONG'
FROM NHAN_VIEN
WHERE MA_PB IN ('PB001','PB002','PB003')
GROUP BY MA_PB
HAVING COUNT(MA_NV) >= 1

--17. Cho biết phòng ban ‘sản xuất’ nào có tổng mức lương >= 100tr
SELECT TEN_PB AS 'TEN PHONG'
FROM PHONG_BAN,NHAN_VIEN
WHERE TEN_PB LIKE '%San xuat%'
group by TEN_PB
HAVING SUM(LUONG) >= 100000

--18. Hiển thị danh sách 10 nhân viên có mức lương cao nhất trong công ty, sắp xếp theo thứ tự giảm dần.
SELECT * 
FROM NHAN_VIEN
WHERE LUONG = (
		SELECT MAX(LUONG) FROM NHAN_VIEN
)
ORDER BY LUONG ASC

--19. Hiển thị danh sách các nhân viên có trong bảng NHAN_VIEN theo thứ tự TEN_NV tăng dần và năm sinh giảm dần.
SELECT * 
FROM NHAN_VIEN
ORDER BY TEN_NV DESC, NAM_SINH ASC

--20. Hiển thị tên dự án, ngày bắt đầu, ngày kết thúc của bảng DUAN theo thứ giảm dần của ngày kết thúc.
SELECT TEN_DUAN, NGAY_BATDAU,NGAY_KETTHUC
FROM DU_AN
ORDER BY NGAY_KETTHUC ASC

--21. Sử dụng JOIN hoặc phép tích để hiển thị thông tin của nhân viên như sau: họ và
--tên nhân viên, lương, tên phòng ban, tên dự án, ngày bắt đầu tham gia vào dự án
--và số giờ đã làm.
SELECT HO_NV, TEN_NV,LUONG,TEN_PB,TEN_DUAN,NGAY_BATDAU,SO_GIO
FROM NHAN_VIEN A
INNER JOIN PHONG_BAN B ON  A.MA_PB = B.MA_PB
INNER JOIN QUANLY_DUAN C ON A.MA_NV = C.MA_NV
INNER JOIN DU_AN D ON D.MA_DUAN = C.MA_DUAN

--22. Viết câu truy vấn hiển thị các thông tin bao gồm họ, tên, lương của nhân viên, tên
--dự án với điều kiện nhân viên thuộc phòng ban có tên ‘Thiết kế’, tham gia vào các
--dự án có ngày bắt đầu ‘1/1/2016’.

SELECT A.HO_NV, A.TEN_NV,A.LUONG,D.TEN_DUAN
FROM NHAN_VIEN A
INNER JOIN PHONG_BAN B ON A.MA_PB = B.MA_PB
INNER JOIN QUANLY_DUAN C ON A.MA_NV = C.MA_NV 
INNER JOIN DU_AN D ON C.MA_DUAN = D.MA_DUAN
WHERE B.TEN_PB LIKE 'San xuat 1' AND D.NGAY_BATDAU LIKE '2020-05-15'

--23. Cho biết danh sách nhân viên có mức lương cao hơn mức lương trung bình của toàn công ty
SELECT *
FROM NHAN_VIEN
WHERE LUONG > (SELECT AVG(LUONG) FROM NHAN_VIEN)

--24. Hiển thị danh sách nhân viên có mức lương cao hơn hoặc bằng mức lương trung bình của phòng ban có mã là ‘PB004’
SELECT * 
FROM NHAN_VIEN 
WHERE LUONG >= (SELECT AVG(LUONG) FROM NHAN_VIEN) AND (MA_PB LIKE 'PB004')

--25. Cho biết danh sách nhân viên có mức lương cao nhất trong công ty
SELECT * 
FROM NHAN_VIEN
WHERE LUONG = (SELECT MAX(LUONG) FROM NHAN_VIEN)

--26. Cho biết danh sách nhân viên có mức lương cao nhất của từng phòng ban.
SELECT *, MA_PB
FROM NHAN_VIEN
WHERE LUONG = (SELECT MAX(LUONG) FROM NHAN_VIEN)
GROUP BY MA_PB

--