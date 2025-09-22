<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    int productId = Integer.parseInt(request.getParameter("product_id"));
    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
    String dbUser = "root";
    String dbPass = "";
    try {
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        String query = "DELETE FROM products WHERE product_id=?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, productId);
        ps.executeUpdate();
        conn.close();
        response.sendRedirect("viewSupplierProducts.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>