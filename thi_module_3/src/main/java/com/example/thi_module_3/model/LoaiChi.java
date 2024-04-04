package com.example.thi_module_3.model;

public class LoaiChi {
    private int maLoaiChi;
    private String tenLoaiChi;

    public LoaiChi(int maLoaiChi, String tenLoaiChi) {
        this.maLoaiChi = maLoaiChi;
        this.tenLoaiChi = tenLoaiChi;
    }

    public int getMaLoaiChi() {
        return maLoaiChi;
    }

    public void setMaLoaiChi(int maLoaiChi) {
        this.maLoaiChi = maLoaiChi;
    }

    public String getTenLoaiChi() {
        return tenLoaiChi;
    }

    public void setTenLoaiChi(String tenLoaiChi) {
        this.tenLoaiChi = tenLoaiChi;
    }
}
