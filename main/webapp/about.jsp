<%@include file="header.jsp"%>
<%@page import="java.util.List" %>
<%@page import="models.Article" %> <!-- Import the Article model for pet details -->
<%@page import="models.Categorie" %> <!-- Import the Category model for pet categories -->

<div class="center_content">
    <div class="left_content">
        <div class="title">
            <span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>About us
        </div>

        <div class="feat_prod_box_details">
            <p class="details">
                <img src="images/about.gif" alt="" title="" class="right" /> Lorem
                ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                veniam, quis nostrud. Lorem ipsum dolor sit amet, consectetur
                adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. <br />
                <br /> Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                Ut enim ad minim veniam, quis nostrud. Lorem ipsum dolor sit amet,
                consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                nostrud.<br /> <br /> Lorem ipsum dolor sit amet, consectetur
                adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem
                ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                veniam, quis nostrud.
            </p>
        </div>

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