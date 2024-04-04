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

insert into so_tang(so_tang)
values(1),(2),(3),(4),(5),(6);

insert into kieu_thue(ten_kieu_thue)
values("Ngày"),("Tháng"),("Năm");

insert into loai_can_ho(ten_loai_can_ho)
values("Studio"),("Family"),("Officetel");

insert into can_ho(ten_can_ho,dien_tich,chi_phi_thue,so_nguoi_toi_da,mo_ta_tien_nghi,ma_loai_can_ho,ma_kieu_thue,ma_so_tang,hinh_anh,tinh_trang,is_delete)
values("0101",50,500000,2,"Studio",1,1,1,"aaaa","Chưa có người thuê",0),
("0102",50,5000000,2,"Studio",1,2,1,"aaaa","Chưa có người thuê",0),
("0103",50,52000000,2,"Studio",1,3,1,"aaaa","Chưa có người thuê",0),
("0104",75,800000,6,"Family",2,1,1,"aaaa","Chưa có người thuê",0),
("0105",75,8000000,6,"Family",2,2,1,"aaaa","Chưa có người thuê",0),
("0106",75,80000000,6,"Family",2,3,1,"aaaa","Chưa có người thuê",0),
("0107",125,1000000,10,"Officetel",3,1,1,"aaaa","Chưa có người thuê",0),
("0108",125,10000000,10,"Officetel",3,2,1,"aaaa","Chưa có người thuê",0),
("0109",125,100000000,10,"Officetel",3,3,1,"aaaa","Chưa có người thuê",0),
("0201",50,520000,2,"Studio",1,1,2,"aaaa","Chưa có người thuê",0),
("0202",50,5200000,2,"Studio",1,2,2,"aaaa","Chưa có người thuê",0),
("0203",50,54000000,2,"Studio",1,3,2,"aaaa","Chưa có người thuê",0),
("0204",75,820000,6,"Family",2,1,2,"aaaa","Chưa có người thuê",0),
("0205",75,8200000,6,"Family",2,2,2,"aaaa","Chưa có người thuê",0),
("0206",75,84000000,6,"Family",2,3,2,"aaaa","Chưa có người thuê",0),
("0207",125,1100000,10,"Officetel",3,1,2,"aaaa","Chưa có người thuê",0),
("0208",125,11000000,10,"Officetel",3,2,2,"aaaa","Chưa có người thuê",0),
("0209",125,110000000,10,"Officetel",3,3,2,"aaaa","Chưa có người thuê",0),
("0301",50,530000,2,"Studio",1,1,3,"aaaa","Chưa có người thuê",0),
("0302",50,5300000,2,"Studio",1,2,3,"aaaa","Chưa có người thuê",0),
("0303",50,56000000,2,"Studio",1,3,3,"aaaa","Chưa có người thuê",0),
("0304",75,830000,6,"Family",2,1,3,"aaaa","Chưa có người thuê",0),
("0305",75,8300000,6,"Family",2,2,3,"aaaa","Chưa có người thuê",0),
("0306",75,86000000,6,"Family",2,3,3,"aaaa","Chưa có người thuê",0),
("0307",125,1200000,10,"Officetel",3,1,3,"aaaa","Chưa có người thuê",0),
("0308",125,12000000,10,"Officetel",3,2,3,"aaaa","Chưa có người thuê",0),
("0309",125,120000000,10,"Officetel",3,3,3,"aaaa","Chưa có người thuê",0),
("0401",50,540000,2,"Studio",1,1,4,"aaaa","Chưa có người thuê",0),
("0402",50,5400000,2,"Studio",1,2,4,"aaaa","Chưa có người thuê",0),
("0403",50,57000000,2,"Studio",1,3,4,"aaaa","Chưa có người thuê",0),
("0404",75,840000,6,"Family",2,1,4,"aaaa","Chưa có người thuê",0),
("0405",75,8400000,6,"Family",2,2,4,"aaaa","Chưa có người thuê",0),
("0406",75,87000000,6,"Family",2,3,4,"aaaa","Chưa có người thuê",0),
("0407",125,1400000,10,"Officetel",3,1,4,"aaaa","Chưa có người thuê",0),
("0408",125,14000000,10,"Officetel",3,2,4,"aaaa","Chưa có người thuê",0),
("0409",125,140000000,10,"Officetel",3,3,4,"aaaa","Chưa có người thuê",0),
("0501",50,550000,2,"Studio",1,1,5,"aaaa","Chưa có người thuê",0),
("0502",50,5500000,2,"Studio",1,2,5,"aaaa","Chưa có người thuê",0),
("0503",50,58000000,2,"Studio",1,3,5,"aaaa","Chưa có người thuê",0),
("0504",75,850000,6,"Family",2,1,5,"aaaa","Chưa có người thuê",0),
("0505",75,8500000,6,"Family",2,2,5,"aaaa","Chưa có người thuê",0),
("0506",75,88000000,6,"Family",2,3,5,"aaaa","Chưa có người thuê",0),
("0507",125,1500000,10,"Officetel",3,1,5,"aaaa","Chưa có người thuê",0),
("0508",125,15000000,10,"Officetel",3,2,5,"aaaa","Chưa có người thuê",0),
("0509",125,150000000,10,"Officetel",3,3,5,"aaaa","Chưa có người thuê",0),
("0601",50,560000,2,"Studio",1,1,6,"aaaa","Chưa có người thuê",0),
("0602",50,5600000,2,"Studio",1,2,6,"aaaa","Chưa có người thuê",0),
("0603",50,59000000,2,"Studio",1,3,6,"aaaa","Chưa có người thuê",0),
("0604",75,860000,6,"Family",2,1,6,"aaaa","Chưa có người thuê",0),
("0605",75,8600000,6,"Family",2,2,6,"aaaa","Chưa có người thuê",0),
("0606",75,89000000,6,"Family",2,3,6,"aaaa","Chưa có người thuê",0),
("0607",125,1600000,10,"Officetel",3,1,6,"aaaa","Chưa có người thuê",0),
("0608",125,16000000,10,"Officetel",3,2,6,"aaaa","Chưa có người thuê",0),
("0609",125,160000000,10,"Officetel",3,3,6,"aaaa","Chưa có người thuê",0);

