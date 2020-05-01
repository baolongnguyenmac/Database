USE master
GO

DROP DATABASE [18120201]
GO

CREATE DATABASE [18120201]
GO

USE [18120201]
GO

-- HOCSINH(mahs, hoten, giotinh, ngaysinh, diachi, malop)
CREATE TABLE HOCSINH (
    mahs CHAR(8),
    hoten NVARCHAR(100),
    isMale BIT,
    ngaysinh DATE,
    diachi NVARCHAR(300),
    malop CHAR(5),

    CONSTRAINT PK_HS PRIMARY KEY (mahs)
)
GO

-- GIAOVIEN(magv, hoten, gioitinh, ngaysinh, diachi)
CREATE TABLE GIAOVIEN (
    magv CHAR(8),
    hoten NVARCHAR(100),
    isMale BIT,
    ngaysinh DATE,
    diachi NVARCHAR(300),

    CONSTRAINT PK_GV PRIMARY KEY (magv)
)

-- LOPHOC(malop, tenlop, nam, gvcn, loptruong)
CREATE TABLE LOPHOC (
    malop CHAR(5),
    tenlop VARCHAR(10),
    nam INT,
    gvcn CHAR(8),
    loptruong CHAR(8),

    CONSTRAINT PK_LOP PRIMARY KEY (malop),
    CONSTRAINT FK_LOP_HS FOREIGN KEY (loptruong) REFERENCES HOCSINH(mahs),
    CONSTRAINT FK_LOP_GV FOREIGN KEY (gvcn) REFERENCES GIAOVIEN(magv)
)
GO

ALTER TABLE HOCSINH ADD CONSTRAINT FK_HS_LOP FOREIGN KEY (malop) REFERENCES LOPHOC(malop)
GO

-- GIAOVIEN(magv, hoten, gioitinh, ngaysinh, diachi)
INSERT GIAOVIEN (magv, hoten, isMale, ngaysinh, diachi)
VALUES ('G1', N'Nguyễn Giáo Viên a', 1, '20000714', N'Triều Tiên')
GO
INSERT GIAOVIEN (magv, hoten, isMale, ngaysinh, diachi)
VALUES ('G2', N'Nguyễn Giáo Viên b', 1, '20000715', N'Đông Triều Tiên')
GO
INSERT GIAOVIEN (magv, hoten, isMale, ngaysinh, diachi)
VALUES ('G3', N'Nguyễn Giáo Viên c', 1, '20000716', N'Tây Triều Tiên')
GO
INSERT GIAOVIEN (magv, hoten, isMale, ngaysinh, diachi)
VALUES ('G4', N'Nguyễn Giáo Viên d', 1, '20000717', N'Nam Triều Tiên')
GO
INSERT GIAOVIEN (magv, hoten, isMale, ngaysinh, diachi)
VALUES ('G5', N'Nguyễn Giáo Viên e', 1, '20000718', N'Bắc Triều Tiên')
GO

-- LOPHOC(malop, tenlop, nam, gvcn, loptruong)
INSERT LOPHOC (malop, tenlop, nam, gvcn, loptruong)
VALUES ('L1', '18CTT1', 2000, 'G1', NULL)
GO
INSERT LOPHOC (malop, tenlop, nam, gvcn, loptruong)
VALUES ('L2', '18CTT2', 2000, 'G1', NULL)
GO
INSERT LOPHOC (malop, tenlop, nam, gvcn, loptruong)
VALUES ('L3', '18CTT3', 2000, 'G1', NULL)
GO
INSERT LOPHOC (malop, tenlop, nam, gvcn, loptruong)
VALUES ('L4', '18CTT4', 2000, 'G1', NULL)
GO
INSERT LOPHOC (malop, tenlop, nam, gvcn, loptruong)
VALUES ('L5', '18CTT5', 2000, 'G1', NULL)
GO

-- HOCSINH(mahs, hoten, giotinh, ngaysinh, diachi, malop)
INSERT HOCSINH (mahs, hoten, isMale, ngaysinh, diachi, malop) 
VALUES ('18120201', N'Nguyễn Học Sinh m', 1, '20000710', N'Lào', 'L1')
GO
INSERT HOCSINH (mahs, hoten, isMale, ngaysinh, diachi, malop) 
VALUES ('18120202', N'Nguyễn Học Sinh n', 1, '20000711', N'Bắc Lào', 'L2')
GO
INSERT HOCSINH (mahs, hoten, isMale, ngaysinh, diachi, malop) 
VALUES ('18120203', N'Nguyễn Học Sinh p', 1, '20000712', N'Nam Lào', 'L3')
GO
INSERT HOCSINH (mahs, hoten, isMale, ngaysinh, diachi, malop) 
VALUES ('18120204', N'Nguyễn Học Sinh q', 1, '20000713', N'Tây Lào', 'L4')
GO
INSERT HOCSINH (mahs, hoten, isMale, ngaysinh, diachi, malop) 
VALUES ('18120205', N'Nguyễn Học Sinh z', 1, '20000714', N'Đông Lào', 'L5')
GO

-- UPDATE HOCSINH SET malop = 'L1' WHERE mahs = '18120201'
-- GO
-- UPDATE HOCSINH SET malop = 'L2' WHERE mahs = '18120202'
-- GO
-- UPDATE HOCSINH SET malop = 'L3' WHERE mahs = '18120203'
-- GO
-- UPDATE HOCSINH SET malop = 'L4' WHERE mahs = '18120204'
-- GO
-- UPDATE HOCSINH SET malop = 'L5' WHERE mahs = '18120205'
-- GO

UPDATE LOPHOC SET loptruong = '18120201' WHERE malop = 'L1'
GO
UPDATE LOPHOC SET loptruong = '18120202' WHERE malop = 'L2'
GO
UPDATE LOPHOC SET loptruong = '18120203' WHERE malop = 'L3'
GO
UPDATE LOPHOC SET loptruong = '18120204' WHERE malop = 'L4'
GO
UPDATE LOPHOC SET loptruong = '18120205' WHERE malop = 'L5'
GO

SELECT LOPHOC.malop, LOPHOC.loptruong FROM LOPHOC
GO
SELECT HOCSINH.mahs, HOCSINH.malop FROM HOCSINH
GO
-- SELECT * FROM GIAOVIEN
-- GO