<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String message = "";
    int supplierId = Integer.parseInt(request.getParameter("id"));
    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
    String dbUser = "root";
    String dbPass = "";

    if (request.getParameter("update") != null) {
        String supplierName = request.getParameter("supplier_name");
        String username = request.getParameter("username");  // New field
        String password = request.getParameter("password");  // New field
        String contactEmail = request.getParameter("contact_email");
        String phoneNumber = request.getParameter("phone_number");
        String address = request.getParameter("address");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String query = "UPDATE suppliers SET name = ?, username = ?, password = ?, contact_email = ?, phone_number = ?, address = ? WHERE supplier_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, supplierName);
            preparedStatement.setString(2, username);
            preparedStatement.setString(3, password);
            preparedStatement.setString(4, contactEmail);
            preparedStatement.setString(5, phoneNumber);
            preparedStatement.setString(6, address);
            preparedStatement.setInt(7, supplierId);
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                message = "Supplier updated successfully!";
            } else {
                message = "Error updating supplier.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
        }
    }

    String supplierName = "";
    String username = "";
    String password = "";
    String contactEmail = "";
    String phoneNumber = "";
    String address = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
        String query = "SELECT * FROM suppliers WHERE supplier_id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, supplierId);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            supplierName = resultSet.getString("name");
            username = resultSet.getString("username");  // Fetching username
            password = resultSet.getString("password");  // Fetching password
            contactEmail = resultSet.getString("contact_email");
            phoneNumber = resultSet.getString("phone_number");
            address = resultSet.getString("address");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Supplier</title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #4e73df;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-size: 16px;
            color: #333;
        }

        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            font-family: 'Times New Roman', serif;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4e73df;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
	    font-family: 'Times New Roman', serif;
        }

        input[type="submit"]:hover {
            background-color: #3b5a9a;
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

        .message {
            text-align: center;
            margin-top: 10px;
            color: #28a745;
        }

        .message.error {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Supplier</h2>
        <form method="post">
            <div class="form-group">
                <label for="supplier_name">Supplier Name:</label>
                <input type="text" id="supplier_name" name="supplier_name" value="<%= supplierName %>" required>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%= username %>" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="<%= password %>" required>
            </div>
            <div class="form-group">
                <label for="contact_email">Contact Email:</label>
                <input type="email" id="contact_email" name="contact_email" value="<%= contactEmail %>" required>
            </div>
            <div class="form-group">
                <label for="phone_number">Phone Number:</label>
                <input type="text" id="phone_number" name="phone_number" value="<%= phoneNumber %>" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="<%= address %>" required>
            </div>
            <input type="submit" name="update" value="Update Supplier">
        </form>
        <a href="javascript:history.back()" class="back-btn">Back</a>
        <p class="message <%= message.contains("successfully") ? "" : "error" %>"><%= message %></p>
    </div>
</body>
</html>