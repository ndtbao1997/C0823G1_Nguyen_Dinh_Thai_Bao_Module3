package com.example.apartment_complex_management.controller;

import com.example.apartment_complex_management.model.*;
import com.example.apartment_complex_management.service.ContractService;
import com.example.apartment_complex_management.service.IContractService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


@WebServlet(value = "/contract-servlet")
public class ContractServlet extends HttpServlet {
    private IContractService contractService;

    @Override
    public void init() throws ServletException {
        contractService = new ContractService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addContract":
                addContract(req, resp);
                break;
            case "search":
                searchByName(req, resp);
                break;
            case "extension":
                contractExtension(req, resp);
                break;
        }
    }

    private void contractExtension(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        int month = Integer.parseInt(req.getParameter("time"));
        contractService.contractExtension(id, month);
        RequestDispatcher dispatcher = req.getRequestDispatcher("contract/extension.jsp");
        Contract contract = contractService.getContractById(id);
        List<Staff> staff = contractService.getListStaff();
        List<Customer> customers = contractService.getListCustomer();
        List<Apartment> apartments = contractService.getListApartment();
        req.setAttribute("customer", customers);
        req.setAttribute("staff", staff);
        req.setAttribute("apartments", apartments);
        req.setAttribute("message1", "Gia hạn thành công hợp đồng có mã HĐ " + id + " thêm " + month + " tháng");
        req.setAttribute("contract", contract);
        senMail1(id);
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void senMail1(int id) {
        ContractDTO contractDTO = contractService.getContractDTO(id);
        String to = contractDTO.getEmail();
        String sub = "Thông báo về việc gia hạn căn hộ.";
        String meg = "<table>" +
                "  <tr>" +
                "    <td>Dear, " + contractDTO.getCustomerName() + "</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Chung cư Team 2 xin thông báo lịch xem nhà như sau:</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Bạn đã gia hạn thành công căn hộ " + contractDTO.getApartment() + "</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Thời hạn hợp đồng sau khi gia hạn là : " + contractDTO.getContractEndDate() + "</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Chúng tôi trân trọng cám ơn. Và rất hân hạnh được đón tiếp quý khách.</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Mọi thắc mắc xin liên hệ vào số điện thoại: 0903214562</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Hoặc phản hồi qua email này.</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Rất hân hạnh được đón tiếp! Trân trọng!</td>" +
                "  </tr>" +
                "</table>";
        Mailer.send(to, sub, meg);
    }

    private void searchByName(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        List<Contract> contracts = contractService.searchByName(name);
        List<Staff> staff = contractService.getListStaff();
        List<Customer> customers = contractService.getListCustomer();
        List<Apartment> apartments = contractService.getListApartment();
        RequestDispatcher dispatcher = req.getRequestDispatcher("contract/search.jsp");
        req.setAttribute("customer", customers);
        req.setAttribute("staff", staff);
        req.setAttribute("list", contracts);
        req.setAttribute("apartments", apartments);
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void addContract(HttpServletRequest req, HttpServletResponse resp) {
        String contractDate = String.valueOf(LocalDate.now());
        String contractEndDate = req.getParameter("contractEndDate");
        int idCustomer = Integer.parseInt(req.getParameter("customer"));
        int idStaff = Integer.parseInt(req.getParameter("staff"));
        int idApartment = Integer.parseInt(req.getParameter("apartment"));
        int deposit = contractService.getDeposit(idApartment);
        Contract contract = new Contract(contractDate, contractEndDate, deposit, idCustomer, idStaff, idApartment);
        contractService.addContract(contract);
        senMail(idApartment);
        List<Contract> contracts = contractService.showAllContract();
        List<Contract> contracts1 = new ArrayList<>();
        for (Contract contract2 : contracts) {
            if (contract2.getIsDeleted() == 0) {
                contracts1.add(contract2);
            }
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("contract/list-contract.jsp");
        req.setAttribute("message2", "Thêm hợp đồng thành công");
        List<Staff> staff = contractService.getListStaff();
        List<Customer> customers = contractService.getListCustomer();
        List<Apartment> apartments = contractService.getListApartmentEmpty();
        req.setAttribute("list", contracts1);
        req.setAttribute("customer", customers);
        req.setAttribute("staff", staff);
        req.setAttribute("apartments", apartments);
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void senMail(int idApartment) {
        List<ViewingScheduleDTO> viewingSchedules = contractService.selectViewSchedule(idApartment);
        for (ViewingScheduleDTO viewingScheduleDTO : viewingSchedules) {
            String to = viewingScheduleDTO.getEmail();
            String sub = "Thông báo thời gian xem căn hộ.";
            String meg = "<table>" +
                    "  <tr>" +
                    "    <td>Dear, " + viewingScheduleDTO.getCustomerName() + "</td>" +
                    "  </tr>" +
                    "  <tr>" +
                    "    <td>Chung cư Team 2 xin thông báo về việc gia hạn hợp đồng như sau:</td>" +
                    "  </tr>" +
                    "  <tr>" +
                    "    <td>Bạn có lịch xem căn hộ " + viewingScheduleDTO.getApartmentName() + "</td>" +
                    "  </tr>" +
                    "  <tr>" +
                    "    <td>Thời gian: " + viewingScheduleDTO.getViewDate() + "</td>" +
                    "  </tr>" +
                    "  <tr>" +
                    "    <td>Địa điểm: 298, Trần Hưng Đạo, Đà Nẵng</td>" +
                    "  </tr>" +
                    "  <tr>" +
                    "    <td>Nhưng hiện tại căn hộ này đã được thuê. Nếu bạn muốn xem căn hộ khác thì chúng tôi luôn luôn sẵn sàng đón tiếp.</td>" +
                    "  </tr>" +
                    "  <tr>" +
                    "    <td>Mọi thắc mắc xin liên hệ vào số điện thoại: 0903214562</td>" +
                    "  </tr>" +
                    "  <tr>" +
                    "    <td>Hoặc phản hồi qua email này.</td>" +
                    "  </tr>" +
                    "  <tr>" +
                    "    <td>Rất hân hạnh được đón tiếp! Trân trọng!</td>" +
                    "  </tr>" +
                    "</table>";
            Mailer.send(to, sub, meg);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "contract":
                showListContract(req, resp);
                break;
            case "addContract":
                showFordAddContract(req, resp);
                break;
            case "delete":
                deleteContract(req, resp);
                break;
            case "getAllContract":
                showAllContract(req, resp);
                break;
            case "sort":
                sortByDate(req, resp);
                break;
            case "search":
                showFormSearch(req, resp);
                break;
            case "extension":
                showFormDetailAndExtension(req, resp);
                break;
            case "getOldContract":
                showOldContract(req, resp);
                break;
            default:
                showListContract(req, resp);
        }
    }

    private void showOldContract(HttpServletRequest req, HttpServletResponse resp) {
        List<Contract> contracts = contractService.showAllContract();
        List<Contract> contracts1 = new ArrayList<>();
        for (Contract contract : contracts) {
            if (contract.getIsDeleted() == 1) {
                contracts1.add(contract);
            }
        }
        List<Staff> staff = contractService.getListStaff();
        List<Customer> customers = contractService.getListCustomer();
        List<Apartment> apartments = contractService.getListApartment();
        RequestDispatcher dispatcher = req.getRequestDispatcher("contract/list-contract.jsp");
        req.setAttribute("customer", customers);
        req.setAttribute("staff", staff);
        req.setAttribute("list", contracts1);
        req.setAttribute("apartments", apartments);
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormDetailAndExtension(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Contract contract = contractService.getContractById(id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("contract/extension.jsp");
        req.setAttribute("contract", contract);
        List<Staff> staff = contractService.getListStaff();
        List<Customer> customers = contractService.getListCustomer();
        List<Apartment> apartments = contractService.getListApartment();
        req.setAttribute("customer", customers);
        req.setAttribute("staff", staff);
        req.setAttribute("apartments", apartments);
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormSearch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("contract/search.jsp");
        dispatcher.forward(req, resp);
    }


    private void sortByDate(HttpServletRequest req, HttpServletResponse resp) {
        List<Contract> contracts = contractService.sortByDate();
        List<Staff> staff = contractService.getListStaff();
        List<Customer> customers = contractService.getListCustomer();
        List<Apartment> apartments = contractService.getListApartment();
        RequestDispatcher dispatcher = req.getRequestDispatcher("contract/list-contract.jsp");
        req.setAttribute("customer", customers);
        req.setAttribute("staff", staff);
        req.setAttribute("list", contracts);
        req.setAttribute("apartments", apartments);


        for (Staff staff1 : staff) {
            System.out.println(staff1.getId());
            System.out.println(staff1.getName());
        }
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAllContract(HttpServletRequest req, HttpServletResponse resp) {
        List<Contract> contracts = contractService.showAllContract();
        List<Contract> contracts1 = new ArrayList<>();
        for (Contract contract : contracts) {
            if (contract.getIsDeleted() == 0) {
                contracts1.add(contract);
            }
        }
        List<Staff> staff = contractService.getListStaff();
        List<Customer> customers = contractService.getListCustomer();
        List<Apartment> apartments = contractService.getListApartment();
        RequestDispatcher dispatcher = req.getRequestDispatcher("contract/list-contract.jsp");
        req.setAttribute("customer", customers);
        req.setAttribute("staff", staff);
        req.setAttribute("list", contracts1);
        req.setAttribute("apartments", apartments);
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteContract(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        contractService.deleteContract(id);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("contract/list-contract.jsp");
        List<Contract> contracts = contractService.showListContract();
        req.setAttribute("message", "Chấm dứt hợp đồng " + id + " thành công");
        req.setAttribute("list", contracts);
        senMail2(id);
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void senMail2(int id) {
        ContractDTO contractDTO = contractService.getContractDTO(id);
        String to = contractDTO.getEmail();
        String sub = "Thông báo về việc kết thúc hợp đồng thuê căn hộ.";
        String meg = "<table>" +
                "  <tr>" +
                "    <td>Dear, " + contractDTO.getCustomerName() + "</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Chung cư Team 2 xin thông báo về việc kết thúc hợp đồng thuê căn hộ như sau:</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Bạn và chúng tôi đã thống nhất về việc kết thúc hợp đồng thuê căn hộ " + contractDTO.getApartment() + "</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Chúng tôi trân trọng cám ơn bạn đã tin tưởng và sử dụng dịch vụ của chúng tôi trong thời gian vừa qua. Và rất hân hạnh được đón tiếp quý khách trong những lần sắp tới.</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Mọi thắc mắc xin liên hệ vào số điện thoại: 0903214562</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Hoặc phản hồi qua email này.</td>" +
                "  </tr>" +
                "  <tr>" +
                "    <td>Rất hân hạnh được đón tiếp! Trân trọng!</td>" +
                "  </tr>" +
                "</table>";
        Mailer.send(to, sub, meg);
    }

    private void showFordAddContract(HttpServletRequest req, HttpServletResponse resp) {
        List<Staff> staff = contractService.getListStaff();
        List<Customer> customers = contractService.getListCustomer();
        List<Apartment> apartments = contractService.getListApartmentEmpty();
        req.setAttribute("customer", customers);
        req.setAttribute("staff", staff);
        req.setAttribute("apartments", apartments);
        RequestDispatcher dispatcher = req.getRequestDispatcher("contract/add-contract.jsp");
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListContract(HttpServletRequest req, HttpServletResponse resp) {
        List<Contract> contracts = contractService.showListContract();
        List<Staff> staff = contractService.getListStaff();
        List<Customer> customers = contractService.getListCustomer();
        List<Apartment> apartments = contractService.getListApartment();
        RequestDispatcher dispatcher = req.getRequestDispatcher("contract/list-contract.jsp");
        req.setAttribute("customer", customers);
        req.setAttribute("staff", staff);
        req.setAttribute("list", contracts);
        req.setAttribute("apartments", apartments);

        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}