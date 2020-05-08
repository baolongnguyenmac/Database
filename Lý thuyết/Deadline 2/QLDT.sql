﻿-- USE master
-- GO
-- DROP DATABASE QLDT
-- GO

create database QLDT
go
use QLDT
go
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
create table GIAOVIEN 
(
	MAGV char (5), 
	HOTEN nvarchar(40), 
	LUONG float, 
	PHAI nchar(3), 
	NGSINH datetime,
	DIACHI nvarchar(100), 
	GVQLCM char(5), 
	MABM nchar(5)
	PRIMARY KEY (MAGV)
)

create table GV_DT 
(
	MAGV char(5), 
	DIENTHOAI char(12),
	PRIMARY KEY (MAGV, DIENTHOAI)
)

create table BOMON 
(
	MABM nchar(5),
	TENBM nvarchar(40), 	 
	PHONG char(5),
	DIENTHOAI char(12), 
	TRUONGBM char(5), 
	MAKHOA char(4), 	
	NGAYNHANCHUC datetime,
	PRIMARY KEY (MABM)
)
create table KHOA 
(
	MAKHOA char(4), 
	TENKHOA nvarchar(40), 
	NAMTL int, 
	PHONG char(5), 
	DIENTHOAI char(12), 	
	TRUONGKHOA char(5), 
	NGAYNHANCHUC datetime,
	PRIMARY KEY (MAKHOA)	
)

create table DETAI 
(
	MADT char(3), 
	TENDT nvarchar(100), 
	CAPQL nvarchar(40), 
	KINHPHI float, 
	NGAYBD datetime, 
	NGAYKT datetime, 	
	MACD nchar(4),
	GVCNDT char(5), 	
	PRIMARY KEY (MADT)
)

create table CHUDE 
(
	MACD nchar(4), 
	TENCD nvarchar(50),
	PRIMARY KEY (MACD)
)
create table CONGVIEC 
(
	MADT char(3), 
	SOTT int, 
	TENCV nvarchar(40), 
	NGAYBD datetime, 
	NGAYKT datetime,
	PRIMARY KEY (MADT, SOTT) 
)

create table THAMGIADT 
(
	MAGV char(5), 
	MADT char(3), 
	STT int, 
	PHUCAP float , 
	KETQUA nvarchar(40),
	PRIMARY KEY (MAGV, MADT, STT)
)

create table NGUOITHAN 
(
	MAGV char(5), 
	TEN nvarchar(20), 
	NGSINH datetime, 
	PHAI nchar(3),
	PRIMARY KEY (MAGV, TEN)
)

alter table GIAOVIEN add
	constraint FK_GIAOVIEN_BOMON foreign key (MABM) references BOMON (MABM),
	constraint FK_GIAOVIEN_GIAOVIEN foreign key (GVQLCM) references GIAOVIEN (MAGV)

alter table KHOA add 
	constraint FK_KHOA_GIAOVIEN foreign key (TRUONGKHOA) references GIAOVIEN (MAGV)

alter table BOMON add 
	constraint FK_BOMON_KHOA foreign key (MAKHOA) references KHOA(MAKHOA),
	constraint FK_BOMON_GIAOVIEN foreign key (TRUONGBM) references GIAOVIEN (MAGV)

alter table NGUOITHAN add
	constraint FK_NGUOITHAN_GIAOVIEN foreign key (MAGV)references GIAOVIEN (MAGV)

alter table THAMGIADT add
	constraint FK_PHANCONG_GIAOVIEN foreign key (MAGV)references GIAOVIEN (MAGV),
	constraint FK_PHANCONG_CONGVIEC foreign key (MADT, STT)references CONGVIEC(MADT, SOTT)

alter table DETAI add
	constraint FK_DETAI_CHUDE foreign key (MACD)references CHUDE (MACD)

alter table DETAI add
	constraint FK_DETAI_GIAOVIEN foreign key (GVCNDT)references GIAOVIEN (MAGV)

alter table GV_DT add
	constraint FK_DIENTHOAI_GIAOVIEN foreign key (MAGV)references GIAOVIEN (MAGV)

alter table CONGVIEC add 	
	constraint FK_CONGVIEC_DETAI foreign key (MADT)references DETAI (MADT)