ALTER TABLE `can_ho` MODIFY COLUMN `mo_ta_tien_nghi` VARCHAR(500);

delimiter //
create procedure them_lich_xem(n_ma_can_ho int,n_ten_khach_hang varchar(45),n_so_dien_thoai varchar(45),n_email varchar(45),n_ngay_xem_can_ho date,n_tinh_trang varchar(45))
begin
insert into lich_xem(ma_can_ho,ten_khach_hang,so_dien_thoai,email,ngay_xem_can_ho,tinh_trang)
values(n_ma_can_ho,n_ten_khach_hang,n_so_dien_thoai,n_email,n_ngay_xem_can_ho,n_tinh_trang);
end
// delimiter ;

delimiter //
create procedure danh_sach_tai_khoan()
begin
select * from tai_khoan;
end;
// delimiter ;

call danh_sach_tai_khoan();

delimiter //
create procedure them_tai_khoan(n_ten_tai_khoan varchar(45),n_mat_khau varchar(45), n_ma_loai_tai_khoan int)
begin
insert into tai_khoan(ten_tai_khoan,mat_khau, ma_loai_tai_khoan)
values(n_ten_tai_khoan,n_mat_khau, n_ma_loai_tai_khoan);
end;
// delimiter ;


delimiter //
create procedure danh_sach_lich_xem()
begin
select ma_lich_xem, ten_can_ho, ten_khach_hang, so_dien_thoai, email, ngay_xem_can_ho, lich_xem.tinh_trang from lich_xem 
join can_ho on lich_xem.ma_can_ho = can_ho.ma_can_ho
where lich_xem.is_delete = 0;
end;
// delimiter ;

call danh_sach_lich_xem;

UPDATE `apartment_management`.`lich_xem` SET `ngay_xem_can_ho` = NULL WHERE (`ma_lich_xem` = '4');

delimiter //
create procedure danh_sach_lich_xem_1()
begin
select ma_lich_xem, ten_can_ho, ten_khach_hang, so_dien_thoai, email, ngay_xem_can_ho, lich_xem.tinh_trang, can_ho.ma_can_ho as ma_can_ho from lich_xem 
join can_ho on lich_xem.ma_can_ho = can_ho.ma_can_ho;
end;
// delimiter ;

