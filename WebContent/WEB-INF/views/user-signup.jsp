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
<%@ include file="/resources/css/user-sighup.css"%>
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
	<div class="container-dangki">
	        <div id="sign-up" class="sign-up-box">
            <div class="sign-up-content">
                <img src="/img/AN.png" alt="">
                <h2>${tb}</h2>
                <h1>Đăng Kí</h1>
					<form:form class="sign-up-form" action="${pageContext.request.contextPath}/home/sign-up.htm" modelAttribute="User">
						<div class="usern">
							<div>Tài Khoản</div>
							<form:input path="username"/>
							<form:errors path="username"/>
						</div>
						<div class="usern">
							<div>Mật khẩu</div>
							<form:input type="password" path="password"/>
							<form:errors path="password"/>
						</div>
						<div class="usern">
							<div>Xác nhận mật khẩu</div>
							<form:input name="rpass" type="password" path=""/>
						</div>
						<div class="usern">
							<div>Họ và tên</div>
							<form:input path="fullname"/>
							<form:errors path="fullname"/>
						</div>
						<div class="usern">
							<div>Ngày sinh</div>
							<form:input placeholder="MM/DD/YYYY" path="birthday"/>
							<form:errors path="birthday"/>
						</div>
						<div class="usern">
							<div>Địa chỉ</div>
							<form:input path="address"/>
							<form:errors path="address"/>
						</div>						
						<div class="usern">
							<div>Email</div>
							<form:input type="email" path="email"/>
							<form:errors path="email"/>
						</div>
						<div class="usern">
							<div>Phone</div>
							<form:input path="phone"/>
							<form:errors path="phone"/>
						</div> 
						<div class = "gender">
						<form:radiobutton path="gender" value="1" label="Nam"/>
						<form:radiobutton path="gender" value="0" label="Nữ" />
						<form:errors path="gender"/>
						</div>		

						<div>
							<button>Đăng kí</button>
						</div>

					</form:form>
                
               
                <div class="sign-up-bottom">
						<p> <a href="${pageContext.request.contextPath}/home/login.htm">Đăng nhập </a>ngay </p>
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