<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="center_content">
	<div class="left_content">
		<div class="title">
			<span class="title_icon"><img src="images/bullet1.gif" alt=""
				title="" /></span>Register
		</div>

		<div class="feat_prod_box_details">
			<p class="details">Lorem ipsum dolor sit amet, consectetur
				adipisicing elit, sed do eiusmod tempor incididunt ut labore et
				dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem
				ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
				tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
				veniam, quis nostrud.</p>

			<div class="contact_form">
				<div class="form_subtitle">Create a new account</div>

				<form name="register" action="reg.do" method="post">
					<div class="form_row">
						<label class="contact"><strong>Username:</strong></label> <input
							name="username" type="text" class="contact_input" required />
					</div>

					<div class="form_row">
						<label class="contact"><strong>Password:</strong></label> <input
							name="password" type="password" class="contact_input" required />
					</div>

					<div class="form_row">
						<label class="contact"><strong>Email:</strong></label> <input
							name="email" type="email" class="contact_input" required />
					</div>

					<div class="form_row">
						<label class="contact"><strong>Phone:</strong></label> <input
							name="phone" type="text" class="contact_input" required />
					</div>

					<div class="form_row">
						<label class="contact"><strong>Company:</strong></label> <input
							name="company" type="text" class="contact_input" />
					</div>

					<div class="form_row">
						<label class="contact"><strong>Address:</strong></label> <input
							name="adrres" type="text" class="contact_input" required />
					</div>

					<div class="form_row">
						<button type="submit" class="register">Submit</button>
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
