package com.example.thi_module_3.repository;

import com.example.thi_module_3.model.ChiTieu;
import com.example.thi_module_3.model.ChiTieuDTO;
import com.example.thi_module_3.model.LoaiChi;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ChiTieuRepository implements IChiTieuRepository {
    private final String XOA_CHI_TIEU = "delete from chi_tieu where ma_chi_tieu = ?;";
    private final String GOI_DANH_SACH_CHI_TIEU_DTO = "call danh_sach_chi_tieu();";
    private final String DANH_SACH_LOAI_CHI = "call danh_sach_loai_chi();";
    private final String THEM_MOI = "insert into chi_tieu(ten_chi_tieu,ngay_chi,so_tien_chi,ma_loai_chi,mo_ta_them)\n" +
            "values(?,?,?,?,?);";

    @Override
    public List<ChiTieuDTO> danhSachChiTieuDTO() {
        List<ChiTieuDTO> chiTieuDTOS = new ArrayList<>();
        Connection connection = null;
        CallableStatement callableStatement = null;
        int maChiTieu;
        String tenChiTieu;
        String ngayChi;
        Double soTienChi;
        String loaiChi;
        String moTaThem;
        try {
            connection = BaseRepository.getConnection();
            callableStatement = connection.prepareCall(GOI_DANH_SACH_CHI_TIEU_DTO);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                maChiTieu = rs.getInt("ma_chi_tieu");
                tenChiTieu = rs.getString("ten_chi_tieu");
                ngayChi = rs.getString("ngay_chi");
                soTienChi = rs.getDouble("so_tien_chi");
                loaiChi = rs.getString("ten_loai_chi");
                moTaThem = rs.getString("mo_ta_them");
                chiTieuDTOS.add(new ChiTieuDTO(maChiTieu, tenChiTieu, ngayChi, soTienChi, loaiChi, moTaThem));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return chiTieuDTOS;
    }

    @Override
    public List<LoaiChi> danhSachLoaiChi() {
        List<LoaiChi> loaiChis = new ArrayList<>();
        Connection connection = null;
        CallableStatement statement = null;
        int maLoaiChi;
        String tenLoaiChi;
        try {
            connection = BaseRepository.getConnection();
            statement = connection.prepareCall(DANH_SACH_LOAI_CHI);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                maLoaiChi = rs.getInt("ma_loai_chi");
                tenLoaiChi = rs.getString("ten_loai_chi");
                loaiChis.add(new LoaiChi(maLoaiChi, tenLoaiChi));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return loaiChis;
    }

    @Override
    public void themMoiChiTieu(ChiTieu chiTieu) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = BaseRepository.getConnection();
            preparedStatement = connection.prepareStatement(THEM_MOI);
            preparedStatement.setString(1, chiTieu.getTenChiTieu());
            preparedStatement.setString(2, chiTieu.getNgayChi());
            preparedStatement.setDouble(3, chiTieu.getSoTienChi());
            preparedStatement.setInt(4, chiTieu.getMaLoaiChi());
            preparedStatement.setString(5, chiTieu.getMoTaThem());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void xoaChiTieu(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = BaseRepository.getConnection();
            preparedStatement = connection.prepareStatement(XOA_CHI_TIEU);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
