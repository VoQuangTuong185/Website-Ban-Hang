<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="clothes.utils.Constants"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="<c:url value='/resources/styles/main_styles.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/styles/responsive.css' />" rel="stylesheet" />
<body style="display:inline-block; align-items: center;     height: 100%;    width: 100%;" >
	<div class="container">
		<div class="col-sm">
			<div class="row">
			<br><br><br><br><br>					
			</div>			
			<%@include file="/WEB-INF/views/include/sidebar_admin.jsp"%>
		</div>
	</div>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/js/bootstrap.min.js"></script>
</body>