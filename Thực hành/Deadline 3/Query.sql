USE QUAN_LY_CHUYEN_BAY
GO

-- Q17. Với mỗi sân bay (SBDEN), 
-- cho biết số lượng chuyến bay hạ cánh xuống sân bay đó. 
-- Kết quả được sắp xếp theo thứ tự tăng dần của sân bay đến
SELECT CHUYENBAY.SBDEN, COUNT(*) SL_MAYBAY
FROM CHUYENBAY, LICHBAY
WHERE CHUYENBAY.MACB = LICHBAY.MACB
GROUP BY CHUYENBAY.SBDEN
ORDER BY CHUYENBAY.SBDEN ASC 

-- Q18.Với mỗi sân bay (SBDI),
-- cho biết sốlượng chuyến bay xuất phát từsân bay đó, 
-- sắp xếp theo thứtựtăng dầncủa sân bayxuất phát
SELECT CHUYENBAY.SBDI, COUNT(*) SL_MAYBAY
FROM CHUYENBAY, LICHBAY
WHERE CHUYENBAY.MACB = LICHBAY.MACB
GROUP BY CHUYENBAY.SBDI
ORDER BY CHUYENBAY.SBDI ASC

-- Q19.Với mỗi sân bay (SBDI), 
-- cho biết sốlượng chuyến bay xuất phát theo từng ngày. 
-- Xuất ra mã sân bay đi, ngày và sốlượng
SELECT CHUYENBAY.SBDI, LICHBAY.NGAYDI, COUNT(*)
FROM CHUYENBAY, LICHBAY
WHERE CHUYENBAY.MACB = LICHBAY.MACB
GROUP BY CHUYENBAY.SBDI, LICHBAY.NGAYDI

-- Q20.Với mỗi sân bay (SBDEN), 
-- cho biết sốlượng chuyến bay hạcánhtheo từng ngày. 
-- Xuất ra mã sân bay đến, ngày và sốlượng
SELECT CHUYENBAY.SBDEN, LICHBAY.NGAYDI, COUNT(*)
FROM CHUYENBAY, LICHBAY
WHERE CHUYENBAY.MACB = LICHBAY.MACB
GROUP BY CHUYENBAY.SBDEN, LICHBAY.NGAYDI

-- Q21.Với mỗi lịch bay, 
-- cho biếtmã chuyến bay, ngày đi 
-- cùng với sốlượng nhân viên không phải làphi côngcủachuyến bay đó
SELECT LB.MACB, LB.NGAYDI, COUNT(DISTINCT PC.MANV)
FROM LICHBAY LB, PHANCONG PC
WHERE PC.MANV NOT IN (
  SELECT PC1.MANV
  FROM PHANCONG PC1
  WHERE PC1.NGAYDI = LB.NGAYDI
   AND PC1.MACB = LB.MACB
 )
GROUP BY LB.MACB, LB.NGAYDI

-- Q22.Sốlượng chuyến bay xuất phát từsân bay MIA vào ngày 11/01/2000
SELECT COUNT(*)
FROM CHUYENBAY, LICHBAY
WHERE LICHBAY.MACB = CHUYENBAY.MACB AND LICHBAY.NGAYDI = '20001101' AND CHUYENBAY.SBDI = 'MIA'

-- Q23.Với mỗi chuyến bay, 
-- cho biết mã chuyến bay, ngày đi, sốlượng nhân viên được phân công trên chuyến bay đó, 
-- sắp theo thứtựgiảm dần của sốlượng.
SELECT LICHBAY.MACB, LICHBAY.NGAYDI, COUNT(*)
FROM LICHBAY, PHANCONG
WHERE LICHBAY.MACB = PHANCONG.MACB AND LICHBAY.NGAYDI = PHANCONG.NGAYDI
GROUP BY LICHBAY.MACB, LICHBAY.NGAYDI
ORDER BY COUNT(*) DESC

-- Q24.Với mỗi chuyến bay, 
-- cho biết mã chuyến bay, ngày đi, cùng với sốlượng hành khách đã đặt chỗcủa chuyến bay đó, 
-- sắp theo thứtựgiảm dần của sốlượng.
SELECT LICHBAY.MACB, LICHBAY.NGAYDI, COUNT(*)
FROM LICHBAY, DATCHO
WHERE LICHBAY.NGAYDI = DATCHO.NGAYDI AND LICHBAY.MACB = DATCHO.MACB
GROUP BY LICHBAY.MACB, LICHBAY.NGAYDI
ORDER BY COUNT(*) DESC

