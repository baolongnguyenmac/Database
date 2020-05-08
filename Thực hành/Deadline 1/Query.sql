-- USE master
-- GO

USE QUAN_LY_CHUYEN_BAY
GO

-- Q1. Cho biết mã số, tên phi công, địa chỉ, điện thoại của các phi công 
-- đã từng lái máy bay loại B747.
SELECT NHANVIEN.MANV, NHANVIEN.TEN, NHANVIEN.DCHI, NHANVIEN.DCHI
FROM NHANVIEN, KHANANG
WHERE KHANANG.MALOAI = 'B747' AND NHANVIEN.MANV = KHANANG.MANV

-- Q2. Cho biết mã số và ngày đi 
-- của các chuyến bay xuất phát từ sân bay DCA 
-- trong khoảng thời gian từ 14 giờ đến 18 giờ.
SELECT *
FROM LICHBAY, CHUYENBAY
WHERE LICHBAY.MACB = CHUYENBAY.MACB AND CHUYENBAY.SBDI = 'DCA'
    AND CHUYENBAY.GIODI BETWEEN '14:00' AND '18:00'