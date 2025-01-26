<%@include file="header.jsp"%>
<%@page import="java.util.List" %>
<%@page import="models.Article" %>
<%@page import="models.Categorie" %>

<div class="center_content">
    <div class="left_content">
        <div class="title">
            <span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My Account
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
                        <label class="contact"><strong>Username:</strong></label> 
                        <input name="username" type="text" class="contact_input" required />
                    </div>

                    <div class="form_row">
                        <label class="contact"><strong>Password:</strong></label> 
                        <input name="password" type="password" class="contact_input" required />
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
<%@include file="rightContent.jsp"%>
    <div class="clear"></div>
</div>
<!--end of center content-->

<%@include file="footer.jsp"%>
</body>
</html>