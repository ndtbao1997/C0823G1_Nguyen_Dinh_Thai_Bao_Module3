-- 21.Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và 
-- đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
CREATE VIEW v_nhan_vien AS
SELECT 
    nv.*
FROM
    nhan_vien nv
        JOIN
    hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
WHERE
    hd.ngay_lam_hop_dong = '2019-12-12'
        AND nv.dia_chi LIKE '%Hải Châu%'
GROUP BY nv.ma_nhan_vien;

-- 22.Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
SET sql_safe_updates = 0;

UPDATE nhan_vien nv
        JOIN
    (SELECT 
        v_nhan_vien.ma_nhan_vien
    FROM
        v_nhan_vien) AS vnv ON nv.ma_nhan_vien = vnv.ma_nhan_vien 
SET 
    nv.dia_chi = REPLACE(nv.dia_chi,
        'Hải Châu',
        'Liên Chiểu')
WHERE
    nv.dia_chi LIKE '%Hải Châu%';
    
SET sql_safe_updates = 1;

-- 23.Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter //
create procedure sp_xoa_khach_hang(id int)
begin
set sql_safe_updates = 0;
delete from khach_hang kh
where kh.ma_khach_hang = id;
delete from hop_dong hd
where hd.ma_khach_hang = id;
delete from hop_dong_chi_tiet hdct
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
// delimiter  ;


