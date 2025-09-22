<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("supplier_id") == null) {
        response.sendRedirect("login.html");
        return;
    }

    String supplierName = "";
    int supplierId = (int) sessionObj.getAttribute("supplier_id");

    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
    String dbUser = "root";
    String dbPass = "";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
        
        String query = "SELECT name FROM suppliers WHERE supplier_id=?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, supplierId);
        resultSet = preparedStatement.executeQuery();
        
        if (resultSet.next()) {
            supplierName = resultSet.getString("name");
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
    <title>Supplier Dashboard</title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            margin: 0;
            padding: 0;
            background-image: url('cardboard.jpg');
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

        .links-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            max-width: 300px;
            margin: 20px auto;
        }

        a {
            font-size: 18px;
            font-weight: bold;
            color: #4e73df;
            text-decoration: none;
            padding: 12px 20px;
            display: block;
            border-radius: 8px;
            border: 2px solid #4e73df;
            transition: all 0.3s ease;
            width: 200px;
            margin-bottom: 15px;
        }

        a:hover {
            background-color: #4e73df;
            color: #fff;
            transform: translateY(-3px);
        }

        a:active {
            transform: translateY(2px);
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
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1><u>Supplier Dashboard</u></h1>
        <h2>Welcome, <%= supplierName %>!</h2>
        <div class="links-container">
            <a href="viewSupplierProducts.jsp">View My Products</a>
            <a href="addProduct.jsp">Add Product</a>
            <a href="login.html">Logout</a>
        </div>
    </div>
</body>
</html>