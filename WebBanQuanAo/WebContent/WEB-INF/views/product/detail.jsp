<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%-- <%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>YAME | ${product.productname}</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value='/resources/styles/single_styles.css' />" rel="stylesheet">
<link href="<c:url value='/resources/styles/responsive.css' />" rel="stylesheet" />
</head>

<body>

	<header class="header trans_300"> </header>

	<div class="fs_menu_overlay"></div>

	<!-- Hamburger Menu -->

	<div class="container single_product_container">
		<div class="row">
			<div class="col"></div>
		</div>

		<div class="row">
			<div class="col-lg-7">
				<div class="single_product_pics">
					<div class="row">
						<div class="col-lg-3 thumbnails_col order-lg-1 order-2">
							<div class="single_product_thumbnails">
								<c:forEach begin="0" end="2" varStatus="status">
									<ul>
										<li><img
											src="<c:url value="/resources/images/${Constants.getImageAt(product.images,status.index)}"/>"
											height="135px" alt=""
											data-image="<c:url value = "/resources/images/${Constants.getImageAt(product.images,status.index)}"/>"></li>
										</br>
									</ul>
								</c:forEach>
							</div>
						</div>
						<div class="col-lg-9 image_col order-lg-2 order-1">
							<div class="single_product_image">
								<div class="single_product_image_background"
									style="background-image: url(images/single_2.jpg)"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="product_details">
					<div class="product_details_title">
						<h2>${product.productname}</h2>
						<p>${product.review}</p>
					</div>
					<div
						class="free_delivery d-flex flex-row align-items-center justify-content-center">
						<span class="ti-truck"></span>Trình trạng : <span></span>
						<c:choose>
							<c:when test="${product.available == 0}"> còn hàng</c:when>
							<c:otherwise>
								<span class="msg-fail">hết hàng</span>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="original_price">Giá gốc: ${product.price}k</div>
					Giá sau khuyến mãi:
					<div class="product_price">${product.price-(product.price*((product.discount)/100))}k</div> <i>(-${product.discount}%)</i>
					<br>
					<br>
					<br>
					<div
						class="quantity d-flex flex-column flex-sm-row align-items-sm-center justify-content-center">
						<a  class="btn btn-danger" href="product/cart.htm?id_product=${product.productId}">${addedToCart ? 'Đã thêm' : 'Thêm vào giỏ'}</a>
						&nbsp;&nbsp;&nbsp;
						<c:if test="${sessionScope.account.type == 'admin'}">
						<a  class="btn btn-primary" href="admin/product/edit.htm?id=${product.productId}">Chỉnh sửa</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Tabs -->

	<div class="tabs_section_container">

		<div class="container">
			<div class="row">
				<div class="col">
					<div class="tabs_container">
						<ul
							class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
							<li class="tab active" data-active-tab="tab_1"><span>Mô
									tả bằng hình ảnh</span></li>
							<li class="tab" data-active-tab="tab_2"><span>Thông
									tin thêm</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">

					<!-- Tab Description -->

					<div id="tab_1" class="tab_container active">
						<div class="row">
							<div class="col-lg-12 desc_col">
								<div class="tab_title">
									<h4>Mô tả bằng hình ảnh</h4>
								</div>
								<div class="tab_image">
									<c:forEach begin="0" end="2" varStatus="status">
										<div class="owl-item product_slider_item">
											<div class="product-item">
												<div class="product discount">
													<div class="product_image">
														<img
															src="<c:url value="/resources/images/${Constants.getImageAt(product.images,status.index)}"/>"
															alt="">
														<!-- CHÈN THÊM MÔ TẢ -->
													</div>
													<div class="favorite favorite_left"></div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="col-lg-12 offset-lg-2 desc_col">
								<div class="tab_image"></div>
								<div class="tab_image desc_last"></div>
							</div>
						</div>
					</div>

					<!-- Tab Additional Info -->

					<div id="tab_2" class="tab_container">
						<div class="row">
							<div class="col additional_info_col">
								<div class="tab_title additional_info_title">
									<h4>Additional Information</h4>
								</div>
								<p>
									COLOR:<span>Gold, Red</span>
								</p>
								<p>
									SIZE:<span>L,M,XL</span>
								</p>
							</div>
						</div>
					</div>

					<!-- Tab Reviews -->

					<div id="tab_3" class="tab_container">
						<div class="row">

							<!-- User Reviews -->

							<div class="col-lg-6 reviews_col">
								<div class="tab_title reviews_title">
									<h4>Reviews (2)</h4>
								</div>

								<!-- User Review -->

								<div
									class="user_review_container d-flex flex-column flex-sm-row">
									<div class="user">
										<div class="user_pic"></div>
										<div class="user_rating">
											<ul class="star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
										</div>
									</div>
									<div class="review">
										<div class="review_date">27 Aug 2016</div>
										<div class="user_name">Brandon William</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua.</p>
									</div>
								</div>
							</div>

							<!-- Add Review -->

							<div class="col-lg-6 add_review_col">

								<div class="add_review">
									<form id="review_form" action="post">
										<div>
											<h1>Add Review</h1>
											<input id="review_name" class="form_input input_name"
												type="text" name="name" placeholder="Name*"
												required="required" data-error="Name is required.">
											<input id="review_email" class="form_input input_email"
												type="email" name="email" placeholder="Email*"
												required="required" data-error="Valid email is required.">
										</div>
										<div>
											<h1>Your Rating:</h1>
											<ul class="user_star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
											<textarea id="review_message" class="input_review"
												name="message" placeholder="Your Review" rows="4" required
												data-error="Please, leave us a review."></textarea>
										</div>
										<div class="text-left text-sm-right">
											<button id="review_submit" type="submit"
												class="red_button review_submit_btn trans_300"
												value="Submit">submit</button>
										</div>
									</form>
								</div>

							</div>

						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="<c:url value='/resources/styles/bootstrap4/popper.js' />"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="<c:url value='/resources/plugins/Isotope/isotope.pkgd.min.js' />"></script>
	<script
		src="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js' />"></script>
	<script src="<c:url value='/resources/plugins/easing/easing.js' />"></script>
	<script
		src="<c:url value='/resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.js' />"></script>
	<script src="<c:url value='/resources/js/single_custom.js' />"></script>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>

</html>
