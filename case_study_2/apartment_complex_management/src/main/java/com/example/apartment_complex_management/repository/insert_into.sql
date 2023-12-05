insert into loai_tai_khoan (ten_loai_tai_khoan)
values("Customer"),
("Staff"),
("Admin");

insert into bo_phan (ten_bo_phan)
values("Nhân viên"),
("Trưởng phòng"),
("Chủ chung cư");

insert into tai_khoan(ten_tai_khoan,mat_khau,ma_loai_tai_khoan,is_delete)
values("admin123","admin123",3,0),
("nhanvien001","nhanvien001",2,0),
("nhanvien002","nhanvien002",2,0),
("khachhang001","khachhanh001",1,0),
("khachhang002","khachhang002",1,0);

insert into nhan_vien(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_bo_phan,ma_tai_khoan,is_delete)
values("Võ Quốc Giàu","1999-01-01",0,"012345678",7000000,"0987654321","vogiau@gmail.com","Cẩm Lệ, Đà Nẵng",1,2,0),
("Nguyễn Trọng Hải","1997-01-01",0,"012345679",10000000,"0982654321","hainguyen@gmail.com","Hải Châu, Đà Nẵng",2,3,0);

insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_tai_khoan,is_delete)
values("Nguyễn Tất Quyền","2003-02-02",0,"053214567","0852741963","quyennguyen@gmail.com","Hòa Khánh, Đà Nẵng",4,0),
("Nguyễn Đình Thái Bảo","1997-08-29",0,"055214567","0842741963","baonguyen@gmail.com","Ngũ Hành Sơn, Đà Nẵng",5,0);