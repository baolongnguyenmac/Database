-- USE master
-- GO

-- DROP DATABASE QLHOC_SINH
-- GO

CREATE DATABASE QLHOC_SINH
GO

USE QLHOC_SINH
GO

-- HOCSINH(mahs, hoten, giotinh, ngaysinh, diachi, malop)
CREATE TABLE HOCSINH (
    mahs CHAR(8),
    hoten NVARCHAR(100),
    male BIT,   -- nếu là thỏ, cho xem tai, nếu là trai, xin mời cút: male = 1, female = 0
    ngaysinh DATE,
    diachi NVARCHAR(300),
    malop CHAR(5),

    CONSTRAINT PK_HS PRIMARY KEY (mahs)
)
GO

-- LOPHOC(malop, tenlop, nam, gvcn, loptruong)
CREATE TABLE LOPHOC (
    malop CHAR(5),
    tenlop VARCHAR(10),
    nam int,
    gvcn CHAR(8),
    lopTruong CHAR(8),

    CONSTRAINT PK_LOPHOC PRIMARY KEY (malop),
)
GO

ALTER TABLE HOCSINH ADD CONSTRAINT FK_HS_LOPHOC FOREIGN KEY (malop) REFERENCES LOPHOC(malop)
GO

ALTER TABLE LOPHOC ADD CONSTRAINT FK_LOPHOC_HS FOREIGN KEY (lopTruong) REFERENCES HOCSINH(mahs)
GO

-- GIAOVIEN(magv, hoten, gioitinh, ngaysinh, diachi)
CREATE TABLE GIAOVIEN (
    magv CHAR(8),
    hoten NVARCHAR(100),
    male BIT,    -- nếu là thỏ, cho xem tai, nếu là trai, xin mời cút: male = 1, female = 0
    ngaysinh DATE,
    diachi NVARCHAR(300),

    CONSTRAINT PK_GIAOVIEN PRIMARY KEY (magv)
)
GO

ALTER TABLE LOPHOC ADD CONSTRAINT FK_LOPHOC_GIAOVIEN FOREIGN KEY (gvcn) REFERENCES GIAOVIEN(magv)
GO

INSERT GIAOVIEN (magv, hoten, male, ngaysinh, diachi)
VALUES ('gv000001', N'Nguyễn Văn A', 1, '20000714', N'số 69, phố bụi cmn đời yolo man :>')
GO
INSERT GIAOVIEN (magv, hoten, male, ngaysinh, diachi)
VALUES ('gv000002', N'Nguyễn Văn B', 1, '20000714', N'số 69123, phố bụi cmn đời yolo man :>')
GO
INSERT GIAOVIEN (magv, hoten, male, ngaysinh, diachi)
VALUES ('gv000003', N'Nguyễn Văn C', 0, '20200714', N'số 61239, phố bụi đời :>')
GO
INSERT GIAOVIEN (magv, hoten, male, ngaysinh, diachi)
VALUES ('gv000004', N'Nguyễn Văn D', 0, '20300714', N'số 61239, phố bụi đời yolo man :>')
GO
INSERT GIAOVIEN (magv, hoten, male, ngaysinh, diachi)
VALUES ('gv000005', N'Nguyễn Văn E', 1, '20400714', N'số 61239, phố bụi cmn đời :>')
GO

INSERT LOPHOC (malop, tenlop, nam, gvcn, lopTruong)
VALUES ('cntt1', '18CTT1', 2020, 'gv000001', NULL)
GO  
INSERT LOPHOC (malop, tenlop, nam, gvcn, lopTruong)
VALUES ('cntt2', '18CTT2', 2020, 'gv000002', NULL)
GO  
INSERT LOPHOC (malop, tenlop, nam, gvcn, lopTruong)
VALUES ('cntt3', '18CTT3', 2020, 'gv000003', NULL)
GO  
INSERT LOPHOC (malop, tenlop, nam, gvcn, lopTruong)
VALUES ('cntt4', '18CTT3', 2020, 'gv000004', NULL)
GO  
INSERT LOPHOC (malop, tenlop, nam, gvcn, lopTruong)
VALUES ('cntt5', '18CTT5', 2020, 'gv000005', NULL)
GO

INSERT HOCSINH (mahs, hoten, male, ngaysinh, diachi, malop)
VALUES ('18120201', N'Nguyễn Bảo Long', 1, '20000714', N'thị trấn Eakar, huyện Eakar, tỉnh Đăk Lăk', 'cntt2')
GO
INSERT HOCSINH (mahs, hoten, male, ngaysinh, diachi, malop)
VALUES ('18120202', N'Nguyễn Bảo Một', 1, '20000714', N'thị trấn Eakar, huyện Eakar, tỉnh Đăk Lăk', 'cntt3')
GO
INSERT HOCSINH (mahs, hoten, male, ngaysinh, diachi, malop)
VALUES ('18120203', N'Nguyễn Bảo Hai', 0, '20000714', N'thị trấn Eakar, huyện Eakar, tỉnh Đăk Lăk', 'cntt1')
GO
INSERT HOCSINH (mahs, hoten, male, ngaysinh, diachi, malop)
VALUES ('18120204', N'Nguyễn Bảo Ba', 0, '20000714', N'thị trấn Eakar, huyện Eakar, tỉnh Đăk Lăk', 'cntt4')
GO
INSERT HOCSINH (mahs, hoten, male, ngaysinh, diachi, malop)
VALUES ('18120205', N'Nguyễn Bảo Bốn', 1, '20000714', N'thị trấn Eakar, huyện Eakar, tỉnh Đăk Lăk', 'cntt5')
GO

UPDATE LOPHOC SET lopTruong = '18120201' WHERE malop = 'cntt2'
GO
UPDATE LOPHOC SET lopTruong = '18120202' WHERE malop = 'cntt3'
GO
UPDATE LOPHOC SET lopTruong = '18120203' WHERE malop = 'cntt1'
GO
UPDATE LOPHOC SET lopTruong = '18120204' WHERE malop = 'cntt4'
GO
UPDATE LOPHOC SET lopTruong = '18120205' WHERE malop = 'cntt5'
GO

SELECT * FROM GIAOVIEN
GO

SELECT * FROM LOPHOC
GO  

SELECT * FROM HOCSINH
GO

