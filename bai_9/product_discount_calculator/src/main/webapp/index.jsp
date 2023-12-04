<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/display-discount" method="post">
    <label for="description">Product Description</label>
    <input type="text" name="description" id="description">
    <label for="price">Price</label>
    <input type="text" name="price" id="price">
    <label for="discountPercent">Discount Percent</label>
    <input type="text" name="discountPercent" id="discountPercent">
    <input type="submit" id="submit" value="Calculate Discount ">
</form>
</body>
</html>