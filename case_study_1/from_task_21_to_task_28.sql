-- 21.Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và 
-- đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_nhan_vien as
    select 
        nv.*
    from
        nhan_vien nv
            join
        hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
    where
        hd.ngay_lam_hop_dong = '2019-12-12'
            and nv.dia_chi like '%Hải Châu%'
            and nv.is_delete = 0
    group by nv.ma_nhan_vien;

-- 22.Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
set sql_safe_updates = 0;

update nhan_vien nv
        join
    (select 
        v_nhan_vien.ma_nhan_vien
    from
        v_nhan_vien) as vnv on nv.ma_nhan_vien = vnv.ma_nhan_vien 
set 
    nv.dia_chi = replace(nv.dia_chi,
        'Hải Châu',
        'Liên Chiểu')
where
    nv.dia_chi like '%Hải Châu%';
    
set sql_safe_updates = 1;

-- 23.Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter //
create procedure sp_xoa_khach_hang(id int)
begin
set sql_safe_updates = 0;
update khach_hang kh
set kh.is_delete = 1
where kh.ma_khach_hang = id;
update hop_dong hd
set hd.is_delete = 1
where hd.ma_khach_hang = id;
update hop_dong_chi_tiet hdct
set hdct.is_delete = 1
where hdct.ma_hop_dong_chi_tiet 
in (select hdct.ma_hop_dong_chi_tiet from hop_dong_chi_tiet hdct join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong where hd.ma_khach_hang = id);
set sql_safe_updates = 1;
end;
// delimiter ;

-- 24.Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure sp_them_moi_hop_dong(new_ngay_lam_hop_dong DATETIME,
    new_ngay_ket_thuc DATETIME,
    new_tien_dat_coc DOUBLE,
    new_ma_nhan_vien INT ,
    new_ma_khach_hang INT ,
    new_ma_dich_vu INT)
begin
declare check_count int;
select count(*) into check_count from nhan_vien where ma_nhan_vien = new_ma_nhan_vien;
if check_count = 0 then
        signal sqlstate '45000' set message_text = 'Nhân viên không tồn tại.';
end if;
select count(*) into check_count from khach_hang where  ma_khach_hang = new_ma_khach_hang;
if check_count = 0 then
        signal sqlstate '45000' set message_text = 'Khách hàng không tồn tại.';
end if;
select count(*) into check_count from dich_vu where ma_dich_vu = new_ma_dich_vu;
if check_count = 0 then
	    signal sqlstate '45000' set message_text = 'Dịch vụ không tồn tại';
end if;
set sql_safe_updates = 0;
insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
values(new_ngay_lam_hop_dong, new_ngay_ket_thuc, new_tien_dat_coc, new_ma_nhan_vien, new_ma_khach_hang, new_ma_dich_vu);
set sql_safe_updates = 1;
end;
// delimiter ;

call sp_them_moi_hop_dong('2023-01-02','2023-01-05',5000,1,100,1);

-- 25.Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
create table history(
id int primary key auto_increment,
so_hop_dong_con_lai int,
thoi_gian_thuc_hien datetime
);
delimiter //
create trigger tr_xoa_hop_dong
after update on hop_dong
for each row
begin
declare hd_count int;
select count(*) into hd_count from hop_dong where hop_dong.is_delete = 0;
insert into history(so_hop_dong_con_lai,thoi_gian_thuc_hien)
values(hd_count,now());
end;
// delimiter ;

drop trigger tr_xoa_hop_dong;

update hop_dong hd
set hd.is_delete = 0
where hd.ma_hop_dong = 4;

-- 26.Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: 
-- Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo
-- “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
delimiter //
create trigger tr_cap_nhat_hop_dong
before update on hop_dong
for each row
begin
if new.ngay_ket_thuc < date_add(new.ngay_lam_hop_dong, interval 2 day) then 
signal sqlstate '45000' set message_text = 'Ngày kết thúc phải lớn hơn ngày làm ngày làm hợp đồng ít nhất 2 ngày';
end if;
end // 
delimiter ;

drop trigger tr_cap_nhat_hop_dong;

set  sql_safe_updates = 0;
update hop_dong
set ngay_ket_thuc = '2020-12-09'
where ma_hop_dong = 1;
set  sql_safe_updates = 1;

-- 27.Tạo Function thực hiện yêu cầu sau:
-- a.Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
-- b.Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện 
-- thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng).
-- Mã của khách hàng được truyền vào như là 1 tham số của function này.
delimiter //
create function func_dem_dich_vu()
returns int
deterministic
begin
declare f_count int;
select count(*) into f_count from
(select hd.ma_dich_vu, sum(dv.chi_phi_thue + ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0)) as tong_tien
from hop_dong hd join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_dich_vu
having tong_tien > 2000000) as thong_ke;
return f_count;
end;
// delimiter ;

select func_dem_dich_vu();

delimiter // 
create function func_tinh_thoi_gian_hop_dong(mkh int)
returns int
deterministic
begin
declare so_ngay int;
select datediff(ngay_ket_thuc, ngay_lam_hop_dong) as chenh_lech into so_ngay from hop_dong hd
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
where kh.ma_khach_hang = mkh
order by chenh_lech desc
limit 1;
return so_ngay;
end;
// delimiter ;

select func_tinh_thoi_gian_hop_dong(2);

-- 28.Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 
-- để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) và xóa những hop_dong sử dụng dịch vụ liên quan
-- (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.
delimiter //
create procedure sp_xoa_dich_vu_va_hd_room()
begin
set sql_safe_updates = 0;
create view room_2015_2019 as 
select dv.ma_dich_vu from dich_vu dv join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where ldv.ten_loai_dich_vu = 'Room' and hd.ngay_lam_hop_dong between '2015-01-01' and '2019-12-31';
update dich_vu join room_2015_2019 on room_2015_2019.ma_dich_vu = dich_vu.ma_dich_vu
set dich_vu.is_delete = 1;
update hop_dong join room_2015_2019 on room_2015_2019.ma_dich_vu = hop_dong.ma_dich_vu
set hop_dong.is_delete = 1;
update hop_dong_chi_tiet hdct join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong 
join room_2015_2019 on room_2015_2019.ma_dich_vu = hd.ma_dich_vu
set hdct.is_delete = 1;
drop view room_2015_2019;
set sql_safe_updates = 1;
end;
// delimiter ;




