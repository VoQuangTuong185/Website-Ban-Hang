<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%-- <%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="clothes.utils.Constants"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yame | sản phẩm theo từng lựa chọn</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css' />"
	rel="stylesheet">
<link
	href="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css' />"
	rel="stylesheet">
<link
	href="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/animate.css' />"
	rel="stylesheet">
<link
	href="<c:url value='/resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/styles/categories_styles.css' />"
	rel="stylesheet">
<link
	href="<c:url value='/resources/styles/categories_responsive.css' />"
	rel="stylesheet">
</head>
<body>
	<div class="super_container">
		<div class="new_arrivals">
			<div class="container ">
				<div class="row">
					<div class="breadcrumbs d-flex flex-row align-items-center">
						<ul>
							<li><a href="index.htm">Home</a></li>
							<li class="active"><a href="index.htm"><i
									class="fa fa-angle-right" aria-hidden="true"></i>Men's</a></li>
						</ul>
					</div>
					<div class="sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h5>Danh mục sản phẩm</h5>
								<div class="row align-items-center">
									<div class="col text-center">
										<div class="new_arrivals_sorting">
											<ul
												class="arrivals_grid_sorting clearfix button-group filters-button-group">
												<c:forEach var="f" items="${category}">
													<li
														class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
														data-filter=".${f.categoryId}">${f.categoryname}</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Main Content -->
					<div class="main_content">
						<!-- Products -->
						<div class="products_iso">
							<div class="row">
								<div class="col">
									<!-- Product Sorting -->
									<div
										class="product_sorting_container product_sorting_container_top">
										<ul class="product_sorting">
											<li><span class="type_sorting_text">Mặc định</span> <i
												class="fa fa-angle-down"></i>
												<ul class="sorting_type">
													<li class="type_sorting_btn"
														data-isotope-option='{ "sortBy": "original-order" }'><span>Mặc định</span></li>
													<li class="type_sorting_btn"
														data-isotope-option='{ "sortBy": "price" }'><span>Theo giá tăng dần</span></li>
													<li class="type_sorting_btn"
														data-isotope-option='{ "sortBy": "name" }'><span>Theo tên sản phẩm</span></li>
												</ul></li>
											<li><span>Chế độ</span> <span class="num_sorting_text">6</span>
												<i class="fa fa-angle-down"></i>
												<ul class="sorting_num">
													<li class="num_sorting_btn"><span>6</span></li>
													<li class="num_sorting_btn"><span>12</span></li>
													<li class="num_sorting_btn"><span>24</span></li>
												</ul></li>
										</ul>
										<div class="pages d-flex flex-row align-items-center">
											<form method="get"
												action="product/index.htm?keyword=${keyword}">
												<div class="input-group">
													<input type="search" placeholder="Từ khóa" name="keyword"
														class="form-control border-success rounded-pill pr-5 form-control-sm mr-10"
														value="${keyword}" />
													<div class="input-group-append ml-10">
														<button class="btn btn-primary btn-sm">Tìm</button>
													</div>
												</div>
											</form>
										</div>
									</div>
									<!-- Product Grid -->
									<div class="product-grid">
										<c:forEach var="f" items="${women}">
											<div class="product-item 2">
												<div class="product discount product_filter">
													<div class="product_image">
														<a href="product/${f.productId}.htm"><img
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
												<div class="red_button add_to_cart_button">
													<a href="product/cart.htm?id_product=${f.productId}">Thêm
														vào giỏ hàng</a>
												</div>
											</div>
										</c:forEach>
										<c:forEach var="f" items="${men}">
											<div class="product-item 1">
												<div class="product discount product_filter">
													<div class="product_image">
														<a href="product/${f.productId}.htm"><img
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
												<div class="red_button add_to_cart_button">
													<a href="product/cart.htm?id_product=${f.productId}">Thêm
														vào giỏ hàng</a>
												</div>
											</div>
										</c:forEach>
										<c:forEach var="f" items="${accessories}">
											<div class="product-item 3">
												<div class="product discount product_filter">
													<div class="product_image">
														<a href="product/${f.productId}.htm"><img
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
												<div class="red_button add_to_cart_button">
													<a href="product/cart.htm?id_product=${f.productId}">Thêm
														vào giỏ hàng</a>
												</div>
											</div>
										</c:forEach>
										<c:forEach var="f" items="${product}">
											<div class="product-item 3">
												<div class="product discount product_filter">
													<div class="product_image">
														<a href="product/${f.productId}.htm"><img
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
												<div class="red_button add_to_cart_button">
													<a href="#">add to cart</a>
												</div>
											</div>
										</c:forEach>
									</div>

									<!-- Product Sorting -->

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
				<nav aria-label="Page navigation">
				<ul class="pagination justify-content-end">
					<!-- First Page -->
					<li class="page-item ${page == 1 ? 'disabled' : '' }"><a
						class="page-link" href="category/index.htm?page=1" tabindex="-1"
						aria-disabled="true">&laquo;</a></li>

					<!-- Page Number -->
					<c:forEach begin="${page-2<1 ? 1 : page-2}"
						end="${page+2 > maxPage ? maxPage : page+2}" varStatus="loop">
						<li class="page-item ${loop.count == page ? 'active' : '' }"><a
							class="page-link" href="category/index.htm?page=${loop.count}">${loop.count}</a></li>
					</c:forEach>

					<!-- Last Page -->
					<li class="page-item ${page == maxPage ? 'disabled' : '' }"><a
						class="page-link" href="category/index.htm?page=${maxPage}"
						tabindex="-1" aria-disabled="true">&raquo;</a></li>
				</ul>
			</nav>
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
	<script src="<c:url value='/resources/js/categories_custom.js' />"></script>
	<script src="<c:url value='/resources/js/custom.js' />"></script>
	<br>
	<br>
	<br>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</html>
