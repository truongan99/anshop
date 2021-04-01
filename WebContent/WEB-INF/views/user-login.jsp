<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<%@ include file="/resources/css/user-login.css"%>
*[id$=errors]{
	color:red;
	font-style: italic;
}
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
	<div class="login-container">
        <div id="login" class="login-box">
            <div class="login-content">
                <img src="/img/AN.png" alt="">
                <h2>${tb}</h2>
                <h1>Đăng Nhập</h1>
                <form class="login-form"  action="${pageContext.request.contextPath}/home/login.htm" method="post">
                    <div class="usern">
                        <label for="uname"><b>Username</b></label>
                        <input type="text" placeholder="Enter Username" name="user" required>
                    </div>
                    <div class="usern">
                        <label for="psw"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="pass" required>
                    </div>
                    <button >Login</button>
                </form>
                <div class="login-bottom">
                    <span class="psw">Forgot <a href="#">password?</a></span>
                    <button><a  href="${pageContext.request.contextPath}/home/sign-up.htm"> Đăng kí</a></button>
                </div>
            </div>
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
            modalus.style.display = "none";
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