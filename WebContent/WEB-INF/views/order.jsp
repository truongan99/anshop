<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>N17DCAT001</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/slider.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/sub.js"></script>
<base href="${pageContext.servletContext.contextPath }" />
<style>
<%@ include file="/resources/css/reset.css"%>
<%@ include file="/resources/css/index.css"%>
<%@ include file="/resources/css/home.css"%>
<%@ include file="/resources/css/list-pro.css"%>
<%@ include file="/resources/css/pro-del.css"%>
<%@ include file="/resources/css/checkout.css"%>
</style>
</head>
<body>
	<header>
		<div class="container">
			<div class="logo">
				<a href=""><img
					src=" ${pageContext.request.contextPath}/resources/img/logo/AN.png" alt=""></a>
			</div>
			<div class="contener1">
					<ul class="navbar">
						<c:forEach var="menu1" items="${menu}">
							<c:if test="${menu1.parentid==null}">
								<li>
									<a href="${pageContext.request.contextPath}/${menu1.link}">${menu1.name}</a>
									<div class="sub-menu">
										<div class="sub-menu1">
											<ul>
												<c:forEach var="menu2" items="${menu}">
													<c:if test="${menu2.parentid==menu1.id}">
														<li><a href="${pageContext.request.contextPath}/list/${menu2.link}.htm">${menu2.name }</a></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
                <div class="navbar-right">
                    <div class="search">
                        <input class="ip-search" />
                        <button><i class="fas fa-search icon-search"></i></button>
                    </div>
                    <button><i class="fas fa-shopping-cart"></i></button>
                    <button onclick="document.getElementById('user').style.display='block'"><i class="fas fa-user"></i></button>
                </div>
			</div>
		</div>
		        <div id="user" class="user-box">
            <span onclick="document.getElementById('user').style.display='none'" class="close" title="Close Modal">&times;</span>
            <div class="user-content">
                <div class="content-top">
                    <i class="fas fa-user-circle"></i>
                    <a href="">${username}</a>
                </div>
                <div class="content-bottom">
                    <button > <a href="${pageContext.request.contextPath}/home/login.htm"> Đăng nhập</a> </button>
                    <button > <a href="${pageContext.request.contextPath}/home/sign-up.htm"> Đăng kí</a> </button>
                </div>
            </div>
        </div>
	</header>
	<h1 style="text-align: center; margin: 10px 0px;  " >${message}</h1>
    <form:form action="${pageContext.request.contextPath}/home/order.htm" >
        <div class="container-checkout">
        
            <div class="left">
                <div class="left-cont">
                    <h1>Thông tin giao hàng</h1>
                    <input  name="name" placeholder="Họ và tên"/>
                    <input name="phone" placeholder="Số điện thoại"/>
                    <input name="email" placeholder="Email"/>
                    <input name="address" placeholder="Địa chỉ nhận hàng"/>
                    <input name="code" placeholder="Mã giảm giá"/>
                    <div class="cod">
                        <h1>Phí giao hàng</h1>
                        <h1>30.000 đ</h1>
                    </div>
                    <div class="cod">
                        <h1>Tổng</h1>
                        <h1><fmt:formatNumber pattern="###,### VND" value="${tongTien}" type="currency" /></h1> 
                    </div>
                    <div class="cod">
                        <h1>Số tiền phải thanh toán</h1>
                        <h1><fmt:formatNumber pattern="###,### VND" value="${tongTien +30000}" type="currency" /></h1> 
                    </div>
                    <button style="width: 100%;height: 40px;margin: 10px 0px;background-color: #2AC37D;color: white;font-size: 18px;"><a >Đặt hàng</a></button>
                </div>
            </div>
            <div class="right">
                <div class="right-cont">
                	<h1>${tbb}</h1>
                    <h1>Giỏ Hàng</h1>
					<c:forEach var="a" items="${cart}">
					<div class="item-cart ">
                        <img src="${pageContext.request.contextPath}/resources/img/pro/${a.image}" alt=" ">
                        <div class="item-cart1 ">
                            <a class="pr"  href=" ">${a.tenSanPham}</a>
                            <div class="sl-tt ">
                                <select   name="size${a.idSanPham}" id="size" class="size">
		                        <c:forEach var="sz" items="${prode}">
		                       		<c:if test="${sz.product.id==a.idSanPham}">
		                       		<c:choose>
		                       			<c:when test="${a.size==sz.size}">
		                       				<option selected="selected" value="${sz.size}">${sz.size}(${sz.quanlity})</option>
		                       			</c:when>
		                       			<c:otherwise><option value="${sz.size}">${sz.size}(${sz.quanlity})</option></c:otherwise>
		                       		</c:choose>
		                       		</c:if>
		                       </c:forEach>   
                                </select >
                                <c:forEach var="sz" items="${prode}">
                                	<c:if test="${sz.product.id==a.idSanPham && sz.size == a.size}">
                                		<input type="number" name="sl${a.idSanPham}" min="0" max="${sz.quanlity}" value="${a.soLuong}" >
                                	</c:if>
                                </c:forEach>
                                <h4><fmt:formatNumber pattern="###,### VND" value="${a.giaSanPham*a.soLuong}" type="currency" /></h4>                     
                            </div>
                            <a class="del" href="${pageContext.request.contextPath}/home/deletecart-od.htm?idSanPham=${a.idSanPham}"><i class="far fa-times-circle "></i></a>
                        </div>
                    </div>
					</c:forEach>
                    <div class="sum ">
                        <div class="s-t ">
                            <h4>Thành Tiền</h4>
                            <h4><fmt:formatNumber pattern="###,### VND" value="${tongTien}" type="currency" /></h4> 
                        </div>
                    </div>
                    <input style="width: 100%;height: 40px;margin: 10px 0px;background-color: #2AC37D;color: white;font-size: 18px;" type="submit" formaction="${pageContext.request.contextPath}/home/order-pr.htm" value="Cập nhật giỏ hàng">
                </div>
            </div>
        </div>
    </form:form>
    <footer>
        <div class="footer-cont">
            <img src="${pageContext.request.contextPath}/resources/img/logo/footer.svg" alt="">
            <ul>
                Sản phẩm
                <li><a href="">Nam</a></li>
                <li><a href="">Nữ</a></li>
                <li><a href="">Thương hiệu</a></li>
                <li><a href="">Sale-off</a></li>
            </ul>
            <ul>
                Liên hệ
                <li><a href="">Email : anshop@gmail.com</a></li>
                <li><a href="">Hotline : 0966669999</a></li>
            </ul>
            <ul>
                Hỗ Trợ
                <li><a href="">FAQs</a></li>
                <li><a href="">Chính sách chung</a></li>
                <li><a href="">Tra cứu đơn hàng</a></li>
            </ul>
        </div>
        <h1>Copyright © 2020 AnShop. All rights reserved.</h1>
    </footer>
</body>
<script>
    // Get the modal
    var modalus = document.getElementById('user');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modalus) {
            modalus.style.display = "none";
        }
    }
    var modallg = document.getElementById('login');
    window.onclick = function(event) {
        if (event.target == modallg) {
            modallg.style.display = "none";
        }
		
    }
    var modalsu = document.getElementById('sign-up');
    window.onclick = function(event) {
        if (event.target == modalsu) {
            modalsu.style.display = "none";
        }
    }
    var modalsu = document.getElementById('cart');
    window.onclick = function(event) {
        if (event.target == modalsu) {
            modalsu.style.display = "none";
        }
    }
</script>
</html>