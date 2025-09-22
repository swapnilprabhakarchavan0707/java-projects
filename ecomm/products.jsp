<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
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
            position: relative;
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
            padding: 20px 40px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .menu-links a {
            padding: 14px 32px;
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
            gap: 25px;
        }
        .auth-buttons .sign-in, .auth-buttons .sign-up {
            text-decoration: none;
            font-size: 18px;
            padding: 12px 30px;
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
        .content-container {
            width: 100%;
            padding: 20px;
        }
        .card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
            padding: 20px;
            margin-bottom: 20px;
        }
        .card h3 {
            font-size: 1.5em;
            color: #34495e;
        }
        .card p {
            font-size: 1.2em;
            color: #333;
        }
        .horizontal-menu {
            display: flex;
            justify-content: center;
            background-color: #ffffff;
            padding: 15px 0;
            margin-bottom: 20px;
        }
        .horizontal-menu a {
            padding: 12px 25px;
            text-decoration: none;
            font-size: 18px;
            color: #34495e;
            display: inline-block;
            transition: transform 0.3s ease, color 0.3s ease; /* Smooth scaling and color transition */
        }
        .horizontal-menu a:hover {
            transform: scale(1.1); /* Make the text slightly bigger */
            color: #2980b9; /* Optional: Change text color on hover */
        }
        .section {
            margin-top: 20px;
        }
	marquee {
            color: red;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <header>
        <h1>Products - NextGen Noook</h1>
        <p>Explore Our Wide Range of Products!</p>
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
        <div class="content-container">
            <div class="section">
                <div class="horizontal-menu">
                    <a href="electronics1.jsp">boAt Aavante Bar 590</a>
                    <a href="electronics2.jsp">SWFTH350</a>
                    <a href="electronics3.jsp">Godrej Washing Machine</a>
                </div>
            </div>
            <div class="section">
                <div class="horizontal-menu">
                    <a href="clothes1.jsp">Men's Black T-Shirt</a>
                    <a href="clothes2.jsp">Women's Black T-Shirt</a>
                    <a href="clothes3.jsp">Women's White T-Shirt</a>
                </div>
            </div>
            <div class="section">
                <div class="horizontal-menu">
                    <a href="appliances1.jsp">Induction Cooktop</a>
                    <a href="appliances2.jsp">Digital Air Fryer</a>
                </div>
            </div>
            <div class="card">
                <h3>Featured Product</h3>
                <p>Explore the latest and greatest products we have to offer. Click on the categories to see more!</p>
            </div>
        </div>
    </div>
<marquee>Quality products crafted for your lifestyle.</marquee>
<br>
    <footer>
        <p>&copy; 2025 NextGen Noook | All rights reserved.</p>
    </footer>
</body>
</html>
