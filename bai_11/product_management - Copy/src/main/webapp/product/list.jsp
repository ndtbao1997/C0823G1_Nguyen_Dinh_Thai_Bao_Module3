<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 03/12/2023
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1"
    />
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<h1 style="text-align: center">Quản lý sản phẩm</h1>
<p>
    <a href="/products?action=add" class="btn btn-outline-primary">Thêm mới sản phẩm</a>
</p>
<div class="d-flex justify-content-center">
    <table border="1" class="table table-striped">
        <tr style="color: #ff7675">
            <th scope="col" style="width: 5%">Id</th>
            <th scope="col" style="width: 20%">Tên sản phẩm</th>
            <th scope="col" style="width: 15%">Giá</th>
            <th scope="col" style="width: 25%">Mô tả sản phẩm</th>
            <th scope="col" style="width: 15%">Nhà sản xuất</th>
            <th scope="col" style="width: 10%">Sửa</th>
            <th scope="col" style="width: 10%">Xóa</th>
        </tr>
        <c:forEach items='${requestScope["products"]}' var="product">
            <tr>
                <td>${product.getId()}</td>
                <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
                <td>${product.getPrice()}</td>
                <td>${product.getDescribe()}</td>
                <td>${product.getProducer()}</td>
                <td>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal">
                        Sửa
                    </button>

                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/products?action=edit&id=${product.getId()}" method="post">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Sửa thông tin sản phẩm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <table>
                                            <tr>
                                                <td>Tên sản phẩm:</td>
                                                <td><input type="text" name="name" id="name"
                                                           value="${product.getName()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Giá sản phẩm:</td>
                                                <td><input type="text" name="price" id="price"
                                                           value="${product.getPrice()}"></td>
                                            </tr>
                                            <tr>
                                                <td>Mô tả sản phẩm:</td>
                                                <td><input type="text" name="describe" id="describe"
                                                           value="${product.getDescribe()}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Nhà sản xuất:</td>
                                                <td><input type="text" name="producer" id="producer"
                                                           value="${product.getProducer()}">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-primary" value="Lưu thay đổi">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </td>
                <td><a href="/products?action=remove&id=${product.getId()}" class="btn btn-outline-primary">Xóa</a></td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
