package com.example.thi_module_3.service;

import com.example.thi_module_3.model.ChiTieu;
import com.example.thi_module_3.model.ChiTieuDTO;
import com.example.thi_module_3.model.LoaiChi;
import com.example.thi_module_3.repository.ChiTieuRepository;
import com.example.thi_module_3.repository.IChiTieuRepository;

import java.util.List;

public class ChiTieuService implements IChiTieuService{
    private final IChiTieuRepository iChiTieuRepository = new ChiTieuRepository();

    @Override
    public List<ChiTieuDTO> danhSachChiTieuDTO() {
        return iChiTieuRepository.danhSachChiTieuDTO();
    }

    @Override
    public List<LoaiChi> danhSachLoaiChi() {
        return iChiTieuRepository.danhSachLoaiChi();
    }

    @Override
    public void themMoiChiTieu(ChiTieu chiTieu) {
        iChiTieuRepository.themMoiChiTieu(chiTieu);
    }

    @Override
    public void xoaChiTieu(int id) {
        iChiTieuRepository.xoaChiTieu(id);
    }
}
