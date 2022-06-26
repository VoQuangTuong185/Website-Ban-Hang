<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="clothes.utils.Constants"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="<c:url value='/resources/styles/main_styles.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/styles/responsive.css' />" rel="stylesheet" />
<title>YAME | thêm sản phẩm</title>
<body
	style="display: inline-block; align-items: center; height: 100%; width: 100%;">
	<div class="container">
		<div class="col-sm">
		<br><br><br><br><br>
			<%@include file="/WEB-INF/views/include/sidebar_admin.jsp"%>
			<form:form modelAttribute="productBean"
				action="${product == null ? 'admin/product/add.htm' : 'admin/product/edit.htm?id='}${product!=null?product.productId:''}"
				method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-6">
						<label for="txtNameControl" class="form-label"><b>Tên sản phẩm</b></label>
						<form:input path="productname" type="text" class="form-control"
							id="txtNameControl" />
						<form:errors path="productname" />
					</div>
					<div class="col-md-3">
						<label class="form-label"><b>Danh mục</b></label>
						<br>
						<form:select path="category" class="form-select">
							<form:options itemLabel="categoryname" itemValue="categoryId"
								items="${categories}" />
						</form:select>
					</div>
					<div class="col-md-3">
						<label for="txtPrice" class="form-label"><b>Giá</b></label>
						<form:input path="price" type="number" class="form-control"
							id="txtPrice" />
						<form:errors path="price" />
					</div>
				</div>

				<div class="mb-3 mt-10">
					<label for="txtDetail" class="form-label"><b>Thông tin
							chi tiết</b></label>
					<form:textarea class="form-control" path="review" rows="3"></form:textarea>
					<form:errors path="review" />
				</div>

				<div class="row mt-10">
					<div class="col">
						<label class="form-label"><b>Tình trạng</b></label><br>
						<div class="form-check form-check-inline">
							<form:radiobutton class="form-check-input" path="available"
								id="inlineRadio1" value="0" />
							<label class="form-check-label">Còn</label>
						</div>
						<div class="form-check form-check-inline">
							<form:radiobutton class="form-check-input" path="available"
								id="inlineRadio2" value="1" />
							<label class="form-check-label">Hết</label>
						</div>
					</div>

					<div class="col">
						<label class="form-label"><b>Trạng thái</b></label><br>
						<div class="form-check form-check-inline">
							<form:radiobutton class="form-check-input" path="status"
								id="raioStatus1" value="0" />
							<label class="form-check-label">Hiển thị</label>
						</div>
						<div class="form-check form-check-inline">
							<form:radiobutton class="form-check-input" path="status"
								id="raioStatus2" value="1" />
							<label class="form-check-label">Ẩn</label>
						</div>
					</div>
					
					<div class="col-md-3">
						<label for="txtDiscount" class="form-label"><b>Giảm giá</b></label>
						<form:input path="discount" type="number" class="form-control"
							id="txtDiscount" />
						<form:errors path="discount" />
					</div>
					
				</div>
				<label for="formFile" class="form-label mt-10"><b>Hình ảnh</b></label>
				<div class="row">
					<c:forEach begin="1" end="3" varStatus="index">
						<div class="col-4">
							<form:input path="images" class="form-control form-control-sm"
								type="file" accept="resoures/image/*" id="formFile${index.count}"
								onchange="loadFile(${index.count})" />
							<div class="text-center mv-10">
								<button id="btn-${index.count}" type="button"
									class="btn btn-warning btn-sm"
									onclick="deleteImage(${index.count})">
									<i class="bi bi-x-lg"></i>Xoá
								</button>
							</div>
							<img src="resources/images/${Constants.getImageAt(product.images, index.count-1)}"
								id="output${index.count}" width="100%" class="mv-10" />

							<form:input type="hidden" class="form-control" path="imagePath"
								id="imagePath${index.count}" />
						</div>
					</c:forEach>
				</div>
				<hr style="border: 1px solid #f1f1f1">
				<div class="text-center mv-10">
					<button type="submit" class="btn btn-primary shadow">${product == null ? "Thêm" : "Sửa" }</button>
				</div>
			</form:form>
		</div>
	</div>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
	var images = "${product.images}";
	console.log(images);
	var arr = images.split(" ");
	console.log(arr.length);

	for (var i = 1; i <= 3; i++) {
		$("#btn-" + i).hide();
		$("#imagePath"+i).val('');
	}

	for (var i = 1; i <= arr.length; i++) {
		if(arr[i-1].length > 0){
			$("#btn-" + i).show();
			$("#imagePath"+i).val(arr[i-1]);
		}	
	}

	var deleteImage = function(i) {
		var output = document.getElementById("output" + i);
		output.src = '';
		$("#formFile" + i).val('');
		$("#btn-" + i).hide();
		$("#imagePath"+i).val('');
	};

	var loadFile = function(i) {
		var output = document.getElementById("output" + i);
		$("#btn-" + i).show();
		$("#imagePath"+i).val(event.target.files[0].name);
		output.src = URL.createObjectURL(event.target.files[0]);
		output.onload = function() {
			URL.revokeObjectURL(output.src); // free memory
		}
	};
	</script>
</body>