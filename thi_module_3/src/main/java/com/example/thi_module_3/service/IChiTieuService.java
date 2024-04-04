package com.example.thi_module_3.service;

import com.example.thi_module_3.model.ChiTieu;
import com.example.thi_module_3.model.ChiTieuDTO;
import com.example.thi_module_3.model.LoaiChi;

import java.util.List;

public interface IChiTieuService {
    List<ChiTieuDTO> danhSachChiTieuDTO();

    List<LoaiChi> danhSachLoaiChi();

    void themMoiChiTieu(ChiTieu chiTieu);

    void xoaChiTieu(int id);
}
