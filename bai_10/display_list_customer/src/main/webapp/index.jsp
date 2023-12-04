<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hiển thị danh sách khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<form action="/display-customer" method="get">
    <input type="submit" id="submit" value="Display Customer">
</form>
<c:if test="${not empty customerList}">
    <h1 style="text-align: center">Danh sách khách hàng</h1>
    <div class="d-flex justify-content-center">
        <table class="table">
            <thead>
            <tr>
                <th scope="col" style="width: 25%">Tên</th>
                <th scope="col" style="width: 25%">Ngày sinh</th>
                <th scope="col" style="width: 25%">Địa chỉ</th>
                <th scope="col" style="width: 25%">Ảnh</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${customerList}" var="customer">
                <tr class="align-middle">
                    <td>${customer.getName()}</td>
                    <td>${customer.getDateOfBirth()}</td>
                    <td>${customer.getAddress()}</td>
                    <td><img src="${customer.getImage()}" alt="Ảnh khách hàng" style="width: 25%"></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>