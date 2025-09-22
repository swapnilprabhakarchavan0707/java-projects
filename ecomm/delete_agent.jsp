<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Delivery Agent</title>
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
            text-align: center;
        }
        h2 {
            color: black;
            margin-bottom: 20px;
        }
        .btn {
            padding: 10px 20px;
            font-size: 18px;
            font-family: 'Times New Roman', serif;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px;
        }
        .confirm-btn {
            background-color: #4CAF50;
            color: white;
        }
        .cancel-btn {
            background-color: #f44336;
            color: white;
            text-decoration: none;
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
        <h2>Delete Delivery Agent</h2>
        <%
            String agentId = request.getParameter("agent_id");
            Connection conn = null;
            PreparedStatement pstmt = null;

            if (request.getMethod().equalsIgnoreCase("POST")) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "");
                    String deleteSql = "DELETE FROM courier WHERE agent_id=?";
                    pstmt = conn.prepareStatement(deleteSql);
                    pstmt.setString(1, agentId);
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
        <p>Are you sure you want to delete this delivery agent?</p>
        <form method="POST" action="delete_agent.jsp?agent_id=<%= agentId %>">
            <button type="submit" class="btn confirm-btn">Yes</button>
            <a href="delivery.jsp" class="btn cancel-btn">No</a>
        </form>
	<br/>
	<br/>
	<a href="javascript:history.back()" style="display: inline-block; padding: 10px 20px; font-family: 'Times New Roman', serif; background-color: #4e73df; color: white; text-decoration: none; border-radius: 5px;">Back</a>
    </div>
</body>
</html>
