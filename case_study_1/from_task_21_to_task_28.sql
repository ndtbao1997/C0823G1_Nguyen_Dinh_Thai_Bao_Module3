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


