<%@include file="header.jsp"%>
<%@page import="models.Article" %>
<%@page import="models.Categorie" %>
<%@page import="java.util.List" %>

<div class="center_content">
    <div class="left_content">
        <div class="crumb_nav">
            <a href="index.do">home</a> &gt;&gt; <%= ((Article) request.getAttribute("article_selected")).getNom() %>
        </div>
        <div class="title">
            <span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Product name
        </div>

        <div class="feat_prod_box_details">
            <div class="prod_img">
                <a><img src="images/<%= ((Article) request.getAttribute("article_selected")).getPhoto() %>" alt="" title="" border="0" /></a> 
                <br /> <br /> 
                <a href="images/<%= ((Article) request.getAttribute("article_selected")).getPhoto() %>" rel="lightbox">
                    <img src="images/zoom.gif" alt="" title="" border="0" />
                </a>
            </div>

            <div class="prod_det_box">
                <div class="box_top"></div>
                <div class="box_center">
                    <div class="prod_title">Details</div>
                    <p class="details"><%= ((Article) request.getAttribute("article_selected")).getDescription() %></p>
                    <div class="price">
                        <strong>PRICE:</strong> <span class="red"><%= ((Article) request.getAttribute("article_selected")).getPrix() %> $</span>
                    </div>
                    <div class="price">
                        <strong>COLORS:</strong> 
                        <span class="colors"><img src="images/color1.gif" alt="" title="" border="0" /></span> 
                        <span class="colors"><img src="images/color2.gif" alt="" title="" border="0" /></span> 
                        <span class="colors"><img src="images/color3.gif" alt="" title="" border="0" /></span>
                    </div>

                    <%
                        if (session.getAttribute("userid") != null) {
                    %>
                            <a href="order.do?userid=<%= session.getAttribute("userid") %>&article_id=<%= ((Article) request.getAttribute("article_selected")).getArticle_id() %>" class="more">
                                <img src="images/order_now.gif" alt="" title="" border="0" />
                            </a>
                    <%
                        } else {
                    %>
                            <a href="myaccount.do" class="more">
                                <img src="images/order_now.gif" alt="" title="" border="0" />
                            </a>
                    <%
                        }
                    %>

                    <div class="clear"></div>
                </div>

                <div class="box_bottom"></div>
            </div>
            <div class="clear"></div>
        </div>

        <div id="demo" class="demolayout">
            <ul id="demo-nav" class="demolayout">
                <li><a class="active" href="#tab1">More details</a></li>
            </ul>

            <div class="tabs-container">
                <div style="display: block;" class="tab" id="tab1">
                    <p class="more_details">Lorem ipsum dolor sit amet, consectetur
                        adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                        exercitation.</p>
                    <ul class="list">
                        <li><a href="#">Lorem ipsum dolor sit amet, consectetur
                                adipisicing elit</a></li>
                        <li><a href="#">Lorem ipsum dolor sit amet, consectetur
                                adipisicing elit</a></li>
                        <li><a href="#">Lorem ipsum dolor sit amet, consectetur
                                adipisicing elit</a></li>
                        <li><a href="#">Lorem ipsum dolor sit amet, consectetur
                                adipisicing elit</a></li>
                    </ul>
                    <p class="more_details">Lorem ipsum dolor sit amet, consectetur
                        adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                        exercitation.</p>
                </div>
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
            <%
                if (session.getAttribute("userid") != null) {
            %>
                <div class="title">
                    <span class="title_icon"><img src="images/cart.gif" alt="" title="" /></span>My cart
                </div>
                <div class="home_cart_content">
                    <span class="red"><%= session.getAttribute("username") %></span>
                </div>
                <a href="cart.do?userid=<%= session.getAttribute("userid") %>" class="view_cart">view cart</a>
            <%
                }
            %>
        </div>

        <div class="title">
            <span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>About Our Shop
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
                <span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>Promotions
            </div>
            <%
                List<Article> modelArticles = (List<Article>) request.getAttribute("modelArticles");
                if (modelArticles != null) {
                    for (Article p : modelArticles) {
                        if ("promo".equals(p.getStatus())) {
            %>
                            <div class="new_prod_box">
                                <a href="details.do?id=<%= p.getArticle_id() %>"><%= p.getNom() %></a>
                                <div class="new_prod_bg">
                                    <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                                    <a href="details.do?id=<%= p.getArticle_id() %>">
                                        <img src="images/<%= p.getPhoto() %>" alt="" title="" class="thumb" border="0" />
                                    </a>
                                </div>
                            </div>
            <%
                        }
                    }
                }
            %>
        </div>

        <div class="right_box">
            <div class="title">
                <span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>Categories
            </div>

            <ul class="list">
                <%
                    List<Categorie> modelCategories = (List<Categorie>) request.getAttribute("modelCategories");
                    if (modelCategories != null) {
                        for (Categorie p : modelCategories) {
                %>
                            <li><a href="#"><%= p.getNom_categorie() %></a></li>
                <%
                        }
                    }
                %>
            </ul>
        </div>
    </div>
    <!--end of right content-->

    <div class="clear"></div>
</div>
<!--end of center content-->

<%@include file="footer.jsp"%>
</body>
<script type="text/javascript">
    var tabber1 = new Yetii({
        id: "demo",
    });
</script>
</html>