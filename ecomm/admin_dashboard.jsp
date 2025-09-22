<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<% 
// Get the admin_id from session
Integer adminId = (Integer) session.getAttribute("admin_id");
String adminFirstName = "";
String adminLastName = "";

if (adminId != null) {
    // Database connection parameters
    String jdbcURL = "jdbc:mysql://localhost:3306/ecomm";
    String jdbcUsername = "root";
    String jdbcPassword = "";

    // Query to get the admin details
    String query = "SELECT first_name, last_name FROM admins WHERE admin_id = ?";

    try {
        // Load the JDBC driver and establish a connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, adminId); // Set admin_id as the parameter

        // Execute the query
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            adminFirstName = resultSet.getString("first_name");
            adminLastName = resultSet.getString("last_name");
        } else {
            out.println("Admin not found in the database.");
        }
        resultSet.close();
        preparedStatement.close();
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Exception: " + e.getMessage());
    }
} else {
    out.println("Admin session not found.");
}
%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            margin: 0;
            padding: 0;
            background-image: url('office-working-space.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }
        .dashboard-container {
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
            max-width: 800px;
            margin: 100px auto;
            padding: 40px;
            text-align: center;
        }
        h1 {
            font-size: 44px;
            color: #3862db;
            margin-bottom: 30px;
            font-weight: bold;
        }
        h2 {
            font-size: 36px;
            color: #4e73df;
            margin-bottom: 20px;
            font-weight: bold;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin: 20px 0;
        }
        a {
            font-size: 18px;
            font-weight: bold;
            color: #4e73df;
            text-decoration: none;
            padding: 12px 20px;
            display: inline-block;
            border-radius: 8px;
            border: 2px solid #4e73df;
            transition: all 0.3s ease;
            width: 150px;
        }
        a:hover {
            background-color: #4e73df;
            color: #fff;
            transform: translateY(-3px);
        }
        a:active {
            transform: translateY(2px);
        }
        .links-container {
            display: flex;
            justify-content: space-between;
            max-width: 400px;
            margin: 20px auto;
        }
        @media (max-width: 768px) {
            .dashboard-container {
                padding: 20px;
            }
            h2 {
                font-size: 28px;
            }
            a {
                font-size: 16px;
                padding: 10px 16px;
            }
            .links-container {
                flex-direction: column;
                align-items: center;
            }
            .links-container a {
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1><u>Admin Dashboard</u></h1>
        <h2>Welcome, <%= adminFirstName %> <%= adminLastName %>!</h2>
        <ul>
            <li><a href="add_admin.jsp" style="font-family:times new roman">Add Admin</a></li>
            <li><a href="manage_suppliers.jsp" style="font-family:times new roman">Manage Suppliers</a></li>
            <li><a href="manage_users.jsp" style="font-family:times new roman">Manage Users</a></li>
            <li><a href="manage_products.jsp" style="font-family:times new roman">Manage Products</a></li>
            <li><a href="payment_receipt.jsp" style="font-family:times new roman">Payment Receipt</a></li>
            <li><a href="delivery.jsp" style="font-family:times new roman">Delivery</a></li>
            <li><a href="logout.jsp" style="font-family:times new roman">Logout</a></li>
        </ul>
    </div>
</body>
</html>