		use master  
		if exists(select * from sysdatabases where name='QLDiem') 
		drop database QLDiem 
		go
		create database QLDiem 
		go
		use QLDiem


		create table MONHOC 
		( 
			MaMH    char(2) constraint PK_MONHOC primary key, 
			TenMH   nVarchar(30) not null, 
			SoTiet  Tinyint not null
		) 


		create table KHOA 
		( 
			MaKhoa  char(2) constraint PK_Khoa primary key, 
			TenKhoa nVarChar(20) not null
		) 


		create table SINHVIEN 
		( 
			MaSV        char(3) constraint PK_SINHVIEN primary key, 
			HoSV        nvarchar(30), 
			TenSV       Nvarchar(10), 
			Phai        bit, 
			NgaySinh    Date, 
			NoiSinh     nvarchar(25), 
			MaKH        char(2) constraint FK_SINHVIEN_KHOA foreign key(MaKH) references KHOA(MaKhoa), 
			HocBong     float
		) 


		create table KETQUA 
		( 
			MaSV    char (3) constraint FK_KETQUA_SINHVIEN foreign key(MaSV) references SINHVIEN(MaSV), 
			MaMH    char (2) constraint FK_KETQUA_MONHOC foreign key(MaMH) references MONHOC(MaMH), 
			LanThi  Tinyint, 
			Diem    Decimal(4,2) not null, 
			constraint PK_KetQua primary key (MaSV, MaMH, LanThi) 
		) 

		insert into MONHOC ( MaMH, TenMH, SoTiet )
		values 		('01', N'Cơ sở dữ liệu', 45), 
					('02', N'Trí tuệ nhân tạo', 45), 
					('03',	N'Truyền tin',45), 
					('04', 	N'Đồ họa',60 ),
					('05', 	N'Văn phạm',60), 
					('06', 	N'Kỹ thuật lập trình', 45) 

		select * 
		from MONHOC

		insert into KHOA 
		values 		('AV' ,N'Anh Văn'),
					('TH', N'Tin học'),
					('TR', N'Triết'),
					('VL', N'Vật lý')
		select * 
		from KHOA

		insert into SINHVIEN 
		values      ('A01', N'Nguyễn Thị', N'Hải',	  1, 	'2003-02-23', 	'Hà Nội',	 'TH', 	1300000),
					('A02', N'Trần Văn', N'Chính',	  0, 	'2002-12-24', 	'Bình Định','VL', 	1500000 ),
					('A03', N'Lê Thu Bạch', N'Yến',	  1, 	'2003-02-21', 	'Tp HCM', 	 'TH', 	1700000),
					('A04', N'Trần Anh', N'Tuấn',	  0, 	'2004-12-20', 	'Hà Nội',	 'AV', 	800000),
					('B01',	N'Trần Thanh', N'Mai',	  1, 	'2003-08-12', 	'Hải Phòng','TR', 	0 ),
					('B02', N'Trần Thị Thu', N'Thủy', 1, 	'2004-01-02', 	'Tp HCM', 	 'AV', 	0 )

		select * 
		from SINHVIEN

		insert into KETQUA
		values          ('A01', '01' ,	1 ,	3 ),
						('A01', '01' ,	2 ,	6 ),
						('A01', '02' ,	2 ,	6 ),
						('A01',	'03' ,	1 , 5 ),
						('A02', '01' ,	1 ,	4.5 ),
						('A02', '01' ,	2 ,	7 ),
						('A02', '03' ,	1 ,	10 ),
						('A02', '05' ,	1 ,	9 ),
						('A03', '01' ,	1 ,	2 ),
						('A03', '01' ,	2 ,	5 ),
						('A03', '03' ,	1 ,	2.5 ),
						('A03', '03' ,	2 ,	4 ),
						('A04', '05' ,	2 ,	10 ),
						('B01', '01' ,	1 ,	7 ),
						('B01', '03' ,	1 ,	2.5 ),
						('B01', '03' ,	2 ,	5 ),
						('B02', '02' ,	1 ,	6 ),
						('B02', '04' ,	1 ,	10 )

		select * 
		from KETQUA

		insert into SINHVIEN (MaSv, HoSv, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong)
		values ('A05', N'Trần Minh', N'Tuyên', 0 , '2006-05-19','Long An','TH', 0)

		select * from SINHVIEN

		insert into MONHOC (MaMH, TenMH, SoTiet)
		values ('B1', N'Deutsch', 45)

		select * from MONHOC

		update KHOA
		set TenKhoa = N'Công nghệ thông tin'
		where MaKhoa = 'TH'

		select * from KHOA

		update MONHOC 
		set SoTiet = 45 
		where TenMH = N'Văn Phạm';

		select * from MONHOC

		update SINHVIEN 
		set TenSV = N'Kỳ'
		where HoSV = N'Trần Thanh' and TenSV = N'Mai'

		select * from SINHVIEN 

		update SINHVIEN 
		set NgaySinh = '1997-07-05'
		where MaSV = 'B02'

		select * from SINHVIEN 	

		update SINHVIEN 
		set phai = 0
		where MaSV = 'B01'

		select * from SINHVIEN

		update SINHVIEN 
		set HocBong = HocBong + 200000
		where MaKH = 'AV'

		select * from SINHVIEN where MaKH = 'AV'

		delete from KETQUA 
		where LanThi = 2 and Diem < 5

		select * from KETQUA 

		delete from KETQUA 
		where MaSV in ( select MaSV from SINHVIEN where HocBong = 0)
		delete from SINHVIEN
		where HocBong = 0

		select * from SINHVIEN where HocBong = 0

		delete from MONHOC 
		where SoTiet > 50 

		select * from MONHOC where SoTiet > 50