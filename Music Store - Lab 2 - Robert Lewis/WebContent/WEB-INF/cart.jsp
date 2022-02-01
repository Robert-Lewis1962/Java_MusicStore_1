<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Franklin Music - Your Cart</title>
<link rel="stylesheet" href="styles/main.css">
</head>
<body>
<h1>Your Cart</h1>

<table>
	<tr>
		<th>
			Description
		</th>
		<th>
			Price
		</th>
		<th class="qty">
			Qty
		</th>
		<td>
		</td>
	</tr>
	<c:forEach var="item" items="${cartList}">
		<tr>
			<td>
				${item.getProduct().getDescription()}
			</td>
			<td>
				${item.getProduct().getPriceCurrencyFormat()}
			</td>
			<td>
				<input type="text" size="3" value="${item.getQty()}">
			</td>
			<td>
				<input type="submit" value="Update">
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td>
			Total:
		</td>
		<td>
			${totalCost}
		</td>
		<td colspan="2">
		</td>
	</tr>
	<tr>
		<td>
			<form action="searchResults" method="post">
				<input type="submit" value="Continue Shopping">
			</form>
		</td>
		<td>
			<input type="submit" value="Checkout">
		</td>
	</tr>
</table>

</body>
</html>