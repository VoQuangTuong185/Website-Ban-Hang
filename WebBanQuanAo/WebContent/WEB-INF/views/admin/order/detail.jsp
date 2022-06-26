<%@ page language="java" pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ page import="clothes.utils.Constants"%>
	<fmt:setLocale value="vi-VN" scope="session" /> 
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="<c:url value='/resources/styles/main_styles.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/styles/responsive.css' />" rel="stylesheet" />
<title>YAME | xem chi tiết đơn hàng</title>
<body style="display: inline-block; align-items: center; height: 100%; width: 100%;">
<div class="container">
<div class="col-sm">	
		<br><br><br><br>
		<%@include file="/WEB-INF/views/include/sidebar_admin.jsp"%>
	<div>
			<table class="table table-hover" >
				<thead>
					<tr>
						<th scope="col">Tên sản phẩm</th>
						<th scope="col">Số lượng</th>
						<th scope="col">Đơn giá</th>
					</tr>
				</thead>
			<c:forEach var="o" items="${orderDetail}">
				<tbody>
					<tr>
						<td><p>${o.product.productname}</p>
						<td>
							<p>${o.quantity}</p>
						</td>
						<td><fmt:formatNumber value="${o.price}" type="currency"
								currencySymbol="k" minFractionDigits="0" /></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		
		<div>	
			<p id="P_1">
				Tổng tiền: <span id="SPAN_2"><b id="B_3"><fmt:formatNumber value="${total}" type="currency"
										currencySymbol="k" minFractionDigits="0" /></b></span>
			</p>
		</div>
		
		<div style="text-align: center;">
			<c:if test="${orderDetail[0].order.status == 1}"><a  class="btn btn-primary" href="admin/order/status.htm?ordersId=${orderDetail[0].order.ordersId}&status=2">Hoàn thành</a> </c:if>
			<c:if test="${orderDetail[0].order.status == 0}"><a  class="btn btn-primary" href="admin/order/status.htm?ordersId=${orderDetail[0].order.ordersId}&status=1">Xác nhận</a>
					      								<a  class="btn btn-danger" href="admin/order/status.htm?ordersId=${orderDetail[0].order.ordersId}&status=3">Hủy đơn</a> </c:if>
		</div>
	</div>
   </div>
</div>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>