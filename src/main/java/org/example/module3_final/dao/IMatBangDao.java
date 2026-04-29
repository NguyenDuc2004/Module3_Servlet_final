package org.example.module3_final.dao;

import org.example.module3_final.model.MatBang;
import java.util.List;

public interface IMatBangDao {
    List<MatBang> selectAll(String loai, String gia, String tang, String tuNgay, String denNgay);
    void insert(MatBang matBang);
    boolean delete(String id);
    // Kiểm tra trùng mã (Dùng cho validation server-side)
    boolean checkDuplicate(String id);
}