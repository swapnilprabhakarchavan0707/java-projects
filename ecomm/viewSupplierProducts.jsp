<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("supplier_id") == null) {
        response.sendRedirect("login.html");
        return;
    }

    int supplierId = (int) sessionObj.getAttribute("supplier_id");
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
    <title>My Products</title>
    <style>
        /* Page Styling */
        body {
            font-family: 'Times new roman', sans-serif;
            margin: 0;
            padding: 20px;
            background: url('warehouse.jpg') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
        }

        /* Page Title */
        h2 {
            color: white;
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
        }

        /* Table Design */
        table {
            width: 85%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            font-size: 18px;
            text-align: center;
        }

        th {
            background-color: #2c3e50;
            color: white;
            font-weight: bold;
        }

        /* Alternate row colors */
        tr:nth-child(even) {
            background-color: #f8f9fc;
        }

        tr:nth-child(odd) {
            background-color: #ffffff;
        }

        /* Button Styles */
        .btn {
            padding: 10px 15px;
            text-decoration: none;
            color: white;
            font-weight: bold;
            border-radius: 6px;
            transition: all 0.3s ease;
            display: inline-block;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            transform: scale(1.05);
        }

        .add-btn {
            background-color: #28a745;
            margin: 10px;
        }

        .add-btn:hover {
            background-color: #218838;
        }

        .back-btn {
            background-color: #6c757d;
            margin: 10px;
        }

        .back-btn:hover {
            background-color: #545b62;
        }

        .edit-btn {
            background-color: #f0ad4e;
            padding: 8px 12px;
        }

        .edit-btn:hover {
            background-color: #ec971f;
        }

        .delete-btn {
            background-color: #d9534f;
            padding: 8px 12px;
        }

        .delete-btn:hover {
            background-color: #c9302c;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                width: 95%;
            }

            th, td {
                font-size: 16px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <h2>My Products</h2>
    <a href="addProduct.jsp" class="btn add-btn">Add Product</a>
    <a href="supplier_dashboard.jsp" class="btn back-btn">Back</a>

    <table>
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Price (Rs.)</th>
            <th>Stock</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
                String query = "SELECT * FROM products WHERE supplier_id = ?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, supplierId);
                resultSet = preparedStatement.executeQuery();
                
                while (resultSet.next()) {
        %>
        <tr>
            <td><%= resultSet.getInt("product_id") %></td>
            <td><%= resultSet.getString("product_name") %></td>
            <td><%= resultSet.getString("description") %></td>
            <td>Rs. <%= String.format("%.2f", resultSet.getDouble("price")) %></td>
            <td><%= resultSet.getInt("stock") %></td>
            <td>
                <a href="editProduct.jsp?product_id=<%= resultSet.getInt("product_id") %>" class="btn edit-btn">Edit</a>
		<br><br>
                <a href="deleteProduct.jsp?product_id=<%= resultSet.getInt("product_id") %>" class="btn delete-btn">Delete</a>
            </td>
        </tr>
        <%
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
    </table>
</body>
</html>