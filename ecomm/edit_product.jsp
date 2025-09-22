<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    // Retrieve product details and handle update action
    String message = "";
    int originalProductId = Integer.parseInt(request.getParameter("id")); // Original Product ID
    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
    String dbUser = "root";
    String dbPass = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);

        if ("POST".equalsIgnoreCase(request.getMethod())) {
            // Handle update
            int newProductId = Integer.parseInt(request.getParameter("product_id")); // New Product ID
            String productName = request.getParameter("product_name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            int supplierId = Integer.parseInt(request.getParameter("supplier_id"));

            String updateQuery = "UPDATE products SET product_id = ?, product_name = ?, description = ?, price = ?, stock = ?, category_id = ?, supplier_id = ? WHERE product_id = ?";
            PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
            updateStatement.setInt(1, newProductId); // New Product ID
            updateStatement.setString(2, productName);
            updateStatement.setString(3, description);
            updateStatement.setDouble(4, price);
            updateStatement.setInt(5, stock);
            updateStatement.setInt(6, categoryId);
            updateStatement.setInt(7, supplierId);
            updateStatement.setInt(8, originalProductId); //Old Product ID

            int rowsAffected = updateStatement.executeUpdate();
            if (rowsAffected > 0) {
                message = "Product updated successfully!";
            } else {
                message = "Failed to update the product.";
            }
        }

        // Fetch current product details
        String selectQuery = "SELECT * FROM products WHERE product_id = ?";
        PreparedStatement selectStatement = connection.prepareStatement(selectQuery);
        selectStatement.setInt(1, originalProductId);
        ResultSet resultSet = selectStatement.executeQuery();
        if (resultSet.next()) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <style>
        body {
            font-family: 'Times New Roman', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            text-align: center;
            color: #17a2b8;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-size: 18px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 18px;
	    font-family: Times new roman;
        }
        input[type="submit"] {
            background-color: #17a2b8;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            width: 100%;
	    font-family: Times new roman;
        }
        input[type="submit"]:hover {
            background-color: #138496;
        }
        .message {
            text-align: center;
            color: green;
            margin-top: 15px;
        }
        .back-btn {
            margin-top: 15px;
            background-color: #f44336;
            color: white;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .back-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Product</h2>
        <form method="post" action="edit_product.jsp?id=<%= originalProductId %>">
            <label for="product_id">Product ID</label> <!-- Editable Product ID -->
            <input type="number" id="product_id" name="product_id" value="<%= resultSet.getInt("product_id") %>" required>

            <label for="product_name">Product Name</label>
            <input type="text" id="product_name" name="product_name" value="<%= resultSet.getString("product_name") %>" required>

            <label for="description">Description</label>
            <input type="text" id="description" name="description" value="<%= resultSet.getString("description") %>" required>

            <label for="price">Price</label>
            <input type="number" id="price" name="price" value="<%= resultSet.getDouble("price") %>" step="0.01" required>

            <label for="stock">Stock</label>
            <input type="number" id="stock" name="stock" value="<%= resultSet.getInt("stock") %>" required>

            <label for="category_id">Category ID</label>
            <input type="number" id="category_id" name="category_id" value="<%= resultSet.getInt("category_id") %>" required>

            <label for="supplier_id">Supplier ID</label>
            <input type="number" id="supplier_id" name="supplier_id" value="<%= resultSet.getInt("supplier_id") %>" required>

            <input type="submit" value="Update Product">
            <a href="javascript:history.back()" class="back-btn">Back</a>
        </form>
        <% if (!message.isEmpty()) { %>
            <p class="message"><%= message %></p>
        <% } %>
    </div>
</body>
</html>
<%
        }else {
            out.println("<h2>Product not found</h2>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
    }
%>