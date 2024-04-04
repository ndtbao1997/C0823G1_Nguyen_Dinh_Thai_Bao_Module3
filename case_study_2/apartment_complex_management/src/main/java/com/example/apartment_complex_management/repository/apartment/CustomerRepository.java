package com.example.apartment_complex_management.repository.apartment;

import com.example.apartment_complex_management.model.Account;
import com.example.apartment_complex_management.model.Customer;
import com.example.apartment_complex_management.model.CustomerDTO;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class CustomerRepository implements ICustomerRepository{
    private final String CALL_LIST_ACCOUNT = "call danh_sach_tai_khoan();";
    private final String CALL_All_CUSTOMER_DTO = "call danh_sach_khach_hang();";
    private final String EDIT_CUSTOMER = "update khach_hang set dia_chi = ? where ma_khach_hang = ?;";
    private final String CALL_REMOVE_CUSTOMER = "call xoa_khach_hang(?);";
    private final String CALL_RECOVER_CUSTOMER = "call phuc_hoi_khach_hang(?);";
    private final String LIST_CUSTOMER = "call danh_sach_khach_hang_1();";

    private final String INSERT_CUSTOMER = "insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_tai_khoan,is_delete) values(?,?,?,?,?,?,?,?,?);";
    @Override
    public List<CustomerDTO> selectAllCustomerDTO() {
        List<CustomerDTO> customerDTOS = new ArrayList<>();
        Connection connection = null;
        CallableStatement callableStatement = null;
        Integer id;
        String name;
        String dateOfBirth;
        Integer gender;
        String numberCMND;
        String numberPhone;
        String email;
        String address;
        String account;
        Integer isDeleted;
        try {
            connection = BaseRepository.getConnection();
            callableStatement = connection.prepareCall(CALL_All_CUSTOMER_DTO);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                id = rs.getInt("ma_khach_hang");
                name = rs.getString("ho_ten");
                dateOfBirth = rs.getString("ngay_sinh");
                gender = rs.getInt("gioi_tinh");
                numberCMND = rs.getString("so_cmnd");
                numberPhone = rs.getString("so_dien_thoai");
                email = rs.getString("email");
                address = rs.getString("dia_chi");
                account = rs.getString("ten_tai_khoan");
                isDeleted = rs.getInt("is_delete");
                customerDTOS.add(new CustomerDTO(id, name, dateOfBirth, gender, numberCMND, numberPhone, email, address, account, isDeleted));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerDTOS;
    }

    @Override
    public void editCustomer(Integer id, String address) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = BaseRepository.getConnection();
            preparedStatement = connection.prepareStatement(EDIT_CUSTOMER);
            preparedStatement.setString(1, address);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void removeCustomer(Integer id) {
        Connection connection = null;
        CallableStatement callableStatement = null;
        try {
            connection = BaseRepository.getConnection();
            callableStatement = connection.prepareCall(CALL_REMOVE_CUSTOMER);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void recoverCustomer(Integer id) {
        Connection connection = null;
        CallableStatement callableStatement = null;
        try {
            connection = BaseRepository.getConnection();
            callableStatement = connection.prepareCall(CALL_RECOVER_CUSTOMER);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean checkNumberCMND(String numberCMND) {
        List<Customer> list = showListCustomer();
        for (Customer customer : list) {
            if (Objects.equals(customer.getNumberCMND(), numberCMND)) {
                return true;
            }
        }
        return false;
    }
    @Override
    public List<Customer> showListCustomer() {
        List<Customer> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(LIST_CUSTOMER);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("ma_khach_hang");
                String name = resultSet.getString("ho_ten");
                String dateOfBirth = resultSet.getString("ngay_sinh");
                int gender = resultSet.getInt("gioi_tinh");
                String numberCMND = resultSet.getString("so_cmnd");
                String numberPhone = resultSet.getString("so_dien_thoai");
                String email = resultSet.getString("email");
                String address = resultSet.getString("dia_chi");
                int idAccount = resultSet.getInt("ma_tai_khoan");
                int isDelete = resultSet.getInt("is_delete");
                list.add(new Customer(id, name, dateOfBirth, gender, numberCMND, numberPhone, email, address, idAccount, isDelete));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
                assert callableStatement != null;
                callableStatement.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    @Override
    public boolean checkNumberPhone(String numberPhone) {
        List<Customer> list = showListCustomer();
        for (Customer customer : list) {
            if (Objects.equals(customer.getNumberPhone(), numberPhone)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void addCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);

            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getDateOfBirth());
            preparedStatement.setInt(3, customer.getGender());
            preparedStatement.setString(4, customer.getNumberCMND());
            preparedStatement.setString(5, customer.getNumberPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getIdAccount());
            preparedStatement.setInt(9, customer.getIsDeleted());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public List<Account> selectAccountCustomer() {
        List<Account> accounts = new ArrayList<>();
        Connection connection = null;
        CallableStatement callableStatement = null;
        Integer id;
        String accountName;
        String password;
        Integer idAccountType;
        Integer isDeleted;
        try {
            connection = BaseRepository.getConnection();
            callableStatement = connection.prepareCall(CALL_LIST_ACCOUNT);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                id = rs.getInt("ma_tai_khoan");
                accountName = rs.getString("ten_tai_khoan");
                password = rs.getString("mat_khau");
                idAccountType = rs.getInt("ma_loai_tai_khoan");
                isDeleted = rs.getInt("is_delete");
                if (idAccountType == 1){
                    accounts.add(new Account(id, accountName, password, idAccountType, isDeleted));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return accounts;
    }
}
