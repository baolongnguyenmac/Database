USE master
GO

DROP DATABASE QLBAN_HANG
GO

CREATE DATABASE QLBAN_HANG
GO

USE QLBAN_HANG
GO

CREATE TABLE KHACH_HANG (
    makh CHAR(10),
    hoten NVARCHAR(100),
    isMale BIT,
    dienthoai CHAR(10),
    diachi NVARCHAR(300),

    CONSTRAINT PK_KH PRIMARY KEY (makh)
)
GO

CREATE TABLE SAN_PHAM (
    masp CHAR(5),
    tensp NVARCHAR(100),
    ngaysx DATE,
    dongia INT,

    CONSTRAINT PK_SP PRIMARY KEY (masp)
)
GO

CREATE TABLE HOA_DON (
    mahd CHAR(5),
    ngaylap DATETIME,
    makh CHAR(10),

    CONSTRAINT PK_HD PRIMARY KEY (mahd),
    CONSTRAINT FK_HD_KH FOREIGN KEY (makh) REFERENCES KHACH_HANG(makh)
)
GO

CREATE TABLE CT_HOA_DON (
    mahd CHAR(5),
    masp CHAR(5),
    soluong INT,

    CONSTRAINT PK_CTHD PRIMARY KEY (mahd, masp),
    CONSTRAINT FK_CTHD_HD FOREIGN KEY (mahd) REFERENCES HOA_DON(mahd),
    CONSTRAINT FK_CTHD_SP FOREIGN KEY (masp) REFERENCES SAN_PHAM(masp)
)
GO 

INSERT KHACH_HANG (makh, hoten, isMale, dienthoai, diachi)
VALUES ('18120201', N'Nguyễn Bảo Long', 1, '0919070940', N'số 69 phố bụi đời')
GO
INSERT KHACH_HANG (makh, hoten, isMale, dienthoai, diachi)
VALUES ('18120202', N'Bảo Long Nguyễn', 0, '0919070941', N'số 69 phố bụi đời triều tiên')
GO
INSERT KHACH_HANG (makh, hoten, isMale, dienthoai, diachi)
VALUES ('18120203', N'Long Bảo Nguyễn', 1, '0919070942', N'số 96 phố bụi đời')
GO

INSERT SAN_PHAM (masp, tensp, ngaysx, dongia)
VALUES ('S1', N'Sữa ong chúa', '20000714', 60000)
GO
INSERT SAN_PHAM (masp, tensp, ngaysx, dongia)
VALUES ('S2', N'Sữa ong bắp cày', '20000714', 70000)
GO
INSERT SAN_PHAM (masp, tensp, ngaysx, dongia)
VALUES ('S3', N'Sữa ong đực', '20000714', 6000000)
GO

INSERT HOA_DON (mahd, ngaylap, makh)
VALUES ('H1', '20000715', 18120201)
GO
INSERT HOA_DON (mahd, ngaylap, makh)
VALUES ('H2', '20000716', 18120202)
GO
INSERT HOA_DON (mahd, ngaylap, makh)
VALUES ('H3', '20000715', 18120203)
GO
INSERT HOA_DON (mahd, ngaylap, makh)
VALUES ('H4', '20000716', 18120203)
GO

INSERT CT_HOA_DON (mahd, masp, soluong)
VALUES ('H1', 'S1', 4)
GO
INSERT CT_HOA_DON (mahd, masp, soluong)
VALUES ('H1', 'S2', 5)
GO
INSERT CT_HOA_DON (mahd, masp, soluong)
VALUES ('H1', 'S3', 6)
GO
INSERT CT_HOA_DON (mahd, masp, soluong)
VALUES ('H2', 'S1', 1)
GO
INSERT CT_HOA_DON (mahd, masp, soluong)
VALUES ('H2', 'S2', 2)
GO
INSERT CT_HOA_DON (mahd, masp, soluong)
VALUES ('H3', 'S1', 1)
GO
-- INSERT CT_HOA_DON (mahd, masp, soluong)
-- VALUES ('H2', 'S1', 1)
-- GO

SELECT * FROM KHACH_HANG
GO
SELECT * FROM SAN_PHAM
GO
SELECT * FROM CT_HOA_DON
GO