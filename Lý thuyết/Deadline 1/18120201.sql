/*
USE master
GO

DROP DATABASE QUAN_LY_NHAN_VIEN
GO
*/

CREATE DATABASE QUAN_LY_NHAN_VIEN
GO

USE QUAN_LY_NHAN_VIEN
GO

CREATE TABLE NHAN_VIEN (
    MA_NV CHAR(5),
    TEN_NV NVARCHAR(100),
    NGAY_SINH DATE,
    MA_NV_QUAN_LY CHAR(5),

    CONSTRAINT PK_NV PRIMARY KEY (MA_NV),
    -- khoá ngoại cho nhân viên quản lý tham chiếu đến mã nhân viên 
    CONSTRAINT FK_NV_NV FOREIGN KEY (MA_NV_QUAN_LY) REFERENCES NHAN_VIEN(MA_NV)
)
GO

CREATE TABLE DU_AN (
    MA_DA CHAR(5),
    TEN_DA NVARCHAR(100),
    MA_NV_CHU_TRI CHAR(5),

    CONSTRAINT PK_DA PRIMARY KEY (MA_DA),
    -- khoá ngoại của nhân viên chủ trì tham chiếu đến mã nhân viên 
    CONSTRAINT FK_DA_NV FOREIGN KEY (MA_NV_CHU_TRI) REFERENCES NHAN_VIEN(MA_NV)
)
GO

CREATE TABLE THAM_GIA_DU_AN (
    MA_NV CHAR(5),
    MA_DA CHAR(5),
    SO_GIO INT,

    CONSTRAINT PK_THAM_GIA_DA PRIMARY KEY (MA_NV, MA_DA),
    -- khoá ngoại mã nhân viên tham chiếu đến bảng nhân viên 
    CONSTRAINT FK_TGDA_NV FOREIGN KEY (MA_NV) REFERENCES NHAN_VIEN(MA_NV),
    -- khoá ngoại mã dự án tham chiếu đến bảng dự án 
    CONSTRAINT FK_TGDA_DA FOREIGN KEY (MA_DA) REFERENCES DU_AN(MA_DA)
)
GO

-- nhập data cho nhân viên 
INSERT NHAN_VIEN (MA_NV, TEN_NV, NGAY_SINH, MA_NV_QUAN_LY)
VALUES ('1', N'Nguyễn Bảo Long', '20000714', NULL)
GO
INSERT NHAN_VIEN (MA_NV, TEN_NV, NGAY_SINH, MA_NV_QUAN_LY)
VALUES ('2', N'Bảo Long Nguyễn', '20000715', '1')
GO

-- nhập data cho dự án 
INSERT DU_AN (MA_DA, TEN_DA, MA_NV_CHU_TRI)
VALUES ('1', N'Dự án Toàn cầu 1', '1')
GO
INSERT DU_AN (MA_DA, TEN_DA, MA_NV_CHU_TRI)
VALUES ('2', N'Dự án Toàn cầu 2', '2')
GO

-- nhập data cho bảng tham gia dự án 
INSERT THAM_GIA_DU_AN (MA_NV, MA_DA, SO_GIO)
VALUES ('1', '1', 69)
GO
INSERT THAM_GIA_DU_AN (MA_NV, MA_DA, SO_GIO)
VALUES ('1', '2', 10)
GO
INSERT THAM_GIA_DU_AN (MA_NV, MA_DA, SO_GIO)
VALUES ('2', '1', 1)
GO
INSERT THAM_GIA_DU_AN (MA_NV, MA_DA, SO_GIO)
VALUES ('2', '2', 100)
GO

SELECT * FROM NHAN_VIEN
GO
SELECT * FROM DU_AN
GO
SELECT * FROM THAM_GIA_DU_AN
GO