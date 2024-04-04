package com.example.apartment_complex_management.model;

public class ContractDTO {
    private String contractEndDate;
    private String customerName;
    private String apartment;
    private String email;

    public ContractDTO(String contractEndDate, String customerName, String apartment, String email) {
        this.contractEndDate = contractEndDate;
        this.customerName = customerName;
        this.apartment = apartment;
        this.email = email;
    }

    public String getContractEndDate() {
        return contractEndDate;
    }

    public void setContractEndDate(String contractEndDate) {
        this.contractEndDate = contractEndDate;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getApartment() {
        return apartment;
    }

    public void setApartment(String apartment) {
        this.apartment = apartment;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
