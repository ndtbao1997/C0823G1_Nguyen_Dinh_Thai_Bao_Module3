package com.example.thi_module_3.model;

public class ChiTieuDTO {
    private int maChiTieu;
    private String tenChiTieu;
    private String ngayChi;
    private Double soTienChi;
    private String loaiChi;
    private String moTaThem;

    public ChiTieuDTO(int maChiTieu, String tenChiTieu, String ngayChi, Double soTienChi, String loaiChi, String moTaThem) {
        this.maChiTieu = maChiTieu;
        this.tenChiTieu = tenChiTieu;
        this.ngayChi = ngayChi;
        this.soTienChi = soTienChi;
        this.loaiChi = loaiChi;
        this.moTaThem = moTaThem;
    }

    public int getMaChiTieu() {
        return maChiTieu;
    }

    public void setMaChiTieu(int maChiTieu) {
        this.maChiTieu = maChiTieu;
    }

    public String getTenChiTieu() {
        return tenChiTieu;
    }

    public void setTenChiTieu(String tenChiTieu) {
        this.tenChiTieu = tenChiTieu;
    }

    public String getNgayChi() {
        return ngayChi;
    }

    public void setNgayChi(String ngayChi) {
        this.ngayChi = ngayChi;
    }

    public Double getSoTienChi() {
        return soTienChi;
    }

    public void setSoTienChi(Double soTienChi) {
        this.soTienChi = soTienChi;
    }

    public String getLoaiChi() {
        return loaiChi;
    }

    public void setLoaiChi(String loaiChi) {
        this.loaiChi = loaiChi;
    }

    public String getMoTaThem() {
        return moTaThem;
    }

    public void setMoTaThem(String moTaThem) {
        this.moTaThem = moTaThem;
    }
}
