<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String message = "";
    int supplierId = Integer.parseInt(request.getParameter("id"));
    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
    String dbUser = "root";
    String dbPass = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
        String query = "DELETE FROM suppliers WHERE supplier_id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, supplierId);
        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            message = "Supplier deleted successfully!";
        } else {
            message = "Error deleting supplier.";
        }
    } catch (Exception e) {
        e.printStackTrace();
        message = "Error: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Supplier</title>
</head>
<body>
    <script>
        alert("<%= message %>");
        window.location.href = "manage_suppliers.jsp";
    </script>
</body>
</html>