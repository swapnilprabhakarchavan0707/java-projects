<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("supplier_id") == null) {
        response.sendRedirect("login.html");
        return;
    }

    int supplierId = (int) sessionObj.getAttribute("supplier_id");
    String productName = request.getParameter("product_name");
    String description = request.getParameter("description");
    double price = Double.parseDouble(request.getParameter("price"));
    int stock = Integer.parseInt(request.getParameter("stock"));

    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
    String dbUser = "root";
    String dbPass = "";
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
        String query = "INSERT INTO products (product_name, description, price, stock, supplier_id) VALUES (?, ?, ?, ?, ?)";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, productName);
        preparedStatement.setString(2, description);
        preparedStatement.setDouble(3, price);
        preparedStatement.setInt(4, stock);
        preparedStatement.setInt(5, supplierId);
        
        int rowsInserted = preparedStatement.executeUpdate();
        if (rowsInserted > 0) {
            response.sendRedirect("viewSupplierProducts.jsp");
        } else {
            out.println("<h3 style='color:red; text-align:center;'>Error adding product. Please try again.</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3 style='color:red; text-align:center;'>An error occurred. Please try again later.</h3>");
    } finally {
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>