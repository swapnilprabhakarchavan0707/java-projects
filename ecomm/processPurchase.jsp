<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*, java.util.*" %>
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
    PreparedStatement updateStockStatement = null;
    ResultSet resultSet = null;

    String productId = request.getParameter("productId");
    String nos = request.getParameter("quantitySpinner");
    String amount = request.getParameter("totalPrice");
    String transactionalId = request.getParameter("transactionalId");
    String deliveryAddress = request.getParameter("deliveryAddress");
    String productName = "";

    // Explicitly declare java.util.Date
    java.util.Date paymentDate = new java.util.Date();

    try {
        // Step 1: Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // Step 2: Retrieve product name and current stock
        String getProductQuery = "SELECT product_name, stock FROM products WHERE product_id = ?";
        preparedStatement = connection.prepareStatement(getProductQuery);
        preparedStatement.setString(1, productId);
        resultSet = preparedStatement.executeQuery();

        int currentStock = 0;
        if (resultSet.next()) {
            productName = resultSet.getString("product_name");
            currentStock = resultSet.getInt("stock");
        }

        int purchaseQuantity = Integer.parseInt(nos);

        // Step 3: Check if sufficient stock is available
        if (currentStock >= purchaseQuantity) {
            // Step 4: Insert payment details into the payments table
            String insertQuery = "INSERT INTO payments (username, product_id, product_name, nos, amount, transactional_id, delivery_address, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, productId);
            preparedStatement.setString(3, productName);
            preparedStatement.setString(4, nos);
            preparedStatement.setString(5, amount);
            preparedStatement.setString(6, transactionalId);
            preparedStatement.setString(7, deliveryAddress);
            preparedStatement.setTimestamp(8, new java.sql.Timestamp(paymentDate.getTime()));
            preparedStatement.executeUpdate();

            // Step 5: Update the stock in the products table
            String updateStockQuery = "UPDATE products SET stock = stock - ? WHERE product_id = ?";
            updateStockStatement = connection.prepareStatement(updateStockQuery);
            updateStockStatement.setInt(1, purchaseQuantity);
            updateStockStatement.setString(2, productId);
            updateStockStatement.executeUpdate();

            // Redirect to success page
            response.sendRedirect("success.html");
        } else {
            // Notify the user about insufficient stock
            out.println("<p>Sorry, only " + currentStock + " items are available in stock.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.html");
    } finally {
        // Step 6: Close resources
        if (resultSet != null) resultSet.close();
        if (preparedStatement != null) preparedStatement.close();
        if (updateStockStatement != null) updateStockStatement.close();
        if (connection != null) connection.close();
    }
%>
