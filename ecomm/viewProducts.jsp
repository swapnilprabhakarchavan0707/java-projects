<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    HttpSession userSession = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.html");
        return;
    }

    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
    String dbUser = "root";
    String dbPass = "";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Products</title>
    <style>
        body {
            font-family: Times New Roman, sans-serif;
            margin: 0;
            padding: 0;
            background: url('productsview.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Slight transparency for readability */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h2{
            font-size: 36px;
            color: #4e73df;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4e73df;
            color: white;
        }

        /* Styling for the blue Back button */
        .back-btn {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
        .back-btn a {
            font-size: 1.1em;
            padding: 10px 20px;
            color: #fff;
            background-color: #4e73df;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .back-btn a:hover {
            background-color: #3a59b1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Available Products</h2>
        <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Category ID</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
                        String query = "SELECT * FROM products";
                        preparedStatement = connection.prepareStatement(query);
                        resultSet = preparedStatement.executeQuery();

                        while (resultSet.next()) {
                            int productId = resultSet.getInt("product_id");
                            String name = resultSet.getString("product_name");
                            String description = resultSet.getString("description");
                            double price = resultSet.getDouble("price");
                            int stock = resultSet.getInt("stock");
                            int category = resultSet.getInt("category_id");
                %>
                <tr>
                    <td><%= productId %></td>
                    <td><%= name %></td>
                    <td><%= description %></td>
                    <td>Rs.<%= price %></td>
                    <td><%= stock %></td>
                    <td><%= category %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (resultSet != null) resultSet.close();
                        if (preparedStatement != null) preparedStatement.close();
                        if (connection != null) connection.close();
                    }
                %>
            </tbody>
        </table>
        <div class="back-btn">
            <a href="user_dashboard.jsp">Back</a>
        </div>
    </div>
</body>
</html>