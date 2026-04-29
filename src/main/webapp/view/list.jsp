<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Danh sách Mặt bằng - TComplex</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-4">
    <h2 class="text-center text-primary mb-4">QUẢN LÝ MẶT BẰNG TÒA NHÀ TCOMPLEX</h2>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <c:remove var="successMessage" scope="session" />
    </c:if>

    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <form action="/mat-bang" method="get" class="row g-3" id="searchForm" onsubmit="return validateDateRange()">
                <input type="hidden" name="action" value="list">
                <div class="col-md-3">
                    <label class="form-label">Loại mặt bằng</label>
                    <select name="searchLoai" class="form-select">
                        <option value="">-- Tất cả --</option>
                        <option value="Văn phòng chia sẻ" ${oldLoai == 'Văn phòng chia sẻ' ? 'selected' : ''}>Văn phòng chia sẻ</option>
                        <option value="Văn phòng trọn gói" ${oldLoai == 'Văn phòng trọn gói' ? 'selected' : ''}>Văn phòng trọn gói</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Giá tối đa (VNĐ)</label>
                    <input type="number" name="searchGia" class="form-control" value="${oldGia}">
                </div>
                <div class="col-md-3">
                    <label class="form-label">Tầng</label>
                    <input type="number" name="searchTang" class="form-control" value="${oldTang}">
                </div>
                <div class="col-md-3">
                    <label class="form-label">Từ ngày</label>
                    <input type="date" name="searchTuNgay" id="tuNgay" class="form-control" value="${oldTuNgay}">
                </div>
                <div class="col-md-3">
                    <label class="form-label">Đến ngày</label>
                    <input type="date" name="searchDenNgay" id="denNgay" class="form-control" value="${oldDenNgay}">
                </div>
                <div class="col-md-3 d-flex align-items-end gap-2">
                    <button type="submit" class="btn btn-primary flex-fill">Tìm kiếm</button>
                    <button type="button" onclick="resetForm()" class="btn btn-secondary flex-fill">Reset</button>
                </div>
            </form>
        </div>
    </div>

    <a href="/mat-bang?action=create" class="btn btn-success mb-3">+ Thêm mặt bằng mới</a>

    <table class="table table-bordered table-hover bg-white shadow-sm">
        <thead class="table-primary text-center">
        <tr>
            <th>Mã MB</th>
            <th>Trạng thái</th>
            <th>Diện tích (m²)</th>
            <th>Tầng</th>
            <th>Loại mặt bằng</th>
            <th>Giá thuê (VNĐ)</th>
            <th>Ngày bắt đầu</th>
            <th>Ngày kết thúc</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${dsMatBang}">
            <tr class="text-center">
                <td>${item.maMatBang}</td>
                <td><span class="badge ${item.trangThai == 'Trống' ? 'bg-success' : 'bg-warning'}">${item.trangThai}</span></td>
                <td>${item.dienTich}</td>
                <td>${item.tang}</td>
                <td>${item.loaiMatBang}</td>
                <td><fmt:formatNumber value="${item.giaTien}" type="number" groupingUsed="true" /></td>
                <td>${item.ngayBatDau}</td>
                <td>${item.ngayKetThuc}</td>
                <td>
                    <button onclick="confirmDelete('${item.maMatBang}')" class="btn btn-danger btn-sm">Xóa</button>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty dsMatBang}">
            <tr><td colspan="9" class="text-center">Không có dữ liệu phù hợp</td></tr>
        </c:if>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function validateDateRange() {
        const tuNgay = document.getElementById('tuNgay').value;
        const denNgay = document.getElementById('denNgay').value;

        // Nếu cả 2 đều có giá trị
        if (tuNgay && denNgay) {
            if (new Date(denNgay) < new Date(tuNgay)) {
                alert('Đến ngày phải lớn hơn hoặc bằng Từ ngày!');
                return false;
            }
        }

        // Nếu chỉ có 1 trong 2
        if ((tuNgay && !denNgay) || (!tuNgay && denNgay)) {
            alert('Vui lòng nhập đầy đủ cả Từ ngày và Đến ngày!');
            return false;
        }

        return true;
    }

    function resetForm() {
        window.location.href = "/mat-bang?action=list";
    }

    function confirmDelete(id) {
        if (confirm("Bạn có chắc chắn muốn xóa mặt bằng với mã số " + id + " không?")) {
            window.location.href = "/mat-bang?action=delete&id=" + id;
        }
    }
</script>
</body>
</html>