<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@ page import="clothes.utils.Constants"%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
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
<title>YAME | Mua online quần áo thời trang</title>
<style>
p {
	text-align: center;
	font-size: 25px;
	font-weight: bold;
	margin-top: 0px;
	text-shadow: 2px 2px #FF0000;
}
body{
font-family: Arial, Helvetica, sans-serif;
}
</style>
</head>

<body>
	<header class="header trans_300"> </header>
	<div class="fs_menu_overlay"></div>
	<div class="main_slider"
		style="background-image: url(./resources/images/slider_1.jpg)">
		<div class="container fill_height">
			<div class="row align-items-center fill_height">
				<div class="col">
					<div class="main_slider_content">
						<h6>Bộ sưu tập mùa hè 2022</h6>
						<h1>Giảm sốc lên tới 30% !!</h1>
						<div class="red_button shop_now_button">
							<a href="category/index.htm">Mua sắm ngay</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Banner -->

	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="banner_item align-items-center"
						style="background-image: url(./resources/images/banner_1.jpg)">
						<div class="banner_category">
							<a href="#">Nữ</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="banner_item align-items-center"
						style="background-image: url(./resources/images/banner_2.jpg)">
						<div class="banner_category">
							<a href="#">Phụ kiện</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="banner_item align-items-center"
						style="background-image: url(./resources/images/banner_3.jpg)">
						<div class="banner_category">
							<a href="#">Nam</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- New Arrivals -->
	<div class="super_container">
		<div class="new_arrivals">
			<div class="container">
				<div class="row">
					<div class="col text-center">
						<div class="section_title new_arrivals_title">
							<h2>Bộ sưu tập mới</h2>
						</div>
					</div>
				</div>
				<div class="row align-items-center">
					<div class="col text-center">
						<div class="new_arrivals_sorting">
							<ul
								class="arrivals_grid_sorting clearfix button-group filters-button-group">
								<c:forEach var="f" items="${category}">
									<li
										class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
										data-filter=".${f.categoryId}">${f.categoryname}</li> 
										<!-- load danh mục, kèm cho chọn để lọc theo danh mục -->
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="product-grid"
							data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>
							<!-- Product 1 -->
							<c:forEach var="f" items="${women}">
								<div class="product-item 2">
									<div class="product discount product_filter">
										<div class="product_image ">
											<a href="./product/${f.productId}.htm"><img
												src="<c:url value="/resources/images/${Constants.getBanner(f.images)}"/>"
												alt=""></a>
										</div>
										<div class="favorite favorite_left"></div>
										<div
											class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
											<span>${f.discount}%</span>
										</div>
										<div class="product_info">
											<h6 class="product_name">
												<a href="./product/${f.productId}.htm">${f.productname}</a>
											</h6>
											<div class="product_price">${f.price-(f.price*((f.discount)/100))}k<span>${f.price}k</span>
											</div>
										</div>
									</div>
									<div class="red_button add_to_cart_button">
										<a href="product/cart.htm?id_product=${f.productId}">Thêm vào giỏ hàng</a>
									</div>
								</div>
							</c:forEach>
							<c:forEach var="f" items="${men}">
								<div class="product-item 1">
									<div class="product discount product_filter">
										<div class="product_image">
											<a href="./product/${f.productId}.htm"><img
												src="<c:url value="/resources/images/${Constants.getBanner(f.images)}"/>"
												alt=""></a>
										</div>
										<div class="favorite favorite_left"></div>
										<div
											class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
											<span>-${f.discount}%</span>
										</div>
										<div class="product_info">
											<h6 class="product_name">
												<a href="./product/${f.productId}.htm">${f.productname}</a>
											</h6>
											<div class="product_price">${f.price-(f.price*((f.discount)/100))}k<span>${f.price}k</span>
											</div>
										</div>
									</div>
									<div class="red_button add_to_cart_button">
										<a href="product/cart.htm?id_product=${f.productId}">Thêm vào giỏ hàng</a>
									</div>
								</div>
							</c:forEach>
							<c:forEach var="f" items="${accessories}">
								<div class="product-item 3">
									<div class="product discount product_filter">
										<div class="product_image">
											<a href="./product/${f.productId}.htm"><img
												src="<c:url value="/resources/images/${Constants.getBanner(f.images)}"/>"
												alt=""></a>
										</div>
										<div class="favorite favorite_left"></div>
										<div
											class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
											<span>-${f.discount}%</span>
										</div>
										<div class="product_info">
											<h6 class="product_name">
												<a href="./product/${f.productId}.htm">${f.productname}</a>
											</h6>
											<div class="product_price">${f.price-(f.price*((f.discount)/100))}k<span>${f.price}k</span>
											</div>
										</div>
									</div>
									<div class="red_button add_to_cart_button">
										<a href="product/cart.htm?id_product=${f.productId}">Thêm vào giỏ hàng</a>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Deal of the week -->

		<div class="deal_ofthe_week">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6">
						<div class="deal_ofthe_week_img">
							<img src="<c:url value="/resources/images/deal_ofthe_week.png"/>"
								alt="">
						</div>
					</div>
					<div class="col-lg-6 text-right deal_ofthe_week_col">
						<div
							class="deal_ofthe_week_content d-flex flex-column align-items-center float-right">
							<div class="section_title">
								<h2>Deal giảm giá SỐC còn lại trong:</h2>
							</div>
							<ul class="timer">
								<p id="demo"></p>
							</ul>
							<div class="red_button shop_now_button">
								<a href="category/index.htm">Mua sắm ngay</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Best Sellers -->

		<div class="best_sellers">
			<div class="container">
				<div class="row">
					<div class="col text-center">
						<div class="section_title new_arrivals_title">
							<h2>Sản phẩm đang giảm giá</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="product_slider_container">
							<div class="owl-carousel owl-theme product_slider">
								<c:forEach var="f" items="${giamGia}">
									<div class="owl-item product_slider_item">
										<div class="product-item">
											<div class="product discount">
												<div class="product_image">
													<a href="./product/${f.productId}.htm"><img
														src="<c:url value="/resources/images/${Constants.getBanner(f.images)}"/>"
														alt=""></a>
												</div>
												<div class="favorite favorite_left"></div>
												<div
													class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
													<span>-${f.discount}%</span>
												</div>
												<div class="product_info">
													<h6 class="product_name">${f.productname}</h6>
													<div class="product_price">${f.price-(f.price*((f.discount)/100))}k<span>${f.price}k</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Benefit -->
		<br><br><br><br>
	</div>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		// Set the date we're counting down to
		var countDownDate = new Date("May 29, 2022 00:00:00").getTime();

		// Update the count down every 1 second
		var x = setInterval(
				function() {

					// Get today's date and time
					var now = new Date().getTime();

					// Find the distance between now and the count down date
					var distance = countDownDate - now;

					// Time calculations for days, hours, minutes and seconds
					var days = Math.floor(distance / (1000 * 60 * 60 * 24));
					var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
							/ (1000 * 60 * 60));
					var minutes = Math.floor((distance % (1000 * 60 * 60))
							/ (1000 * 60));
					var seconds = Math.floor((distance % (1000 * 60)) / 1000);

					// Output the result in an element with id="demo"
					document.getElementById("demo").innerHTML = days + " ngày "
							+ hours + " giờ " + minutes + " phút " + seconds
							+ " giây";

					// If the count down is over, write some text 
					if (distance < 0) {
						clearInterval(x);
						document.getElementById("demo").innerHTML = "Đã hết hạn giảm giá";
					}
				}, 1000);
	</script>
	<script src="<c:url value="/resources/styles/bootstrap4/popper.js" />"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/js/bootstrap.min.js"></script>
	<script
		src="<c:url value="/resources/plugins/Isotope/isotope.pkgd.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/easing/easing.js" />"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>
	<script src="<c:url value='/resources/js/custom.js' />"></script>
</body>
</html>