call danh_sach_lich_xem_1;


delimiter //
create procedure danh_sach_can_ho()
begin
select ma_can_ho,ten_can_ho,dien_tich,chi_phi_thue,so_nguoi_toi_da,mo_ta_tien_nghi,ten_loai_can_ho,ten_kieu_thue,so_tang,tinh_trang,can_ho.is_delete from can_ho
join loai_can_ho on can_ho.ma_loai_can_ho = loai_can_ho.ma_loai_can_ho
join kieu_thue on kieu_thue.ma_kieu_thue = can_ho.ma_kieu_thue
join so_tang on so_tang.ma_so_tang = can_ho.ma_so_tang;
end;
// delimiter ;

call danh_sach_can_ho();

delimiter //
create procedure danh_sach_nhan_vien()
begin
select ma_nhan_vien, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ten_bo_phan, ten_tai_khoan, nhan_vien.is_delete from nhan_vien
join bo_phan on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
join tai_khoan on nhan_vien.ma_tai_khoan = tai_khoan.ma_tai_khoan;
end;
// delimiter ;

call danh_sach_nhan_vien();

delimiter //
create procedure xoa_nhan_vien(id int)
begin
declare ma_tk int;
    select tai_khoan.ma_tai_khoan into ma_tk from tai_khoan join nhan_vien on tai_khoan.ma_tai_khoan = nhan_vien.ma_tai_khoan where nhan_vien.ma_nhan_vien = id;
    update nhan_vien set is_delete = 1 where ma_nhan_vien = id;
    update tai_khoan set is_delete = 1 where ma_tai_khoan = ma_tk;
end;
// delimiter ;

delimiter //
create procedure phuc_hoi_nhan_vien(id int)
begin
declare ma_tk int;
    select tai_khoan.ma_tai_khoan into ma_tk from tai_khoan join nhan_vien on tai_khoan.ma_tai_khoan = nhan_vien.ma_tai_khoan where nhan_vien.ma_nhan_vien = id;
    update nhan_vien set is_delete = 0 where ma_nhan_vien = id;
    update tai_khoan set is_delete = 0 where ma_tai_khoan = ma_tk;
end;
// delimiter ;

insert into nhan_vien(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_bo_phan,ma_tai_khoan)
values(?,?,?,?,?,?,?,?,?,?);

delimiter //
create procedure danh_sach_khach_hang()
begin
select ma_khach_hang, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ten_tai_khoan, khach_hang.is_delete from khach_hang
join tai_khoan on khach_hang.ma_tai_khoan = tai_khoan.ma_tai_khoan;
end;
// delimiter ;

call danh_sach_khach_hang();

delimiter //
create procedure xoa_khach_hang(id int)
begin
declare ma_tk int;
    select tai_khoan.ma_tai_khoan into ma_tk from tai_khoan join khach_hang on tai_khoan.ma_tai_khoan = khach_hang.ma_tai_khoan where khach_hang.ma_khach_hang = id;
    update khach_hang set is_delete = 1 where ma_khach_hang = id;
    update tai_khoan set is_delete = 1 where ma_tai_khoan = ma_tk;
end;
// delimiter ;

delimiter //
create procedure phuc_hoi_khach_hang(id int)
begin
declare ma_tk int;
    select tai_khoan.ma_tai_khoan into ma_tk from tai_khoan join khach_hang on tai_khoan.ma_tai_khoan = khach_hang.ma_tai_khoan where khach_hang.ma_khach_hang = id;
    update khach_hang set is_delete = 0 where ma_khach_hang = id;
    update tai_khoan set is_delete = 0 where ma_tai_khoan = ma_tk;
end;
// delimiter ;

insert into nhan_vien(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_bo_phan,ma_tai_khoan)
values(?,?,?,?,?,?,?,?,?,?);


