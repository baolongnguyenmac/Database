-- USE master
-- GO

USE QUAN_LY_CHUYEN_BAY
GO

-- Q1. Cho biết mã số, tên phi công, địa chỉ, điện thoại của các phi công 
-- đã từng lái máy bay loại B747.
SELECT NHANVIEN.MANV, NHANVIEN.TEN, NHANVIEN.DCHI, NHANVIEN.DCHI
FROM NHANVIEN, KHANANG
WHERE KHANANG.MALOAI = 'B747'
    AND NHANVIEN.MANV = KHANANG.MANV -- kết bảng nhân viên - khả năng

-- Q2. Cho biết mã số và ngày đi 
-- của các chuyến bay xuất phát từ sân bay DCA 
-- trong khoảng thời gian từ 14 giờ đến 18 giờ.
SELECT LICHBAY.MACB, LICHBAY.NGAYDI
FROM LICHBAY, CHUYENBAY
WHERE LICHBAY.MACB = CHUYENBAY.MACB    AND CHUYENBAY.SBDI = 'DCA'  -- các chuyến bay xuất phát từ sân bay DCA 
    AND CHUYENBAY.GIODI BETWEEN '14:00'    AND '18:00' -- quy định giờ bay 

-- Q3. Cho biết tên những nhân viên được phân công 
-- trên chuyến bay có mã số 100 xuất phát tại sân bay SLC.
-- Các dòng dữliệu xuất ra không được phép trùng lắp
SELECT DISTINCT NHANVIEN.TEN
FROM NHANVIEN, CHUYENBAY, PHANCONG
WHERE NHANVIEN.MANV = PHANCONG.MANV
    AND PHANCONG.MACB = CHUYENBAY.MACB    AND CHUYENBAY.MACB = '100'   -- số hiệu 100
    AND CHUYENBAY.SBDI = 'SLC'  -- tại sân bay 'slc'

-- SELECT *
-- FROM CHUYENBAY

-- Q4. Cho biết mã loại và Số hiệu máy bay 
-- đã từng xuất phát tại sân bay MIA. 
-- Các dòng dữliệu xuất ra không được phép trùng lắp.
SELECT DISTINCT LOAIMB.MALOAI, LICHBAY.SOHIEU
FROM LOAIMB, LICHBAY, CHUYENBAY, MAYBAY
WHERE LICHBAY.MACB = CHUYENBAY.MACB    AND CHUYENBAY.SBDI = 'MIA'  -- kết bảng lịch bay - chuyến bay và tìm sân bay mia
    AND MAYBAY.SOHIEU = LICHBAY.SOHIEU    AND MAYBAY.MALOAI = LOAIMB.MALOAI -- kết bảng máy bay - lịch bay và máy  bay - loại máy bay 

-- Q5. Cho biếtmã chuyến bay, ngày đi, 
-- cùng với tên, địa chỉ, điện thoại của tất cảcác hành khách đi trên chuyến đó. 
-- Sắp xếp theo thứ tự tăng dần của mã chuyến bay và theo ngày đi giảm dần.
SELECT LICHBAY.MACB, LICHBAY.NGAYDI, KHACHHANG.TEN, KHACHHANG.DCHI, KHACHHANG.DTHOAI
FROM LICHBAY, KHACHHANG, DATCHO
WHERE LICHBAY.MACB = DATCHO.MACB    AND LICHBAY.NGAYDI = DATCHO.NGAYDI -- kết bảng đặt chỗ - lịch bay
    AND KHACHHANG.MAKH = DATCHO.MAKH -- kết bảng khách hàng - đặt chỗ
ORDER BY LICHBAY.MACB ASC, LICHBAY.NGAYDI DESC  -- sắp xếp chút xíu :v

