<%@page import="java.util.List" %>
<%@page import="java.util.Random" %>
<%@page import="models.Article" %> <!-- Import the Article model for pet details -->
<%@page import="models.Categorie" %> <!-- Import the Category model for pet categories -->
<%@include file="header.jsp"%>

<div class="center_content">
    <!-- Left Content Section -->
    <div class="left_content">
        <!-- Featured Pets Section -->
        <div class="title">
            <span class="title_icon">
                <img src="images/bullet1.gif" alt="" title="" />
            </span>
            Featured Pets
        </div>

        <% 
        // Fetch the list of pets from the request
        List<Article> modelArticles = (List<Article>) request.getAttribute("modelArticles");
        
        // Check if there are any pets available
        if (modelArticles != null && !modelArticles.isEmpty()) {
            // Randomly pick a pet to feature
            Random random = new Random();
            Article featuredPet = modelArticles.get(random.nextInt(modelArticles.size())); 
        %>
            <!-- Display the featured pet's details -->
            <div class="feat_prod_box">
                <div class="prod_img">
                    <a href="details.do?id=<%= featuredPet.getArticle_id() %>">
                        <img src="images/<%= featuredPet.getPhoto() %>" alt="Featured Pet" title="Featured Pet" border="0" />
                    </a>
                </div>
                <div class="prod_det_box">
                    <div class="box_top"></div>
                    <div class="box_center">
                        <div class="prod_title"><%= featuredPet.getNom() %></div>
                        <p class="details"><%= featuredPet.getDescription() %></p>
                        <a href="details.do?id=<%= featuredPet.getArticle_id() %>" class="more">- more details -</a>
                        <div class="clear"></div>
                    </div>
                    <div class="box_bottom"></div>
                </div>
                <div class="clear"></div>
            </div>
        <% 
        } else { 
        %>
            <!-- Show a message if no pets are available -->
            <p>No featured pets available at the moment. Check back later!</p>
        <% 
        } 
        %>

        <!-- New Pets Section -->
        <div class="title">
    <span class="title_icon"><img src="images/bullet2.gif" alt="" title="" /></span>New Articles
</div>

<div class="new_products">
    <%
        List<Article> mArticles = (List<Article>) request.getAttribute("modelArticles");
        if (mArticles != null && !mArticles.isEmpty()) {
            boolean hasNewArticles = false;
            for (Article p : mArticles) {
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
    <!-- End of Left Content -->

    <%@include file="rightContent.jsp"%>
   

    <div class="clear"></div>
</div>
<!-- End of Center Content -->

<%@include file="footer.jsp"%>
</body>
</html>