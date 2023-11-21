-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET sql_safe_updates = 0;

DELETE FROM nhan_vien nv
WHERE
    nv.ma_nhan_vien NOT IN (SELECT 
        hd.ma_nhan_vien
    FROM
        hop_dong hd
    
    WHERE
        hd.ngay_lam_hop_dong BETWEEN '2019-01-01' AND '2021-12-31'
    GROUP BY hd.ma_nhan_vien);
    
SET sql_safe_updates = 1;

-- 17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là 
-- lớn hơn 10.000.000 VNĐ.
CREATE VIEW task_17 as
SELECT 
    kh.ma_khach_hang,
    SUM(dv.chi_phi_thue + IFNULL(dvdk.gia, 0) * IFNULL(hdct.so_luong, 0)) AS tong_tien
FROM
    khach_hang kh
        JOIN
    hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
        JOIN
    dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        left JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        left JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
WHERE
     YEAR(hd.ngay_lam_hop_dong) = '2021'
GROUP BY   hd.ma_hop_dong, hdct.ma_hop_dong;

CREATE VIEW task_17_tong_tien_2021 as
SELECT 
    task_17.ma_khach_hang, SUM(task_17.tong_tien) as tong_tien
FROM
    task_17
GROUP BY task_17.ma_khach_hang;

SET sql_safe_updates = 0;
        
UPDATE khach_hang kh
        JOIN
    (SELECT 
        kh.ma_khach_hang
    FROM
        task_17_tong_tien_2021 t17
    JOIN khach_hang kh ON t17.ma_khach_hang = kh.ma_khach_hang
    JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
    WHERE
        t17.tong_tien > 1000000
            AND lk.ten_loai_khach = 'Platinium') AS sqr ON sqr.ma_khach_hang = kh.ma_khach_hang 
SET 
    ma_loai_khach = 1;
    
SET sql_safe_updates = 1; 

-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
                
-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
SET sql_safe_updates = 0;

UPDATE dich_vu_di_kem dvdk
        JOIN
    (SELECT 
        dvdk.ma_dich_vu_di_kem, SUM(hdct.so_luong) AS so_lan_su_dung
    FROM
        dich_vu_di_kem dvdk
    JOIN hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
    JOIN hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
    WHERE
        hd.ngay_lam_hop_dong LIKE '2020-%'
    GROUP BY hdct.ma_dich_vu_di_kem
    HAVING so_lan_su_dung > 10) AS task_19 ON task_19.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
SET 
    dvdk.gia = dvdk.gia * 2;

SET sql_safe_updates = 1;

-- 20.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id 
-- (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    kh.email,
    kh.so_dien_thoai,
    kh.ngay_sinh,
    kh.dia_chi,
    'Khách hàng' AS loai
FROM
    khach_hang kh
UNION
SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    nv.email,
    nv.so_dien_thoai,
    nv.ngay_sinh,
    nv.dia_chi,
    'Nhân viên' AS loai
FROM
    nhan_vien nv;

