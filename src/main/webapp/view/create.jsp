<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm mới Mặt bằng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="col-md-8 mx-auto card shadow p-4">
        <h3 class="text-center text-success mb-4">THÊM MẶT BẰNG MỚI</h3>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <form action="/mat-bang?action=add" method="post" class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Mã mặt bằng (XXX-XX-XX)</label>
                <input type="text" name="maMatBang" class="form-control" required
                       pattern="[A-Z0-9]{3}-[A-Z0-9]{2}-[A-Z0-9]{2}"
                       value="${oldData.maMatBang}" title="Định dạng đúng: XXX-XX-XX">
            </div>

            <div class="col-md-6">
                <label class="form-label">Trạng thái</label>
                <select name="trangThai" class="form-select" required>
                    <option value="Trống">Trống</option>
                    <option value="Hạ tầng">Hạ tầng</option>
                    <option value="Đầy đủ">Đầy đủ</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Diện tích (m²)</label>
                <input type="number" step="0.1" name="dienTich" class="form-control"
                       min="20.1" required value="${oldData.dienTich}">
            </div>

            <div class="col-md-6">
                <label class="form-label">Tầng</label>
                <input type="number" name="tang" class="form-control"
                       min="1" max="15" required value="${oldData.tang}">
            </div>

            <div class="col-md-6">
                <label class="form-label">Loại mặt bằng</label>
                <select name="loaiMatBang" class="form-select" required>
                    <option value="Văn phòng chia sẻ">Văn phòng chia sẻ</option>
                    <option value="Văn phòng trọn gói">Văn phòng trọn gói</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Giá thuê (VNĐ)</label>
                <input type="number" name="giaTien" class="form-control"
                       min="1000001" required value="${oldData.giaTien}">
            </div>

            <div class="col-md-6">
                <label class="form-label">Ngày bắt đầu</label>
                <input type="date" name="ngayBatDau" class="form-control" required
                       value="${oldData.ngayBatDau}">
            </div>

            <div class="col-md-6">
                <label class="form-label">Ngày kết thúc</label>
                <input type="date" name="ngayKetThuc" class="form-control" required
                       value="${oldData.ngayKetThuc}">
            </div>

            <div class="col-12 text-center mt-4">
                <button type="submit" class="btn btn-success px-5">Lưu thông tin</button>
                <a href="/mat-bang" class="btn btn-secondary px-5">Hủy bỏ</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>