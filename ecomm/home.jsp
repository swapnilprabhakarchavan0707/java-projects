<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
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
            justify-content: space-between;
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

        .image-gallery {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .image-gallery img {
            width: 300px;
            height: 300px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }

        .image-gallery img:hover {
            transform: scale(1.1);
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

        .content1, .content2 {
            margin-top: 30px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
        }

        .content1 h2, .content2 h2 {
            font-size: 2em;
            color: #333;
            text-align: center;
        }

        .content1 p, .content2 p, ul li {
            font-size: 1.2em; /* Updated to match other content text */
            color: #333;
            line-height: 1.8;
            text-align: justify;
        }

        .content1 h3 {
            font-size: 1.6em; /* Updated to match other headings */
            color: #333;
        }

        marquee {
            color: red;
            font-size: 1.2em;
        }
    </style>
</head>
<body>

<header>
    <h1>Exclusive Product Collection</h1>
    <p>Discover our premium selection of high-end products</p>
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
<br>

<!-- Horizontal image gallery -->
<div class="image-gallery">
    <img src="figure1.jpeg" alt="Figure 1">
    <img src="figure2.jpeg" alt="Figure 2">
    <img src="figure3.jpeg" alt="Figure 3">
    <img src="figure4.jpeg" alt="Figure 4">
</div>

<div class="container">
    <div class="content1">
        <h2>Why Shop With Us? Your Perfect Shopping Destination!</h2>
        <p>At NextGen Noook, we believe shopping should be more than just buying products. It should be an experience! Here's why you should choose us for all your shopping needs:</p>
        <h3>Why Should You Choose Us for Your Next Purchase?</h3>
        <ul>
            <li><b>Exclusive Selection:</b> We offer a carefully curated selection of premium products, ranging from the latest electronics, fashion-forward clothes, to state-of-the-art home appliances. Whatever your needs, we’ve got you covered!</li>
            <li><b>Seamless Shopping Experience:</b> Our website is designed to be as user-friendly as possible, offering a seamless shopping experience from start to finish. From browsing our collections to easy checkout, shopping with us is effortless!</li>
        </ul>
        <h3>What Are the Benefits of Shopping With Us?</h3>
        <ul>
            <li><b>Amazing Discounts & Offers:</b> We believe in offering our customers unbeatable value! Enjoy regular discounts, flash sales, and special offers that make your shopping experience even more rewarding.</li>
            <li><b>Fast & Reliable Shipping:</b> Get your orders delivered right to your door, with our speedy and secure shipping options. We pride ourselves on quick turnaround times, so you can enjoy your new products in no time!</li>
        </ul>
        <h3>What Quality Can You Expect From Our Products?</h3>
        <ul>
            <li><b>Top-Notch Quality:</b> At NextGen Noook, quality is our top priority. We handpick each product from the most reputable brands to ensure that every item we sell is durable, reliable, and meets your expectations. Whether it's cutting-edge electronics or stylish apparel, you can count on our products to perform.</li>
            <li><b>Certified and Tested:</b> All our products go through rigorous testing and quality checks. We only offer items that are certified to meet high standards, so you can shop with confidence, knowing you're getting the best.</li>
        </ul>
    </div>

    <div class="content2">
        <h2>Why Wait? Make the Smart Choice Today!</h2>
        <p>With NextGen Noook, you're not just buying products – you're investing in quality, convenience, and satisfaction. Don't miss out on the chance to shop with a brand that cares about you and your needs. Experience the best shopping journey now! </p>
    </div>
</div>
<br>
<br>
<marquee>Shop Now & Enjoy Amazing Deals.</marquee>
<br>
<footer>
    <p>&copy; 2025 NextGen Noook | All rights reserved.</p>
</footer>

</body>
</html>