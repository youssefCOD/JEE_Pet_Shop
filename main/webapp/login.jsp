<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="center_content">
	<div class="left_content">
		<div class="title">
			<span class="title_icon"><img src="images/bullet1.gif" alt=""
				title="" /></span>My Account
		</div>

		<div class="feat_prod_box_details">
			<p class="details">Lorem ipsum dolor sit amet, consectetur
				adipisicing elit, sed do eiusmod tempor incididunt ut labore et
				dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem
				ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
				tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
				veniam, quis nostrud.</p>

			<div class="contact_form">
				<div class="form_subtitle">Login to your account</div>

				<form name="login" action="login.do" method="post">
					<div class="form_row">
						<label class="contact"><strong>Username:</strong></label> <input
							name="username" type="text" class="contact_input" required />
					</div>

					<div class="form_row">
						<label class="contact"><strong>Password:</strong></label> <input
							name="password" type="password" class="contact_input" required />
					</div>

					<div class="form_row">
						<button type="submit">Submit</button>
					</div>
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	<!--end of left content-->

	<div class="right_content">
		<div class="languages_box">
			<div id="google_translate_element"></div>

			<script type="text/javascript">
                function googleTranslateElementInit() {
                    new google.translate.TranslateElement({ pageLanguage: "en" }, "google_translate_element");
                }
            </script>

			<script type="text/javascript"
				src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
		</div>
		<div class="currency">
			<span class="red">Currency: </span> <a href="#">GBP</a> <a href="#">EUR</a>
			<a href="#"><strong>USD</strong></a>
		</div>

		<div class="cart">
			<c:if test="${ !empty sessionScope.userid }">
				<div class="title">
					<span class="title_icon"><img src="images/cart.gif" alt=""
						title="" /></span>My cart
				</div>
				<div class="home_cart_content">
					<span class="red">${sessionScope.username}</span>
				</div>
				<a href="cart.do?userid=${sessionScope.userid }" class="view_cart">View
					Cart</a>
			</c:if>
		</div>

		<div class="title">
			<span class="title_icon"><img src="images/bullet3.gif" alt=""
				title="" /></span>About Our Shop
		</div>
		<div class="about">
			<p>
				<img src="images/about.gif" alt="" title="" class="right" /> Lorem
				ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
				tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
				veniam, quis nostrud.
			</p>
		</div>

		<div class="right_box">
			<div class="title">
				<span class="title_icon"><img src="images/bullet4.gif" alt=""
					title="" /></span>Promotions
			</div>
			<c:forEach items="${modelArticles}" var="p">
				<c:if test="${ p.getStatus().equals('promo')}">
					<div class="new_prod_box">
						<a href="details.do?id=${p.getArticle_id()}">${p.getNom()}</a>
						<div class="new_prod_bg">
							<span class="new_icon"><img src="images/promo_icon.gif"
								alt="" title="" /></span> <a href="details.do?id=${p.getArticle_id()}"><img
								src="images/${p.getPhoto()}" alt="" title="" class="thumb"
								border="0" /></a>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<div class="right_box">
			<div class="title">
				<span class="title_icon"><img src="images/bullet5.gif" alt=""
					title="" /></span>Categories
			</div>

			<ul class="list">
				<c:forEach items="${modelCategories}" var="p">
					<li><a href="category.do?id=${p.getCategorie_id()}">${p.getNom_categorie()}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!--end of right content-->

	<div class="clear"></div>
</div>
<!--end of center content-->

<%@include file="footer.jsp"%>
</html>
