<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<link rel="icon" type="image/png" href="/resources/images/icons/favicon.ico" />
<link href="<c:url value='/resources/login/css/util.css' />" rel="stylesheet" /> 
<link href="<c:url value='/resources/login/css/style.css' />" rel="stylesheet" />
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="<c:url value='/resources/styles/main_styles.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/styles/responsive.css' />" rel="stylesheet" />

<head>
<meta charset="UTF-8">
<title>Đăng Nhập</title>
<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
	<form:form action="account/signin.htm" method="post"
		modelAttribute="user">
		<div class="limiter">
			<div class="container-login100">
				<div class="login100-pic js-tilt" data-tilt data-tilt-max="20"
					data-tilt-speed="100" data-tilt-perspective="500">
					<img src="<c:url value="/resources/login/images/img-01.png"/>"
						alt="IMG">
				</div>
				<div class="wrap-login100">
					<form class="login100-form validate-form">
						<span class="login100-form-title"> Đăng nhập </span>
						<div class="forgot-header">
							<h6 style="color: red; font-style: italic; padding-top: 15px;">${message}</h6>
						</div>
						<div class="wrap-input100 validate-input"
							data-validate="Valid email is required: ex@abc.xyz">
							<input class="input100" type="text" name="email"
								placeholder="Email" value="${email}" /> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</span>
						</div>

						<div class="wrap-input100 validate-input"
							data-validate="Password is required">
							<input class="input100" type="password" name="pw"
								placeholder="Password" value="${pwd}" /> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-lock" aria-hidden="true"></i>
							</span>
						</div>
						<span style="color: #001100; font-style: italic;"> <input
							type="checkbox" name="rm" /> Nhớ tài khoản
						</span>
						<div class="container-login100-form-btn">
							<button type="submit" class="login100-form-btn">Đăng
								nhập</button>
						</div>

						<div class="text-center p-t-12">
							<span class="txt1"> Bạn quên </span> <a class="txt2"
								href="account/forgot.htm">Email/ Mật khẩu? </a>
						</div>

						<div class="text-center p-t-12">
							<a class="txt2" href="account/register.htm"> Chưa có tài
								khoản thì tạo ngay nào <i class="fa fa-long-arrow-right m-l-5"
								aria-hidden="true"></i>
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</form:form>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src="<c:url value='/resources/login/js/main.js' />" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.2/vanilla-tilt.min.js"></script>
</body>
</html>