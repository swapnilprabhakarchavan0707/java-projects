<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    // Get username and password from the request
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Database connection details
    String dbURL = "jdbc:mysql://localhost:3306/ecomm";
    String dbUser = "root";
    String dbPass = "";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        connection = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // Check if the login is for an admin
        String query = "SELECT * FROM admins WHERE username=? AND password=?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            // Admin login successful
            HttpSession userSession = request.getSession();
            userSession.setAttribute("username", username);
            userSession.setAttribute("admin_id", resultSet.getInt("admin_id"));
            response.sendRedirect("admin_dashboard.jsp");
        } else {
            // Check for user login
            query = "SELECT * FROM users WHERE username=? AND password=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // User login successful
                HttpSession userSession = request.getSession();
                userSession.setAttribute("username", username);
                response.sendRedirect("user_dashboard.jsp");
            } else {
                // Check for supplier login
                query = "SELECT * FROM suppliers WHERE username=? AND password=?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    // Supplier login successful
                    HttpSession userSession = request.getSession();
                    userSession.setAttribute("username", username);
                    userSession.setAttribute("supplier_id", resultSet.getInt("supplier_id"));
                    response.sendRedirect("supplier_dashboard.jsp");
                } else {
                    // Invalid credentials
                    out.println("<h3 style='color:red; text-align:center;'>Invalid username or password. Please try again.</h3>");
                    out.println("<a href='login.html' style='text-align:center;'>Back to Login</a>");
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3 style='color:red; text-align:center;'>An error occurred. Please try again later.</h3>");
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>