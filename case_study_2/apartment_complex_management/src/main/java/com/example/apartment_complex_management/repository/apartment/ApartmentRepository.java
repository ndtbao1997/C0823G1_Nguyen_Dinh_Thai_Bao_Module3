package com.example.apartment_complex_management.repository.apartment;

import com.example.apartment_complex_management.model.Apartment;
import com.example.apartment_complex_management.model.ApartmentDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class ApartmentRepository implements IApartmentRepository {
    private static final String CALL_GET_APARTMENT_BY_ID = "call get_apartment_by_id(?);";
    private final String SELECT_ALL_APARTMENT = "select * from can_ho where is_delete = 0;";
    private final String SELECT_APARTMENT_BY_ID = "select * from can_ho where is_delete = 0 and ma_can_ho = ?;";
    private final String CALL_LIST_APARTMENT = "call danh_sach_can_ho();";
    private final String EDIT_APARTMENT = "update can_ho set chi_phi_thue = ? where ma_can_ho = ? ;";
    private final String UPDATE_APARTMENT = "call update_apartment(?,?,?,?,?,?,?,?,?);";
    private final String SELECT_SCHEDULE = "select * from lich_xem;";
    @Override
    public List<Apartment> selectAllApartment() {
        List<Apartment> apartments = new ArrayList<>();
        Connection connection;
        PreparedStatement preparedStatement;
        Integer id;
        String name;
        Double acreage;
        Double rentalCosts;
        Integer maxPeople;
        String description;
        Integer idRentalType;
        Integer idApartmentType;
        Integer idFloors;
        String image;
        String status;
        Integer isDeleted;
        try {
            connection = BaseRepository.getConnection();
            preparedStatement = connection.prepareStatement(SELECT_ALL_APARTMENT);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                id = rs.getInt("ma_can_ho");
                name = rs.getString("ten_can_ho");
                acreage = rs.getDouble("dien_tich");
                rentalCosts = rs.getDouble("chi_phi_thue");
                maxPeople = rs.getInt("so_nguoi_toi_da");
                description = rs.getString("mo_ta_tien_nghi");
                idRentalType = rs.getInt("ma_kieu_thue");
                idApartmentType = rs.getInt("ma_loai_can_ho");
                idFloors = rs.getInt("ma_so_tang");
                image = rs.getString("hinh_anh");
                status = rs.getString("tinh_trang");
                isDeleted = rs.getInt("is_delete");
                apartments.add(new Apartment(id,name,acreage,rentalCosts,maxPeople,description,idRentalType,
                        idApartmentType,idFloors,image,status,isDeleted));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return apartments;
    }

    @Override
    public Apartment selectApartmentById(int id) {
        Connection connection;
        PreparedStatement preparedStatement;
        Apartment apartment = null;
        Integer id1;
        String name;
        Double acreage;
        Double rentalCosts;
        Integer maxPeople;
        String description;
        Integer idRentalType;
        Integer idApartmentType;
        Integer idFloors;
        String image;
        String status;
        Integer isDeleted;
        try{
            connection = BaseRepository.getConnection();
            preparedStatement = connection.prepareStatement(SELECT_APARTMENT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                id1 = rs.getInt("ma_can_ho");
                name = rs.getString("ten_can_ho");
                acreage = rs.getDouble("dien_tich");
                rentalCosts = rs.getDouble("chi_phi_thue");
                maxPeople = rs.getInt("so_nguoi_toi_da");
                description = rs.getString("mo_ta_tien_nghi");
                idRentalType = rs.getInt("ma_kieu_thue");
                idApartmentType = rs.getInt("ma_loai_can_ho");
                idFloors = rs.getInt("ma_so_tang");
                image = rs.getString("hinh_anh");
                status = rs.getString("tinh_trang");
                isDeleted = rs.getInt("is_delete");
                apartment = new Apartment(id1,name,acreage,rentalCosts,maxPeople,description,idRentalType,
                        idApartmentType,idFloors,image,status,isDeleted);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return apartment;
    }

    @Override
    public List<ApartmentDTO> selectListApartmentDTO() {
        List<ApartmentDTO> apartmentDTOS = new ArrayList<>();
        Connection connection = null;
        CallableStatement callableStatement = null;
        Integer id;
        String name;
        Double  acreage;
        Double rentalCosts;
        Integer maxPeople;
        String description;
        String apartmentType;
        String rentalType;
        Integer floors;
        String status;
        Integer isDeleted;
        try{
            connection = BaseRepository.getConnection();
            callableStatement = connection.prepareCall(CALL_LIST_APARTMENT);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()){
                id = rs.getInt("ma_can_ho");
                name = rs.getString("ten_can_ho");
                acreage = rs.getDouble("dien_tich");
                rentalCosts = rs.getDouble("chi_phi_thue");
                maxPeople = rs.getInt("so_nguoi_toi_da");
                description = rs.getString("mo_ta_tien_nghi");
                apartmentType = rs.getString("ten_loai_can_ho");
                rentalType = rs.getString("ten_kieu_thue");
                floors = rs.getInt("so_tang");
                status = rs.getString("tinh_trang");
                isDeleted = rs.getInt("is_delete");
                apartmentDTOS.add(new ApartmentDTO(id,name,acreage,rentalCosts,maxPeople,description,apartmentType,rentalType,floors,status,isDeleted));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return apartmentDTOS;
    }

    @Override
    public void editApartment(Integer id, Double rentalCost) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try{
            connection = BaseRepository.getConnection();
            preparedStatement = connection.prepareStatement(EDIT_APARTMENT);
            preparedStatement.setDouble(1,rentalCost);
            preparedStatement.setInt(2,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public ApartmentDTO selectApartmentDTOById(int id) {
        ApartmentDTO apartmentDTO = null;
        Connection connection = null;
        CallableStatement callableStatement = null;
        String name;
        Double  acreage;
        Double rentalCosts;
        Integer maxPeople;
        String description;
        String apartmentType;
        String rentalType;
        Integer floors;
        String status;
        Integer isDeleted;
        try{
            connection = BaseRepository.getConnection();
            callableStatement = connection.prepareCall(CALL_GET_APARTMENT_BY_ID);
            callableStatement.setInt(1,id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()){
                name = rs.getString("ten_can_ho");
                acreage = rs.getDouble("dien_tich");
                rentalCosts = rs.getDouble("chi_phi_thue");
                maxPeople = rs.getInt("so_nguoi_toi_da");
                description = rs.getString("mo_ta_tien_nghi");
                apartmentType = rs.getString("ten_loai_can_ho");
                rentalType = rs.getString("ten_kieu_thue");
                floors = rs.getInt("so_tang");
                status = rs.getString("tinh_trang");
                isDeleted = rs.getInt("is_delete");
                apartmentDTO = new ApartmentDTO(id,name,acreage,rentalCosts,maxPeople,description,apartmentType,rentalType,floors,status,isDeleted);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return apartmentDTO;
    }

    @Override
    public void editInfoApartment(Apartment apartment) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(UPDATE_APARTMENT);
            statement.setInt(1,apartment.getId());
            statement.setString(2,apartment.getName());
            statement.setDouble(3,apartment.getAcreage());
            statement.setDouble(4,apartment.getRentalCosts());
            statement.setInt(5,apartment.getMaxPeople());
            statement.setInt(6,apartment.getIdRentalType());
            statement.setInt(7,apartment.getIdApartmentType());
            statement.setInt(8,apartment.getIdFloors());
            statement.setString(9,apartment.getStatus());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int getCountSchedule() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int count = 0;
        try{
            connection = BaseRepository.getConnection();
            preparedStatement = connection.prepareStatement(SELECT_SCHEDULE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String status = rs.getString("tinh_trang");
                int is_delete = rs.getInt("is_delete");
                if (Objects.equals(status, "Chờ phản hồi") && is_delete == 0){
                    count++;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;
    }
}
