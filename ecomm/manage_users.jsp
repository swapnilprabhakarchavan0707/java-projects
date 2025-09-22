<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String message = "";
    if (request.getParameter("submit") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String address = request.getParameter("address");
        
        String dbURL = "jdbc:mysql://localhost:3306/ecomm";
        String dbUser = "root";
        String dbPass = "";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String query = "INSERT INTO users (username, password, full_name, email, phone_number, address) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, fullName);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, phoneNumber);
            preparedStatement.setString(6, address);
            int rowsAffected = preparedStatement.executeUpdate();
            
            if (rowsAffected > 0) {
                message = "User added successfully!";
            } else {
                message = "Error adding user.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
        }
    }

    // Delete user logic
    if (request.getParameter("delete") != null) {
        int userId = Integer.parseInt(request.getParameter("delete"));
        String dbURL = "jdbc:mysql://localhost:3306/ecomm";
        String dbUser = "root";
        String dbPass = "";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String query = "DELETE FROM users WHERE user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            int rowsAffected = preparedStatement.executeUpdate();
            
            if (rowsAffected > 0) {
                message = "User deleted successfully!";
            } else {
                message = "Error deleting user.";
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
    <title>Manage Users</title>
    <style>
	body {
    	  font-family: 'Times New Roman', serif;
          background-image: url('manage_users.jpg');
          background-size: cover;
          background-repeat: no-repeat;
          margin: 0;
          padding: 0;
          display: flex;
          justify-content: center;
          align-items: flex-start;
          min-height: 100vh;
	}

        .container {
    	 background-color: rgba(255, 255, 255, 0.8); /* Adjust the transparency */
    	 padding: 30px;
    	 border-radius: 10px;
    	 box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    	 width: 80%;
    	 max-width: 1000px;
    	 margin-top: 20px;
	}

        h2 {
            font-size: 28px;
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
	    font-family:times new roman;
        }

	input[type="submit"] {
            background-color: #4e73df;
	    width: 102%;
            color: white;
            cursor: pointer;
            border: none;
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

        table {
            width: 100%;
            margin-top: 30px;
            border-collapse: collapse;
            background-color: #f9f9f9;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4e73df;
            color: white;
        }

        .btn-edit, .btn-delete {
            background-color: #4e73df;
            color: white;
            border: none;
            padding: 6px 12px;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn-edit:hover {
            background-color: #3a54a3;
        }

        .btn-delete:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Users</h2>

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
            <input type="submit" name="submit" value="Add User"><br><br>
        </form>

        <!-- Back Button -->
        <a href="javascript:history.back()" class="back-btn">Back</a>
	<br><br>

        <!-- Display Feedback -->
        <p class="message <%= message.contains("successfully") ? "" : "error" %>"><%= message %></p>
	<br>

        <!-- Display User List -->
        <h3>User List</h3>
        <table>
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Username</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
                    String dbUser = "root";
                    String dbPass = "";
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
                        String query = "SELECT * FROM users";
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery(query);

                        while (resultSet.next()) {
                %>
                <tr>
                    <td><%= resultSet.getInt("user_id") %></td>
                    <td><%= resultSet.getString("username") %></td>
                    <td><%= resultSet.getString("full_name") %></td>
                    <td><%= resultSet.getString("email") %></td>
                    <td><%= resultSet.getString("phone_number") %></td>
                    <td><%= resultSet.getString("address") %></td>
                    <td>
                        <a href="edit_users.jsp?id=<%= resultSet.getInt("user_id") %>" class="btn-edit">Edit</a><br><br>
                        <a href="delete_users.jsp?delete=<%= resultSet.getInt("user_id") %>" class="btn-delete">Delete</a>
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