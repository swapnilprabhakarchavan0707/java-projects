<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String message = "";
    int productId = Integer.parseInt(request.getParameter("id"));
    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
    String dbUser = "root";
    String dbPass = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // Delete dependent rows in the `order_items` table
        String deleteOrderItemsQuery = "DELETE FROM order_items WHERE product_id = ?";
        PreparedStatement deleteOrderItemsStmt = connection.prepareStatement(deleteOrderItemsQuery);
        deleteOrderItemsStmt.setInt(1, productId);
        deleteOrderItemsStmt.executeUpdate();

        // Now delete the product
        String deleteProductQuery = "DELETE FROM products WHERE product_id = ?";
        PreparedStatement deleteProductStmt = connection.prepareStatement(deleteProductQuery);
        deleteProductStmt.setInt(1, productId);

        int rowsAffected = deleteProductStmt.executeUpdate();
        if (rowsAffected > 0) {
            message = "Product deleted successfully!";
        } else {
            message = "Error: Product not found or could not be deleted.";
        }
    } catch (Exception e) {
        e.printStackTrace();
        message = "Error: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Product</title>
    <style>
        body {
            font-family: Times New Roman, sans-serif;
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
            color: #f44336;
        }
        .message {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Product</h2>
        <p class="message"><%= message %></p>
        <a href="manage_products.jsp">Back to Manage Products</a>
    </div>
</body>
</html>