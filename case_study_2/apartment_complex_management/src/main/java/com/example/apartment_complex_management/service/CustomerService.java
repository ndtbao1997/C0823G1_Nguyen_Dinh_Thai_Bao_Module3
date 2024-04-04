package com.example.apartment_complex_management.service;

import com.example.apartment_complex_management.model.Account;
import com.example.apartment_complex_management.model.Customer;
import com.example.apartment_complex_management.model.CustomerDTO;
import com.example.apartment_complex_management.repository.apartment.CustomerRepository;
import com.example.apartment_complex_management.repository.apartment.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService {
    private final ICustomerRepository iCustomerRepository = new CustomerRepository();
    @Override
    public List<CustomerDTO> selectAllCustomerDTO() {
        return iCustomerRepository.selectAllCustomerDTO();
    }

    @Override
    public void editCustomer(Integer id, String address) {
        iCustomerRepository.editCustomer(id,address);
    }

    @Override
    public void removeCustomer(Integer id) {
        iCustomerRepository.removeCustomer(id);
    }

    @Override
    public void recoverCustomer(Integer id) {
        iCustomerRepository.recoverCustomer(id);
    }

    @Override
    public boolean checkNumberCMND(String numberCMND) {
        return iCustomerRepository.checkNumberCMND(numberCMND);
    }

    @Override
    public boolean checkNumberPhone(String numberPhone) {
        return iCustomerRepository.checkNumberPhone(numberPhone);
    }

    @Override
    public void addCustomer(Customer customer) {
        iCustomerRepository.addCustomer(customer);
    }

    @Override
    public List<Account> selectAccountCustomer() {
        return iCustomerRepository.selectAccountCustomer();
    }
}
