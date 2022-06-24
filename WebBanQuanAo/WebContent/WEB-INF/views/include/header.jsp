<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="clothes.utils.Constants"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}
</style>
<meta charset='utf-8'>
<base href="${pageContext.servletContext.contextPath}/">

</head>
<header class="header trans_300">
	<div class="main_nav_container">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-right">
					<div class="logo_container">
						<a href="#">YAME <span>shop</span></a>
					</div>
					<nav class="navbar">
						<ul class="navbar_menu">
							<li><a href="home.htm"><button type="button"
									class="btn btn-success position-relative">Trang chủ</button></a></li>
							<li><a href="category/index.htm"><button type="button"
									class="btn btn-success position-relative">Mua sắm</button></a></li>
							<li><c:if test="${sessionScope.account != null}">
									<a href="cart/index.htm"><button type="button"
											class="btn btn-success position-relative">
											Giỏ hàng <span
												class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
												${user.carts.size()} </span>
										</button></a>
								</c:if></li>
							<i class="bi bi-cart-check-fill"></i>
						</ul>
						<c:choose>
							<c:when test="${sessionScope.account == null}">
								<div class="nav-item dropdown">
									<a href="" data-toggle="dropdown"
										class="nav-link dropdown-toggle user-action"><img
										src="<c:url value="/resources/images/3.jpg"/>" alt=""
										class="avatar" alt="Avatar"> Tài Khoản <b class="caret">
									</b></a>
									<div class="dropdown-menu">
										<a href="account/signin.htm" class="dropdown-item"><i
											class="fa fa-user-o"></i> Đăng nhập</a> <a
											href="account/register.htm" class="dropdown-item"><i
											class="fa fa-calendar-o"></i> Đăng ký</a>
									</div>
								</div>
							</c:when>

							<c:otherwise>
								<div class="nav-item dropdown">
									<c:choose>
										<c:when test="${sessionScope.account.type == 'admin'}">
											<a href="#" data-toggle="dropdown"
												class="nav-link dropdown-toggle user-action"><img
												src="<c:url value="/resources/images/3.jpg"/>" alt=""
												class="avatar" alt="Avatar">
												${sessionScope.account.fullname}(admin) <b class="caret">
											</b></a>
											<br />
										</c:when>
										<c:otherwise>

											<a href="#" data-toggle="dropdown"
												class="nav-link dropdown-toggle user-action"><img
												src="<c:url value="/resources/images/3.jpg"/>" alt=""
												class="avatar" alt="Avatar">
												${sessionScope.account.fullname} <b class="caret"> </b></a>
										</c:otherwise>
									</c:choose>
									<div class="dropdown-menu">
										<a href="order/index.htm" class="dropdown-item"><i
											class="fa fa-user-o"></i> Đơn hàng của tôi</a>
										<c:if test="${sessionScope.account.type == 'admin'}">
											<a href="admin.htm" class="dropdown-item"><i
												class="fa fa-sliders"></i> Quản trị admin</a>
										</c:if>
										<a href="account/profile.htm" class="dropdown-item"><i
											class="fa fa-user-o"></i> Trang cá nhân</a> <a
											href="./account/change.htm" class="dropdown-item"><i
											class="fa fa-user-o"></i> Đổi mật khẩu</a>
										<div class="dropdown-divider"></div>
										<a href="account/logout.htm" class="dropdown-item"><i
											class="material-icons">&#xE8AC;</i> Logout</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>

						<div class="hamburger_container">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
</header>
</html>