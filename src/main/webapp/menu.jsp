<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KMN COFFEE- Demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body { 
                background-color: #FDF5E6; 
                color: #4B3621; 
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .card { 
                border: 1px solid #D2B48C; 
                border-radius: 15px; 
                background-color: #FFFFFF; 
                transition: 0.3s;
            }
            .card-clickable {
                cursor: pointer;
                transition: all 0.3s ease;
            }
            .card-clickable:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            }
            .text-secondary { color: #6F4E37 !important; }
            .price { 
                color: #8B4513; 
                font-weight: bold; 
                font-size: 1.3rem; 
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center mb-5 text-secondary">☕ KMN COFFEE</h1>
            <div class="container mt-4 mb-4">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="input-group">
                <span class="input-group-text bg-white border-end-0">
                    <i class="bi bi-search"></i> </span>
                <input type="text" id="searchInput" class="form-control border-start-0 ps-0" 
                       placeholder="Nhập tên món cần tìm (ví dụ: Bơ, Cà phê...)" 
                       onkeyup="filterMenu()">
            </div>
        </div>
    </div>
</div>
            
            <div class="row">
              <c:forEach items="${data}" var="d">
    <div class="col-md-4 mb-4">
        <div class="card h-100 p-3 card-clickable" 
             data-desc="${d.description}" 
             onclick="showRecipe('${d.id}', '${d.name}', this)">
             
            <h5 class="fw-bold">${d.name}</h5>
            
            <div class="mt-auto">
                <span class="text-danger fw-bold">${d.price} VNĐ</span>
            </div>
        </div>
    </div>
</c:forEach>
            </div>
        </div>

        <div class="modal fade" id="recipeModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #6F4E37; color: white;">
                        <h5 class="modal-title" id="modalTitle">Tên món đồ uống</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
    <h6 class="fw-bold text-secondary">🌿 Định lượng chi tiết:</h6>
    <ul id="recipeDetailsList" class="list-group list-group-flush">
    </ul>
    <hr> <div class="mt-3">
    <h6 class="fw-bold text-secondary">📖 Cách thực hiện:</h6>
    <p id="recipeInstructions" class="ps-3 text-muted" style="font-style: italic; white-space: pre-line;">
        </p>
</div>
</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-dark mt-5" style="background-color: #4B3621;">
            <div class="container">
                <a class="navbar-brand fw-bold" href="#">☕ COFFEE MANAGEMENT</a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="menu">Quản lý Đồ uống</a></li>
                        <li class="nav-item"><a class="nav-link" href="nhanvien.jsp">Quản lý Nhân sự</a></li>
                        <li class="nav-item"><a class="nav-link" href="branch">Chi nhánh</a>
                    </ul>
                    <span class="navbar-text text-warning">Xin chào, Admin!</span>
                </div>
            </div>
        </nav>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        
       <script>
function showRecipe(pid, name, element) {
    // 1. Hiện tên món và Cách thực hiện ngay lập tức
    document.getElementById('modalTitle').innerText = "Công thức: " + name;
    let desc = element.getAttribute('data-desc');
    document.getElementById('recipeInstructions').innerText = desc ? desc : "Chưa có hướng dẫn pha chế.";

    // 2. Lấy định lượng từ SQL
    fetch('menu?pid='+ pid)
        .then(response => response.json())
        .then(data => {
            let listArea = document.getElementById('recipeDetailsList');
            listArea.innerHTML = ""; // Xóa dữ liệu cũ

            if (!data || data.length === 0) {
                listArea.innerHTML = '<li class="list-group-item text-muted">Chưa cập nhật định lượng</li>';
            } else {
                // Duyệt qua từng nguyên liệu để thêm vào danh sách
              data.forEach(item => {
    listArea.innerHTML += `
        <li class="list-group-item d-flex justify-content-between align-items-center">
            <span>` + item.ten + `</span> 
            <span class="badge rounded-pill" style="background-color: #6F4E37;">` + item.luong + `</span>
        </li>`;
});
            }
            
            // 3. Chỉ hiện Modal sau khi đã nạp xong dữ liệu
            var myModal = new bootstrap.Modal(document.getElementById('recipeModal'));
            myModal.show();
        })
        .catch(error => {
            console.error('Lỗi lấy dữ liệu:', error);
            alert("Không thể kết nối đến máy chủ để lấy định lượng!");
        });
} // Kết thúc hàm showRecipe

function filterMenu() {
    let input = document.getElementById('searchInput').value.toLowerCase();
    let cards = document.getElementsByClassName('col-md-4');

    for (let i = 0; i < cards.length; i++) {
        let name = cards[i].getElementsByTagName('h5')[0].innerText.toLowerCase();
        if (name.includes(input)) {
            cards[i].style.display = ""; 
        } else {
            cards[i].style.display = "none"; 
        }
    }
}
</script>
    </body>
</html>