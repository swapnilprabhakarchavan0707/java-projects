<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String message = "";
    if (request.getParameter("submit") != null) {
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String role = request.getParameter("role");
        String corrAddress = request.getParameter("corr_address");
        String permAddress = request.getParameter("perm_address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String dbURL = "jdbc:mysql://localhost:3306/ecomm";
        String dbUser = "root";
        String dbPass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String query = "INSERT INTO admins (first_name, last_name, role, correspondence_address, permanent_address, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, role);
            preparedStatement.setString(4, corrAddress);
            preparedStatement.setString(5, permAddress);
            preparedStatement.setString(6, username);
            preparedStatement.setString(7, password);
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                message = "Admin added successfully!";
            } else {
                message = "Error adding admin.";
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
    <title>Add Admin</title>
    </head>
<style>
    /* General Body Styling with Background Image */
    body {
    	margin: 0;
    	padding: 20px 0; /* Add padding to ensure top and bottom visibility */
    	font-family: 'Times New Roman', serif;
    	background: url('add_admin.jpg') no-repeat center center fixed;
    	background-size: cover; /* Keeps the background properly scaled */
    	display: flex;
    	justify-content: center;
    	align-items: flex-start; /* Align container towards the top */
    	min-height: 100vh; /* Ensure the body fully fills the viewport */
    	color: #333;
	}

    /* Centered Container Styling */
    .container {
        background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background for readability */
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
        text-align: center;
        max-width: 400px;
        width: 100%;
        margin-top: 50px; /* Add some space from the top */
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
    input[type="text"], input[type="password"] {
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
        margin-bottom: 10px; /* Add space between buttons */
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
<body>
    <div class="container">
        <h2>Add Admin</h2>
        <form method="post">
            <!-- First Name Field -->
            <label for="first_name">First Name:</label>
            <input type="text" id="first_name" name="first_name" placeholder="Enter first name" required>

            <!-- Last Name Field -->
            <label for="last_name">Last Name:</label>
            <input type="text" id="last_name" name="last_name" placeholder="Enter last name" required>

            <!-- Role Field -->
            <label for="role">Role:</label>
            <input type="text" id="role" name="role" placeholder="Enter role" required>

            <!-- Correspondence Address Field -->
            <label for="corr_address">Correspondence Address:</label>
            <input type="text" id="corr_address" name="corr_address" placeholder="Enter correspondence address" required>

            <!-- Permanent Address Field -->
            <label for="perm_address">Permanent Address:</label>
            <input type="text" id="perm_address" name="perm_address" placeholder="Enter permanent address" required>

            <!-- Username Field -->
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter username" required>

            <!-- Password Field -->
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>

            <!-- Submit Button -->
            <button type="submit" name="submit">Add Admin</button>
        </form>
        
        <!-- Edit and Delete Buttons -->
        <button class="edit-btn" onclick="window.location.href='edit_admin.jsp'">Edit Admin</button>
        <button class="delete-btn" onclick="window.location.href='delete_admin.jsp'">Delete Admin</button>

    <!-- Back Button -->
        <button class="back-btn" onclick="history.back()">Back</button>
        
        <!-- Feedback Message -->
        <p class="message <%= message.contains("successfully") ? "success" : "error" %>"><%= message %></p>
    </div>
</body>
</html>