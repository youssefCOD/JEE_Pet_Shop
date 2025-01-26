<%@include file="header.jsp"%>
<%@page import="java.util.List" %>
<%@page import="models.Article" %>
<%@page import="models.Categorie" %>

<div class="center_content">
    <div class="left_content">
        <div class="title">
            <span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Featured Articles
        </div>

        <%
            List<Article> catSelected = (List<Article>) request.getAttribute("cat_selected");
            if (catSelected != null) {
                for (Article p : catSelected) {
        %>
                    <div class="feat_prod_box">
                        <div class="prod_img">
                            <a href="details.do?id=<%= p.getArticle_id() %>">
                                <img src="images/<%= p.getPhoto() %>" alt="" title="" border="0" />
                            </a>
                        </div>

                        <div class="prod_det_box">
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
        %>

        <div class="title">
    <span class="title_icon"><img src="images/bullet2.gif" alt="" title="" /></span>New Articles
</div>

<div class="new_products">
    <%
        List<Article> modelArticles = (List<Article>) request.getAttribute("modelArticles");
        if (modelArticles != null && !modelArticles.isEmpty()) {
            boolean hasNewArticles = false;
            for (Article p : modelArticles) {
                if ("new".equals(p.getStatus())) {
                    hasNewArticles = true;
    %>
                    <div class="new_prod_box">
                        <a href="details.do?id=<%= p.getArticle_id() %>"><%= p.getNom() %></a>
                        <div class="new_prod_bg">
                            <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
                            <a href="details.do?id=<%= p.getArticle_id() %>">
                                <img src="images/<%= p.getPhoto() %>" alt="" title="" class="thumb" border="0" />
                            </a>
                        </div>
                    </div>
    <%
                }
            }
            if (!hasNewArticles) {
    %>
                <p>No new articles available at the moment.</p>
    <%
            }
        } else {
    %>
            <p>No new articles available at the moment.</p>
    <%
        }
    %>
</div>

        <div class="clear"></div>
    </div>
    <!--end of left content-->
 
<%@include file="rightContent.jsp"%>    <!--end of right content-->

    <div class="clear"></div>
</div>
<!--end of center content-->

<%@include file="footer.jsp"%>
</body>
</html>