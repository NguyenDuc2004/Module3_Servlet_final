package org.example.module3_final.dao;

import org.example.module3_final.dbConnection.DbConnection;
import org.example.module3_final.model.MatBang;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MatBangDaoImpl implements IMatBangDao {

    @Override
    public List<MatBang> selectAll(String loai, String gia, String tang, String tuNgay, String denNgay) {
        List<MatBang> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM matbang WHERE loai_mat_bang LIKE ? " +
                     "AND gia_tien <= ? AND CAST(tang AS CHAR) LIKE ?");

        // Thêm điều kiện tìm kiếm theo ngày nếu có
        if (tuNgay != null && !tuNgay.isEmpty() && denNgay != null && !denNgay.isEmpty()) {
            sql.append(" AND ngay_bat_dau >= ? AND ngay_ket_thuc <= ?");
        }

        sql.append(" ORDER BY dien_tich ASC");

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            ps.setString(1, (loai == null || loai.isEmpty()) ? "%" : "%" + loai + "%");
            ps.setDouble(2, (gia == null || gia.isEmpty()) ? Double.MAX_VALUE : Double.parseDouble(gia));
            ps.setString(3, (tang == null || tang.isEmpty()) ? "%" : tang);

            // Set giá trị cho tham số ngày nếu có
            if (tuNgay != null && !tuNgay.isEmpty() && denNgay != null && !denNgay.isEmpty()) {
                ps.setString(4, tuNgay);
                ps.setString(5, denNgay);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new MatBang(
                    rs.getString("ma_mat_bang"), rs.getString("trang_thai"),
                    rs.getDouble("dien_tich"), rs.getInt("tang"),
                    rs.getString("loai_mat_bang"), rs.getDouble("gia_tien"),
                    rs.getString("ngay_bat_dau"), rs.getString("ngay_ket_thuc")
                ));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    @Override
    public void insert(MatBang mb) {
        String sql = "INSERT INTO matbang VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, mb.getMaMatBang());
            ps.setString(2, mb.getTrangThai());
            ps.setDouble(3, mb.getDienTich());
            ps.setInt(4, mb.getTang());
            ps.setString(5, mb.getLoaiMatBang());
            ps.setDouble(6, mb.getGiaTien());
            ps.setString(7, mb.getNgayBatDau());
            ps.setString(8, mb.getNgayKetThuc());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM matbang WHERE ma_mat_bang = ?";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    @Override
    public boolean checkDuplicate(String id) {
        String sql = "SELECT ma_mat_bang FROM matbang WHERE ma_mat_bang = ?";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
}