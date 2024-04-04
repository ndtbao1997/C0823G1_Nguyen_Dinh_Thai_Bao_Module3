package com.example.thi_module_3.model;

public class ChiTieu {
    private int maChiTieu;
    private String tenChiTieu;
    private String ngayChi;
    private Double soTienChi;
    private int maLoaiChi;
    private String moTaThem;

    public ChiTieu(int maChiTieu, String tenChiTieu, String ngayChi, Double soTienChi, int maLoaiChi, String moTaThem) {
        this.maChiTieu = maChiTieu;
        this.tenChiTieu = tenChiTieu;
        this.ngayChi = ngayChi;
        this.soTienChi = soTienChi;
        this.maLoaiChi = maLoaiChi;
        this.moTaThem = moTaThem;
    }

    public ChiTieu(String tenChiTieu, String ngayChi, Double soTienChi, int maLoaiChi, String moTaThem) {
        this.tenChiTieu = tenChiTieu;
        this.ngayChi = ngayChi;
        this.soTienChi = soTienChi;
        this.maLoaiChi = maLoaiChi;
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

    public int getMaLoaiChi() {
        return maLoaiChi;
    }

    public void setMaLoaiChi(int maLoaiChi) {
        this.maLoaiChi = maLoaiChi;
    }

    public String getMoTaThem() {
        return moTaThem;
    }

    public void setMoTaThem(String moTaThem) {
        this.moTaThem = moTaThem;
    }
}
