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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" />
<link href="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/animate.css' />" rel="stylesheet" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/plugins/easing/easing.js" />"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>
<script src="<c:url value="/resources/plugins/Isotope/isotope.pkgd.min.js" />"></script>
<script src="<c:url value="/resources/plugins/easing/easing.js" />"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>

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
									class="btn btn-success position-relative">Trang ch???</button></a></li>
							<li><a href="category/index.htm"><button type="button"
									class="btn btn-success position-relative">Mua s???m</button></a></li>
							<li><c:if test="${sessionScope.account != null}">
									<a href="cart/index.htm"><button type="button"
											class="btn btn-success position-relative">
											Gi??? h??ng <span
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
										class="avatar" alt="Avatar"> T??i Kho???n <b class="caret">
									</b></a>
									<div class="dropdown-menu">
										<a href="account/signin.htm" class="dropdown-item"><i
											class="fa fa-user-o"></i> ????ng nh???p</a> <a
											href="account/register.htm" class="dropdown-item"><i
											class="fa fa-calendar-o"></i> ????ng k??</a>
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
											class="fa fa-user-o"></i> ????n h??ng c???a t??i</a>
										<c:if test="${sessionScope.account.type == 'admin'}">
											<a href="admin.htm" class="dropdown-item"><i
												class="fa fa-sliders"></i> Qu???n tr??? admin</a>
										</c:if>
										<a href="account/profile.htm" class="dropdown-item"><i
											class="fa fa-user-o"></i> Trang c?? nh??n</a> <a
											href="./account/change.htm" class="dropdown-item"><i
											class="fa fa-user-o"></i> ?????i m???t kh???u</a>
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