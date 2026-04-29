package org.example.module3_final.service;

import org.example.module3_final.dao.IMatBangDao;
import org.example.module3_final.dao.MatBangDaoImpl;
import org.example.module3_final.model.MatBang;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

public class MatBangService {
    private IMatBangDao dao = new MatBangDaoImpl();

    public List<MatBang> findAll(String loai, String gia, String tang, String tuNgay, String denNgay) {
        return dao.selectAll(loai, gia, tang, tuNgay, denNgay);
    }

    public boolean remove(String id) {
        return dao.delete(id);
    }

    public String add(MatBang mb) {
        // 1. Kiểm tra trùng mã mặt bằng
        if (dao.checkDuplicate(mb.getMaMatBang())) {
            return "Mã mặt bằng vừa thêm đã tồn tại";
        }

        // 2. Kiểm tra logic ngày: Ngày bắt đầu < Ngày kết thúc ít nhất 6 tháng
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate start = LocalDate.parse(mb.getNgayBatDau(), formatter);
            LocalDate end = LocalDate.parse(mb.getNgayKetThuc(), formatter);

            long monthsBetween = ChronoUnit.MONTHS.between(start, end);

            if (monthsBetween < 6) {
                return "Ngày bắt đầu phải nhỏ hơn ngày kết thúc ít nhất là 6 tháng.";
            }
        } catch (Exception e) {
            return "Định dạng ngày không hợp lệ.";
        }

        dao.insert(mb);
        return "success";
    }

    public boolean isIdExists(String id) {
        return dao.checkDuplicate(id);
    }
}