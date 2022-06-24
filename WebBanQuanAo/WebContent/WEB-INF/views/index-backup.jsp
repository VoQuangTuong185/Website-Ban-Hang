<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix= "f" %>
<%-- <%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--   <%@include file="/WEB-INF/views/include/header.jsp"%>	  --%>
  <%@ page import="clothes.utils.Constants"%>

<!DOCTYPE html>
<html>
<head>
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
 <link href="<c:url value='/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css' />" rel="stylesheet"> 
 <link href="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/animate.css' />" rel="stylesheet">
 <link href="<c:url value='/resources/styles/main_styles.css' />" rel="stylesheet">
<link href="<c:url value='/resources/styles/responsive.css' />" rel="stylesheet"> 
<title>YAME | Mua quần áo CHÍNH23</title>
<style>
p{
  text-align: center;
  font-size: 25px;
  font-weight: bold;
  margin-top: 0px;
text-shadow: 2px 2px #FF0000;
}
</style>
</head>

<body>
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
								<li><a href="home.htm">Trang chủ</a></li>
								<li><a href="category/index.htm">Mua sắm</a></li>
								<li><a href="contact.htm">Liên hệ</a></li>
							</ul>
								<div class="nav-item dropdown">			
									<a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle user-action"><img src="<c:url value="/resources/images/3.jpg"/>"alt=""class="avatar" alt="Avatar"> Tài Khoản <b class="caret"> </b></a>
									<div class="dropdown-menu">
										<a href="./account/signin.htm" class="dropdown-item"><i class="fa fa-user-o"></i> Đăng nhập</a>
										<a href="./account/register.htm" class="dropdown-item"><i class="fa fa-calendar-o"></i> Đăng ký</a>
										<a href="#" class="dropdown-item"><i class="fa fa-sliders"></i> Settings</a>
										<div class="dropdown-divider"></div>
										<a href="#" class="dropdown-item"><i class="material-icons">&#xE8AC;</i> Logout</a>
									</div>
								</div>

							<ul class="navbar_user">
								<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>							
								<li class="checkout">
									<a href="#">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i>
										<span id="checkout_items" class="checkout_items">2</span>
									</a>
								</li>
							</ul>
							<div class="hamburger_container">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="fs_menu_overlay"></div>
	<br><br><br><br>
	<div class="main_slider" style="background-image:url(./resources/images/slider_1.jpg)">
		<div class="container fill_height">
			<div class="row align-items-center fill_height">
				<div class="col">
					<div class="main_slider_content">
						<h6>Bộ sưu tập mùa hè 2022</h6>
						<h1>Giảm ngay 30% !!</h1>
						<div class="red_button shop_now_button"><a href="category/index.htm">Mua sắm ngay</a></div>
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
					<div class="banner_item align-items-center" style="background-image:url(./resources/images/banner_1.jpg)">
						<div class="banner_category">
							<a href="#">Nữ</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="banner_item align-items-center" style="background-image:url(./resources/images/banner_2.jpg)">
						<div class="banner_category">
							<a href="#">Phụ kiện</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="banner_item align-items-center" style="background-image:url(./resources/images/banner_3.jpg)">
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
						<ul class="arrivals_grid_sorting clearfix button-group filters-button-group">
							<c:forEach var="f" items="${category}">	
									<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".${f.categoryId}">${f.categoryname}</li>										
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>
						<!-- Product 1 -->
							<c:forEach var="f" items="${women}">
									<div class="product-item 2">
												<div class="product discount product_filter">												
													<div class="product_image ">
														<a href="./product/${f.productId}.htm"><img src="<c:url value="/resources/images/${Constants.getBanner(f.images)}"/>"  alt=""></a>
													</div>
													<div class="favorite favorite_left"></div>
													<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>${f.discount}%</span></div>
													<div class="product_info">
														<h6 class="product_name"><a href="./product/${f.productId}.htm">${f.productname}</a></h6>
														<div class="product_price">${f.price-(f.price*((f.discount)/100))}<span>${f.price}</span></div>
													</div>										
												</div>
											   <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
									</div>															
							</c:forEach>		
							<c:forEach var="f" items="${men}">
									<div class="product-item 1">
												<div class="product discount product_filter">												
													<div class="product_image">
														<a href="./product/${f.productId}.htm"><img src="<c:url value="/resources/images/${Constants.getBanner(f.images)}"/>"  alt=""></a>
													</div>
													<div class="favorite favorite_left"></div>
													<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-${f.discount}%</span></div>
													<div class="product_info">
														<h6 class="product_name"><a href="./product/${f.productId}.htm">${f.productname}</a></h6>
														<div class="product_price">${f.price-(f.price*((f.discount)/100))}<span>${f.price}</span></div>
													</div>										
												</div>
											   <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
									</div>															
							</c:forEach>	
							<c:forEach var="f" items="${accessories}">
									<div class="product-item 3">
												<div class="product discount product_filter">												
													<div class="product_image">
														<a href="./product/${f.productId}.htm"><img src="<c:url value="/resources/images/${Constants.getBanner(f.images)}"/>"  alt=""></a>
													</div>
													<div class="favorite favorite_left"></div>
													<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-${f.discount}%</span></div>
													<div class="product_info">
														<h6 class="product_name"><a href="./product/${f.productId}.htm">${f.productname}</a></h6>
														<div class="product_price">${f.price-(f.price*((f.discount)/100))}<span>${f.price}</span></div>
													</div>										
												</div>
											   <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
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
						<img src="<c:url value="/resources/images/deal_ofthe_week.png"/>" alt="">
					</div>
				</div>
				<div class="col-lg-6 text-right deal_ofthe_week_col">
					<div class="deal_ofthe_week_content d-flex flex-column align-items-center float-right">
						<div class="section_title">
							<h2>Mặt hàng giảm giá sốc</h2>
						</div>
						<ul class="timer">
							<p id="demo"></p>				
						</ul>
						<div class="red_button shop_now_button"><a href="category/index.htm">Mua sắm ngay</a></div>
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
						<h2>Sản phẩm bán chạy</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="product_slider_container">
					<div class="owl-carousel owl-theme product_slider">								
							<c:forEach var="f" items="${banChay}">
								<div class="owl-item product_slider_item">
									<div class="product-item">
										<div class="product discount">												
											<div class="product_image">
												<img src="<c:url value="/resources/images/${Constants.getBanner(f.images)}"/>"  alt="">
											</div>
											<div class="favorite favorite_left"></div>
											<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-${f.discount}%</span></div>
											<div class="product_info">
												<h6 class="product_name"><a href="single.html">${f.productname}</a></h6>
												<div class="product_price">${f.price-(f.price*((f.discount)/100))}<span>${f.price}</span></div>										
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
<br>
	<div class="benefit">
		<div class="container">
			<div class="row benefit_row">
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>Miễn phí vận chuyển</h6>
							cho đơn hàng trên 1 triệu
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-money" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>thanh toán cod</h6>
							tiện lợi nhận hàng
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-undo" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>15 ngày đổi trả</h6>
							nếu bạn không hài lòng
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>mở bán cả tuần </h6>
							kể cả ngày nghỉ, lễ từ 8AM - 9PM
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
						<ul class="footer_nav">
							<li><a href="#">Blog</a></li>
							<li><a href="#">FAQs</a></li>
							<li><a href="contact.html">Contact us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
						<ul>
							<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer_nav_container">
						<div class="cr">Â©2018 All Rights Reserverd. Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="#">Colorlib</a> &amp; distributed by <a href="https://themewagon.com">ThemeWagon</a></div>
					</div>
				</div>
			</div>
		</div>
	</footer>

</div>
<script>
      // Set the date we're counting down to
	  var countDownDate = new Date("May 22, 2022 00:00:00").getTime();
	
	  // Update the count down every 1 second
	  var x = setInterval(function() {

	  // Get today's date and time
	  var now = new Date().getTime();
	    
	  // Find the distance between now and the count down date
	  var distance = countDownDate - now;
	    
	  // Time calculations for days, hours, minutes and seconds
	  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
	    
	  // Output the result in an element with id="demo"
	  document.getElementById("demo").innerHTML = days + " ngày " + hours + " giờ "
	  + minutes + " phút " + seconds + " giây";
	    
	  // If the count down is over, write some text 
	  if (distance < 0) {
	    clearInterval(x);
	    document.getElementById("demo").innerHTML = "Đã hết hạn giảm giá";
	  }
	}, 
1000);
</script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="<c:url value="/resources/styles/bootstrap4/popper.js" />" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/plugins/Isotope/isotope.pkgd.min.js" />" ></script>
<script src="<c:url value="/resources/plugins/easing/easing.js" />" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>
<script src="<c:url value='/resources/js/custom.js' />" ></script>


</body>

</html>
