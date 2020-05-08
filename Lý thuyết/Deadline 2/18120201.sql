USE QLDT
GO

/*  * CÂU 1
-- Cho biết danh sách bô môn(mabm,tenbm)của khoa CNTT 
-- có giáo viên tham gia đề tài thuộc chủ đề “Quản lý giáo dục”
*/

-- Tim giao vien tham gia cac de tai thuoc chu de “Quản lý giáo dục”
SELECT DISTINCT GIAOVIEN.MAGV
FROM GIAOVIEN, THAMGIADT, CHUDE, DETAI
WHERE CHUDE.TENCD = N'Quản lý giáo dục' AND CHUDE.MACD = DETAI.MACD 
    AND THAMGIADT.MADT = DETAI.MADT
    AND GIAOVIEN.MAGV = THAMGIADT.MAGV

-- Cho biết danh sách bô môn(mabm,tenbm)của khoa CNTT 
-- có giáo viên tham gia đề tài thuộc chủ đề “Quản lý giáo dục”
SELECT DISTINCT BOMON.MABM, BOMON.TENBM
FROM GIAOVIEN, THAMGIADT, CHUDE, DETAI, BOMON, KHOA
WHERE CHUDE.TENCD = N'Quản lý giáo dục' AND CHUDE.MACD = DETAI.MACD
    AND THAMGIADT.MADT = DETAI.MADT 
    AND GIAOVIEN.MAGV = THAMGIADT.MAGV
    AND BOMON.MABM = GIAOVIEN.MABM
    AND BOMON.MAKHOA = KHOA.MAKHOA AND KHOA.MAKHOA = 'CNTT'
GO


/*  * CÂU 2
-- Cho biếtdanh sách các giáo viên (magv,tengv)
-- được Nguyễn Hoài An quản lý và có tham gia đềtài do Trần Trà Hương chủtrì
*/

-- Tim nhung giao vien do nguyen an trung quan ly
SELECT GV.HOTEN, QL.HOTEN
FROM GIAOVIEN AS GV, GIAOVIEN AS QL
WHERE GV.GVQLCM = QL.MAGV AND QL.HOTEN = N'Nguyễn An Trung'

-- Liet ke de tai do Trần Trà Hương chu tri
SELECT DETAI.MADT, DETAI.TENDT
FROM DETAI, GIAOVIEN
WHERE DETAI.GVCNDT = GIAOVIEN.MAGV AND GIAOVIEN.HOTEN = N'Trần Trà Hương'

-- Cho biếtdanh sách các giáo viên (magv,tengv)
-- được Nguyễn Hoài An quản lý và có tham gia đềtài do Trần Trà Hương chủtrì
SELECT DISTINCT GV.MAGV, GV.HOTEN
FROM GIAOVIEN AS GV, GIAOVIEN AS QLGV, GIAOVIEN AS QLDT, THAMGIADT, DETAI
WHERE GV.GVQLCM = QLGV.MAGV AND QLGV.HOTEN = N'Nguyễn Hoài An' 
    AND THAMGIADT.MAGV = GV.MAGV 
    AND DETAI.GVCNDT = QLDT.MAGV AND QLDT.HOTEN = N'Trần Trà Hương'


/*  * CÂU 3 (chèn dữ liệu vào trước để còn có cái mà test)
    * có 004 + 006 thuộc khoa sh
        * add thằng 004 vào đề tài 001 (mã cv: 6) của trưởng khoa cntt (trần trà hương: 002)
        * add thằng 004 vào đề tài 002 (mã cv: 6) của trưởng khoa cntt (trần trà hương: 002)
        * add thằng 006 vào đề tài 002 (mã cv: 7) của trưởng khoa cntt (trần trà hương: 002)
        * add thằng 006 vào đề tài 001 (mã cv: 7) của trưởng khoa cntt (trần trà hương: 002)

    -- đề: 
    -- Cho biếtdanh sách giáo viên (magv,tengv)
    -- của khoa SH tham gia đềtài do trưởng khoa CNTT chủtrì. // MEOS COS KHOA CNSH :)

-- MADT char(3), 
-- SOTT int, 
-- TENCV nvarchar(40), 
-- NGAYBD datetime, 
-- NGAYKT datetime,
INSERT CONGVIEC VALUES ('001', 6, N'demo cho tý cho vui', '20000714', '20100714')
INSERT CONGVIEC VALUES ('001', 7, N'demo cho tý cho vui p2', '20000714', '20100714')
INSERT CONGVIEC VALUES ('002', 6, N'demo cho tý cho vui', '20000714', '20100714')
INSERT CONGVIEC VALUES ('002', 7, N'demo cho tý cho vui p2', '20000714', '20100714')

-- MAGV char(5), 
-- MADT char(3), 
-- STT int, 
-- PHUCAP float , 
-- KETQUA nvarchar(40),
INSERT THAMGIADT VALUES ('004', '001', 6, 1, N'Đạt')
INSERT THAMGIADT VALUES ('004', '002', 6, 1, N'Đạt')
INSERT THAMGIADT VALUES ('006', '001', 7, 1, N'Đạt')
INSERT THAMGIADT VALUES ('006', '002', 7, 1, N'Đạt')

*/

