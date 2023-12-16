Use Master

GO
    Create Database banhkem
GO

USE banhkem;

CREATE TABLE CUAHANG(
	MaCH int primary key identity(1,1),
	Ten nvarchar(100) not null,
	DienThoai varchar(20),
	DiaChi nvarchar(100)
) 
GO

CREATE TABLE DANHMUC(
	MaDM int primary key identity(1,1),
	Ten nvarchar(100) not null
) 
GO

CREATE TABLE MATHANG(
	MaMH int primary key identity(1,1),
	Ten nvarchar(100) not null,
	GiaGoc int default 0,
	GiaBan int default 0,
	SoLuong smallint default 0,
	MoTa nvarchar(1000),
	HinhAnh varchar(255),
	MaDM int not null foreign key(MaDM) references DANHMUC(MaDM),
	LuotXem int default 0,
	LuotMua int default 0
) 
GO

CREATE TABLE CHUCVU(
	MaCV int primary key identity(1,1),
	Ten nvarchar(100) not null,
	HeSo float default 1.0
) 
GO

CREATE TABLE NHANVIEN(
	MaNV int primary key identity(1,1),
	Ten nvarchar(100) not null,
	MaCV int not null foreign key(MaCV) references CHUCVU(MaCV),
	DienThoai varchar(20),
	Email varchar(50),
	MatKhau varchar(50)	
) 
GO

CREATE TABLE KHACHHANG(
	MaKH int primary key identity(1,1),
	Ten nvarchar(100) not null,
	DienThoai varchar(20),
	Email varchar(50),
	MatKhau varchar(500)
) 
GO

CREATE TABLE DIACHI(	
	MaDC int primary key identity(1,1),
	MaKH int not null foreign key(MaKH) references KHACHHANG(MaKH),
	DiaChi nvarchar(100) not null,
	PhuongXa varchar(20) ,
	QuanHuyen varchar(50),
	TinhThanh varchar(50),
	MacDinh int default 1	
) 
GO

CREATE TABLE HOADON(
	MaHD int primary key identity(1,1),
	Ngay datetime default getdate(),
	TongTien int default 0,
	MaKH int not null foreign key(MaKH) references KHACHHANG(MaKH),
	TrangThai int default 0

) 
SET IDENTITY_INSERT hoadon On
GO

CREATE TABLE CTHOADON(
	MaCTHD int primary key identity(1,1),
	MaHD int not null foreign key(MaHD) references HOADON(MaHD),	
	MaMH int not null foreign key(MaMH) references MATHANG(MaMH),
	DonGia int default 0,
	SoLuong smallint default 1,
	ThanhTien int
) 
GO

-- Dữ liệu bảng CUA_HANG
INSERT INTO CUAHANG(Ten, DienThoai, DiaChi) VALUES(N'Cửa hàng bánh kem Hawai','08965321475',N'225 Lý Thái Tổ, P Mỹ Xuyên, TP Long Xuyên, An Giang');

-- Dữ liệu bảng LOAI_HANG
INSERT INTO DANHMUC(Ten) VALUES(N'Bánh quy');
INSERT INTO DANHMUC(Ten) VALUES(N'Bánh kem tiramisu');
INSERT INTO DANHMUC(Ten) VALUES(N'Bánh kem Mousses');
INSERT INTO DANHMUC(Ten) VALUES(N'Bánh sinh nhật');

