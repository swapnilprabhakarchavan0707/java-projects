<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("username") == null) {
        response.sendRedirect("login.html");
        return;
    }

    String username = (String) userSession.getAttribute("username");
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
    <title>Payment History</title>
    <style>
        body {
            font-family: 'Times New Roman', sans-serif;
            background: url('payment.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            max-width: 1100px; /* Ensures table fits properly */
            margin: 40px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.9); /* Light transparency for readability */
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            font-size: 36px;
            color: #4e73df;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3); /* Subtle text shadow for better readability */
        }

        th {
            background-color: #4e73df;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .buttons {
            display: flex;
            justify-content: space-between; /* Align Back button to the left and Print button to the right */
            margin-top: 20px;
        }

        .buttons a, .buttons button {
            font-size: 1.1em;
            padding: 10px 20px;
            color: #fff;
            text-decoration: none;
            background-color: #4e73df;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
	    font-family: 'Times New Roman', sans-serif;
        }

        .buttons a:hover {
            background-color: #3a59b1;
        }

        .buttons button:hover {
            background-color: #3a59b1;
        }

        .back-btn {
            background-color: #f44336;
        }

        .back-btn:hover {
            background-color: #d32f2f;
        }

        @media print {
            body {
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: none; /* Allow full width for print */
                width: 100%; /* Ensure the container spans the page */
                margin: 0; /* Remove margins for print view */
                padding: 0; /* Remove padding for cleaner print */
            }

            table {
                page-break-inside: auto;
                margin-top: 0; /* Remove extra margins in print */
            }

            @page {
                size: A4 landscape; /* Ensure A4 landscape orientation */
                margin: 10mm; /* Set reasonable margins for print */
            }

            .buttons {
                display: none; /* Hide buttons during printing */
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Payment History</h2>
        <table>
            <thead>
                <tr>
                    <th>Sr No</th>
                    <th>Username</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Nos</th>
                    <th>Amount</th>
                    <th>Transactional ID</th>
                    <th>Delivery Address</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
                        String query = "SELECT sr_no, username, product_id, product_name, nos, amount, transactional_id, delivery_address, date FROM payments WHERE username=?";
                        preparedStatement = connection.prepareStatement(query);
                        preparedStatement.setString(1, username);
                        resultSet = preparedStatement.executeQuery();

                        while (resultSet.next()) {
                            int srNo = resultSet.getInt("sr_no");
                            String usernameDB = resultSet.getString("username");
                            int productId = resultSet.getInt("product_id");
                            String productName = resultSet.getString("product_name");
                            int nos = resultSet.getInt("nos");
                            double amount = resultSet.getDouble("amount");
                            String transactionalId = resultSet.getString("transactional_id");
                            String deliveryAddress = resultSet.getString("delivery_address");
                            String date = resultSet.getString("date");
                %>
                <tr>
                    <td><%= srNo %></td>
                    <td><%= usernameDB %></td>
                    <td><%= productId %></td>
                    <td><%= productName %></td>
                    <td><%= nos %></td>
                    <td>Rs. <%= amount %></td>
                    <td><%= transactionalId %></td>
                    <td><%= deliveryAddress %></td>
                    <td><%= date %></td>
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
        <div class="buttons">
            <a href="user_dashboard.jsp" class="back-btn">Back</a>
            <button onclick="window.print()">Print</button>
        </div>
    </div>
</body>
</html>