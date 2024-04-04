package com.example.apartment_complex_management.service;

import com.example.apartment_complex_management.model.Account;
import com.example.apartment_complex_management.model.Customer;
import com.example.apartment_complex_management.model.CustomerDTO;

import java.util.List;

public interface ICustomerService {
    List<CustomerDTO> selectAllCustomerDTO();

    void editCustomer(Integer id, String address);

    void removeCustomer(Integer id);

    void recoverCustomer(Integer id);

    boolean checkNumberCMND(String numberCMND);

    boolean checkNumberPhone(String numberPhone);

    void addCustomer(Customer customer);

    List<Account> selectAccountCustomer();
}
