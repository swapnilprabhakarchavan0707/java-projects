<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <style>
        /* Similar style as before for product detail pages */
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
        }

        header h1 {
            font-size: 3em;
            margin: 0;
        }

        header p {
            font-size: 1.3em;
            margin-top: 10px;
            color: #ecf0f1;
        }

        .container {
            width: 70%;
            margin: 0 auto;
            padding-top: 30px;
        }

        .product-detail {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-top: 40px;
        }

        .product-image {
            width: 45%;
        }

        .product-image img {
            width: 100%;
            border-radius: 8px;
        }

        .product-info {
            width: 45%;
            text-align: left;
        }

        .product-info h3 {
            font-size: 2em;
            color: #333;
        }

        .product-info p {
            font-size: 1.2em;
            color: #555;
        }

        .product-info .price {
            font-size: 1.5em;
            color: #27ae60;
            margin-top: 20px;
        }

        .auth-buttons {
            text-align: center;
            margin-top: 40px;
        }

        .auth-buttons a {
            background-color: #2980b9;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 30px;
            font-size: 1.2em;
            margin: 0 15px;
            transition: background-color 0.3s ease;
        }

        .auth-buttons a:hover {
            background-color: #3498db;
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
    </style>
</head>

<body>

    <header>
        <h1>Product Details</h1>
        <p>Explore detailed information about this product</p>
    </header>

    <div class="container">
        <div class="product-detail">
            <!-- Product Image -->
            <div class="product-image">
                <img src="Godrej-Washing-Machine.jpg" alt="Godrej Washing Machine">
            </div>

            <!-- Product Information -->
            <div class="product-info">
                <h3>Godrej Washing Machine</h3>
                <p><strong>Product Overview:</strong> The Godrej Washing Machine WS EDGE CLS 70 is designed to provide effective washing with energy-saving features, high performance, and a large load capacity for a modern home.</p>
                <p><strong>Specifications:</strong></p>
                <ul>
                    <li>Energy Efficient</li>
                    <li>Large 7 kg Load Capacity</li>
                    <li>Multiple Wash Programs</li>
                    <li>Smart Wash Technology</li>
                    <li>Quiet Operation</li>
                </ul>
                <p class="price">Rs. 9,790</p>
            </div>
        </div>

        <!-- Sign Up / Sign In Buttons -->
        <div class="auth-buttons">
            <a href="signup.jsp">Sign Up</a>
            <a href="login.html">Sign In</a>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 NextGen Noook | All rights reserved.</p>
    </footer>

</body>

</html>