<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery Agent Management</title>
    <style>
body {
    font-family: 'Times New Roman', serif;
    background: url('delivery.jpg') no-repeat center center fixed;
    background-size: cover;
    margin: 0;
    padding: 0;
    color: #fff;  /* Make text white to contrast the background */
    position: relative;
}

body:before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);  /* Stronger overlay for more contrast */
    z-index: -1;  /* Make sure it stays behind the content */
}

.container {
    width: 80%;
    margin: 20px auto;
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.8);  /* Slightly transparent white background */
    border-radius: 10px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
}

h2 {
    text-align: center;
    color: #4e73df;
    font-size: 36px;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: rgba(255, 255, 255, 0.9); /* Solid background for table */
    border-radius: 8px;
    overflow: hidden;
}

th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
    color: #000;  /* Make the text inside table black */
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

.btn {
    padding: 8px 16px;
    margin: 4px;
    font-size: 14px;
    font-family: 'Times New Roman', serif;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.edit-btn {
    background-color: #4CAF50;
    color: white;
}

.delete-btn {
    background-color: #f44336;
    color: white;
}

.add-btn {
    display: block;
    width: 100px;
    margin: 20px auto;
    background-color: #4e73df;
    color: white;
    border-radius: 5px;
    text-align: center;
    padding: 10px 0;
    text-decoration: none;
}

.add-btn:hover {
    background-color: #3b5998;
}

a {
    text-decoration: none;
    color: inherit;
}

a:hover {
    text-decoration: underline;
}
    </style>
</head>
<body>
    <div class="container">
        <h2>Delivery Agents</h2>
        <table>
            <thead>
                <tr>
                    <th>Agent ID</th>
                    <th>First Name</th>
                    <th>Middle Name</th>
                    <th>Last Name</th>
                    <th>Mobile Number</th>
                    <th>Alternative Mobile Number</th>
                    <th>Delivery Sector</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "");
                        stmt = conn.createStatement();
                        String sql = "SELECT * FROM courier";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int agentId = rs.getInt("agent_id");
                            String firstName = rs.getString("first_name");
                            String middleName = rs.getString("middle_name");
                            String lastName = rs.getString("last_name");
                            String mobileNumber = rs.getString("mobile_number");
                            String altMobileNumber = rs.getString("alternative_mobile_number");
                            String deliverySector = rs.getString("delivery_sector");

                %>
                <tr>
                    <td><%= agentId %></td>
                    <td><%= firstName %></td>
                    <td><%= middleName %></td>
                    <td><%= lastName %></td>
                    <td><%= mobileNumber %></td>
                    <td><%= altMobileNumber %></td>
                    <td><%= deliverySector %></td>
                    <td>
                        <a href="edit_agent.jsp?agent_id=<%= agentId %>" class="btn edit-btn">Edit</a>
                        <a href="delete_agent.jsp?agent_id=<%= agentId %>" class="btn delete-btn">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
        <a href="add_agent.jsp" class="add-btn">Add Agent</a>
        <br/>
        <br/>
        <a href="javascript:history.back()" style="display: inline-block; padding: 10px 20px; font-family: 'Times New Roman', serif; background-color: #4e73df; color: white; text-decoration: none; border-radius: 5px;">Back</a>
    </div>
</body>
</html>