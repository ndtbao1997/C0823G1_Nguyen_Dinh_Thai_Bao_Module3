package com.example.apartment_complex_management.repository.apartment;

import com.example.apartment_complex_management.model.*;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    private static final String CALL_CONTRACT = "call hop_dong_dto();";
    private static final String SELECT_CONTRACT = "select * from hop_dong where is_delete = 0";
    private static final String FEEDBACK_CUSTOMER = "update khach_hang set is_delete = 0 where ma_khach_hang = ?;";

    private static final String SELECT_CONTRACT_BY_ID = "select * from hop_dong where is_delete = 0 and ma_hop_dong = ?";
    private static final String SELECT_ALL_CONTRACT = "select * from hop_dong";

    private static final String SELECT_ALL_STAFF = "select nhan_vien.ma_nhan_vien,nhan_vien.ho_ten,nhan_vien.so_cmnd\n" +
            "from nhan_vien where is_delete = 0;";
    private static final String SELECT_ALL_CUSTOMER = "select khach_hang.ma_khach_hang,khach_hang.ho_ten,khach_hang.so_cmnd\n" +
            "from khach_hang;";
    private static final String SELECT_ALL_APARTMENT = "select can_ho.ma_can_ho, can_ho.ten_can_ho, can_ho.chi_phi_thue from can_ho;";

    private static final String SELECT_ALL_APARTMENT_EMPTY = "select can_ho.ma_can_ho,can_ho.ten_can_ho\n" +
            "from can_ho where tinh_trang = 'Chưa cho thuê';";

    private static final String INSERT_CONTRACT = "call insert_contract(?,?,?,?,?,?)";
    private static final String DELETE_CONTRACT_BY_ID = "call delete_contract_by_id(?)";
    private static final String SORT_BY_DATE = "select * from hop_dong\n" +
            "where is_delete = 0\n" +
            "order by ngay_ket_thuc;";

    private static final String SEARCH_BY_NAME = "select * from khach_hang_hop_dong\n" +
            "where ho_ten like ?;";

    private static final String EXTEND_CONTRACT = "update hop_dong set ngay_ket_thuc = ? where ma_hop_dong = ?;";
    private static final String CHANGE_STATUS_APARTMENT = "call change_status_apartment(?)";
    private static final String GET_ID_CUSTOMER_BY_NAME = "select ma_khach_hang from khach_hang where ho_ten = ?";
    private static final String GET_ID_STAFF_BY_NAME = "select ma_nhan_vien from nhan_vien where ho_ten = ?";

    private static final String GET_ID_APARTMENT_BY_NAME = "select ma_can_ho from can_ho where ten_can_ho = ?";

    private static final String GET_DEPOSIT_BY_ID_APARTMENT = "select chi_phi_thue\n" +
            "from can_ho\n" +
            "where ma_can_ho = ?;";
    private static final String SELECT_VIEW_SCHEDULE = "call danh_sach_lich_xem_1;";


    @Override
    public List<Contract> showListContract() {
        Connection connection = BaseRepository.getConnection();
        List<Contract> contracts = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_CONTRACT);
            ResultSet resultSet = statement.executeQuery();
            int id;
            String contractDate;
            String contractEndDate;
            int deposit;
            int idCustomer;
            int idStaff;
            int idApartment;
            int isDeleted;
            while (resultSet.next()) {
                id = resultSet.getInt("ma_hop_dong");
                contractDate = resultSet.getString("ngay_lam_hop_dong");
                contractEndDate = resultSet.getString("ngay_ket_thuc");
                deposit = resultSet.getInt("tien_dat_coc");
                idCustomer = resultSet.getInt("ma_khach_hang");
                idStaff = resultSet.getInt("ma_nhan_vien");
                idApartment = resultSet.getInt("ma_can_ho");
                isDeleted = resultSet.getInt("is_delete");
                contracts.add(new Contract(id, contractDate, contractEndDate, deposit, idCustomer, idStaff, idApartment, isDeleted));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contracts;
    }

    @Override
    public List<Staff> getListStaff() {
        Connection connection = BaseRepository.getConnection();
        List<Staff> staff = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_STAFF);
            ResultSet resultSet = statement.executeQuery();
            int id;
            String name;
            String numberCMND;
            while (resultSet.next()) {
                id = resultSet.getInt("ma_nhan_vien");
                name = resultSet.getString("ho_ten");
                numberCMND = resultSet.getString("so_cmnd");
                staff.add(new Staff(id, name,numberCMND));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staff;
    }

    @Override
    public List<Customer> getListCustomer() {
        Connection connection = BaseRepository.getConnection();
        List<Customer> customers = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = statement.executeQuery();
            int id;
            String name;
            String numberCMND;
            while (resultSet.next()) {
                id = resultSet.getInt("ma_khach_hang");
                name = resultSet.getString("ho_ten");
                numberCMND = resultSet.getString("so_cmnd");
                customers.add(new Customer(id, name,numberCMND));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public void addContract(Contract contract) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement1 = connection.prepareStatement(FEEDBACK_CUSTOMER);
            preparedStatement1.setInt(1, contract.getIdCustomer());
            CallableStatement statement = connection.prepareCall(INSERT_CONTRACT);
            CallableStatement statement1 = connection.prepareCall(CHANGE_STATUS_APARTMENT);
            statement1.setInt(1, contract.getIdApartment());
            statement1.executeUpdate();
            statement.setString(1, contract.getContractDate());
            statement.setString(2, contract.getContractEndDate());
            statement.setInt(3, contract.getDeposit());
            statement.setInt(4, contract.getIdCustomer());
            statement.setInt(5, contract.getIdStaff());
            statement.setInt(6, contract.getIdApartment());
            statement.executeUpdate();
            preparedStatement1.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Apartment> getListApartment() {
        Connection connection = BaseRepository.getConnection();
        List<Apartment> apartments = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_APARTMENT);
            ResultSet resultSet = statement.executeQuery();
            int id;
            String name;
            Double rentalCost;
            while (resultSet.next()) {
                id = resultSet.getInt("ma_can_ho");
                name = resultSet.getString("ten_can_ho");
                rentalCost = resultSet.getDouble("chi_phi_thue");
                apartments.add(new Apartment(id, name, rentalCost));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return apartments;
    }

    @Override
    public void deleteContract(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement statement = connection.prepareCall(DELETE_CONTRACT_BY_ID);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Contract> showAllContract() {
        Connection connection = BaseRepository.getConnection();
        List<Contract> contracts = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_CONTRACT);
            ResultSet resultSet = statement.executeQuery();
            int id;
            String contractDate;
            String contractEndDate;
            int deposit;
            int idCustomer;
            int idStaff;
            int idApartment;
            int isDeleted;
            while (resultSet.next()) {
                id = resultSet.getInt("ma_hop_dong");
                contractDate = resultSet.getString("ngay_lam_hop_dong");
                contractEndDate = resultSet.getString("ngay_ket_thuc");
                deposit = resultSet.getInt("tien_dat_coc");
                idCustomer = resultSet.getInt("ma_khach_hang");
                idStaff = resultSet.getInt("ma_nhan_vien");
                idApartment = resultSet.getInt("ma_can_ho");
                isDeleted = resultSet.getInt("is_delete");
                contracts.add(new Contract(id, contractDate, contractEndDate, deposit, idCustomer, idStaff, idApartment, isDeleted));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contracts;
    }

    @Override
    public List<Contract> sortByDate() {
        Connection connection = BaseRepository.getConnection();
        List<Contract> contracts = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SORT_BY_DATE);
            ResultSet resultSet = statement.executeQuery();
            int id;
            String contractDate;
            String contractEndDate;
            int deposit;
            int idCustomer;
            int idStaff;
            int idApartment;
            int isDeleted;
            while (resultSet.next()) {
                id = resultSet.getInt("ma_hop_dong");
                contractDate = resultSet.getString("ngay_lam_hop_dong");
                contractEndDate = resultSet.getString("ngay_ket_thuc");
                deposit = resultSet.getInt("tien_dat_coc");
                idCustomer = resultSet.getInt("ma_khach_hang");
                idStaff = resultSet.getInt("ma_nhan_vien");
                idApartment = resultSet.getInt("ma_can_ho");
                isDeleted = resultSet.getInt("is_delete");
                contracts.add(new Contract(id, contractDate, contractEndDate, deposit, idCustomer, idStaff, idApartment, isDeleted));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contracts;
    }

    @Override
    public List<Contract> searchByName(String name) {
        Connection connection = BaseRepository.getConnection();
        List<Contract> contracts = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SEARCH_BY_NAME);
            statement.setString(1, "%" + name + "%");
            ResultSet resultSet = statement.executeQuery();
            int id;
            String contractDate;
            String contractEndDate;
            int deposit;
            int idCustomer;
            int idStaff;
            int idApartment;
            int isDeleted;
            while (resultSet.next()) {
                id = resultSet.getInt("ma_hop_dong");
                contractDate = resultSet.getString("ngay_lam_hop_dong");
                contractEndDate = resultSet.getString("ngay_ket_thuc");
                deposit = resultSet.getInt("tien_dat_coc");
                idCustomer = resultSet.getInt("ma_khach_hang");
                idStaff = resultSet.getInt("ma_nhan_vien");
                idApartment = resultSet.getInt("ma_can_ho");
                isDeleted = resultSet.getInt("is_delete");
                contracts.add(new Contract(id, contractDate, contractEndDate, deposit, idCustomer, idStaff, idApartment, isDeleted));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contracts;
    }

    @Override
    public Contract getContractById(int id) {
        Connection connection = BaseRepository.getConnection();
        Contract contract = null;
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_CONTRACT_BY_ID);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            String contractDate;
            String contractEndDate;
            int deposit;
            int idCustomer;
            int idStaff;
            int idApartment;
            int isDeleted;
            while (resultSet.next()) {
                contractDate = resultSet.getString("ngay_lam_hop_dong");
                contractEndDate = resultSet.getString("ngay_ket_thuc");
                deposit = resultSet.getInt("tien_dat_coc");
                idCustomer = resultSet.getInt("ma_khach_hang");
                idStaff = resultSet.getInt("ma_nhan_vien");
                idApartment = resultSet.getInt("ma_can_ho");
                isDeleted = resultSet.getInt("is_delete");
                contract = new Contract(id, contractDate, contractEndDate, deposit, idCustomer, idStaff, idApartment, isDeleted);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contract;
    }

    @Override
    public void contractExtension(int id, int month) {
        List<Contract> contracts = showAllContract();
        Contract contract = null;
        for (Contract contract1 : contracts) {
            if (contract1.getId() == id) {
                contract = contract1;
                break;
            }
        }
        assert contract != null;
        String[] end = contract.getContractEndDate().split("-");
        int num1 = Integer.parseInt(end[0]);
        int num2 = Integer.parseInt(end[1]);
        int num3 = num2 + month;
        if (num3 > 12) {
            num1++;
            num3 = num3 - 12;
        }
        String month1 = num1 + "-" + num3 + "-" + end[2];
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(EXTEND_CONTRACT);
            statement.setString(1, month1);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Apartment> getListApartmentEmpty() {
        Connection connection = BaseRepository.getConnection();
        List<Apartment> apartments = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_APARTMENT_EMPTY);
            ResultSet resultSet = statement.executeQuery();
            int id;
            String name;
            while (resultSet.next()) {
                id = resultSet.getInt("ma_can_ho");
                name = resultSet.getString("ten_can_ho");
                apartments.add(new Apartment(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return apartments;
    }

    @Override
    public int getIdCustomerByName(String nameCustomer) {
        Connection connection = BaseRepository.getConnection();
        int id = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(GET_ID_CUSTOMER_BY_NAME);
            statement.setString(1, "'" + nameCustomer + "'");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt("ma_khach_hang");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    @Override
    public int getIdStaffByName(String nameStaff) {
        Connection connection = BaseRepository.getConnection();
        int id = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(GET_ID_STAFF_BY_NAME);
            statement.setString(1, "'" + nameStaff + "'");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt("ma_nhan_vien");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    @Override
    public int getIdApartmentByName(String nameApartment) {
        Connection connection = BaseRepository.getConnection();
        int id = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(GET_ID_APARTMENT_BY_NAME);
            statement.setString(1, "'" + nameApartment + "'");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt("ma_can_ho");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    @Override
    public int getDeposit(int idApartment) {
        Connection connection = BaseRepository.getConnection();
        int deposit = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(GET_DEPOSIT_BY_ID_APARTMENT);
            statement.setInt(1, idApartment);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                deposit = resultSet.getInt("chi_phi_thue");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deposit;
    }

    @Override
    public List<ViewingScheduleDTO> selectViewSchedule(int idApartment) {
        Connection connection = null;
        CallableStatement callableStatement = null;
        List<ViewingScheduleDTO> viewingScheduleDTOS = new ArrayList<>();
        Integer id;
        String apartmentName;
        String customerName;
        String email;
        String viewDate;
        String[] arr1;
        String[] arr2;
        try {
            connection = BaseRepository.getConnection();
            callableStatement = connection.prepareCall(SELECT_VIEW_SCHEDULE);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                id = rs.getInt("ma_can_ho");
                apartmentName = rs.getString("ten_can_ho");
                customerName = rs.getString("ten_khach_hang");
                email = rs.getString("email");
                viewDate = rs.getString("ngay_xem_can_ho");
                if (id == idApartment) {
                    arr1 = String.valueOf(LocalDate.now()).split("-");
                    arr2 = viewDate.split("-");
                    if (Integer.parseInt(arr2[0]) > Integer.parseInt(arr1[0])) {
                        viewingScheduleDTOS.add(new ViewingScheduleDTO(apartmentName, customerName, email, viewDate));
                    } else if (Integer.parseInt(arr2[0]) == Integer.parseInt(arr1[0])) {
                        if (Integer.parseInt(arr2[1]) > Integer.parseInt(arr1[1])) {
                            viewingScheduleDTOS.add(new ViewingScheduleDTO(apartmentName, customerName, email, viewDate));
                        } else if (Integer.parseInt(arr2[1]) == Integer.parseInt(arr1[1])) {
                            if (Integer.parseInt(arr2[2]) > Integer.parseInt(arr1[2])) {
                                viewingScheduleDTOS.add(new ViewingScheduleDTO(apartmentName, customerName, email, viewDate));
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return viewingScheduleDTOS;
    }

    @Override
    public ContractDTO getContractDTO(int id) {
        Connection connection = null;
        CallableStatement callableStatement = null;
        String contractEndDate;
        String customerName;
        String apartment;
        String email;
        int code;
        try {
            connection = BaseRepository.getConnection();
            callableStatement = connection.prepareCall(CALL_CONTRACT);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                code = rs.getInt("ma_hop_dong");
                contractEndDate = rs.getString("ngay_ket_thuc");
                customerName = rs.getString("ho_ten");
                apartment = rs.getString("ten_can_ho");
                email = rs.getString("email");
                if (code == id) {
                    return new ContractDTO(contractEndDate, customerName, apartment, email);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}