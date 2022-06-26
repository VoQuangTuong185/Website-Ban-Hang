<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@ page import="clothes.utils.Constants"%>
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
 <link href="<c:url value='/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css' />" rel="stylesheet"> 
 <link href="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/animate.css' />" rel="stylesheet">
 <link href="<c:url value='/resources/styles/main_styles.css' />" rel="stylesheet">
<link href="<c:url value='/resources/styles/responsive.css' />" rel="stylesheet"> 
<br><br><br><br><br>
<div class="row m-10">
	<div class="col-lg-2"></div>
	<div class="col-lg-8">
		<div class="text-center"><h3>Trang cá nhân</h3></div>
		<div class="p-3 mb-2 bg-success text-white">${message}</div>
		<form:form method="post" modelAttribute="accountBean"
			action="account/profile.htm">

			<div class="mb-3">
				<label class="form-label"><b>Họ và tên</b></label>
				<form:input path="fullname" type="text" class="form-control" id="name" />
				<form:errors path="fullname" />
			</div>

			<div class="mb-3">
				<label class="form-label"><b>Email</b></label>
				<form:input path="email" type="email" class="form-control" id="email" />
				
			</div>

			<div class="mb-3">
				<label class="form-label"><b>Số điện thoại</b></label>
				<form:input path="phone" type="text" class="form-control" id="phone" />
				<form:errors path="phone" />
			</div>

			<div class="mb-3">
				<label class="form-label"><b>Địa chỉ</b></label>
				<form:input path="address" type="text" class="form-control" id="address" />
				<form:errors path="address" />
			</div>

			<div class="text-center mb-10">
				<button type="submit" class="btn btn-primary">Cập nhật</button>
			</div>

		</form:form>
		<br><br><br><br>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>