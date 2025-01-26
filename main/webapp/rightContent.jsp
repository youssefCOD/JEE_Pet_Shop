<%@page import="java.util.List" %>
<%@page import="models.Article" %> <!-- Import the Article model for pet details -->
<%@page import="models.Categorie" %> 
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
                List<Article> articles = (List<Article>) request.getAttribute("modelArticles");
                if (articles != null) {
                    for (Article p : articles) {
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
                    List<Categorie> categories = (List<Categorie>) request.getAttribute("modelCategories");
                    if (categories != null) {
                        for (Categorie p : categories) {
                %>
                            <li><a href="category.do?id=<%= p.getCategorie_id() %>"><%= p.getNom_categorie() %></a></li>
                <%
                        }
                    }
                %>
            </ul>
        </div>
    </div>
    <!--end of right content-->
