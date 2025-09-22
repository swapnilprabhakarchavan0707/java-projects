<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String message = "";

    // Get the user ID from the request
    int userId = 0;
    if (request.getParameter("id") != null) {
        userId = Integer.parseInt(request.getParameter("id"));

        String dbURL = "jdbc:mysql://localhost:3306/ecomm";
        String dbUser = "root";
        String dbPass = "";

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Delete the user with the specified ID
            String query = "DELETE FROM users WHERE user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                message = "User deleted successfully!";
            } else {
                message = "Error: User not found or could not be deleted.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error deleting user: " + e.getMessage();
        }
    } else {
        message = "Invalid user ID.";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete User</title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            background-image: url('source.jpg');
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
            text-align: center;
        }

        h2 {
            font-size: 24px;
            color: #f44336;
            margin-bottom: 20px;
        }

        .message {
            font-size: 18px;
            margin-top: 20px;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            background-color: #4e73df;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }

        a:hover {
            background-color: #3a54a3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete User</h2>
        <p class="message"><%= message %></p>
        <a href="list_users.jsp">Back to User List</a>
    </div>
</body>
</html>