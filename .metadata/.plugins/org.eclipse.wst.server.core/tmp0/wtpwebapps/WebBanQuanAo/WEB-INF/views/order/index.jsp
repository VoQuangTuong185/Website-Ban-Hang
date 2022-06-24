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
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<title>YAME | đơn hàng của tôi</title>
<body
	style="display: inline-block; align-items: center; height: 100%; width: 100%;">
		<br><br><br><br><br><br>
	<div class="row ml-3">
		<div class="col-3">	
		</div>
	<div class=".col-sm-6">
	<%@include file="/WEB-INF/views/include/header.jsp"%>
		<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<c:url value="order/" var="pagedLink">
			<c:param name="p" value="~" />
		</c:url>
		<c:choose>
			<c:when test="${pagedListHolder.pageList.isEmpty() == true }">
				<h1>Đơn hàng trống.</h1>
			</c:when>
			<c:when test="${pagedListHolder.pageList.isEmpty() == false }">
				<div>
					<tg:paging pagedListHolder="${pagedListHolder}"
						pagedLink="${pagedLink}" />
				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Mã đơn hàng</th>
							<th scope="col">Địa chỉ</th>
							<th scope="col">Thời gian đặt</th>
							<th scope="col">Trạng thái</th>
							<th scope="col">Thao tác</th>
							<th scope="col">Thông tin</th>
						</tr>
					</thead>
					<c:forEach var="o" items="${pagedListHolder.pageList}">
						<tbody>
							<tr>
								<th scope="row">${o.ordersId}</th>

								<td>${o.account.address}</td>
								<td><fmt:formatDate pattern="dd/MM/yyyy - HH:mm"
										value="${o.orderTime}" /></td>
								<td><c:if test="${o.status == 2}"><p style="color: blue;">Đã hoàn thành</p>
								</c:if> <c:if test="${o.status == 1}"><p style="color: green;">Đang giao</p>
								</c:if> <c:if test="${o.status == 0}"><p style="color: violet;">Chờ xác nhận</p>
								</c:if><c:if test="${o.status == 3}"><p style="color: red;">Đã huỷ</p>
								</c:if></td>
							<td>
								<c:if test="${o.status == 0}">
									<a class="btn btn-danger"
										href="order/status.htm?ordersId=${o.ordersId}&status=3">Hủy đơn</a>
								</c:if></td>
							<td><a class="btn"
								href="order/detail/${o.ordersId}.htm" style="color: blue;">Chi tiết</a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
								<div style="text-align: center;">
					<a class="btn btn-primary" href="home.htm">Quay lại</a>
						</div>
				<div>
					<tg:paging pagedListHolder="${pagedListHolder}"
						pagedLink="${pagedLink}" />
				</div>
			</c:when>
		</c:choose>
		</div>
	</div>
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>
<link rel="stylesheet prefetch"
	href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
			<br><br><br><br><br>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>