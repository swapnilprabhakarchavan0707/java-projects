<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
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
            padding: 20px 40px; /* Further increased padding for better spacing */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
            position: sticky; /* Sticky position */
            top: 0; /* Sticks to the top of the page */
            z-index: 1000;
        }

        .menu-links a {
            padding: 14px 32px; /* Increased padding around menu text */
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
            gap: 25px; /* Increased space between the buttons */
        }

        .auth-buttons .sign-in, .auth-buttons .sign-up {
            text-decoration: none;
            font-size: 18px;
            padding: 12px 30px; /* Further increased padding for better button size */
            border-radius: 5px;
            transition: 0.3s;
            font-weight: bold;
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
            display: flex;
            flex-wrap: wrap; /* Allows wrapping for responsiveness */
            gap: 20px; /* Adds space between items */
        }

        .image-container {
            flex: 0 0 30%; /* Occupies 30% of the container width */
            max-width: 300px; /* Optional: Limit image width */
            order: 1; /* Ensures the image appears on the left */
        }

        .image-container img {
            width: 100%; /* Responsive image */
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .content-box {
            flex: 1 1 65%; /* Content boxes occupy 65% of the width */
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
            padding: 20px;
            order: 2; /* Content appears to the right of the image */
        }

        .content-box h2 {
            font-size: 2em;
            color: #333;
            text-align: center;
        }

        .content-box p, .content-box ul {
            font-size: 1.2em;
            color: #333;
            line-height: 1.6;
            text-align: justify;
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

	marquee {
            color: red;
            font-size: 1.2em;
        }
    </style>
</head>
<body>

<header>
    <h1>About NextGen Noook</h1>
    <p>Your Trusted Partner in E-commerce Excellence</p>
</header>

<!-- Menu below header -->
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
    <!-- Image Container -->
    <div class="image-container">
        <img src="logo.jpg" alt="About Us Image">
    </div>

    <!-- Content Boxes -->
    <div class="content-box">
        <h2>Who We Are</h2>
        <p>Welcome to NextGen Noook, a leading e-commerce platform dedicated to providing high-quality products and exceptional customer service. Founded with the vision to revolutionize the online shopping experience, NextGen Noook has grown into a trusted name in the industry.</p>
    </div>
    <div class="content-box">
        <h2>Our Mission</h2>
        <p>At NextGen Noook, our mission is to empower our customers by offering a diverse range of premium products at competitive prices. We are committed to excellence in every aspect of our business, from product selection to customer support, ensuring a seamless and satisfying shopping experience for all our clients.</p>
    </div>
    <div class="content-box">
        <h2>What We Offer</h2>
        <p>Our extensive product catalog includes the latest electronics, fashion-forward apparel, state-of-the-art home appliances, and much more. We carefully curate our selection to ensure that every item meets the highest standards of quality and reliability. Our dedication to innovation and customer satisfaction sets us apart from the competition.</p>
    </div>
    <div class="content-box">
        <h2>Why Choose Us?</h2>
        <ul>
            <li><b>Exclusive Products:</b> We offer a unique collection of products that you won't find anywhere else.</li>
            <li><b>Exceptional Customer Service:</b> Our dedicated support team is always ready to assist you with any queries or concerns.</li>
            <li><b>Secure Shopping:</b> We prioritize your security, ensuring that your personal information is protected at all times.</li>
            <li><b>Fast Shipping:</b> Enjoy prompt and reliable delivery of your orders right to your doorstep.</li>
        </ul>
    </div>
    <div class="content-box">
        <h2>Join Our Community</h2>
        <p>Become a part of the NextGen Noook community and experience the best in online shopping. Sign up today and stay updated with our latest offers, product launches, and exclusive deals. Thank you for choosing NextGen Noook as your preferred e-commerce destination. We look forward to serving you!</p>
    </div>
</div>
<br>
<br>
<marquee>Your trusted partner in exceptional shopping.</marquee>
<br>
<footer>
    <p>&copy; 2025 NextGen Noook | All rights reserved.</p>
</footer>

</body>
</html>