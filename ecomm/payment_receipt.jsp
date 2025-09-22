<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Details</title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            margin: 0;
            padding: 0;
            background-image: url('payment.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 36px;
            color: #4e73df;
            margin-bottom: 20px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .button-container {
            display: flex;
            justify-content: space-between; /* Align buttons on opposite sides */
            align-items: center;
            margin-top: 20px;
        }

        .back-button, .print-button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 18px;
            font-family: 'Times New Roman', serif;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            background-color: #4e73df; /* Same color for both buttons */
        }

        .back-button:hover, .print-button:hover {
            background-color: #3b5998;
        }

        @media print {
            body {
                background: none;
            }

            .container {
                width: 100%;
                margin: 0;
                box-shadow: none;
                padding: 0;
            }

            .button-container {
                display: none; /* Hide buttons during printing */
            }

            table {
                page-break-inside: auto;
            }
        }
    </style>
    <script>
        function printPage() {
            window.print(); // Trigger the print dialog
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Payment Details</h2>
        <table>
            <tr>
                <th>Sr No</th>
                <th>Username</th>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Nos</th>
                <th>Amount</th>
                <th>Transaction ID</th>
                <th>Delivery Address</th>
                <th>Date</th>
            </tr>
            <%
                // Database connection details
                String dbURL = "jdbc:mysql://localhost:3306/ecomm";
                String dbUser = "root";
                String dbPass = "";

                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM payments";
                    rs = stmt.executeQuery(sql);

                    if (!rs.isBeforeFirst()) {
            %>
                    <tr>
                        <td colspan="9" style="text-align: center;">No records found</td>
                    </tr>
            <%
                    } else {
                        while (rs.next()) {
                            int srNo = rs.getInt("sr_no");
                            String username = rs.getString("username");
                            String productId = rs.getString("product_id");
                            String productName = rs.getString("product_name");
                            int nos = rs.getInt("nos");
                            double amount = rs.getDouble("amount");
                            String transactionalId = rs.getString("transactional_id");
                            String deliveryAddress = rs.getString("delivery_address");
                            String date = rs.getString("date");
            %>
                    <tr>
                        <td><%= srNo %></td>
                        <td><%= username %></td>
                        <td><%= productId %></td>
                        <td><%= productName %></td>
                        <td><%= nos %></td>
                        <td><%= amount %></td>
                        <td><%= transactionalId %></td>
                        <td><%= deliveryAddress %></td>
                        <td><%= date %></td>
                    </tr>
            <%
                        }
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='9' style='color: red; text-align: center;'>Error: " + e.getMessage() + "</td></tr>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>
        <div class="button-container">
            <a href="javascript:history.back()" class="back-button">Back</a>
            <a href="javascript:printPage()" class="print-button">Print</a>
        </div>
    </div>
</body>
</html>