<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    HttpSession userSession = request.getSession(false); // Retrieve the session
    String username = (String) session.getAttribute("username");
    
    if (username == null) {
        // If no user is logged in, redirect to login page
        response.sendRedirect("login.html");
        return;
    }

    // Database connection details
    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
    String dbUser = "root";
    String dbPass = "";

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    String fullName = "";
    String email = "";

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        connection = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // Query to get the user's details
        String query = "SELECT full_name, email FROM users WHERE username=?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, username);
        
        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            fullName = resultSet.getString("full_name");
            email = resultSet.getString("email");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <style>
        /* Overall page styling */
        body {
            font-family: 'Times New Roman', serif;
            margin: 0;
            padding: 0;
            background-image: url('customers.jpeg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }

        /* Container for the dashboard */
        .dashboard-container {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
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
            width: 150px; /* Same width for all links */
        }

        a:hover {
            background-color: #4e73df;
            color: #fff;
            transform: translateY(-3px);
        }

        a:active {
            transform: translateY(2px);
        }

        /* Flexbox for centering the new links */
        .links-container {
            display: flex;
            justify-content: space-between;
            max-width: 400px;
            margin: 20px auto;
        }

        /* Responsive Design */
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
	<h1><u>User Dashboard</u></h1>
        <h2>Welcome, <%= fullName %>!</h2>
        <ul>
            <li><a href="viewProducts.jsp">View Products</a></li>
            <li><a href="purchase.jsp">Purchase</a></li>
            <li><a href="paymentHistory.jsp">Payment History</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
</body>
</html>