-- Dữ liệu bảng MAT_HANG
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh kem Tiramisu trái tim',N'Bánh kem tiramisu được trang trí hình trái tim. Bánh gồm ba lớp bánh bông lan và 2 lớp nhân kem sữa tươi phô mai',290000,290000,10,'b1.jpg',2,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh kem Chocolate Mousse Cheesecake',N'Bánh kem được phủ một lớp socola mịn. Được trang trí với socola trắng và hạt caramelized ',395000,395000,20,'b2.jpg',3,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh kem Passion Mousse Cheesecake',N'Bánh kem được phủ bởi một lớp gelatin chanh dây. Được trang trí với những bông hoa sô cô la trắng ',395000,350000,20,'b3.jpg',3,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh kem Red Velvet Mousse Cheesecake',N'Bánh Red Velvet Mousse Cheesecake là một món tráng miệng độc đáo kết hợp giữa bánh Red Velvet và kem phô mai mousse. Bánh có lớp bánh Red Velvet mịn và màu đỏ tươi, xen kẽ với lớp kem phô mai nhẹ nhàng và thơm ngon. Đây là một món tráng miệng hấp dẫn và hợp khẩu vị cho những người yêu thích hương vị ngọt ngào và mát lành của phô mai.',395000,350000,30,'b4.jpg',3,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh kem Tiramisu Mousse Cheesecake',N'Bánh kem Tiramisu Mousse Cheesecake là một món tráng miệng tuyệt vời kết hợp giữa hai món phổ biến là Tiramisu và cheesecake. Bánh có lớp kem Tiramisu mousse nhẹ nhàng, hòa quyện với lớp cheesecake mềm mịn và độ béo vừa phải. Với hương vị cà phê đặc trưng và lớp bánh kem mousse nhẹ nhàng, được trang trí bằng cacao rắc lên mặt.',395000,395000,25,'b5.jpg',2,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh kem Choco Butter',N'Bánh kem Choco Butter là một món tráng miệng ngọt ngào và thơm ngon, với cốt bánh được làm từ 3 lớp bông lan vani mềm mịn xen kẽ với 2 lớp kem sô-cô-la đậm đà. Bên ngoài, bánh được phủ bởi một lớp kem chocobutter, một hỗn hợp ngọt ngào và béo ngậy từ bơ sô-cô-la. Kết hợp giữa bông lan, kem sô-cô-la và kem chocobutter tạo nên một hương vị độc đáo và thỏa mãn cho những người yêu thích sô-cô-la. Bánh được trang trí thêm với các hạt sô-cô-la hoặc vụn bánh để tăng thêm vẻ đẹp và hương vị.',240000,200000,50,'b6.jpg',4,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh kem cam sữa chua mật ong',N'Bánh kem Cam Sữa Chua Mật Ong là một món tráng miệng tươi ngon và hài hòa với cấu trúc lớp bánh gồm 3 lớp bông lan vani êm ái xen kẽ với 2 lớp nhân cam sữa chua mật ong thơm ngon. Sự kết hợp giữa cam, sữa chua và mật ong mang đến một hương vị trái cây tươi mát.',290000,290000,30,'b7.jpg',4,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh kem thơm',N'Bánh kem Thơm là một món tráng miệng ngọt ngào và thơm ngon, với cấu trúc lớp bánh gồm 3 lớp bông lan vani mềm mịn. Lớp nhân bên trong bánh là mứt thơm đặc trưng, tạo nên hương vị ngọt ngào và tinh tế. Với mỗi miếng bánh, bạn sẽ cảm nhận được hương thơm đặc biệt từ nhân mứt, kết hợp với sự nhẹ nhàng và mềm mịn từ lớp bông lan.',240000,200000,30,'b8.jpg',4,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh kem bắp',N'Bánh kem Bắp là một món tráng miệng độc đáo và ngon miệng, với cấu trúc lớp bánh gồm 3 lớp bông lan vani mềm mịn. Lớp nhân bên trong bánh là nhân bắp đặc trưng, có chứa hạt bắp giòn tan, tạo nên hương vị độc đáo và giữ cho bánh thêm độ giòn màu mỡ. Khi bạn cắn vào bánh, bạn sẽ cảm nhận được hương vị ngọt thanh của nhân bắp kết hợp với sự nhẹ nhàng và mềm mịn từ lớp bông lan.',290000,290000,10,'b9.jpg',4,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh kem cam sữa chua mật ong',N'Bánh kem cam sữa chua mật ong là một món tráng miệng tươi ngon và đặc biệt, với thành phần chính gồm bông lan vani mềm mịn, kem sữa tươi thơm mát, nước cam tươi tự nhiên, mật ong ngọt ngào, mứt cam thêm hương vị tươi sắc và sữa chua tạo độ béo mượt. Sự kết hợp hoàn hảo của các thành phần này mang đến hương vị hài hòa, từ hương thơm cam tự nhiên cho đến độ ngọt êm dịu của sữa chua và mật ong.',290000,290000,20,'b10.jpg',4,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh Macaron',N'Bánh kem Macaron là một loại bánh tráng miệng nhỏ gọn và đa dạng với 5 hương vị khác nhau trong một hộp 5 cái. Hương vị bao gồm socola đậm đà, dâu tươi ngọt, trà xanh thơm mát, vani ngọt ngào và chuối thơm béo. Mỗi chiếc bánh Macaron có lớp vỏ mỏng, giòn tan và mềm mịn bên trong, kết hợp với nhân kem hoặc mứt phù hợp với từng hương vị. Bánh kem Macaron là một sự lựa chọn tuyệt vời để thưởng thức nhiều hương vị và trải nghiệm hương vị đa dạng trong một lần.',40000,40000,50,'b11.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh quy bơ đậu phộng',N'Bánh quy bơ đậu phộng là một loại bánh quy thơm ngon và thú vị, với thành phần chính gồm bột mì tạo độ giòn, đậu phộng giòn rụm, lòng trắng trứng tạo độ mềm mịn, bơ thêm độ béo và đường ngọt nhẹ. Sự kết hợp của các thành phần này tạo nên một hương vị độc đáo và hấp dẫn. Bánh quy có vị bơ thơm ngon, cùng vị đậu phộng thêm sự giòn rụm. Đây là một loại bánh quy truyền thống được ưa thích và thường được thưởng thức trong các dịp lễ hội hoặc làm quà biếu.',25000,25000,50,'b12.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh mì bơ tỏi',N'Bánh mì bơ tỏi là một loại bánh mì đặc biệt với hương vị thơm ngon và cấu trúc cứng giòn. Bánh mì được làm từ bột mì tinh chế kết hợp với bơ và tỏi tạo nên hương vị đặc trưng. Với cấu trúc cứng, bánh mì có độ giòn hoàn hảo. Hương vị tỏi thơm ngào và bơ thêm độ béo làm cho bánh mì trở thành một món ăn ngon miệng và phù hợp để thưởng thức trong bữa ăn hoặc nhâm nhi cùng gia đình và bạn bè.',35000,35000,50,'b12.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh mì bơ đường',N'Bánh mì bơ đường là một loại bánh mì có cấu trúc cứng giòn và hương vị ngọt ngào. Bánh mì được làm từ bột mì tinh chế kết hợp với bơ và đường, tạo nên lớp vỏ cứng và màu vàng hấp dẫn. Với hương vị ngọt từ đường và độ béo từ bơ, bánh mì trở thành món ăn thích hợp để ăn sáng hoặc nhâm nhi cùng nước uống. Cấu trúc cứng giòn của bánh mì tạo ra trải nghiệm ăn đặc biệt và thỏa mãn cho người thưởng thức. Bánh mì bơ đường thường là một lựa chọn phổ biến trong các bữa tiệc và buổi trà chiều.',35000,35000,50,'b13.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh quy vani hạnh nhân',N'Bánh quy vani hạnh nhân là một loại bánh quy truyền thống với hương vị phong phú và giòn tan. Bánh quy được làm từ bột mì cao cấp và hương liệu vani, kết hợp với hạnh nhân thêm độ giòn và hương vị đặc trưng. Với mùi thơm ngọt của vani và hạnh nhân, bánh quy vani hạnh nhân là một món tráng miệng hoàn hảo để thưởng thức cùng các loại đồ uống. Cấu trúc giòn tan và vị hạnh nhân thêm sự thú vị và hấp dẫn cho mỗi miếng bánh. Bánh quy vani hạnh nhân thường là món ăn nhẹ phổ biến trong các buổi tiệc và dịp lễ.',50000,50000,50,'b14.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh quy sôcla hạnh nhân',N'Bánh quy socola hạnh nhân là một loại bánh quy thơm ngon và hấp dẫn với sự kết hợp hoàn hảo giữa socola và hạnh nhân. Bánh quy được làm từ bột mì cao cấp, hương liệu socola và hạnh nhân giòn rụm. Với hương vị đắng ngọt của socola và độ giòn của hạnh nhân, bánh quy socola hạnh nhân mang đến trải nghiệm ăn thú vị và đáng nhớ. Bánh quy này thường được thưởng thức kèm với nước uống như cà phê hoặc sữa. Đây là lựa chọn lý tưởng cho những ai yêu thích sự kết hợp giữa socola và hạnh nhân trong một món tráng miệng.',50000,50000,50,'b15.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh quy trái cây',N'Bánh quy trái cây là một loại bánh quy nhẹ nhàng và tươi ngon, với sự kết hợp của các loại trái cây tươi và hương vị bánh quy. Bánh quy được làm từ bột mì cao cấp và kết hợp với trái cây tươi, như dứa, xoài, nho, hoặc dâu tây, tạo nên một hương vị tươi mát và độc đáo. Sự cắt nhỏ các miếng trái cây trong bánh quy làm tăng thêm sự tươi ngon và đa dạng. Bánh quy trái cây là một lựa chọn tuyệt vời cho những người muốn thưởng thức hương vị trái cây tươi mà vẫn có sự ngọt ngào và giòn tan từ bánh quy. Nó cũng là một lựa chọn phổ biến trong các dịp tiệc và buổi trà.',50000,50000,50,'b16.jpg',1,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh kem Roise Love',N'Bánh kem Roise Love là một chiếc bánh đẹp với 4 lớp bánh chiffon phô mai, nhân kem phô mai và hoa kem tươi. Bánh được trang trí với các loại hoa màu trắng và cam, hoa màu xanh và vàng.',380000,350000,50,'b17.jpg',4,0,0);
INSERT INTO MATHANG(Ten,MoTa,GiaGoc,GiaBan,SoLuong,HinhAnh,MaDM,LuotXem,LuotMua) VALUES(N'Bánh kem Joy Of Christmas',N'Bánh Kem Joy Of Christmas là một tác phẩm nghệ thuật bánh kem đặc biệt mang hơi thở của mùa Giáng sinh. Bánh kem được làm từ cốt chiffon sô cô la tươi ngon, được trang trí bằng kem tươi và sô cô la tạo nên một vẻ ngoài đẹp mắt và hấp dẫn. Bên cạnh đó, bánh còn được trang trí bằng cốm màu và bông đường bi bạc, tạo nên những chi tiết tinh tế và lấp lánh như tuyết rơi. Bánh có hình khúc cây, tượng trưng cho tinh thần của mùa lễ. Bánh Kem Joy Of Christmas không chỉ là một món tráng miệng ngon mà còn mang đến cảm giác ấm áp và niềm vui của mùa Giáng sinh.',380000,380000,50,'b18.jpg',4,0,0);

