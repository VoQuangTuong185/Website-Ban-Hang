<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="clothes.utils.Constants"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="<c:url value='/resources/styles/main_styles.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/styles/responsive.css' />" rel="stylesheet" />
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<title>YAME | quản lý đơn hàng</title>
<body style="display: inline-block; align-items: center; height: 100%; width: 100%;">
    <div class="container">
        <div class="col-3"></div>
        <div class=".col-sm-6">
            <%@include file="/WEB-INF/views/include/header.jsp"%>
            <br /><br /><br /><br /><br /><br />
            <%@include file="/WEB-INF/views/include/sidebar_admin.jsp"%>
            <jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />
            <c:url value="admin/order/" var="pagedLink">
                <c:param name="p" value="~" />
            </c:url>
            <c:choose>
                <c:when test="${pagedListHolder.pageList.isEmpty() == true }">
                    <h1>Đơn hàng trống.</h1>
                </c:when>
                <c:when test="${pagedListHolder.pageList.isEmpty() == false }">
                    <div>
                        <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Mã đơn hàng</th>
                                <th scope="col">Người đặt</th>
                                <th scope="col">SĐT</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Thời gian đặt</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Thao tác</th>
                                <th scope="col">Thông tin</th>
                            </tr>
                        </thead>
                        <c:forEach var="o" items="${pagedListHolder.pageList}">
                            <tbody>
                                <tr>
                                    <th scope="row">${o.ordersId}</th>
                                    <td>${o.account.fullname}</td>
                                    <td>${o.account.phone}</td>
                                    <td>${o.account.address}</td>
                                    <td><fmt:formatDate pattern="dd/MM/yyyy - HH:mm" value="${o.orderTime}" /></td>
                                    <td>
                                        <c:if test="${o.status == 2}">
                                            <p style="color: blue;">Đã hoàn thành</p>
                                        </c:if>
                                        <c:if test="${o.status == 1}">
                                            <p style="color: green;">Đang giao</p>
                                        </c:if>
                                        <c:if test="${o.status == 0}">
                                            <p style="color: red;">Chờ xác nhận</p>
                                        </c:if>
                                        <c:if test="${o.status == 3}">
                                            <p style="color: red;">Đã Hủy</p>
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${o.status == 1}">
                                            <a class="btn btn-primary" href="admin/order/statusDaGiao.htm?ordersId=${o.ordersId}&email=${o.account.email}&status=2">Hoàn thành</a>
                                        </c:if>
                                        <c:if test="${o.status == 0}">
                                            <a class="btn btn-primary" href="admin/order/status.htm?ordersId=${o.ordersId}&status=1">Xác nhận</a>
                                            <a class="btn btn-danger" href="admin/order/status.htm?ordersId=${o.ordersId}&status=3">Hủy đơn</a>
                                        </c:if>
                                    </td>
                                    <td><a class="btn" href="admin/order/detail/${o.ordersId}.htm" style="c8olor: blue;">Chi tiết</a></td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                    <div>
                        <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
                    </div>
                </c:when>
            </c:choose>
        </div>
    </div>
    <%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>