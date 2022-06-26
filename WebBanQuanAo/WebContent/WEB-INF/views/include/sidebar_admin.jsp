<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="clothes.utils.Constants"%>
<div class="list-group shadow">
    <h4 style="color: BLUE; padding-top: 15px; text-align: center;">QUẢN LÝ ADMIN</h4>
    <a href="admin/product.htm" class="list-group-item list-group-item-action ${Constants.adminPanelIndex(requestScope['javax.servlet.forward.request_uri']) == 0 ? 'active' : '' }"> Quản lý sản phẩm</a>
    <a href="admin/mail.htm" class="list-group-item list-group-item-action ${Constants.adminPanelIndex(requestScope['javax.servlet.forward.request_uri']) == 1 ? 'active' : '' }"> Gửi mail</a>
    <a href="admin/order/index.htm" class="list-group-item list-group-item-action ${Constants.adminPanelIndex(requestScope['javax.servlet.forward.request_uri']) == 2 ? 'active' : '' }"> Quản lý đơn</a>
    <a href="admin/account.htm" class="list-group-item list-group-item-action ${Constants.adminPanelIndex(requestScope['javax.servlet.forward.request_uri']) == 3 ? 'active' : '' }"> Quản lý tài khoản</a>
</div>
<br />