-- Dữ liệu bảng CHUC_VU
INSERT INTO CHUCVU(Ten) VALUES(N'Quản lý');
INSERT INTO CHUCVU(Ten) VALUES(N'Nhân viên thu ngân');


-- Dữ liệu bảng NHANVIEN
--INSERT INTO NHANVIEN(Ten,MaCV,DienThoai,Email,MatKhau) VALUES(N'Nguyễn Phước Tân',1,'0909456789','nptan@abc.com','202cb962ac59075b964b07152d234b70');
--INSERT INTO NHANVIEN(Ten,MaCV,DienThoai,Email,MatKhau) VALUES(N'Dương Thị Mỹ Thuận',2,'0988778899','dtmthuan@abc.com','202cb962ac59075b964b07152d234b70');
--INSERT INTO NHANVIEN(Ten,MaCV,DienThoai,Email,MatKhau) VALUES(N'Trần Huỳnh Sơn',3,'0903123123','thson@abc.com','202cb962ac59075b964b07152d234b70');
--INSERT INTO NHANVIEN(Ten,MaCV,DienThoai,Email,MatKhau) VALUES(N'Lê Ngọc Thanh',2,'0913454544','lnthanh@abc.com','202cb962ac59075b964b07152d234b70');

-- Dữ liệu bảng KHACHHANG
--INSERT INTO KHACHHANG(Ten,DienThoai,Email,MatKhau) VALUES(N'','','','');

-- Dữ liệu bảng DIACHI
--INSERT INTO DIACHI(MaKH,DiaChi,PhuongXa,QuanHuyen,TinhThanh,MacDinh) VALUES(1,N'',N'',N'',N'',1);

-- Dữ liệu bảng HOADON
--INSERT INTO HOADON(TongTien,MaKH,TrangThai) VALUES(70000,1,0);


-- Dữ liệu bảng CTHOA_DON
--INSERT INTO CTHOADON(MaHD,MaMH,DonGia,SoLuong,ThanhTien) VALUES(1,2,23000,1,23000);

GO

SELECT * FROM DANHMUC;
SELECT * FROM MATHANG;