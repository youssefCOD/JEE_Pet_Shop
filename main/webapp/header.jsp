<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252" />
<title>Animal Shop</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	<div id="wrap">

		<div class="header">
			<div class="logo">
				<a href="index.do"><img src="images/logo.gif" alt="" title=""
					border="0" /></a>
			</div>
			<div id="menu">
				<ul>
					<li><a href="index.do">home</a></li>
					<li><a href="about.do">about us</a></li>
					<li><a href="articles.do">articles</a></li>
					<li><a href="specials.do">special offers</a></li>

					<%
                        if (session.getAttribute("userid") == null) {
                    %>
                            <li><a href="myaccount.do">my account</a></li>
                            <li><a href="register.do">register</a></li>
                    <%
                        }
                    %>

                    <li><a href="contact.do">contact</a></li>

                    <%
                        if (session.getAttribute("userid") != null) {
                    %>
                            <li><a href="cart.do?userid=<%= session.getAttribute("userid") %>">cart</a></li>
                            <li><a href="logout.do">logout</a></li>
                    <%
                        }
                    %>
				</ul>
			</div>
		</div>

