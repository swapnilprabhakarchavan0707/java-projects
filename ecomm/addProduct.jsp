<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("supplier_id") == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <style>
        body {
            font-family: 'Times new roman', sans-serif;
            background-image: url('remote.jpg');
            background-size: cover;
            background-position: center;
            font-size: 20px;
            text-align: center;
            color: white;
            margin: 0;
            padding: 0;
        }
        h2 {
            color: #4e73df;
            font-size: 36px;
	    text-align: center;
            margin-bottom: 20px;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            max-width: 450px;
            margin: 80px auto;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
            text-align: left;
        }
        label {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }
        input, textarea, button {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            margin-top: 10px;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-family: 'Times new roman', sans-serif;
        }
        textarea {
            resize: none;
            height: 80px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 18px;
            transition: all 0.3s ease;
        }
        .btn:hover {
            background-color: #45a049;
            transform: translateY(-3px);
        }
        .btn-back {
            background-color: #007BFF;
            margin-top: 15px;
            text-align: center;
            display: block;
            text-decoration: none;
            padding: 12px;
            border-radius: 8px;
            color: white;
            font-size: 18px;
            transition: all 0.3s ease;
        }
        .btn-back:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Product</h2>
        <form action="addProductAction.jsp" method="post">
            <label for="product_name">Product Name</label>
            <input type="text" id="product_name" name="product_name" placeholder="Enter Product Name" required>
            
            <label for="description">Description</label>
            <textarea id="description" name="description" placeholder="Enter Product Description" required></textarea>
            
            <label for="price">Price</label>
            <input type="number" id="price" name="price" placeholder="Enter Price" required>
            
            <label for="stock">Stock</label>
            <input type="number" id="stock" name="stock" placeholder="Enter Stock Quantity" required>
            
            <button type="submit" class="btn">Add Product</button>
        </form>
        <a href="viewSupplierProducts.jsp" class="btn-back">Back</a>
    </div>
</body>
</html>