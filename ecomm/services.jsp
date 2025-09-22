<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services</title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            background-color: #fafafa;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #34495e;
            color: white;
            text-align: center;
            padding: 50px 0;
            border-bottom: 4px solid #2980b9;
            position: relative; /* Non-sticky */
        }
        header h1 {
            font-size: 3em;
            margin: 0;
        }
        header p {
            font-size: 1.25em;
            margin-top: 10px;
            color: #ecf0f1;
        }
        .menu-container {
            display: flex;
            justify-content: space-between; /* Separate menu links and buttons */
            align-items: center;
            background-color: #ffffff;
            padding: 20px 40px; /* Added spacing for a cleaner layout */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
            position: sticky; /* Sticky menu */
            top: 0;
            z-index: 1000;
        }
        .menu-links a {
            padding: 14px 32px; /* Increased spacing for menu links */
            text-decoration: none;
            font-size: 18px;
            color: #34495e;
            transition: 0.3s;
        }
        .menu-links a:hover {
            background-color: #2980b9;
            color: white;
        }
        .auth-buttons {
            display: flex;
            gap: 25px; /* Space between buttons */
        }
        .auth-buttons .sign-in, .auth-buttons .sign-up {
            text-decoration: none;
            font-size: 18px;
            padding: 12px 30px; /* Adjusted button size */
            border-radius: 5px;
            font-weight: bold;
            transition: 0.3s;
        }
        .auth-buttons .sign-in {
            color: #ffffff;
            background-color: #2980b9;
            border: 2px solid #2980b9;
        }
        .auth-buttons .sign-in:hover {
            background-color: #ffffff;
            color: #2980b9;
        }
        .auth-buttons .sign-up {
            color: #2980b9;
            background-color: #ffffff;
            border: 2px solid #2980b9;
        }
        .auth-buttons .sign-up:hover {
            background-color: #2980b9;
            color: #ffffff;
        }
        .container {
            width: 85%;
            margin: 0 auto;
            padding-top: 30px;
        }
        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px 0;
            margin-top: 50px;
            font-size: 1.1em;
        }
        footer p {
            margin: 0;
        }
        .content {
            margin-top: 30px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
        }
        .content h2 {
            font-size: 2em;
            color: #333;
            text-align: center;
        }
        .content p {
            font-size: 1.2em;
            color: #333;
            line-height: 1.6;
            text-align: justify;
        }
        .services-list {
            margin-top: 30px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
        }
        .services-list h3 {
            font-size: 1.5em;
            color: #333;
        }
        .services-list ul {
            list-style-type: none;
            font-size: 1.2em;
            padding: 0;
        }
        .services-list li {
            margin-bottom: 10px;
        }
	marquee {
            color: red;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
<header>
    <h1>Our Services - NextGen Nook</h1>
    <p>Discover What We Offer!</p>
</header>
<!-- Sticky menu container -->
<div class="menu-container">
    <div class="menu-links">
        <a href="home.jsp">Home</a>
        <a href="about.jsp">About</a>
        <a href="contacts.jsp">Contacts</a>
        <a href="products.jsp">Products</a>
        <a href="services.jsp">Services</a>
    </div>
    <div class="auth-buttons">
        <a href="login.html" class="sign-in">Sign in</a>
        <a href="signup.jsp" class="sign-up">Sign up</a>
    </div>
</div>
<div class="container">
    <div class="content">
        <h2>Our Services</h2>
        <p>At NextGen Nook, we offer a range of services designed to enhance your shopping experience. Our commitment to excellence is reflected in the quality of services we provide.</p>
    </div>
    <div class="services-list">
        <h3>Services We Provide</h3>
        <ul>
            <li><b>24/7 Customer Support:</b> Reach out to us anytime for assistance.</li>
            <li><b>Fast and Secure Shipping:</b> Get your products delivered quickly and safely.</li>
            <li><b>Easy Returns and Exchanges:</b> Hassle-free returns and exchanges for a seamless experience.</li>
            <li><b>Loyalty Program:</b> Enjoy exclusive rewards and discounts as a loyal customer.</li>
            <li><b>Personalized Recommendations:</b> Receive product recommendations tailored to your preferences.</li>
            <li><b>Gift Wrapping Services:</b> Add a special touch with our professional gift wrapping options.</li>
            <li><b>Exclusive Deals and Offers:</b> Stay updated with our latest deals and promotional offers.</li>
        </ul>
    </div>
</div>
<br>
<br>
<marquee>Dedicated to serving you better every day.</marquee>
<br>
<footer>
    <p>&copy; 2025 NextGen Nook | All rights reserved.</p>
</footer>
</body>
</html>