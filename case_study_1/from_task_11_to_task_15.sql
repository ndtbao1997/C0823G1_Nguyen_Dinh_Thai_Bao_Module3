-- 11.Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT 
    dvdk.*
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE
    lk.ten_loai_khach = 'Diamond'
        AND dvdk.is_delete = 0
        AND hdct.is_delete = 0
        AND (kh.dia_chi LIKE '%Vinh'
        OR kh.dia_chi LIKE '%Quảng Ngãi');
        
-- 12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT 
    hd.ma_hop_dong,
    nv.ho_ten AS ho_ten_nhan_vien,
    kh.ho_ten AS ho_ten_khach_hang,
    dv.ma_dich_vu,
    kh.so_dien_thoai,
    dv.ten_dich_vu,
    SUM(IFNULL(so_luong, 0)) AS so_luong_dich_vu_di_kem,
    hd.tien_dat_coc
FROM
    hop_dong hd
        JOIN
    nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
WHERE
    (hd.ngay_lam_hop_dong BETWEEN '2020-10-01' AND '2020-12-31')
        AND hd.ma_hop_dong NOT IN (SELECT 
            hd.ma_hop_dong
        FROM
            hop_dong hd
        WHERE
            hd.ngay_lam_hop_dong LIKE '2021-06%'
                AND hd.is_delete = 0)
        AND hd.is_delete = 0
GROUP BY hd.ma_hop_dong;

-- 13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
SELECT 
    dvdk.ten_dich_vu_di_kem,
    dvdk.ma_dich_vu_di_kem,
    SUM(so_luong) AS so_luong_dich_vu_di_kem
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE
    hdct.is_delete = 0
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING so_luong_dich_vu_di_kem = (SELECT 
        MAX(so_luong_dich_vu_di_kem)
    FROM
        (SELECT 
            dvdk.ten_dich_vu_di_kem,
                dvdk.ma_dich_vu_di_kem,
                SUM(so_luong) AS so_luong_dich_vu_di_kem
        FROM
            dich_vu_di_kem dvdk
        JOIN hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        WHERE
            hdct.is_delete = 0
        GROUP BY dvdk.ma_dich_vu_di_kem) AS max_so_luong);
    
-- 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
CREATE VIEW task_14 AS
    SELECT 
        dvdk.ten_dich_vu_di_kem,
        dvdk.ma_dich_vu_di_kem,
        COUNT(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
    FROM
        dich_vu_di_kem dvdk
            JOIN
        hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    WHERE
        hdct.is_delete = 0
    GROUP BY dvdk.ten_dich_vu_di_kem
    HAVING so_lan_su_dung = 1;

SELECT 
    hd.ma_hop_dong, ldv.ten_loai_dich_vu, t14.*
FROM
    task_14 t14
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = t14.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        JOIN
    loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
WHERE
    hd.is_delete = 0;
    
-- 15.Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, 
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
CREATE VIEW task_15 AS
    SELECT 
        nv.ma_nhan_vien, COUNT(hd.ma_nhan_vien) AS thanh_tich
    FROM
        nhan_vien nv
            JOIN
        hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
    WHERE
        hd.is_delete = 0
    GROUP BY hd.ma_nhan_vien;

SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi,
    t15.thanh_tich
FROM
    nhan_vien nv
        JOIN
    trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
        JOIN
    bo_phan bp ON bp.ma_bo_phan = nv.ma_bo_phan
        JOIN
    task_15 t15 ON t15.ma_nhan_vien = nv.ma_nhan_vien
WHERE
    nv.is_delete = 0
HAVING thanh_tich <= 3;