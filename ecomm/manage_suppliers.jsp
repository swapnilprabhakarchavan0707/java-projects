<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String message = "";

    // Declare Database Connection Variables Globally
    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
    String dbUser = "root";
    String dbPass = "";

    if (request.getParameter("submit") != null) {
        String supplierName = request.getParameter("supplier_name");
        String contactEmail = request.getParameter("contact_email");
        String phoneNumber = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String username = request.getParameter("username");  // Added new field
        String password = request.getParameter("password");  // Added new field

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String query = "INSERT INTO suppliers (name, contact_email, phone_number, address, username, password) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, supplierName);
            preparedStatement.setString(2, contactEmail);
            preparedStatement.setString(3, phoneNumber);
            preparedStatement.setString(4, address);
            preparedStatement.setString(5, username);
            preparedStatement.setString(6, password);
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                message = "Supplier added successfully!";
            } else {
                message = "Error adding supplier.";
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
        }
    }

    // Delete supplier logic
    if (request.getParameter("delete") != null) {
        int supplierId = Integer.parseInt(request.getParameter("delete"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String query = "DELETE FROM suppliers WHERE supplier_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, supplierId);
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                message = "Supplier deleted successfully!";
            } else {
                message = "Error deleting supplier.";
            }
            connection.close();
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
    <title>Manage Suppliers</title>
    <style>
        body {
        	font-family: 'Times New Roman', serif;
        	background-image: url('manage_suppliers.jpg');
        	background-size: cover;
        	background-repeat: no-repeat;
        	margin: 0;
        	padding: 0;
        	display: flex;
        	justify-content: center;
        	align-items: center; /* Changed from flex-start to center */
        	min-height: 100vh;
    	}

        .container {
        	background-color: rgba(255, 255, 255, 0.9);
        	padding: 30px;
        	border-radius: 10px;
        	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        	width: 80%;
        	max-width: 1000px;
        	margin-top: 20px;
        	margin-bottom: 20px; /* Added margin at the bottom */
        	overflow-y: auto; /* Ensure scrolling if content overflows */
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
            font-family: times new roman;
        }

        input[type="submit"] {
            background-color: #4e73df;
            width: 102%;
            color: white;
            cursor: pointer;
            border: none;
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
            margin-right: 5px;
        }

        .btn-edit:hover {
            background-color: #3a54a3;
        }

        .btn-delete {
            background-color: #f44336;
        }

        .btn-delete:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Suppliers</h2>

        <!-- Supplier Add Form -->
        <form method="post">
            <div class="form-group">
                <label for="supplier_name">Supplier Name:</label>
                <input type="text" id="supplier_name" name="supplier_name" required>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="contact_email">Contact Email:</label>
                <input type="email" id="contact_email" name="contact_email" required>
            </div>
            <div class="form-group">
                <label for="phone_number">Phone Number:</label>
                <input type="text" id="phone_number" name="phone_number" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <input type="submit" name="submit" value="Add Supplier"><br><br>
		<a href="admin_dashboard.jsp" class="back-btn">Back</a><br><br>
        </form>

        <!-- Display Supplier List -->
        <h3>Supplier List</h3>
        <table>
            <thead>
                <tr>
                    <th>Supplier ID</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
                        String query = "SELECT * FROM suppliers";
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery(query);

                        while (resultSet.next()) {
                %>
                <tr>
                    <td><%= resultSet.getInt("supplier_id") %></td>
                    <td><%= resultSet.getString("name") %></td>
                    <td><%= resultSet.getString("username") %></td>
                    <td><%= resultSet.getString("contact_email") %></td>
                    <td><%= resultSet.getString("phone_number") %></td>
                    <td><%= resultSet.getString("address") %></td>
                    <td>
                        <a href="edit_supplier.jsp?id=<%= resultSet.getInt("supplier_id") %>" class="btn-edit">Edit</a>
                        <a href="delete_supplier.jsp?delete=<%= resultSet.getInt("supplier_id") %>" class="btn-delete">Delete</a>
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