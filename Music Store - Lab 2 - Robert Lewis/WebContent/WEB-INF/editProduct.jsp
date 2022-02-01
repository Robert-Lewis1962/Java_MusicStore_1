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
<h1>Edit Product</h1>

<c:if test="${check == 'ADD'}">
<form action="editProduct" method="post">
	<label>Code:</label>
		<input type="text" name="id" size="10" value="${item.getCode()}"> 
			<br/>
	<label>Description:</label>
		<input type="text" name="desc" size="50" value="${item.getDescription()}">
			<br/>
	<label>Price:</label>
		<input type="text" name="cost" size="10" value="${item.getPrice()}">
			<br/>
	<p class="error">${message}</p>
	<input type="submit" value="Update Product">
</form>
<form action="productMaintenance" method="get">
	<input type="submit" value="View Products">
</form>
</c:if>

<c:if test="${check == 'EDIT'}">
<form action="editProduct" method="post">
	<label>Code:</label>
		<input type="text" name="id" size="10" value="${item.getCode()}" readonly> 
			<br/>
	<label>Description:</label>
		<input type="text" name="desc" size="50" value="${item.getDescription()}">
			<br/>
	<label>Price:</label>
		<input type="text" name="cost" size="10" value="${item.getPrice()}">
			<br/>
	<p class="error">${message}</p>
	<input type="submit" value="Update Product">
</form>
<form action="productMaintenance" method="get">
	<input type="submit" value="View Products">
</form>
</c:if>
</body>
</html>