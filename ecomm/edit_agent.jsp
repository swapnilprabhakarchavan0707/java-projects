<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Delivery Agent</title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 40px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: black;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label, input {
            margin-bottom: 10px;
	    font-family: 'Times new roman', serif;
            font-size: 20px;
        }
        input {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .btn {
            padding: 10px;
            font-size: 18px;
            font-family: 'Times New Roman', serif;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
        .submit-btn {
            background-color: #4CAF50;
            color: white;
        }
        .cancel-btn {
            background-color: #f44336;
	    text-decoration: none;
	    text-align: center;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Delivery Agent</h2>
        <%
            String agentId = request.getParameter("agent_id");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            if (request.getMethod().equalsIgnoreCase("POST")) {
                String firstName = request.getParameter("first_name");
                String middleName = request.getParameter("middle_name");
                String lastName = request.getParameter("last_name");
                String mobileNumber = request.getParameter("mobile_number");
                String altMobileNumber = request.getParameter("alternative_mobile_number");
                String deliverySector = request.getParameter("delivery_sector");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "");
                    String updateSql = "UPDATE courier SET first_name=?, middle_name=?, last_name=?, mobile_number=?, alternative_mobile_number=?, delivery_sector=? WHERE agent_id=?";
                    pstmt = conn.prepareStatement(updateSql);
                    pstmt.setString(1, firstName);
                    pstmt.setString(2, middleName);
                    pstmt.setString(3, lastName);
                    pstmt.setString(4, mobileNumber);
                    pstmt.setString(5, altMobileNumber);
                    pstmt.setString(6, deliverySector);
                    pstmt.setString(7, agentId);
                    pstmt.executeUpdate();
                    response.sendRedirect("delivery.jsp");
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            } else {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "");
                    String sql = "SELECT * FROM courier WHERE agent_id=?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, agentId);
                    rs = pstmt.executeQuery();
                    if (rs.next()) {
                        String firstName = rs.getString("first_name");
                        String middleName = rs.getString("middle_name");
                        String lastName = rs.getString("last_name");
                        String mobileNumber = rs.getString("mobile_number");
                        String altMobileNumber = rs.getString("alternative_mobile_number");
                        String deliverySector = rs.getString("delivery_sector");
        %>
        <form method="POST" action="edit_agent.jsp?agent_id=<%= agentId %>">
            <label for="first_name">First Name:</label>
            <input type="text" id="first_name" name="first_name" value="<%= firstName %>" required>
            <label for="middle_name">Middle Name:</label>
            <input type="text" id="middle_name" name="middle_name" value="<%= middleName %>" required>
            <label for="last_name">Last Name:</label>
            <input type="text" id="last_name" name="last_name" value="<%= lastName %>" required>
            <label for="mobile_number">Mobile Number:</label>
            <input type="text" id="mobile_number" name="mobile_number" value="<%= mobileNumber %>" required>
            <label for="alternative_mobile_number">Alternative Mobile Number:</label>
            <input type="text" id="alternative_mobile_number" name="alternative_mobile_number" value="<%= altMobileNumber %>" required>
            <label for="delivery_sector">Delivery Sector:</label>
            <input type="text" id="delivery_sector" name="delivery_sector" value="<%= deliverySector %>" required>
            <button type="submit" class="btn submit-btn">Save</button>
            <a href="delivery.jsp" class="btn cancel-btn">Cancel</a>
        </form>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            }
        %>
	<br/>
	<br/>
	<a href="javascript:history.back()" style="display: inline-block; padding: 10px 20px; font-family: 'Times New Roman', serif; background-color: #4e73df; color: white; text-decoration: none; border-radius: 5px;">Back</a>
    </div>
</body>
</html>