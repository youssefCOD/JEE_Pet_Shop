<%@include file="header.jsp"%>
<%@page import="java.util.List" %>
<%@page import="models.Article" %>
<%@page import="models.Categorie" %>

<div class="center_content">
    <div class="left_content">
        <div class="title">
            <span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Contact Us
        </div>

        <div class="feat_prod_box_details">
            <p class="details">Lorem ipsum dolor sit amet, consectetur
                adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem
                ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                veniam, quis nostrud.</p>

            <div class="contact_form">
                <div class="form_subtitle">All fields are required</div>
                <form method="post" action="contact.do">
                    <div class="form_row">
                        <label class="contact"><strong>Name:</strong></label> 
                        <input type="text" name="name" class="contact_input" required />
                    </div>

                    <div class="form_row">
                        <label class="contact"><strong>Email:</strong></label> 
                        <input type="email" name="email" class="contact_input" required />
                    </div>

                    <div class="form_row">
                        <label class="contact"><strong>Phone:</strong></label> 
                        <input type="text" name="phone" class="contact_input" required />
                    </div>

                    <div class="form_row">
                        <label class="contact"><strong>Company:</strong></label> 
                        <input type="text" name="company" class="contact_input" />
                    </div>

                    <div class="form_row">
                        <label class="contact"><strong>Message:</strong></label>
                        <textarea name="message" class="contact_textarea" required></textarea>
                    </div>

                    <div class="form_row">
                        <button type="submit" class="submit_button">Submit</button>
                    </div>
                </form>
            </div>
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