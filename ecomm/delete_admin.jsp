<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String message = "";
    if (request.getParameter("submit") != null) {
        String adminId = request.getParameter("admin_id");

        String dbURL = "jdbc:mysql://localhost:3306/ecomm";
        String dbUser = "root";
        String dbPass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String query = "DELETE FROM admins WHERE admin_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Integer.parseInt(adminId));
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                message = "Admin deleted successfully!";
            } else {
                message = "Error deleting admin. Admin ID not found.";
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
    <title>Delete Admin</title>
    <style>
        /* General Body Styling with Background Image */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Times New Roman', serif;
            background: url('felix.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        /* Centered Container Styling */
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background for readability */
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 450px;
            width: 100%;
        }

        /* Heading Styling */
        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #4e54c8;
        }

        /* Label Styling */
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            font-size: 18px;
        }

        /* Input Fields */
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 18px;
            font-family: 'Times New Roman';
        }

        /* Button Styling */
        button {
            width: 100%;
            background-color: #4e54c8;
            color: #fff;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-family: 'Times New Roman';
            margin-bottom: 10px;
        }

        button:hover {
            background-color: #3a42a1;
        }

        .back-btn {
            background-color: #f44336;
            color: white;
            margin-top: 10px;
            font-family: 'Times New Roman';
        }

        /* Message Styling */
        .message {
            margin-top: 15px;
            font-size: 14px;
        }

        .message.success {
            color: #28a745;
        }

        .message.error {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Admin</h2>
        <form method="post">
            <!-- Admin ID Field -->
            <label for="admin_id">Admin ID:</label>
            <input type="text" id="admin_id" name="admin_id" placeholder="Enter admin ID to delete" required>

            <!-- Submit Button -->
            <button type="submit" name="submit">Delete Admin</button>
        </form>
        <!-- Feedback Message -->
        <p class="message <%= message.contains("successfully") ? "success" : "error" %>"><%= message %></p>
        <!-- Back Button -->
        <button class="back-btn" onclick="history.back()">Back</button>
    </div>
</body>
</html>