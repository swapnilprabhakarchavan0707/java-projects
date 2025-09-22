<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    // Initialize message and manage product actions
    String message = "";
    String action = request.getParameter("action");

    // Handle different actions (Add, Edit, Delete products)
    if ("add".equals(action)) {
        String name = request.getParameter("product_name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        int categoryId = Integer.parseInt(request.getParameter("category_id"));

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/ecomm";
        String dbUser = "root";
        String dbPass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String query = "INSERT INTO products (product_name, description, price, stock, category_id) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setDouble(3, price);
            preparedStatement.setInt(4, stock);
            preparedStatement.setInt(5, categoryId);

            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                message = "Product added successfully!";
            } else {
                message = "Error adding product.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products - Admin</title>
    <style>
        body {
            font-family: 'Times New Roman', sans-serif;
            background-image: url('manage_products.jpg'); /* Background image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.8);
            margin: 50px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            max-width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }

        h2 {
            color: #4e73df;
            font-size: 32px;
            text-align: center;
            margin-bottom: 30px;
        }

	h3 {
	    color: black;
	}

        label {
            font-size: 18px;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="number"],
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 2px solid #ddd;
            box-sizing: border-box;
	    font-family:times new roman;
            outline: none;
        }

        input[type="submit"] {
            background-color: #4e73df;
            color: white;
            cursor: pointer;
            border: none;
        }

        input[type="submit"]:hover {
            background-color: #3b5a9a;
        }
	
        .error-message {
            color: red;
            text-align: center;
        }

        .product-table {
            width: 100%;
            margin-top: 30px;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        .product-table th, .product-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .product-table th {
            background-color: #4e73df;
            color: white;
        }

        .product-table td {
            background-color: #f9f9f9;
            color: #4e73df;
            font-weight: 400; 
        }

        .product-table a {
            color: #4e73df;
            text-decoration: none;
        }

        .product-table a:hover {
            text-decoration: underline;
        }
	
	.back-button {
            margin-top: 15px;
            background-color: #f44336;
            color: white;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .back-button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Products</h2>

        <!-- Form for adding new product -->
        <form method="post" action="manage_products.jsp?action=add">
            <label for="product_name">Product Name:</label>
            <input type="text" id="product_name" name="product_name" required>

            <label for="description">Description:</label>
            <input type="text" id="description" name="description" required>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" required>

            <label for="stock">Stock:</label>
            <input type="number" id="stock" name="stock" required>

            <label for="category_id">Category ID:</label>
            <input type="number" id="category_id" name="category_id" required>

            <label for="supplier_id">Supplier ID:</label>
            <input type="number" id="supplier_id" name="supplier_id" required>
	     
	     <input type="submit" value="Add Product"><br><br>

        </form>

	<!-- Back Button as a link styled like a button -->
        <a href="javascript:history.back();" class="back-button">Back</a>
	<br><br>

        <!-- Displaying message after adding product -->
        <p class="error-message"><%= message %></p>
	<br>

        <!-- Product Table (View all products) -->
        <h3>Product List</h3>
        <table class="product-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Category ID</th>
		    <th>Supplier ID</th>
		    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Display all products from the database
                    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
                    String dbUser = "root";
                    String dbPass = "";

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
                        String query = "SELECT * FROM products";
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery(query);

                        while (resultSet.next()) {
                %>
                            <tr>
                                <td><%= resultSet.getInt("product_id") %></td>
                                <td><%= resultSet.getString("product_name") %></td>
                                <td><%= resultSet.getString("description") %></td>
                                <td><%= resultSet.getDouble("price") %></td>
                                <td><%= resultSet.getInt("stock") %></td>
                                <td><%= resultSet.getInt("category_id") %></td>
				<td><%=resultSet.getInt("supplier_id") %></td>
                                <td>
                                    <a href="edit_product.jsp?id=<%= resultSet.getInt("product_id") %>">Edit</a> |
                                    <a href="delete_product.jsp?id=<%= resultSet.getInt("product_id") %>">Delete</a>
                                </td>
                            </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
