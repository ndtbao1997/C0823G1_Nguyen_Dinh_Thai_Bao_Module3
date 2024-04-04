package com.example.thi_module_3.controller;

import com.example.thi_module_3.model.ChiTieu;
import com.example.thi_module_3.model.ChiTieuDTO;
import com.example.thi_module_3.model.LoaiChi;
import com.example.thi_module_3.service.ChiTieuService;
import com.example.thi_module_3.service.IChiTieuService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ChiTieuServlet",urlPatterns = "/chitieu-servlet")
public class ChiTieuServlet extends HttpServlet {
 private IChiTieuService iChiTieuService;

    @Override
    public void init() throws ServletException {
        iChiTieuService = new ChiTieuService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "themMoi":
                themMoiChiTieu(req,resp);
                break;
            default:
                danhSachChiTieu(req,resp);
                break;
        }
    }

    private void themMoiChiTieu(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       List<LoaiChi> loaiChis = iChiTieuService.danhSachLoaiChi();
       RequestDispatcher requestDispatcher = req.getRequestDispatcher("them-moi-chi-tieu.jsp");
       req.setAttribute("loaiChis",loaiChis);
       requestDispatcher.forward(req,resp);
    }

    private void danhSachChiTieu(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ChiTieuDTO> chiTieuDTOS = iChiTieuService.danhSachChiTieuDTO();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("danh-sach-chi-tieu.jsp");
        req.setAttribute("chiTieuDTOS",chiTieuDTOS);
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "themMoi":
                themMoi(req,resp);
                break;
            case "xoaChiTieu":
                xoaChiTieu(req,resp);
                break;
        }
    }

    private void xoaChiTieu(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        iChiTieuService.xoaChiTieu(id);
        List<ChiTieuDTO> chiTieuDTOS = iChiTieuService.danhSachChiTieuDTO();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("danh-sach-chi-tieu.jsp");
        req.setAttribute("chiTieuDTOS",chiTieuDTOS);
        req.setAttribute("message","aaa");
        requestDispatcher.forward(req,resp);
    }

    private void themMoi(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String date = req.getParameter("date");
        double soTienChi = Double.parseDouble(req.getParameter("soTienChi"));
        int loaiChi = Integer.parseInt(req.getParameter("loaiChi"));
        String moTa = req.getParameter("moTa");
        if (name == ""){
            String m1 = "Vui lòng không để trống";
            req.setAttribute("m1",m1);
        }
        if (moTa == ""){
            String m2 = "Vui lòng không để trống";
            req.setAttribute("m2",m2);
        }
        if (date == ""){
            String m3 = "Vui lòng chọn ngày";
            req.setAttribute("m3",m3);
        }

        RequestDispatcher requestDispatcher;
        if ((name == "") || (moTa == "")){
            requestDispatcher = req.getRequestDispatcher("them-moi-chi-tieu.jsp");
            List<LoaiChi> loaiChis = iChiTieuService.danhSachLoaiChi();
            req.setAttribute("loaiChis",loaiChis);
        } else {
            requestDispatcher = req.getRequestDispatcher("danh-sach-chi-tieu.jsp");
            ChiTieu chiTieu = new ChiTieu(name,date,soTienChi,loaiChi,moTa);
            iChiTieuService.themMoiChiTieu(chiTieu);
            List<ChiTieuDTO> chiTieuDTOS = iChiTieuService.danhSachChiTieuDTO();
            req.setAttribute("chiTieuDTOS",chiTieuDTOS);
            req.setAttribute("message", "aaa");
        }
        requestDispatcher.forward(req,resp);
    }
}
