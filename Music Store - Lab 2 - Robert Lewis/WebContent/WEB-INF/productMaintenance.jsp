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
<h1>Products</h1>


<table>
	<tr>
		<th class="code">Code</th>
		<th class="description">Description</th>
		<th class="price">Price</th>
		<th></th>
		<th></th>
	</tr>
	<c:forEach var="item" items="${productList}">
		<tr>
			<td>
				<c:out value='${item.getCode()}'></c:out>
			</td>
			<td>
				<c:out value='${item.getDescription()}'></c:out>
			</td>
			<td class="price">
				<c:out value='${item.getPriceCurrencyFormat()}'></c:out>
			</td>
			<td>
				<a href="editProduct?Code=${item.getCode()}">Edit</a>
			</td>
			<td>
				<a href="confirmDelete?Code=${item.getCode()}">Delete</a>
			</td>
		</tr>
	</c:forEach>
</table>
<form action="editProduct" method="get">
	<input type="submit" value="Add Product">
</form>
</body>
</html>