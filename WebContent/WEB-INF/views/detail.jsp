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
				<a href="${pageContext.request.contextPath}/home/index.htm"><img
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
	
	    <div class="container-detail">
        <div class="img-pro">
        <c:forEach var="a" items="${item}">
            <div class=" owl-carousel owl-theme ">
					 <div class="item-img">
                    <img src=" ${pageContext.request.contextPath}/resources/img/pro/${a.img1}" alt="">
                </div>
                <div class="item-img">
                    <img src=" ${pageContext.request.contextPath}/resources/img/pro/${a.img2}" alt="">
                </div>
                <div class="item-img">
                    <img src=" ${pageContext.request.contextPath}/resources/img/pro/${a.img3}" alt="">
                </div>
            </div>
            <div class="sub-img">
            	<img src=" ${pageContext.request.contextPath}/resources/img/pro/${a.img1}" alt="">
            	<img src=" ${pageContext.request.contextPath}/resources/img/pro/${a.img2}" alt="">
            	<img src=" ${pageContext.request.contextPath}/resources/img/pro/${a.img3}" alt="">
            </div>
        </c:forEach>
        </div>
        <div class="del-pro">
            <c:forEach var="pr" items="${item}">
            	<h1>${pr.name}</h1>
            	<h3>Màu : ${pr.coler}</h3>
	            <h3>Mã SP : ${pr.id}</h3>
				<div style="margin-top: 5px" class="price">
					<c:if test="${pr.sale==0}">
						<h2>Giá :
							<fmt:formatNumber pattern="###,### VND" value="${pr.price}"
								type="currency" />
						</h2>
					</c:if>
					<c:if test="${pr.sale!=0}">
						<div style="display: flex;">
						<del>
							<h2 style="margin-right: 10px">
								<fmt:formatNumber pattern="###,### VND" value="${pr.price}"
									type="currency" />
							</h2>
						</del>
						<h2>
							<fmt:formatNumber pattern="###,### VND"
								value="${pr.price - (pr.price*pr.sale)/100}" type="currency" />
						</h2>
						</div>
					</c:if>
				</div>
				<p class="content-del">${pr.content}</p>
				<button class="mua" ><a class="bt-mua" href="${pageContext.request.contextPath}/home/shopping-now.htm?id=${pr.id }&name=${pr.name }&coler=${pr.coler}&gia=${pr.price }&image=${pr.img1}">Mua ngay</a></button>
	        <button class="add"><a href="${pageContext.request.contextPath}/home/shopping-list.htm?id=${pr.id }&name=${pr.name }&coler=${pr.coler}&gia=${pr.price }&image=${pr.img1}">Thêm</a></button>
            <div class="tab-size">
                <img src=" ${pageContext.request.contextPath}/resources/img/banner/size.jpg" alt="">
            </div>
            </c:forEach>
        </div>
    </div>
    <div class="cart-left1">
        <button onclick="document.getElementById('cart1').style.display='block'">
            <span>0</span>
            <i class="fas fa-shopping-cart"></i>
        </button>
    </div>
    <div id="cart1" class="cart-cont1">
        <span onclick="document.getElementById( 'cart1').style.display='none' " class="close " title="Close Modal ">&times;</span>
        <h1>Giỏ Hàng</h1>
        <div class="item-cart ">
            <img src="img/product1.jpg " alt=" ">
            <div class="item-cart1 ">
                <a href=" ">Tên sản phẩm - mã sản phẩm</a>
                <div class="sl-tt ">
                    <input type="number ">
                    <h4>184.000 đ</h4>
                </div>
                <button class="del "><i class="far fa-times-circle "></i></button>
            </div>
        </div>
        <div class="item-cart ">
            <img src="img/product1.jpg " alt=" ">
            <div class="item-cart1 ">
                <a href=" ">Tên sản phẩm - mã sản phẩm</a>
                <div class="sl-tt ">
                    <input type="number ">
                    <h4>184.000 đ</h4>
                </div>
                <button class="del "><i class="far fa-times-circle "></i></button>
            </div>
        </div>
        <div class="sum ">
            <div class="s-t ">
                <h4>Thành Tiền</h4>
                <h4>184.000 đ</h4>
            </div>
            <a class="bt-tt " href=" ">Thanh Toán</a>
        </div>
    </div>
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
        modalus.style.display = "none ";
    }
}
var modallg = document.getElementById('login');
window.onclick = function(event) {
    if (event.target == modallg) {
        modallg.style.display = "none ";
    }
}
var modalsu = document.getElementById('sign-up');
window.onclick = function(event) {
    if (event.target == modalsu) {
        modalsu.style.display = "none ";
    }
}
var modalsu = document.getElementById('cart1');
window.onclick = function(event) {
    if (event.target == modalsu) {
        modalsu.style.display = "none ";
    }
}
</script>
</html>