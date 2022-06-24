<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="/resources/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link
	href="<c:url value='/resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css' />"
	rel="stylesheet">
<!--===============================================================================================-->
<link href="<c:url value='/resources/login/css/util.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/login/css/style.css' />"
	rel="stylesheet">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!--===============================================================================================-->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/hamburgers/1.2.1/hamburgers.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.css">
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

<head>
<meta charset="UTF-8">
<title>Đăng Ký Tài Khoản</title>
<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
<form:form action="account/register.htm" method="post" modelAttribute="user">
<div class="signup">
<div class="limiter">
		<div class="container-login100">
			<div class="login100-pic js-tilt" data-tilt data-tilt-max="20" data-tilt-speed="100" data-tilt-perspective="500">
				<img src="<c:url value="/resources/login/images/img-01.png"/>"alt="IMG">
			</div>
			<div class="wrap-login100">			
				<form class="login100-form validate-form">
					<span class="login100-form-title">
						Đăng ký tài khoản
					</span>
						<div class="forgot-header">
							<h6 style="color: red; font-style: italic; padding-top: 15px;">${message}</h6>
						</div>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<form:input class="input100" type="text" path="email" placeholder="Email"/>						
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
					<form:errors path="email" />
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<form:input class="input100" type="password" path="password" placeholder="Mật khẩu"/>						
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<form:errors path="password" />
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<form:input class="input100" type="text" path="fullname" placeholder="Tên đầy đủ"/>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
					<form:errors path="fullname" />							
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<form:input class="input100" type="text" path="phone" placeholder="Số điện thoại"/>						
						<span class="focus-input100"></span>						
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>						
					</div>
					<form:errors path="phone" />
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<form:input class="input100" type="text" path="address" placeholder="Địa chỉ"/>						
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
					<form:errors path="address" />
					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">Đăng ký
						</button>
					</div>
				<br> <a class="sign-in" href="account/signin.htm">Đã có tài
					khoản, mời đăng nhập</a>
					<div class="text-center p-t-12">
						<span class="txt1">						
						</span>
						<a class="txt2" href="#">						
						</a>
					</div>

					<div class="text-center .p-t-12">
						<span class="txt1">
							Bạn quên
						</span>
						<a class="txt2" href="account/forgot.htm">
							Email/ Mật khẩu?
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
		</div>
</form:form>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
<!--===============================================================================================-->	

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--===============================================================================================-->
<script src="<c:url value='/resources/styles/bootstrap4/popper.js' />" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src="<c:url value='/resources/login/js/main.js' />" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.2/vanilla-tilt.min.js"></script>
</body>
</html>