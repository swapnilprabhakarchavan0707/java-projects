<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    int productId = Integer.parseInt(request.getParameter("product_id"));
    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
    String dbUser = "root";
    String dbPass = "";

    if (request.getMethod().equals("POST")) {
        String productName = request.getParameter("product_name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        try {
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String query = "UPDATE products SET product_name=?, description=?, price=?, stock=? WHERE product_id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, productName);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, stock);
            ps.setInt(5, productId);
            ps.executeUpdate();
            conn.close();
            response.sendRedirect("viewSupplierProducts.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        String productName = "";
        String description = "";
        double price = 0.0;
        int stock = 0;

        try {
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String query = "SELECT * FROM products WHERE product_id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                productName = rs.getString("product_name");
                description = rs.getString("description");
                price = rs.getDouble("price");
                stock = rs.getInt("stock");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <style>
        /* Background Image */
        body {
            font-family: 'Times new roman', sans-serif;
            background: url('cardboard.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* White Container */
        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 25px;
            border-radius: 12px;
            width: 450px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        h2 {
            color: #4e73df;
            font-size: 28px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin: 10px 0 5px;
            color: #333;
            font-size: 20px;
        }

        input, textarea {
            width: 90%;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #ddd;
            font-size: 18px;
            outline: none;
	    font-family: 'Times new roman', sans-serif;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            background: #f9f9f9;
        }

        input:focus, textarea:focus {
            border-color: #4e73df;
            box-shadow: 0px 0px 10px rgba(78, 115, 223, 0.3);
        }

        textarea {
            resize: none;
            height: 90px;
        }

        /* Buttons */
        .btn {
            width: 90%;
            padding: 12px;
            border-radius: 6px;
            border: none;
            font-size: 17px;
            font-weight: bold;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            margin-top: 12px;
            display: inline-block;
            text-decoration: none;
	    font-family: 'Times new roman', sans-serif;
        }

        .update-btn {
	    width: 95%;
            background: #4e73df;
        }

        .update-btn:hover {
            background: #375aab;
            transform: scale(1.05);
        }

        .back-btn {
            background: #d9534f;
        }

        .back-btn:hover {
            background: #c9302c;
            transform: scale(1.05);
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Product</h2>
        <form method="post">
            <label>Product Name:</label>
            <input type="text" name="product_name" value="<%= productName %>" required>

            <label>Description:</label>
            <textarea name="description" required><%= description %></textarea>

            <label>Price:</label>
            <input type="number" step="0.01" name="price" value="<%= price %>" required>

            <label>Stock:</label>
            <input type="number" name="stock" value="<%= stock %>" required>

            <button type="submit" class="btn update-btn">Update Product</button>
        </form>
        <a href="viewSupplierProducts.jsp" class="btn back-btn">Back</a>
    </div>
</body>
</html>
<%
    }
%>