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
	<script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>YAME | Admin gửi mail khách hàng</title>
<body style="display: inline-block; align-items: center; height: 100%; width: 100%;">
	<div class="container">
		<div class="col-3"></div>
		<div class=".col-sm-6">
			<%@include file="/WEB-INF/views/include/header.jsp"%>
			<br><br><br><br><br><br>
			<%@include file="/WEB-INF/views/include/sidebar_admin.jsp"%>
			<div class="p-3 mb-2 bg-success text-white">${message}</div>
		<form action="admin/mail/send.htm" method="post">
			<label class="form-label">
			<b>Tiêu đề</b></label><input
				name="subject" class="form-control" /> <label
				class="form-label mt-10">
				<b>Nội dung</b></label>
			<textarea name="body" id="body" rows="10" cols="80">
                Khuyến mãi lên tới 30% cho bộ sưu tập mới mùa hè 2022
            </textarea>
			<div class="text-center mt-10">
			<br>
				<button type="submit" class="btn btn-primary">Gửi</button>
			</div>

		</form>
		</div>
	</div>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/js/bootstrap.min.js"></script>
	<script>
	CKEDITOR.replace('body');
</script>
</body>