-- Q25.Với mỗi chuyến bay, 
-- cho biết mã chuyến bay, ngày đi, tổng lương của (các nhân viên đượcphân công trong chuyến bay), 
-- sắp xếp theo thứtựtăng dần của tổng lương
SELECT LICHBAY.MACB, LICHBAY.NGAYDI, SUM(NHANVIEN.LUONG)
FROM LICHBAY, NHANVIEN, PHANCONG
WHERE LICHBAY.NGAYDI = PHANCONG.NGAYDI AND LICHBAY.MACB = PHANCONG.MACB AND NHANVIEN.MANV = PHANCONG.MANV
GROUP BY LICHBAY.MACB, LICHBAY.NGAYDI
ORDER BY SUM(NHANVIEN.LUONG) ASC

-- Q26.Cho biếtlương trung bình của các nhân viên không phải là phi công
SELECT AVG(NHANVIEN.LUONG)
FROM NHANVIEN
WHERE NHANVIEN.LOAINV = 0

-- Q27.Cho biếtmức lương trung bình của các phi côn
SELECT AVG(NHANVIEN.LUONG)
FROM NHANVIEN
WHERE NHANVIEN.LOAINV = 1

-- UNCHECKED
-- Q28.Với mỗi loại máy bay, 
-- cho biết sốlượng chuyếnbay đã bay trên loạimáybay đó hạ cánh xuống sân bay ORD. 
-- Xuất ra mã loại máy bay, sốlượng chuyến bay.
SELECT MAYBAY.MALOAI, COUNT(*)
FROM MAYBAY, LICHBAY, CHUYENBAY
WHERE MAYBAY.SOHIEU = LICHBAY.SOHIEU AND LICHBAY.MACB = CHUYENBAY.MACB AND CHUYENBAY.SBDEN = 'ORD'
GROUP BY MAYBAY.MALOAI

-- Q29.Cho biếtsân bay (SBDI) và sốlượng chuyến bay 
-- có nhiều hơn 2 chuyến bay xuất phát trong khoảng 10 giờđến 22 giO
SELECT CHUYENBAY.SBDI, COUNT(*)
FROM CHUYENBAY
WHERE CHUYENBAY.GIODI BETWEEN '10:00' AND '22:00'
GROUP BY CHUYENBAY.SBDI
HAVING COUNT(*) > 2

-- Q30.Cho biếttên phi công đượcphân công vào ít nhất 2 chuyến bay 
-- trong cùng một ngày
SELECT NHANVIEN.TEN, PHANCONG.NGAYDI, COUNT(*)
FROM NHANVIEN, PHANCONG
WHERE NHANVIEN.MANV = PHANCONG.MANV
GROUP BY NHANVIEN.MANV, NHANVIEN.TEN, PHANCONG.NGAYDI
HAVING COUNT(*) >= 2

-- Q31.Cho biếtmã chuyến bay và ngày đi của những chuyến bay 
-- có ít hơn 3 hành khách đặt chỗ
SELECT LICHBAY.MACB, LICHBAY.NGAYDI, COUNT(*)
FROM LICHBAY, DATCHO
WHERE LICHBAY.MACB = DATCHO.MACB AND LICHBAY.NGAYDI = DATCHO.NGAYDI
GROUP BY LICHBAY.MACB, LICHBAY.NGAYDI
HAVING COUNT(*) < 3

-- Q32.Cho biếtsốhiệu máy bay và loại máy bay 
-- mà phi công cómã 1001 được phân công lái trên 2 lần
SELECT MAYBAY.SOHIEU, MAYBAY.MALOAI, COUNT(*)
FROM MAYBAY, LICHBAY, PHANCONG
WHERE MAYBAY.SOHIEU = LICHBAY.SOHIEU AND MAYBAY.MALOAI = LICHBAY.MALOAI 
 AND PHANCONG.NGAYDI = LICHBAY.NGAYDI AND PHANCONG.MACB = LICHBAY.MACB 
 AND PHANCONG.MANV = '1001'
GROUP BY MAYBAY.SOHIEU, MAYBAY.MALOAI
HAVING COUNT(*) > 2

-- Q33.Với mỗi hãng sản xuất, 
-- cho biết sốlượng loại máy bay mà hãng đó đã sản xuất.
-- Xuất ra hãng sản xuất và sốlượnG
SELECT LOAIMB.HANGSX, COUNT(*)
FROM LOAIMB
GROUP BY LOAIMB.HANGSX

