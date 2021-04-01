<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>N17DCAT001</title>
<base href="${pageContext.servletContext.contextPath }" />
<style>
<%@ include file="/resources/css/reset.css"%>
<%@ include file="/resources/css/manager-pr.css"%>
</style>
</head>
<body>
	    <div class="header">
        <div class="container-header">
            <div class="left-header">
                <img src=" ${pageContext.request.contextPath}/resources/img/logo/logo-sub.png" alt="">
            </div>
            <div class="right-header">
                <ul>
                    <li><a href="../anshop-final/admin/product.htm">Quản lý sản phẩm</a></li>
                    <li><a href="../anshop-final/admin/donhang.htm">Quản lý đơn hàng</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="main">
        <div class="main-right">
            <table>
                <tr>
                	<th>Mã đơn hàng</th>
                	<th>Ngày</th>
                    <th>Tên KH</th>
                    <th>SĐT</th>
                    <th>Email</th>
                    <th>Sản phẩm</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th></th>
                </tr>
            	
				<c:forEach var="a" items="${listdh}">
                		<tr>              	
                		<td>${a.order.id}</td>
                		<td>${a.order.date}</td>
                		<td>${a.order.customer.name}</td>
                		<td>${a.order.customer.phone}</td>
                		<td>${a.order.customer.email}</td>
                		<td>
                			<ul>
                				<c:forEach var="b" items="${listdh}">
                					<c:if test="${a.order.id == b.order.id}">
                						<li>- ${b.product.name} -Size: ${b.size} -SL: ${b.quanlity}</li>
                					</c:if>
                				</c:forEach>
                			</ul>
                		</td>
                		<td>${a.order.total}</td>
                		<c:if test="${a.order.status==0}">
                			<td>Đã xác nhận</td>
                		</c:if>
                		<c:if test="${a.order.status==1}">
                			<td>Chưa xác nhận</td>
                		</c:if>
                		<td>
                			<a href="${pageContext.request.contextPath}/admin/xacnhan.htm?id=${a.order.id}" >Xác nhận</a> 
                			<a href="${pageContext.request.contextPath}/admin/deleteod.htm?id=${a.order.id}">Xóa</a></td>
                		</td>	
                		</tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>