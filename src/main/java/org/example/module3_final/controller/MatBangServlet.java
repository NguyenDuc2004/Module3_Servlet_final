package org.example.module3_final.controller;

import org.example.module3_final.model.MatBang;
import org.example.module3_final.service.MatBangService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MatBangServlet", value = "/mat-bang")
public class MatBangServlet extends HttpServlet {
    private MatBangService service = new MatBangService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                showList(request, response);
                break;
            case "create":
                request.getRequestDispatcher("/view/create.jsp").forward(request, response);
                break;
            case "delete":
                deleteMatBang(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addMatBang(request, response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loai = request.getParameter("searchLoai");
        String gia = request.getParameter("searchGia");
        String tang = request.getParameter("searchTang");
        String tuNgay = request.getParameter("searchTuNgay");
        String denNgay = request.getParameter("searchDenNgay");

        List<MatBang> list = service.findAll(loai, gia, tang, tuNgay, denNgay);
        request.setAttribute("dsMatBang", list);
        request.setAttribute("oldLoai", loai);
        request.setAttribute("oldGia", gia);
        request.setAttribute("oldTang", tang);
        request.setAttribute("oldTuNgay", tuNgay);
        request.setAttribute("oldDenNgay", denNgay);

        request.getRequestDispatcher("/view/list.jsp").forward(request, response);
    }

    // Yêu cầu 1: Thêm mới & Validation Server-side
    private void addMatBang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ma = request.getParameter("maMatBang");
        String trangThai = request.getParameter("trangThai");
        double dienTich = Double.parseDouble(request.getParameter("dienTich"));
        int tang = Integer.parseInt(request.getParameter("tang"));
        String loai = request.getParameter("loaiMatBang");
        double gia = Double.parseDouble(request.getParameter("giaTien"));
        String batDau = request.getParameter("ngayBatDau");
        String ketThuc = request.getParameter("ngayKetThuc");

        MatBang mb = new MatBang(ma, trangThai, dienTich, tang, loai, gia, batDau, ketThuc);

        String result = service.add(mb);

        if (result.equals("success")) {
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Thêm mặt bằng thành công!");
            response.sendRedirect("/mat-bang?action=list");
        } else {

            request.setAttribute("error", result);
            request.setAttribute("oldData", mb);
            request.getRequestDispatcher("/view/create.jsp").forward(request, response);
        }
    }


    private void deleteMatBang(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        service.remove(id);
        HttpSession session = request.getSession();
        session.setAttribute("successMessage", "Xóa mặt bằng thành công!");
        response.sendRedirect("/mat-bang?action=list");
    }
}