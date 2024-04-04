package com.example.apartment_complex_management.service;

import com.example.apartment_complex_management.model.Apartment;
import com.example.apartment_complex_management.model.ApartmentDTO;
import com.example.apartment_complex_management.repository.apartment.ApartmentRepository;
import com.example.apartment_complex_management.repository.apartment.IApartmentRepository;

import java.util.List;

public class ApartmentService implements IApartmentService{
    private final IApartmentRepository iApartmentRepository= new ApartmentRepository();
    @Override
    public List<Apartment> selectAllApartment() {
        return iApartmentRepository.selectAllApartment();
    }

    @Override
    public Apartment selectApartmentById(int id) {
        return iApartmentRepository.selectApartmentById(id);
    }

    @Override
    public List<ApartmentDTO> selectListApartmentDTO() {
        return iApartmentRepository.selectListApartmentDTO();
    }

    @Override
    public void editApartment(Integer id, Double rentalCost) {
        iApartmentRepository.editApartment(id,rentalCost);
    }

    @Override
    public ApartmentDTO selectApartmentDTOById(int id) {
        return iApartmentRepository.selectApartmentDTOById(id);
    }

    @Override
    public void editInfoApartment(Apartment apartment) {
        iApartmentRepository.editInfoApartment(apartment);
    }

    @Override
    public int getCountSchedule() {
        return iApartmentRepository.getCountSchedule();
    }
}