-- Q6. Cho biếtmã chuyến bay, ngày đi, 
-- cùng với tên, địa chỉ, điệnthoại củatất cảnhững nhân viên 
-- được  phân  công  trong  chuyến  bay đó.  
-- Sắp  xếp  theo  thứtựtăng  dần  của  mã chuyến bay và theo ngày đi giảm dần
SELECT LICHBAY.MACB, LICHBAY.NGAYDI, NHANVIEN.TEN, NHANVIEN.DCHI, NHANVIEN.DTHOAI
FROM LICHBAY, NHANVIEN, PHANCONG
WHERE LICHBAY.MACB = PHANCONG.MACB    AND LICHBAY.NGAYDI = PHANCONG.NGAYDI -- kết bảng lịch bay - phân công -> lấy thông tin lịch bay 
    AND PHANCONG.MANV = NHANVIEN.MANV   -- kết bảng nhân viên - phân công -> lấy thông tin nhân viên
ORDER BY LICHBAY.MACB ASC, LICHBAY.NGAYDI DESC

-- Q7.Cho biếtmã chuyến bay, ngày đi, mã sốvà tên của nhữngphi công 
-- đượcphân công vào chuyến bay hạcánhxuống sân bay ORD
SELECT LICHBAY.MACB, LICHBAY.NGAYDI, NHANVIEN.MANV, NHANVIEN.TEN
FROM LICHBAY, NHANVIEN, PHANCONG, CHUYENBAY
WHERE LICHBAY.MACB = PHANCONG.MACB    AND LICHBAY.NGAYDI = PHANCONG.NGAYDI -- kết bảng lịch bay - phân công -> lấy thông tin lịch bay 
    AND PHANCONG.MANV = NHANVIEN.MANV   -- kết bảng phân công - nhân viên -> lấy thông tin nhân viên được phân công 
    AND CHUYENBAY.MACB = LICHBAY.MACB    AND CHUYENBAY.SBDEN = 'ORD'   -- kết bảng chuyến bay - lịch bay -> lấy thông tin về sân bay đến 

-- Q8.Cho biếtcác chuyến bay (mã sốchuyến bay, ngày đi vàtên củaphi công) 
-- trong đó phi công có mã '1001' được phân công lái.
SELECT LICHBAY.MACB, LICHBAY.NGAYDI, NHANVIEN.TEN
FROM LICHBAY, NHANVIEN, PHANCONG
WHERE LICHBAY.MACB = PHANCONG.MACB    AND LICHBAY.NGAYDI = PHANCONG.NGAYDI -- kết bảng lịch bay với bảng phân công
    AND NHANVIEN.MANV = PHANCONG.MANV   -- kết bảng nhân viên với bảng phân công
    AND NHANVIEN.MANV = '1001'  -- sau khi kết lịch bay - nhân viên thông qua phân công thì ràng buộc mã nv 

-- Q9.Cho biếtthông tin (mã chuyến bay, sân bay đi, giờđi, giờđến, ngày đi) 
-- của nhữngchuyến bay hạcánhxuống DEN. 
-- Các chuyến bay được liệtkê theo ngày đi giảm dần và sân bay xuất phát (SBDI) tăng dần
SELECT CHUYENBAY.MACB, CHUYENBAY.SBDI, CHUYENBAY.GIODI, CHUYENBAY.GIODEN, LICHBAY.NGAYDI
FROM CHUYENBAY, LICHBAY
WHERE CHUYENBAY.MACB = LICHBAY.MACB -- kết bảng chuyến bay - lịch bay
    AND CHUYENBAY.SBDEN = 'DEN' -- ràng buộc sân bay đến
ORDER BY LICHBAY.NGAYDI DESC, CHUYENBAY.SBDI ASC 

-- Q.10 Với mỗi phi công, cho biếthãng sản xuất và mã loại máy bay 
-- mà phi công này có khả năng bay được. 
-- Xuất ra tên phi công, hãng sảnxuất và mã loại máy bay
SELECT NHANVIEN.TEN, LOAIMB.HANGSX, LOAIMB.MALOAI
FROM NHANVIEN, LOAIMB, KHANANG
WHERE NHANVIEN.MANV = KHANANG.MANV  -- kết bảng nhân viên - khả năng
    AND KHANANG.MALOAI = LOAIMB.MALOAI  -- kết bảng khả năng - mã loại -> tìm ra loại máy bay 

