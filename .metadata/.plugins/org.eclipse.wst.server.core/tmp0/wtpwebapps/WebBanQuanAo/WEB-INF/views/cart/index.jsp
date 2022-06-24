<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="clothes.utils.Constants"%>
	<fmt:setLocale value="vi-VN" scope="session" />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/animate.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/styles/main_styles.css' />"
	rel="stylesheet">
<title>YAME | giỏ hàng</title>
<body
	style="display: inline-block; align-items: center; height: 100%; width: 100%;">
	<br><br><br><br><br><br>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="row ml-3">
		<div class="col-3"></div>
		<div class=".col-sm-6">
			<c:choose>
				<c:when test="${cart.isEmpty() ==  true}">
					<div id="H1_1">
						<h1>Giỏ hàng trống</h1>
						<a href="home.htm">Thêm sản phẩm</a>
					</div>
				</c:when>
				<c:when test="${cart.isEmpty() ==  false}">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">Tên sản phẩm</th>
								<th scope="col">Số lượng</th>
								<th scope="col">Đơn giá</th>
								<th scope="col">Thao tác</th>
							</tr>
						</thead>
						<c:forEach var="c" items="${cart}">
							<tbody>
								<tr>
									<td>${c.product.productname}</td>
									<td>
										<div>
											<c:if test="${c.quantity > 1}">
												<a id="BUTTON_2" type="button"
													href="cart/sl/minus.htm?id_product=${c.product.productId}&sl=${c.quantity}">-</a>
											</c:if>
											<c:if test="${c.quantity == 1}">
												<a class="disabled" id="BUTTON_2" type="button"
													href="cart/sl/minus.htm?id_product=${c.product.productId}&sl=${c.quantity}">-</a>
											</c:if>
											<label id="INPUT_3">${c.quantity}</label> <a id="BUTTON_4"
												type="button"
												href="cart/sl/plus.htm?id_product=${c.product.productId}&sl=${c.quantity}">+</a>
										</div>
									</td>
									<td><fmt:formatNumber
											value="${c.product.price-(c.product.price*((c.product.discount)/100))}"
											type="currency" currencySymbol="k" minFractionDigits="0" /></td>
									<td><a type="button" class="btn btn-danger"
										data-bs-toggle="modal" data-bs-target="#exampleModal">Xóa</a>
									</td>
								</tr>
							</tbody>
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Xác nhận</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Bạn chắc chắn muốn xóa sản phẩm
											khỏi giỏ hàng không?</div>
										<div class="modal-footer">
											<a type="button" class="btn btn-danger"
												href="cart/delete/${c.product.productId}.htm">Đồng ý</a>
											<button type="button" class="btn btn-primary"
												data-bs-dismiss="modal">Hủy</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</table>
					<div>
						<p id="P_1">
							Tổng tiền: <span id="SPAN_2"><b id="B_3"><fmt:formatNumber
										value="${total}" type="currency" currencySymbol="k"
										minFractionDigits="0" /></b></span>
						</p>
					</div>
					<div></div>
					<div style="text-align: center;">
						<a class="btn btn-primary" href="cart/checkout.htm">Thanh toán</a>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
	<script src="<c:url value='/resources/css_cart/bootstrap.min.js' />"></script>
	<script type="text/javascript"
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<br><br><br><br><br>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>