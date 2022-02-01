<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Franklin Music - Search Results</title>
<link rel="stylesheet" href="styles/main.css">
</head>
<body>
<h1>Search Results</h1>

<table>
	<tr>
		<th class="code"> Code </th>
		<th class="description"> Description </th>
		<th class="price"> Price </th>
		<th> </th>
	</tr>
	<c:forEach var="item" items="${productList}">
		<tr>
			<td>
				${item.getCode()}
			</td>
			<td>
				${item.getDescription()}
			</td>
			<td class="price">
				${item.getPriceCurrencyFormat()}
			</td>
			<td>
				<form action="cart" method="post">
					<input type="hidden" name="Code" value="${item.getCode()}">
					<input type="submit" value="Add To Cart">
				</form>
			</td>
		</tr>
	</c:forEach>
	<tr>
	<td colspan="3"></td>
	<td>
		<form action="cart" method="get">
			<input type="submit" value="View Cart">
		</form>
	</td>
	</tr>
</table>

</body>
</html>