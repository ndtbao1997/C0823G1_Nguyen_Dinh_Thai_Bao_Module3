CREATE DATABASE furama_database;
USE furama_database;

CREATE TABLE vi_tri (
    ma_vi_tri INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_vi_tri VARCHAR(45) UNIQUE
);

CREATE TABLE trinh_do (
    ma_trinh_do INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_trinh_do VARCHAR(45) UNIQUE
);

CREATE TABLE bo_phan (
    ma_bo_phan INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_bo_phan VARCHAR(45) UNIQUE
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL UNIQUE,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45) UNIQUE,
    dia_chi VARCHAR(45),
    ma_vi_tri INT NOT NULL,
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    ma_trinh_do INT NOT NULL,
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    ma_bo_phan INT NOT NULL,
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);

CREATE TABLE loai_khach (
    ma_loai_khach INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_loai_khach VARCHAR(45) UNIQUE
);

CREATE TABLE khach_hang (
    ma_khach_hang INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ma_loai_khach INT NOT NULL,
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach),
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL UNIQUE,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45) UNIQUE,
    dia_chi VARCHAR(45)
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45) UNIQUE
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45) UNIQUE
);

CREATE TABLE dich_vu (
    ma_dich_vu INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT,
    CHECK (dien_tich > 0),
    chi_phi_thue DOUBLE NOT NULL,
    CHECK (chi_phi_thue > 0),
    so_nguoi_toi_da INT,
    CHECK (so_nguoi_toi_da > 0),
    ma_kieu_thue INT NOT NULL,
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    ma_loai_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu),
    tieu_chuan_phong VARCHAR(45),
    mo_to_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    CHECK (dien_tich_ho_boi > 30),
    so_tang INT,
    CHECK (so_tang > 0),
    dich_vu_mien_phi_di_kem TEXT
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL UNIQUE,
    gia DOUBLE NOT NULL,
    CHECK (gia > 0),
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45) DEFAULT 'Open'
);

CREATE TABLE hop_dong (
    ma_hop_dong INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE NOT NULL,
    CHECK (tien_dat_coc > 0),
    ma_nhan_vien INT NOT NULL,
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    ma_khach_hang INT NOT NULL,
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    ma_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ma_hop_dong INT NOT NULL,
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    ma_dich_vu_di_kem INT NOT NULL,
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem),
    UNIQUE (ma_hop_dong , ma_dich_vu_di_kem),
    so_luong INT NOT NULL,
    CHECK (so_luong >= 0)
);