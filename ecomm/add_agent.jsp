<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Delivery Agent</title>
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
            color: white;
            text-decoration: none;
            text-align: center;
            padding-top: 10px;
            display: inline-block;
        }
        .cancel-btn:hover {
            background-color: #e33120;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Delivery Agent</h2>
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String firstName = request.getParameter("first_name");
                String middleName = request.getParameter("middle_name");
                String lastName = request.getParameter("last_name");
                String mobileNumber = request.getParameter("mobile_number");
                String altMobileNumber = request.getParameter("alternative_mobile_number");
                String deliverySector = request.getParameter("delivery_sector");

                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "");
                    String insertSql = "INSERT INTO courier (first_name, middle_name, last_name, mobile_number, alternative_mobile_number, delivery_sector) VALUES (?, ?, ?, ?, ?, ?)";
                    pstmt = conn.prepareStatement(insertSql);
                    pstmt.setString(1, firstName);
                    pstmt.setString(2, middleName);
                    pstmt.setString(3, lastName);
                    pstmt.setString(4, mobileNumber);
                    pstmt.setString(5, altMobileNumber);
                    pstmt.setString(6, deliverySector);
                    pstmt.executeUpdate();
                    response.sendRedirect("delivery.jsp");
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            }
        %>
        <form method="POST" action="add_agent.jsp">
            <label for="first_name">First Name:</label>
            <input type="text" id="first_name" name="first_name" required>
            <label for="middle_name">Middle Name:</label>
            <input type="text" id="middle_name" name="middle_name" required>
            <label for="last_name">Last Name:</label>
            <input type="text" id="last_name" name="last_name" required>
            <label for="mobile_number">Mobile Number:</label>
            <input type="text" id="mobile_number" name="mobile_number" required>
            <label for="alternative_mobile_number">Alternative Mobile Number:</label>
            <input type="text" id="alternative_mobile_number" name="alternative_mobile_number" required>
            <label for="delivery_sector">Delivery Sector:</label>
            <input type="text" id="delivery_sector" name="delivery_sector" required>
            <button type="submit" class="btn submit-btn">Add Agent</button>
            <a href="delivery.jsp" class="btn cancel-btn">Cancel</a>
        </form>
	<br/>
	<br/>
	<a href="javascript:history.back()" style="display: inline-block; padding: 10px 20px; font-family: 'Times New Roman', serif; background-color: #4e73df; color: white; text-decoration: none; border-radius: 5px;">Back</a>
    </div>
</body>
</html>