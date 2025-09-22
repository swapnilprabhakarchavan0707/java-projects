<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
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
    ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Purchase Product</title>
<style>
body {
    font-family: 'Times New Roman', sans-serif;
    background: url('purchase.jpg') no-repeat center center fixed;
    background-size: cover;
    margin: 0; 
    padding: 20px 0; /* Ensure visibility at the top and bottom */
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
}
.container {
    width: 80%;
    max-width: 1000px;
    margin: 40px auto;
    padding: 30px;
    background: rgba(255, 255, 255, 0.9); /* Light transparency for readability */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}
h2 {
    font-size: 36px;
    color: #4e73df;
    margin-bottom: 20px;
    font-weight: bold;
    text-align: center;
}
p {
    font-size: 20px;
    font-style: italic;
}
.form-group {
    margin-bottom: 20px;
    font-size: 1.2em;
}
label {
    font-weight: bold;
    color: #444;
    display: block;
    margin-bottom: 8px;
}
select, input[type="text"] {
    width: 100%;
    padding: 12px;
    font-size: 18px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background: #f9f9f9;
    font-family: 'Times New Roman', sans-serif;
    box-sizing: border-box;
}
select:focus, input[type="text"]:focus {
    outline: none;
    border-color: #4e73df;
    background: #fff;
}
.btn {
    width: 100%;
    padding: 14px;
    background-color: #4e73df;
    color: #fff;
    font-size: 18px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-family: 'Times New Roman', sans-serif;
    transition: background-color 0.3s ease;
}
.btn:hover {
    background-color: #3a54a3;
}

/* Updated Back Button Styles */
.back-btn a {
    display: inline-block;
    width: 97%; /* Same width as the Proceed to Payment button */
    padding: 14px;
    font-size: 18px;
    color: #fff;
    background-color: #4e73df; /* Blue color */
    text-align: center;
    text-decoration: none;
    border-radius: 8px;
    transition: background-color 0.3s ease;
    font-family: 'Times New Roman', sans-serif;
}
.back-btn a:hover {
    background-color: #f44336; /* Red color on hover */
}
.price-note {
    color: red;
    font-size: 20px;
}
.center-content {
    text-align: center;
}
</style>
</head>
<body>
<div class="container">
<h2>Purchase Product</h2>
<form method="post" action="processPurchase.jsp">
<div class="form-group">
<label for="productId">Select Product:</label>
<select name="productId" id="productId" required>
<option value="">--Select a Product--</option>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
    String query = "SELECT * FROM products";
    preparedStatement = connection.prepareStatement(query);
    resultSet = preparedStatement.executeQuery();
    while (resultSet.next()) {
        int productId = resultSet.getInt("product_id");
        String name = resultSet.getString("product_name");
        double price = resultSet.getDouble("price");
        int stock = resultSet.getInt("stock");
%>
<option value="<%= productId %>" data-price="<%= price %>" data-stock="<%= stock %>"><%= name %></option> 
<%
    } 
} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (resultSet != null) resultSet.close();
    if (preparedStatement != null) preparedStatement.close();
    if (connection != null) connection.close();
}
%>
</select>
</div>
<div class="form-group">
<label for="productPrice">Product Price (INR): </label>
<input type="text" id="productPrice" name="productPrice" readonly placeholder="--Price will be displayed here--">
<span class="price-note">Particular*</span>
</div>
<div class="form-group">
<label for="productStock">Product Stock:</label>
<input type="text" id="productStock" name="productStock" readonly placeholder="--Stock will be displayed here--">
</div>
<div class="form-group">
<label for="quantitySpinner">Purchase Item:</label>
<select id="quantitySpinner" name="quantitySpinner">
<%
for (int i = 1; i <= 500; i++) {
%>
<option value="<%= i %>"><%= i %></option>
<%
} 
%>
<option value="500+">500 and more</option>
</select>
</div>
<div class="form-group">
<label for="totalPrice">Total Price (INR):</label>
<input type="text" id="totalPrice" name="totalPrice" readonly placeholder="--Total price will be displayed here--">
</div>
<div class="form-group center-content">
<label for="qrCode">Scan QR Code to Pay:</label>
<img src="path_to_your_qr_code_image" alt="QR Code" id="qrCode" style="display: block; margin: 20px auto;">
</div>
<div class="form-group center-content">
<label for="accountNumber">Account Number:</label>
<p>1234567890</p>
</div>
<div class="form-group center-content">
<label for="upi">UPI ID:</label>
<p>your_upi_id@bank</p>
</div>
<div class="form-group">
<label for="transactionalId">Transaction ID:</label>
<input type="text" id="transactionalId" name="transactionalId" required placeholder="Enter transaction ID">
</div>
<div class="form-group">
<label for="deliveryAddress">Delivery Address:</label>
<input type="text" id="deliveryAddress" name="deliveryAddress" required placeholder="Enter delivery address">
</div>
<button type="submit" class="btn">Proceed to Payment</button>
</form>
<br><br>
<div class="back-btn">
<a href="user_dashboard.jsp">Back</a>
</div>
</div>
<script>
function updateTotalPrice() {
    var price = parseFloat(document.getElementById('productPrice').value) || 0;
    var quantity = parseInt(document.getElementById('quantitySpinner').value) || 0;
    var totalPrice = price * quantity; 
    document.getElementById('totalPrice').value = totalPrice.toFixed(2);
}
document.getElementById('productId').addEventListener('change', function () {
    var selectedOption = this.options[this.selectedIndex];
    var price = selectedOption.getAttribute('data-price');
    var stock = selectedOption.getAttribute('data-stock');
    document.getElementById('productPrice').value = price;
    document.getElementById('productStock').value = stock;
    document.getElementById('quantitySpinner').value = 1; 
    updateTotalPrice();
});
document.getElementById('quantitySpinner').addEventListener('change', function () {
    if (this.value === '500+') {
        this.value = 500;
    }
    updateTotalPrice();
});
</script>
</body>
</html>