-- TIM TRUONG KHOA CNTT
SELECT GIAOVIEN.MAGV, GIAOVIEN.HOTEN
FROM GIAOVIEN, KHOA
WHERE GIAOVIEN.MAGV = KHOA.TRUONGKHOA AND KHOA.MAKHOA = 'CNTT'

-- TIM DE TAI DO TRUONG KHOA CNTT CHU TRI
SELECT DETAI.MADT, DETAI.TENDT
FROM DETAI, GIAOVIEN, KHOA
WHERE GIAOVIEN.MAGV = KHOA.TRUONGKHOA AND KHOA.MAKHOA = 'CNTT'
    AND GIAOVIEN.MAGV = DETAI.GVCNDT

-- TIM DE TAI DO GV OF SH THAM GIA
SELECT DETAI.MADT, DETAI.TENDT
FROM DETAI, GIAOVIEN, BOMON, THAMGIADT
WHERE BOMON.MAKHOA = 'SH' AND GIAOVIEN.MABM = BOMON.MABM
    AND THAMGIADT.MAGV = GIAOVIEN.MAGV AND DETAI.MADT = THAMGIADT.MADT

-- Cho biếtdanh sách giáo viên (magv,tengv)
-- của khoa CNSH tham gia đềtài do trưởng khoa CNTT chủtrì. // MEOS COS KHOA CNSH :)
SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN AS TK, GIAOVIEN AS GV, THAMGIADT, DETAI, KHOA, BOMON
WHERE KHOA.TRUONGKHOA = TK.MAGV AND KHOA.MAKHOA = 'CNTT' -- TRUONG KHOA CNTT (TRAN TRA HUONG)
    AND DETAI.GVCNDT = TK.MAGV -- CHU TRI DE TAI
    AND GV.MABM = BOMON.MABM AND BOMON.MAKHOA = 'SH' -- GIAOVIEN THUOC CNSH
    AND GV.MAGV = THAMGIADT.MAGV AND THAMGIADT.MADT = DETAI.MADT -- THAMGIA DT 

-- cách hay hơn (của anh nam đẹp zai)
SELECT GIAOVIEN.MAGV, GIAOVIEN.HOTEN
FROM GIAOVIEN, BOMON, KHOA, THAMGIADT, DETAI
WHERE GIAOVIEN.MABM = BOMON.MABM AND BOMON.MAKHOA = 'SH'
    AND THAMGIADT.MAGV = GIAOVIEN.MAGV AND DETAI.MADT = THAMGIADT.MADT 
    AND DETAI.GVCNDT = KHOA.TRUONGKHOA AND KHOA.MAKHOA = 'CNTT'

/*  * CÂU 4
-- Cho biết các têntrưởng bô môn
-- vừa tham gia đềtài do Nguyễn Văn Anchủtrì 
-- vừa làm chủtrìmột đềtài 
*/
SELECT DISTINCT TBM.HOTEN
FROM GIAOVIEN AS TBM, GIAOVIEN AS CN, BOMON, DETAI, THAMGIADT
WHERE TBM.MAGV = BOMON.TRUONGBM    -- Cho biết các têntrưởng bô môn
    AND THAMGIADT.MAGV = TBM.MAGV AND THAMGIADT.MADT = DETAI.MADT  -- tham gia đềtài
    AND DETAI.GVCNDT = CN.MAGV AND CN.HOTEN = N'Trương Nam Sơn' -- do Nguyễn Văn Anchủtrì 
    AND TBM.MAGV = DETAI.GVCNDT -- chủtrìmột đềtài 


/*  * CÂU 5
-- Cho biết các giáo viên (magv, tengv)
-- tham gia đềtài 
-- mà đượcchủtrìbởi trưởng bộmôn của mình.
*/
SELECT GV.MAGV, GV.HOTEN 
FROM GIAOVIEN AS GV, GIAOVIEN AS TBM, THAMGIADT, DETAI, BOMON
WHERE GV.MABM = BOMON.MABM AND BOMON.TRUONGBM = TBM.MAGV    -- trưởng bộmôn của mình.
    AND DETAI.GVCNDT = TBM.MAGV AND THAMGIADT.MADT = DETAI.MADT -- đượcchủtrìbởi trưởng bộmôn của mình.
    AND THAMGIADT.MAGV = GV.MAGV    -- THAM GIA