delimiter $$
create procedure insert_contract(in in_ngay date,in in_ngay_ket_thuc date,in in_tien_dat_coc varchar(50),in in_ma_khach_hang int,in in_ma_nhan_vien int, in in_ma_can_ho int)
begin
insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_khach_hang,ma_nhan_vien,ma_can_ho)
values(in_ngay,in_ngay_ket_thuc,in_tien_dat_coc,in_ma_khach_hang,in_ma_nhan_vien, in_ma_can_ho);
update lich_xem set is_delete = 1 where lich_xem.ma_can_ho = in_ma_can_ho;
end $$
delimiter ;
call insert_contract('20230101','20230202',10000,1,1,1);


DELIMITER $$
CREATE PROCEDURE delete_contract_by_id(IN id INT)
BEGIN
    DECLARE id_can_ho INT;
    SELECT can_ho.ma_can_ho INTO id_can_ho
    FROM hop_dong
    JOIN can_ho ON hop_dong.ma_can_ho = can_ho.ma_can_ho
    WHERE hop_dong.ma_hop_dong = id
    LIMIT 1;
    
    IF id_can_ho IS NOT NULL THEN
        UPDATE hop_dong
        SET is_delete = 1
        WHERE ma_hop_dong = id;

        UPDATE can_ho
        SET tinh_trang = 'Chưa cho thuê'
        WHERE ma_can_ho = id_can_ho;
    END IF;
END $$
DELIMITER ;
call delete_contract_by_id(1);

delimiter $$
create procedure contract_extension(in id int, in month_plus int)
begin
update hop_dong
set ngay_ket_thuc = timestampadd(month,month_plus,ngay_ket_thuc)
where ma_hop_dong = id;
end $$
delimiter ;
call contract_extension(1,6);


delimiter $$
create procedure change_status_apartment(in id int)
begin
update can_ho
set tinh_trang = 'Đã cho thuê'
where ma_can_ho = id;
end $$
delimiter ;
call change_status_apartment(1);
delimiter $$

select nhan_vien.ma_nhan_vien,nhan_vien.ho_ten from nhan_vien where is_delete = 0;
select khach_hang.ma_khach_hang,khach_hang.ho_ten from khach_hang;
            
select can_ho.ma_can_ho, can_ho.ten_can_ho, can_ho.chi_phi_thue from can_ho;

delimiter //
create procedure danh_sach_khach_hang_1()
begin
select * from khach_hang;
end;
// delimiter ;
call danh_sach_khach_hang_1();

delimiter //
create procedure hop_dong_dto()
begin
select ma_hop_dong, ngay_ket_thuc, ho_ten,email,ten_can_ho from hop_dong join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join can_ho on can_ho.ma_can_ho = hop_dong.ma_can_ho;
end;
// delimiter ;
call hop_dong_dto();

create view khach_hang_hop_dong as
select hop_dong.*,khach_hang.ho_ten 
from hop_dong
join khach_hang
on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang;

delimiter $$
create procedure get_apartment_by_id(in id int)
begin
select can_ho.*, loai_can_ho.ten_loai_can_ho, kieu_thue.ten_kieu_thue, so_tang.so_tang
from can_ho join loai_can_ho on loai_can_ho.ma_loai_can_ho = can_ho.ma_loai_can_ho
join kieu_thue on kieu_thue.ma_kieu_thue = can_ho.ma_kieu_thue
join so_tang on can_ho.ma_so_tang = so_tang.ma_so_tang
where can_ho.ma_can_ho = id;
end $$
delimiter ;

call get_apartment_by_id(1);

delimiter $$
create procedure update_apartment(in id int,in in_name varchar(50),in in_dien_tich double,
in in_chi_phi_thue double,in in_so_nguoi_toi_da int,in in_ma_kieu_thue int,
 in in_ma_loai_can_ho int,in in_ma_so_tang int,in in_tinh_trang varchar(50))
begin
update can_ho
set ten_can_ho = in_name,
dien_tich = in_dien_tich,
chi_phi_thue = in_chi_phi_thue,
so_nguoi_toi_da = in_so_nguoi_toi_da,
ma_kieu_thue = in_ma_kieu_thue,
ma_loai_can_ho = in_ma_loai_can_ho,
ma_so_tang = in_ma_so_tang,
tinh_trang = in_tinh_trang
where ma_can_ho = id;
end $$
delimiter ;

UPDATE khach_hang SET khach_hang.email = 'nguyendinhthaibao63@gmail.com' WHERE ma_khach_hang = 2;