<%@include file="header.jsp"%>
<%@page import="java.util.List" %>
<%@page import="models.Article" %>
<%@page import="models.Categorie" %>

<div class="center_content">
    <div class="left_content">
        <div class="title">
            <span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Special Gifts
        </div>

        <%
            List<Article> modelArticles = (List<Article>) request.getAttribute("modelArticles");
            if (modelArticles != null) {
                for (Article p : modelArticles) {
                    if ("spec".equals(p.getStatus())) {
        %>
                        <div class="feat_prod_box">
                            <div class="prod_img">
                                <a href="details.do?id=<%= p.getArticle_id() %>">
                                    <img src="images/<%= p.getPhoto() %>" alt="" title="" border="0" />
                                </a>
                            </div>

                            <div class="prod_det_box">
                                <span class="special_icon">
                                    <img src="images/special_icon.gif" alt="" title="" />
                                </span>

                                <div class="box_top"></div>
                                <div class="box_center">
                                    <div class="prod_title"><%= p.getNom() %></div>
                                    <p class="details"><%= p.getDescription() %></p>
                                    <a href="details.do?id=<%= p.getArticle_id() %>" class="more">- more details -</a>
                                    <div class="clear"></div>
                                </div>

                                <div class="box_bottom"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
        <%
                    }
                }
            }
        %>

        <%
            if (modelArticles != null) {
                for (Article p : modelArticles) {
                    if ("promo".equals(p.getStatus())) {
        %>
                        <div class="new_prod_box">
                            <a href="details.do?id=<%= p.getArticle_id() %>"><%= p.getNom() %></a>
                            <div class="new_prod_bg">
                                <span class="new_icon">
                                    <img src="images/promo_icon.gif" alt="" title="" />
                                </span>
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

        <div class="clear"></div>
    </div>
    <!--end of left content-->

    <%@include file="rightContent.jsp"%>

    <div class="clear"></div>
</div>
<!--end of center content-->

<%@include file="footer.jsp"%>
</body>
</html>