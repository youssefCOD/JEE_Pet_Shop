<%@include file="header.jsp"%>
<%@page import="java.util.List" %>
<%@page import="models.Article" %>
<%@page import="models.Categorie" %>

<div class="center_content">
    <div class="left_content">
        <div class="crumb_nav">
            <a href="index.do">home</a>
        </div>
        <div class="title">
            <span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Category Pets
        </div>

        <div class="new_products">
            <%
                List<Article> modelArticles = (List<Article>) request.getAttribute("modelArticles");
                if (modelArticles != null) {
                    for (Article p : modelArticles) {
            %>
                        <div class="new_prod_box">
                            <a href="details.do?id=<%= p.getArticle_id() %>"><%= p.getNom() %></a>
                            <div class="new_prod_bg">
                                <a href="details.do?id=<%= p.getArticle_id() %>">
                                    <img src="images/<%= p.getPhoto() %>" alt="" title="" class="thumb" border="0" />
                                </a>
                            </div>
                        </div>
            <%
                    }
                }
            %>
        </div>

        <div class="clear"></div>
    </div>
    <!--end of left content-->

<%@include file="rightContent.jsp"%>
    <!--end of right content-->

    <div class="clear"></div>
</div>
<!--end of center content-->

<%@include file="footer.jsp"%>
</body>
</html>