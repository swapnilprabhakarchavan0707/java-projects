<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <style>
        /* General reset and styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            margin: 0;
            padding: 20px 0; /* Add padding to ensure container is visible at the top and bottom */
            overflow: auto; /* Allow scrolling if necessary */
        }

        body {
            font-family: 'Times New Roman', sans-serif;
            background-image: url('signup.jpeg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Align items at the top with some padding */
            min-height: 100vh; /* Ensure body fills the viewport height */
        }

        .container {
            background: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            padding: 40px;
            margin: 20px; /* Additional margin to ensure space around the box */
        }

        h2 {
            text-align: center;
            font-size: 2rem;
            color: #4e73df;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 5px;
            background: #f4f4f4;
            color: #333;
            font-family: Times New Roman;
        }

        input[type="submit"] {
            background-color: #4e73df;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border: none;
        }

        input[type="submit"]:hover {
            background-color: #3e59b1;
        }

        .back-btn {
            display: block;
            text-align: center;
            margin-top: 20px;
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 5px;
            text-decoration: none;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #d32f2f;
        }

        .message {
            text-align: center;
            font-size: 1.1rem;
            padding: 10px;
            margin-top: 20px;
            border-radius: 5px;
        }

        .message.success {
            background-color: #28a745;
            color: white;
        }

        .message.error {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Create an Account</h2>

        <!-- User Add Form -->
        <form method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="full_name">Full Name:</label>
                <input type="text" id="full_name" name="full_name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone_number">Phone Number:</label>
                <input type="text" id="phone_number" name="phone_number" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <input type="submit" value="Add User">
        </form>

        <!-- Back Button -->
        <a href="javascript:history.back()" class="back-btn">Back</a>

        <% 
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String fullName = request.getParameter("full_name");
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phone_number");
                String address = request.getParameter("address");

                String jdbcURL = "jdbc:mysql://localhost:3306/ecomm";
                String jdbcUsername = "root";
                String jdbcPassword = "";

                Connection connection = null;
                PreparedStatement statement = null;
                String message = "";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                    String sql = "INSERT INTO users (username, password, full_name, email, phone_number, address) VALUES (?, ?, ?, ?, ?, ?)";

                    statement = connection.prepareStatement(sql);
                    statement.setString(1, username);
                    statement.setString(2, password);
                    statement.setString(3, fullName);
                    statement.setString(4, email);
                    statement.setString(5, phoneNumber);
                    statement.setString(6, address);

                    int rowsAffected = statement.executeUpdate();

                    if (rowsAffected > 0) {
                        message = "User added successfully!";
                        out.println("<div class='message success'>" + message + "</div>");
                    } else {
                        message = "Error adding user!";
                        out.println("<div class='message error'>" + message + "</div>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    message = "Error: " + e.getMessage();
                    out.println("<div class='message error'>" + message + "</div>");
                } finally {
                    try {
                        if (statement != null) {
                            statement.close();
                        }
                        if (connection != null) {
                            connection.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
</body>
</html>