----------------
insert into KHOA values ('CNTT',N'Công nghệ thông tin',1995,'B11','0838123456',null,'02/20/2005')
insert into KHOA values ('VL',N'Vật lý',1976,'B21','0838223223',null,'09/18/2003')
insert into KHOA values ('SH',N'Sinh học',1980,'B31','0838454545',null,'10/11/2000')
insert into KHOA values ('HH',N'Hóa học',1980,'B41','0838456456',null,'10/15/2001')
----------------
insert into BOMON values (N'HTTT',N'Hệ thống thông tin','B13','0838125125',null,'CNTT','09/20/2004')
insert into BOMON values (N'CNTT',N'Công nghệ tri thức','B15','0838126126',null, 'CNTT', null)
insert into BOMON values (N'MMT',N'Mạng máy tính','B16','0838676767 ',null,'CNTT','05/15/2005')
insert into BOMON values (N'VLĐT',N'Vật lý điện tử','B23','0838234234',null, 'VL', null)	
insert into BOMON values (N'VLƯD',N'Vật lý ứng dụng','B24','0838454545',null,'VL','02/18/2006')
insert into BOMON values (N'VS',N'Vi sinh','B32','0838909090',null,'SH','01/01/2007')
insert into BOMON values (N'SH',N'Sinh hóa','B33','0838898989',null, 'SH', null)	
insert into BOMON values (N'HL',N'Hóa lý','B42','0838878787',null, 'HH', null)	
insert into BOMON values (N'HPT',N'Hóa phân tích','B43','0838777777',null,'HH','10/15/2007')
insert into BOMON values (N'HHC',N'Hóa hữu cơ','B44','838222222',null, 'HH', null)	
----------------
insert into GIAOVIEN values ('001',N'Nguyễn Hoài An',2000,N'Nam','02/15/1973',N'25/3 Lạc Long Quân, Q.10, TP HCM', null, N'MMT')
insert into GIAOVIEN values ('002',N'Trần Trà Hương',2500,N'Nữ','06/20/1960',N'125	Trần Hưng Đạo, Q.1,TP HCM', null, N'HTTT')
insert into GIAOVIEN values ('003',N'Nguyễn Ngọc Ánh',2200,N'Nữ','05/11/1975',N'12/21	Võ Văn Ngân	Thủ Đức, TP HCM', '002',N'HTTT')
insert into GIAOVIEN values ('004',N'Trương Nam Sơn',2300,N'Nam','06/20/1959',N'215	Lý Thường Kiệt,TP Biên Hòa',null, N'VS')
insert into GIAOVIEN values ('005',N'Lý Hoàng Hà',2500,N'Nam','10/23/1954',N'22/5	Nguyễn Xí, Q.Bình Thạnh, TP HCM',null, N'VLĐT')
insert into GIAOVIEN values ('006',N'Trần Bạch Tuyết',1500,N'Nữ','05/20/1980',N'127	Hùng Vương, TP Mỹ Tho','004',N'VS')
insert into GIAOVIEN values ('007',N'Nguyễn An Trung',2100,N'Nam','06/05/1976',N'234 3/2, TP Biên Hòa',null, N'HPT')
insert into GIAOVIEN values ('008',N'Trần Trung Hiếu',1800,N'Nam','08/06/1977',N'22/11 Lý Thường Kiệt, TP Mỹ Tho','007',N'HPT')
insert into GIAOVIEN values ('009',N'Trần Hoàng Nam',2000,N'Nam','11/22/1975',N'234	Trấn Não, An Phú,TP HCM','001',N'MMT')
insert into GIAOVIEN values ('010',N'Phạm Nam Thanh',1500,N'Nam','12/12/1980',N'221	Hùng Vương, Q.5, TP HCM','007',N'HPT')
----------------
insert into GV_DT values ('001','0903123123')
insert into GV_DT values ('001','0838912112')
insert into GV_DT values ('002','0913454545')
insert into GV_DT values ('003','0903656565')
insert into GV_DT values ('003','0838121212')
insert into GV_DT values ('003','0937125125')
insert into GV_DT values ('006','0937888888')
insert into GV_DT values ('008','0913232323')
insert into GV_DT values ('008','0653717171')
----------------
insert into CHUDE values (N'QLGD',N'Quản lý giáo dục')
insert into CHUDE values (N'NCPT',N'Nghiên cứu phát triển')
insert into CHUDE values (N'ƯDCN',N'Ứng dụng công nghệ')
----------------
insert into DETAI (MADT, TENDT, KINHPHI, CAPQL, NGAYBD, NGAYKT, MACD, GVCNDT) values ('001',N'HTTT quản lý các trường ĐH',20,N'ĐHQG','10/20/2007','10/20/2008',N'QLGD','002')
insert into DETAI (MADT, TENDT, KINHPHI, CAPQL, NGAYBD, NGAYKT, MACD, GVCNDT) values ('002',N'HTTT quản lý giáo vụ cho một Khoa','20',N'Trường','10/12/2000','10/12/2001',N'QLGD','002')
insert into DETAI (MADT, TENDT, KINHPHI, CAPQL, NGAYBD, NGAYKT, MACD, GVCNDT) values ('003',N'Nghiên cứu chế tạo sợi Nanô Platin','300',N'ĐHQG','05/15/2008','05/15/2010',N'NCPT','005')
insert into DETAI (MADT, TENDT, KINHPHI, CAPQL, NGAYBD, NGAYKT, MACD, GVCNDT) values ('004',N'Tạo vật liệu sinh học bằng màng ối người','100',N'Nhà nước','01/01/2007','12/31/2009',N'NCPT','004')
insert into DETAI (MADT, TENDT, KINHPHI, CAPQL, NGAYBD, NGAYKT, MACD, GVCNDT) values ('005',N'Ứng dụng hóa học xanh','200',N'Trường','10/10/2003','12/10/2004',N'ƯDCN','007')
insert into DETAI (MADT, TENDT, KINHPHI, CAPQL, NGAYBD, NGAYKT, MACD, GVCNDT) values ('006',N'Nghiên cứu tế bào gốc','4000',N'Nhà nước','10/20/2006','10/20/2009',N'NCPT','004')
insert into DETAI (MADT, TENDT, KINHPHI, CAPQL, NGAYBD, NGAYKT, MACD, GVCNDT) values ('007',N'HTTT quản lý thư viện ở các trường ĐH','20',N'Trường','5/10/2009','05/10/2010',N'QLGD','001')
----------------
set dateformat dmy

