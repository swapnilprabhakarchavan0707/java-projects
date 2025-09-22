<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String message = "";

    // Fetch the user details if the "id" parameter is provided
    int userId = 0;
    String username = "", fullName = "", email = "", phoneNumber = "", address = "";

    if (request.getParameter("id") != null) {
        userId = Integer.parseInt(request.getParameter("id"));

        String dbURL = "jdbc:mysql://localhost:3306/ecomm";
        String dbUser = "root";
        String dbPass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String query = "SELECT * FROM users WHERE user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                username = resultSet.getString("username");
                fullName = resultSet.getString("full_name");
                email = resultSet.getString("email");
                phoneNumber = resultSet.getString("phone_number");
                address = resultSet.getString("address");
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error fetching user details: " + e.getMessage();
        }
    }

    // Update the user record if the form is submitted
    if (request.getParameter("submit") != null) {
        String updatedUsername = request.getParameter("username");
        String updatedFullName = request.getParameter("full_name");
        String updatedEmail = request.getParameter("email");
        String updatedPhoneNumber = request.getParameter("phone_number");
        String updatedAddress = request.getParameter("address");

        String dbURL = "jdbc:mysql://localhost:3306/ecomm";
        String dbUser = "root";
        String dbPass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String query = "UPDATE users SET username = ?, full_name = ?, email = ?, phone_number = ?, address = ? WHERE user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, updatedUsername);
            preparedStatement.setString(2, updatedFullName);
            preparedStatement.setString(3, updatedEmail);
            preparedStatement.setString(4, updatedPhoneNumber);
            preparedStatement.setString(5, updatedAddress);
            preparedStatement.setInt(6, userId);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                message = "User updated successfully!";
            } else {
                message = "Error updating user.";
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
    <title>Edit User</title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            background-image: url('edit_users.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            font-size: 24px;
            color: #4e73df;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-size: 18px;
            color: #333;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 18px;
        }

        input[type="submit"] {
            background-color: #4e73df;
            color: white;
            cursor: pointer;
            border: none;
        }

        input[type="submit"]:hover {
            background-color: #3a54a3;
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
            font-size: 16px;
            color: #28a745;
        }

        .message.error {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit User</h2>
        <form method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" style="font-family:times new roman" name="username" value="<%= username %>" required>
            </div>
            <div class="form-group">
                <label for="full_name">Full Name:</label>
                <input type="text" id="full_name" style="font-family:times new roman" name="full_name" value="<%= fullName %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" style="font-family:times new roman" name="email" value="<%= email %>" required>
            </div>
            <div class="form-group">
                <label for="phone_number">Phone Number:</label>
                <input type="text" id="phone_number" style="font-family:times new roman" name="phone_number" value="<%= phoneNumber %>" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" style="font-family:times new roman" name="address" value="<%= address %>" required>
            </div>
            <input type="submit" style="font-family:times new roman" name="submit" value="Update User">
        </form>
        <a href="javascript:history.back()" class="back-btn">Back</a>
        <p class="message <%= message.contains("successfully") ? "" : "error" %>"><%= message %></p>
    </div>
</body>
</html>