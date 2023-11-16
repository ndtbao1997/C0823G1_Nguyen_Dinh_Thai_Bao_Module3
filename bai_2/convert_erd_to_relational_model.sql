CREATE DATABASE convert_erd_to_relational_model;

USE convert_erd_to_relational_model;

CREATE TABLE phieu_xuat (
    so_px INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat DATE
);

CREATE TABLE vat_tu (
    ma_vat_tu INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_vat_tu VARCHAR(255) UNIQUE
);

CREATE TABLE chi_tiet_phieu_xuat (
    don_gia_xuat LONG,
    CHECK (don_gia_xuat > 0),
    so_luong_xuat INT,
    CHECK (so_luong_xuat > 0),
    so_px INT NOT NULL,
    FOREIGN KEY (so_px)
        REFERENCES phieu_xuat (so_px),
    ma_vat_tu INT NOT NULL,
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    PRIMARY KEY (so_px , ma_vat_tu)
);

CREATE TABLE phieu_nhap (
    so_pn INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ngay_nhap DATE
);

CREATE TABLE chi_tiet_phieu_nhap (
    don_gia_nhap LONG,
    CHECK (don_gia_nhap > 0),
    so_luong_nhap INT,
    CHECK (so_luong_nhap > 0),
    ma_vat_tu INT NOT NULL,
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    so_pn INT NOT NULL,
    FOREIGN KEY (so_pn)
        REFERENCES phieu_nhap (so_pn),
    PRIMARY KEY (so_pn , ma_vat_tu)
);

CREATE TABLE don_dat_hang (
    ngay_dat_hang DATE NOT NULL,
    so_dh INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ma_ncc INT NOT NULL,
    FOREIGN KEY (ma_ncc)
        REFERENCES nha_cung_cap (ma_ncc)
);

CREATE TABLE chi_tiet_don_dat_hang (
    ngay_giao_hang DATE NOT NULL,
    so_dh INT NOT NULL,
    FOREIGN KEY (so_dh)
        REFERENCES don_dat_hang (so_dh),
    ma_vat_tu INT NOT NULL,
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    PRIMARY KEY (ma_vat_tu , so_dh)
);

CREATE TABLE nha_cung_cap (
    ma_ncc INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_ncc VARCHAR(255),
    dia_chi VARCHAR(255)
);

CREATE TABLE ncc_sdt (
    ma_ncc INT NOT NULL,
    FOREIGN KEY (ma_ncc)
        REFERENCES nha_cung_cap (ma_ncc),
    sdt VARCHAR(12) NOT NULL UNIQUE,
    PRIMARY KEY (ma_ncc , sdt)
);