insert into CONGVIEC values ('001',1,N'Khởi tạo và Lập kế hoạch','20/10/2007','20/12/2008')
insert into CONGVIEC values ('001',2,N'Xác định yêu cầu','21/12/2008','21/03/2008')
insert into CONGVIEC values ('001',3,N'Phân tích hệ thống','22/03/2008','22/5/2008')
insert into CONGVIEC values ('001',4,N'Thiết kế hệ thống','23/05/2008','23/06/2008')
insert into CONGVIEC values ('001',5,N'Cài đặt thử nghiệm','24/06/2008','20/10/2008')
insert into CONGVIEC values ('006',1,N'Lấy mẫu','20/10/2006','20/02/2007')
insert into CONGVIEC values ('006',2,N'Nuôi cấy','21/02/2007','21/08/2008')
insert into CONGVIEC values ('002',1,N'Khởi tạo và Lập kế hoạch','10/05/2009','10/07/2009')
insert into CONGVIEC values ('002',2,N'Xác định yêu cầu','11/07/2009','11/10/2009')
insert into CONGVIEC values ('002',3,N'Phân tích hệ thống','12/10/2009','20/12/2009')
insert into CONGVIEC values ('002',4,N'Thiết kế hệ thống','21/12/2009','22/03/2010')
insert into CONGVIEC values ('002',5,N'Cài đặt thử nghiệm','23/03/2010','10/05/2010')
set dateformat mdy
----------------
insert into THAMGIADT values ('003','001',1,1,N'Đạt')
insert into THAMGIADT values ('003','001',2,0,N'Đạt')
insert into THAMGIADT values ('002','001',4,2,N'Đạt')
insert into THAMGIADT values ('003','001',4,1,N'Đạt')
insert into THAMGIADT values ('004','006',1,0,N'Đạt')
insert into THAMGIADT values ('004','006',2,1,N'Đạt')
insert into THAMGIADT values ('006','006',2,1.5,N'Đạt')
insert into THAMGIADT values ('001','002',1,0, null)	
insert into THAMGIADT values ('001','002',2,2, null)	
insert into THAMGIADT values ('003','002',2,0, null)	
insert into THAMGIADT values ('009','002',3,0.5, null)	
insert into THAMGIADT values ('009','002',4,1.5, null)	
----------------
update KHOA set TRUONGKHOA = '002' where MAKHOA='CNTT'
update KHOA set TRUONGKHOA = '005' where MAKHOA='VL'
update KHOA set TRUONGKHOA = '004' where MAKHOA='SH'
update KHOA set TRUONGKHOA = '007' where MAKHOA='HH'
----------------
update BOMON set TRUONGBM = '002' where MABM=N'HTTT'
update BOMON set TRUONGBM = '001' where MABM=N'MMT'
update BOMON set TRUONGBM = '005' where MABM=N'VLƯD'
update BOMON set TRUONGBM = '004' where MABM=N'VS'
update BOMON set TRUONGBM = '007' where MABM=N'HPT'
----------------
insert into NGUOITHAN values ('001', N'Hùng', '1/14/1990', N'Nam')
insert into NGUOITHAN values ('001', N'Thủy', '12/8/1994', N'Nữ')
insert into NGUOITHAN values ('003', N'Thu', '9/3/1998', N'Nữ')
insert into NGUOITHAN values ('003', N'Hà', '9/3/1998', N'Nữ')
insert into NGUOITHAN values ('008', N'Nam', '5/6/1991', N'Nam')
insert into NGUOITHAN values ('010', N'Nguyệt', '1/14/2006', N'Nữ')
insert into NGUOITHAN values ('007', N'Vy', '2/14/2000', N'Nữ')
insert into NGUOITHAN values ('007', N'Mai', '3/26/2003', N'Nữ')
insert into NGUOITHAN values ('009', N'An', '8/19/1996', N'Nam')

