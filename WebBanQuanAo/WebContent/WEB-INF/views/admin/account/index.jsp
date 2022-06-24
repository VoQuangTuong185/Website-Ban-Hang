<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="clothes.utils.Constants"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
<link
	href="<c:url value='/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css' />"
	rel="stylesheet">
<link
	href="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/animate.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/styles/main_styles.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/styles/responsive.css' />"
	rel="stylesheet">
<title>YAME | quản lý tài khoản - mở</title>
<body style="display: inline-block; align-items: center; height: 100%; width: 100%;">
	<div class="container">
		<div class="col-3"></div>
		<div class=".col-sm-6">
			<%@include file="/WEB-INF/views/include/header.jsp"%>
			<br><br><br><br><br><br>
			<%@include file="/WEB-INF/views/include/sidebar_admin.jsp"%>
			<div>
				<span class="float-start msg-success">${message}</span> <span
					class="float-start msg-fail">${msgError}</span> <span
					class="float-end"><a href="admin/account/locked.htm"
					type="button" class="btn btn-primary rounded-pill mb-10 shadow">Xem
						danh sách tài khoản bị khóa</a></span>

			</div>

			<table class="shadow table table-hover">
				<thead class="indigo">
					<tr>
						<th class="btlr" scope="col">ID</th>
						<th scope="col">Tên</th>
						<th scope="col">Email</th>
						<th scope="col">SĐT</th>
						<th scope="col">Trạng thái</th>
						<th class="btrr" scope="col">Hành động</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="a" items="${accounts}">
						<tr>
							<td scope="row"><b>${a.accountId}</b></td>
							<td><b>${a.fullname}</b></td>
							<td><i>${a.email}</i></td>
							<td>${a.phone}</td>
							<td><c:choose>
									<c:when test="${a.status == 0}">
										<span class="msg-success">Hoạt động</span>
									</c:when>
									<c:otherwise>
										<span class="msg-fail">Khóa</span>
									</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${a.status==0}">
										<button type="button"
											class="btn btn-danger btn-sm rounded-pill"
											onclick="confirm(${a.accountId})">
											<i class="bi bi-lock-fill"></i>
										</button>
									</c:when>
									<c:otherwise>
										<a href="admin/account/unlock.htm?id=${a.accountId}"
											class="btn btn-success btn-sm rounded-pill"> <i
											class="bi bi-unlock-fill"></i>
										</a>
									</c:otherwise>
								</c:choose></td>
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
							<h5 class="modal-title" id="exampleModalLabel">Xác nhận khóa
								tài khoản</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div id="confirmBody" class="modal-body"></div>
						<div class="modal-footer">
							<button id="btnCancel" type="button" class="btn btn-secondary">Hủy</button>
							<button id="btnConfirm" type="button" class="btn btn-danger">Khóa</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<br />
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-end">
				<!-- First Page -->
				<li class="page-item ${page == 1 ? 'disabled' : '' }"><a
					class="page-link" href="admin/account.htm?page=1" tabindex="-1"
					aria-disabled="true">&laquo;</a></li>

				<!-- Page Number -->
				<c:forEach begin="${page-2<1 ? 1 : page-2}"
					end="${page+2 > maxPage ? maxPage : page+2}" varStatus="loop">
					<li class="page-item ${loop.count == page ? 'active' : '' }"><a
						class="page-link" href="admin/account.htm?page=${loop.count}">${loop.count}</a></li>
				</c:forEach>

				<!-- Last Page -->
				<li class="page-item ${page == maxPage ? 'disabled' : '' }"><a
					class="page-link" href="admin/account.htm?page=${maxPage}"
					tabindex="-1" aria-disabled="true">&raquo;</a></li>
			</ul>
		</nav>
	</div>

	<script type="text/javascript"
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/js/bootstrap.min.js"></script>
	<script>
	var id = -1;	
	var confirm = function(accountId){
		id = accountId;
		console.log(accountId);
		$('#confirmModel').modal('show');
		var str = "Người dùng khi bị khóa sẽ không thể sử dụng website của bạn. Bạn chắc chắn chứ?";
		$('#confirmBody').html(str);	
	}
	$('#btnConfirm').on('click', function(event) {
		window.location.href = "admin/account/lock.htm?id="+id;
	});
	$('#btnCancel').on('click', function(event) {
		$('#confirmModel').modal('hide');
	});
</script>
</body>