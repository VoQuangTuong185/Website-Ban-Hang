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
<title>Thay đổi mật khẩu</title>
<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>	
<form:form action="account/change_forgot.htm" method="post" >
<div class="limiter">
		<div class="container-login100">	
						<div class="login100-pic js-tilt" data-tilt data-tilt-max="20" data-tilt-speed="100" data-tilt-perspective="500">
				<img src="<c:url value="/resources/login/images/img-01.png"/>"alt="IMG">
			</div>	
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<span class="login100-form-title">
						<h1>Thay đổi mật khẩu</h1>
						${message}
					</span>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="email" name="email" placeholder="Nhập Email" value="${email}" readonly/> 
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>			

                    <div class="wrap-input100 validate-input" data-validate = "Code is required">
						<input class="input100" type="password" name="pw1" placeholder="Mật khẩu mới"/> 
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Code is required">
						<input class="input100" type="password" name="pw2" placeholder="Nhập lại mật khẩu mới"/> 
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

                    <div class="container-login100-form-btn">
						<button class="login100-form-btn">
						<input type="submit" value ="" class="forgot-button" /> Đổi mật khẩu</button>
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
<script type="text/javascript" src="resources/js/forgot.js"></script>
</body>
</html>




