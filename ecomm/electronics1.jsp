<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <style>
        /* Same style as before with slight changes for the product details page */
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
                <img src="Boat-Aavante-Bar-590-Pebble-Black.jpg" alt="boAt Aavante Bar 590">
            </div>

            <!-- Product Information -->
            <div class="product-info">
                <h3>boAt Aavante Bar 590</h3>
                <p><strong>Product Overview:</strong> boAt Aavante Bar 590 is a high-quality Bluetooth soundbar that provides amazing sound quality and a wireless experience. Perfect for home entertainment setups.</p>
                <p><strong>Specifications:</strong></p>
                <ul>
                    <li>Bluetooth Connectivity</li>
                    <li>Power: 20W</li>
                    <li>Built-in FM radio</li>
                    <li>Long Battery Life</li>
                    <li>Compact & Sleek Design</li>
                </ul>
                <p class="price">Rs. 1,999</p>
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