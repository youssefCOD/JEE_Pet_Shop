<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="center_content">
	<div class="left_content">
		<div class="title">
			<span class="title_icon"><img src="images/bullet1.gif" alt=""
				title="" /></span>Featured pets
		</div>

		<c:forEach items="${modelArticles}" var="p">
			<c:if test="${ p.getArticle_id()%5==0}">
				<div class="feat_prod_box">
					<div class="prod_img">
						<a href="details.do?id=${p.getArticle_id()}"><img
							src="images/${p.getPhoto()}" alt="" title="" border="0" /></a>
					</div>

					<div class="prod_det_box">
						<div class="box_top"></div>
						<div class="box_center">
							<div class="prod_title">${p.getNom()}</div>
							<p class="details">${p.getDescription()}</p>
							<a href="details.do?id=${p.getArticle_id()}" class="more">-
								more details -</a>
							<div class="clear"></div>
						</div>

						<div class="box_bottom"></div>
					</div>
					<div class="clear"></div>
				</div>
			</c:if>
		</c:forEach>

		<div class="title">
			<span class="title_icon"><img src="images/bullet2.gif" alt=""
				title="" /></span>New pets
		</div>

		<div class="new_products">
			<c:forEach items="${modelArticles}" var="p">
				<c:if test="${ p.getStatus().equals('new')}">
					<div class="new_prod_box">
						<a href="details.do?id=${p.getArticle_id()}">${p.getNom()}</a>
						<div class="new_prod_bg">
							<span class="new_icon"><img src="images/new_icon.gif"
								alt="" title="" /></span> <a href="details.do?id=${p.getArticle_id()}"><img
								src="images/${p.getPhoto()}" alt="" title="" class="thumb"
								border="0" /></a>
						</div>
					</div>
				</c:if>
			</c:forEach>
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
			<span class="red">Currency: </span> <a class="selected">GBP</a> <a
				class="selected">EUR</a> <a class="selected">USD</a>
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
				<a href="cart.do?userid=${sessionScope.userid }" class="view_cart">view
					cart</a>
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

<div class="footer">
	<div class="left_footer">
		<img src="images/footer_logo.gif" alt="" title="" /><br /> <a
			href="http://csscreme.com/freecsstemplates/"
			title="free css templates"><img src="images/csscreme.gif"
			alt="free css templates" border="0" /></a>
	</div>
	<div class="right_footer">
		<a href="#">home</a> <a href="#">about us</a> <a href="#">services</a>
		<a href="#">privacy policy</a> <a href="#">contact us</a>
	</div>
</div>

</div>

</body>
</html>
