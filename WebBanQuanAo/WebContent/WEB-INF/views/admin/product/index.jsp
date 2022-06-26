
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="clothes.utils.Constants"%>
<fmt:setLocale value="vi-VN" scope="session" />
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="<c:url value='/resources/styles/main_styles.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/styles/responsive.css' />" rel="stylesheet" />
	<title>YAME | quản lý sản phẩm</title>
<body style="display: inline-block; align-items: center; height: 100%; width: 100%;">
	<div class="container">
		<div class="col-3"></div>
		<div class=".col-sm-6">
			<%@include file="/WEB-INF/views/include/header.jsp"%>
			<br><br><br><br><br><br>
			<%@include file="/WEB-INF/views/include/sidebar_admin.jsp"%>
			<div>
			<div class="row">
				<div class="col"></div>
				<div class="col"></div>
				<div class="col"></div>
			</div>
		</div>
	</div>
			<div>
				<span class="float-start msg-success">${message}</span> <span
					class="float-start msg-fail">${msgError}</span> <span
					class="float-end"><a href="admin/product/add.htm"
					type="button" class="btn btn-primary rounded-pill mb-10 shadow"><i
						class="bi bi-plus-circle-fill"></i> Thêm sản phẩm</a></span>

			</div>
			<table class="shadow table table-hover">
				<thead class="indigo">
					<tr>
						<th class="btlr" scope="col">ID</th>
						<th scope="col">Tên sản phẩm</th>
						<th scope="col">Giá</th>
						<th scope="col">Danh mục</th>
						<th scope="col">Tình trạng</th>
						<th scope="col">Khuyến mãi</th>
						<th scope="col">Hiện/Ẩn</th>
						<th scope="col">Sửa</th>
						<th scope="col">Xóa</th>
						<th class="btrr" scope="col">Xem</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="f" items="${product}">
						<tr class="${f.status != 0 ? 'table-active' : '' }">
							<td scope="row">${f.productId}</td>
							<td>${f.productname}</td>
							<td><span class="ftag ftag-price"><fmt:formatNumber
										value="${f.price}" type="currency" currencySymbol="k"
										minFractionDigits="0" /></span></td>
							<td><span class="ftag ftag-teal">${f.category.categoryname}</span></td>
							<td><c:choose>
									<c:when test="${f.available == 0}">
										<span class="msg-success">Còn</span>
									</c:when>
									<c:otherwise>
										<span class="msg-fail">Hết</span>
									</c:otherwise>
								</c:choose></td>
							<td>${f.discount}%</td>
							<td>${f.status == 0 ? "Hiện" : "Ẩn"}</td>
							<td><a href="admin/product/edit.htm?id=${f.productId}"
								type="button" class="btn btn-primary "> <i
									class="bi bi-pencil-fill"></i></a></td>
							<td>
								<button type="button" class="btn btn-danger "
									onclick="confirm(${f.productId})">
									<i class="bi bi-x-lg"></i>
								</button>
							</td>
							<td><a href="product/${f.productId}.htm" type="button"
								class="btn btn-warning "><i
									class="bi bi-eye-fill"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- Modal -->
			<div id="confirmModel" class="modal fade hide" id="exampleModal"
				tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Xác nhận xóa sản phẩm ?</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div id="confirmBody" class="modal-body">
							Nếu sản phẩm đã được thêm vào giỏ của người dùng thì vẫn sẽ bị
							xóa. <br> Thao tác này không thể khôi phục. <br>Bạn
							chắc chắn chứ ?
						</div>
						<div class="modal-footer">
							<button id="btnCancel" type="button" class="btn btn-secondary">Hủy</button>
							<button id="btnConfirm" type="button" class="btn btn-primary">Xóa</button>
						</div>
					</div>
				</div>
			</div>
			<br />
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-end">
					<!-- First Page -->
					<li class="page-item ${page == 1 ? 'disabled' : '' }"><a
						class="page-link" href="admin/product.htm?page=1" tabindex="-1"
						aria-disabled="true">&laquo;</a></li>

					<!-- Page Number -->
					<c:forEach begin="${page-2<1 ? 1 : page-2}"
						end="${page+2 > maxPage ? maxPage : page+2}" varStatus="loop">
						<li class="page-item ${loop.count == page ? 'active' : '' }"><a
							class="page-link" href="admin/product.htm?page=${loop.count}">${loop.count}</a></li>
					</c:forEach>

					<!-- Last Page -->
					<li class="page-item ${page == maxPage ? 'disabled' : '' }"><a
						class="page-link" href="admin/product.htm?page=${maxPage}"
						tabindex="-1" aria-disabled="true">&raquo;</a></li>
				</ul>
			</nav>
		</div>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/js/bootstrap.min.js"></script>
	<script>
	var id = -1;	
	var confirm = function(productId){
		id = productId;
		console.log(productId);
		$('#confirmModel').modal('show');
		var str = "Thao tác này không thể khôi phục<br>Bạn chắc chắn muốn xóa chứ?";
		$('#confirmBody').html(str);	
	}
	$('#btnConfirm').on('click', function(event) {
		console.log("AA: "+id);
		window.location.href = "admin/product.htm?delete="+id;
	});
	$('#btnCancel').on('click', function(event) {
		$('#confirmModel').modal('hide');
	});
</script>
</body>

