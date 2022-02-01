<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Maintenance</title>
<link rel="stylesheet" href="styles/main.css">
</head>
<body>
<h1>Are you sure you want to delete this product?</h1>

<table>
	<tr>
		<th>
			Code:
		</th>
		<td>
			${product.getCode()}
		</td>
	</tr>
	<tr>
		<th>
			Description:
		</th>
		<td>
			${product.getDescription()}
		</td>
	</tr>
	<tr>
		<th>
			Price:
		</th>
		<td>
			${product.getPriceCurrencyFormat()}
		</td>
	</tr>
</table>
<form action="confirmDelete" method="post">
	<input type="hidden" name="Code" value="${product.getCode()}">
	<input type="submit" value="Yes">
</form>
<form action="productMaintenance" method="get">
	<input type="submit" value="No">
</form>

</body>
</html>