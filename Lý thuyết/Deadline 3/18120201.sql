USE  QLDT
GO

-- bài 1: 
-- Cho biết các giáo viên (magv, tengv)
-- cùng bộ môn với Nguyễn Văn An 
-- và chưa bao giờ tham gia đề tài 
-- do trưởng khoa CNTT chủ trì.
SELECT DISTINCT GV.MAGV, GV.HOTEN
FROM GIAOVIEN AS GV, GIAOVIEN AS NVA
WHERE NVA.HOTEN = N'Trần Trung Hiếu' AND NVA.MABM = GV.MABM -- Trần Trung Hiếu để test :>
    AND GV.MAGV NOT IN (
        SELECT DISTINCT T.MAGV   
        FROM THAMGIADT T, DETAI D, KHOA CNTT
        WHERE T.MADT = D.MADT 
            AND D.GVCNDT = CNTT.TRUONGKHOA
            AND CNTT.MAKHOA = 'CNTT'
    )

-- giáo viên tham gia đề tài của trường khoa cntt chủ trì :>
-- test :>
SELECT DISTINCT T.MAGV   
FROM THAMGIADT T, DETAI D, KHOA CNTT
WHERE T.MADT = D.MADT 
    AND D.GVCNDT = CNTT.TRUONGKHOA
    AND CNTT.MAKHOA = 'CNTT'

-- bài 2:
-- Cho biết các đề tài (madt, tendt)
-- do trưởng bộ môn HTTT chủ trì 
-- và không được giáo viên Nguyễn Văn An tham gia
SELECT DISTINCT DETAI.MADT, DETAI.TENDT
FROM DETAI, BOMON, GIAOVIEN NVA
WHERE NVA.HOTEN = N'Trần Hoàng Nam' -- sử dụng Trần Hoàng Nam để test
    AND DETAI.GVCNDT = BOMON.TRUONGBM
    AND BOMON.MABM = 'HTTT'
    AND NVA.MAGV NOT IN (
        SELECT DISTINCT THAMGIADT.MAGV
        FROM THAMGIADT
        WHERE THAMGIADT.MADT = DETAI.MADT
    )

-- bài 3:
-- Trong các giáo viên tham gia đề tài 
-- thuộc chủ đề “Thành phố thông minh”, 
-- ai (tengv) là người có lương lớn nhất
SELECT GV.MAGV, GV.HOTEN, GV.LUONG
FROM GIAOVIEN AS GV
WHERE GV.LUONG >= ALL (
    SELECT GV1.LUONG
    FROM GIAOVIEN AS GV1, THAMGIADT, DETAI, CHUDE
    WHERE GV1.MAGV = THAMGIADT.MAGV
        AND DETAI.MADT = THAMGIADT.MADT
        AND DETAI.MACD = CHUDE.MACD
        AND CHUDE.TENCD = N'Nghiên cứu phát triển'  -- test bằng Nghiên cứu phát triển
)

-- bài 4
-- Với mỗi đề tài, cho biết ai là người tham gia lớn tuổi nhất (madt, tendt, magv, tengv, tuoi).
SELECT DISTINCT DETAI.MADT, DETAI.TENDT, GIAOVIEN.MAGV, GIAOVIEN.HOTEN, (2020-YEAR(GIAOVIEN.NGSINH)) AS TUOI
FROM DETAI, GIAOVIEN, THAMGIADT
WHERE DETAI.MADT = THAMGIADT.MADT 
    AND GIAOVIEN.MAGV = THAMGIADT.MAGV
    AND NOT EXISTS (    
        SELECT *
        FROM GIAOVIEN GV, THAMGIADT TGDT, DETAI DT
        WHERE DT.MADT = DETAI.MADT 
            AND GV.NGSINH < GIAOVIEN.NGSINH 
            AND GV.MAGV = TGDT.MAGV 
            AND DT.MADT = TGDT.MADT 
    )

-- (madt, tendt, magv, tengv, tuoi).
SELECT DISTINCT DT.MADT, DT.TENDT, GV.HOTEN, YEAR(GETDATE()) - YEAR(GV.NGSINH)
FROM DETAI DT, GIAOVIEN GV, THAMGIADT T
WHERE GV.MAGV = T.MAGV AND T.MADT = DT.MADT
    AND YEAR(GV.NGSINH) <= ALL (
        SELECT YEAR(GV1.NGSINH)
        FROM GIAOVIEN GV1, THAMGIADT T1, DETAI DT1
        WHERE GV1.MAGV = T1.MAGV
            AND T1.MADT = DT1.MADT
            AND DT1.MADT = DT.MADT
    )

SELECT GV.HOTEN, YEAR(GETDATE()) - YEAR(GV.NGSINH)
FROM GIAOVIEN AS GV