-- Q11.Cho biếtmã phi công, tên phi công
-- đãlái máy bay trong chuyến bay mãsố 100 vào ngày 01/11/2000
SELECT NHANVIEN.MANV, NHANVIEN.TEN, LICHBAY.MACB
FROM NHANVIEN, PHANCONG, LICHBAY
WHERE NHANVIEN.MANV = PHANCONG.MANV -- kết bảng nhân viên - phân công -> đê lấy tên
    AND LICHBAY.MACB = PHANCONG.MACB    AND LICHBAY.NGAYDI = PHANCONG.NGAYDI  -- kết bảng lịch bay - phân công -> để lấy mã chuyến + ngày đi 
    AND LICHBAY.NGAYDI = '20001101'    AND LICHBAY.MACB = '100'   -- ràng buộc mã chuyến may và ngày đi 

-- Q12.Cho biết mã chuyến bay, mã nhân viên, tên nhân viên 
-- được phân công vào chuyến bay 
-- xuất phát ngày 10/31/2000 tại sân bay MIA vào lúc 20:30
SELECT NHANVIEN.MANV, NHANVIEN.TEN, LICHBAY.MACB
FROM NHANVIEN, LICHBAY, PHANCONG, CHUYENBAY
WHERE NHANVIEN.MANV = PHANCONG.MANV -- kết bảng nhân viên - phân công
    AND LICHBAY.MACB = PHANCONG.MACB -- kết bảng lịch bay - phân công -> để kết nhân viên - lịch bay và tìm ngày đi
    AND CHUYENBAY.MACB = LICHBAY.MACB   -- kết bằng chuyến bay - lịch bay -> tìm giờ đi 
    AND CHUYENBAY.GIODI = '20:30'    AND LICHBAY.NGAYDI = '20001031'   -- ràng buộc ngày đi và giờ đi 

-- Q13.Cho biết thông tin vềchuyến bay (mã chuyến bay, sốhiệu, mã loại, hãng sản xuất)
-- mà phi công "Quang"đã láI
SELECT LICHBAY.MACB, LICHBAY.SOHIEU, LICHBAY.MALOAI, LOAIMB.HANGSX
FROM LICHBAY, LOAIMB, NHANVIEN, MAYBAY, PHANCONG
WHERE LICHBAY.SOHIEU = MAYBAY.SOHIEU AND MAYBAY.MALOAI = LOAIMB.MALOAI  -- kết lịch bay - loại mb thông qua lịch bay
    AND LICHBAY.MACB = PHANCONG.MACB AND LICHBAY.NGAYDI = PHANCONG.NGAYDI   -- kết lich bay - phân công
    AND PHANCONG.MANV = NHANVIEN.MANV AND NHANVIEN.TEN = 'Quang' -- tìm nv quang 

-- Q14.Cho biếttên của những phi công 
-- chưa đượcphân công lái chuyến bay nào
SELECT NHANVIEN.TEN
FROM NHANVIEN
WHERE NHANVIEN.LOAINV = 1    AND NOT EXISTS (
    SELECT NV.TEN
    FROM NHANVIEN NV, PHANCONG
    WHERE NV.MANV = PHANCONG.MANV
)

-- Q15.Cho biết tên khách hàng đã đi chuyến bay trên máybay củahãng "Boeing"
SELECT DISTINCT KHACHHANG.TEN
FROM KHACHHANG, DATCHO, LICHBAY, MAYBAY, LOAIMB
WHERE LOAIMB.HANGSX = 'Boeing'    AND LOAIMB.MALOAI = MAYBAY.MALOAI -- tìm máy bay do boeing sản xuất và kết bảng loại máy bay - máy bay
    AND MAYBAY.SOHIEU = LICHBAY.SOHIEU  -- kết bảng máy bay - lịch bay
    AND LICHBAY.MACB = DATCHO.MACB    AND LICHBAY.NGAYDI = DATCHO.NGAYDI   -- kết bảng lịch bay - đặt chỗ
    AND DATCHO.MAKH = KHACHHANG.MAKH -- tìm thông tin khách hàng :))

-- Q16.Cho biếtmã cácchuyếnbay chỉbay vớimáybay sốhiệu 10 vàmãloại B747
SELECT LICHBAY.MACB
FROM LICHBAY
WHERE LICHBAY.SOHIEU = 10    AND LICHBAY.MALOAI = 'B747'


