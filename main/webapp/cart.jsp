<%@include file="header.jsp"%>
<%@page import="java.util.List" %>
<%@page import="models.Article" %>
<%@page import="models.Categorie" %>
<%@page import="models.Purchase" %>

<div class="center_content">
    <div class="left_content">
        <div class="title">
            <span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My cart
        </div>

        <div class="feat_prod_box_details">
            &gt;&gt; <%= session.getAttribute("username") %> <br />
            <table class="cart_table">
                <tr class="cart_title">
                    <td>Item pic</td>
                    <td>Product name</td>
                    <td>Unit price</td>
                    <td>Qty</td>
                    <td>Total</td>
                </tr>

                <%
                    List<Purchase> purshases = (List<Purchase>) request.getAttribute("purshases");
                    if (purshases != null) {
                        for (Purchase  a : purshases) {
                        	Article p = a.getArticle();
                %>
                            <tr>
                                <td>
                                    <a href="details.do?id=<%= p.getArticle_id() %>">
                                        <img src="images/<%= p.getPhoto() %>" alt="" title="" border="0" class="cart_thumb" width="50%" />
                                    </a>
                                </td>
                                <td><%= p.getNom() %></td>
                                <td><%= p.getPrix() %>$</td>
                                <td><%= a.getQuantity() %></td>
                                <td><%= p.getPrix() %>$</td>
                            </tr>
                <%
                        }
                    }
                %>

                <tr>
                    <td colspan="4" class="cart_total"><span class="red">TOTAL SHIPPING:</span></td>
                    <td><%= request.getAttribute("totalCount") %></td>
                </tr>

                <tr>
                    <td colspan="4" class="cart_total"><span class="red">TOTAL:</span></td>
                    <td><%= request.getAttribute("total") %>$</td>
                </tr>
            </table>
            <a href="#" class="continue">&lt; continue</a>
            <a href="#" class="checkout">checkout &gt;</a>
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
                            <li><a href="category.do?id=<%= p.getCategorie_id() %>"><%= p.getNom_categorie() %></a></li>
                <%
                        }
                    }
                %>
            </ul>
        </div>
    </div>
	<%@include file="rightContent.jsp"%>    <!--end of right content-->

    <div class="clear"></div>
</div>
<!--end of center content-->

<%@include file="footer.jsp"%>
</body>
</html>