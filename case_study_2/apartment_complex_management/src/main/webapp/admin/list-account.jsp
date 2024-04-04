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
    <title>Hello Apartment</title>
    <link rel="stylesheet" href="../css/main%20(1).css">
    <link rel="stylesheet" href="../css/animation%20(1).css">
    <link rel="stylesheet" href="../css/footer.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <style>

        ul {
            list-style-type: none;
        }

        p {
            font-family: Roboto, serif;
        }

        body.new-design .hero .hero-title .eyebrow {
            font-size: 12px;
            line-height: 16px;
            font-weight: 700;
            letter-spacing: -.05em;
            text-transform: uppercase;
            padding-bottom: 0.5rem;
            margin-bottom: 0;
        }

        .hero .hero-title {
            color: #fff;
            font-size: 66px;
            letter-spacing: 2px;
            font-variant-ligatures: none;
            line-height: 70px;
            margin-bottom: 16px;
            position: relative;
            text-transform: uppercase;
            z-index: 25;
        }

        h1:not([class*=is-title-]), .is-title-xxl {
            font-size: 2.5rem;
            font-weight: 100;
            letter-spacing: -0.05em;
            line-height: 2.5rem;
            text-transform: uppercase;
        }

        .card {
            border: none
        }

        .btn-custom {
            border-color: #918055; /* Đổi màu viền thành màu đỏ */
        }

        .btn-custom a {
            color: #918055;
        }

        .btn-custom:hover {
            background-color: #918055; /* Thay đổi màu nền thành màu đỏ */
            border-color: #918055;
        }

        .btn-custom:hover a {
            color: white; /* Thay đổi màu chữ thành màu trắng */
        }

        .custom-btn {
            border-color: #F44566;
        }

        .custom-btn a {
            color: #F44566;
        }

        .custom-btn:hover {
            background-color: #F44566;
            border: #F44566;
        }

        .custom-btn:hover a {
            color: white;
        }
    </style>
</head>
<body>
<jsp:include page="header-admin.jsp"/>
<h2 style="text-align: center;font-weight: bold;color: #f44566; margin-top: 100px;margin-bottom: 40px">Danh sách tài
    khoản</h2>
<table>
    <tr>
        <td>
            <button type="button" class="btn btn-custom">
                <a href="/account-admin?action=addAccount" style="text-decoration: none"
                   data-bs-target="#exampleModal">
                    Thêm mới tài khoản
                </a>
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-custom">
                <a href="#" style="text-decoration: none" data-bs-toggle="modal"
                   data-bs-target="#exampleModal-4">
                    Tìm kiếm tài khoản
                </a>
            </button>
            <div class="modal fade" id="exampleModal-4" tabindex="-1"
                 aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/account-admin?action=search" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel-4">Nhập tên tài khoản bạn muốn tìm</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <table>
                                    <tr>
                                        <td>Tên tài khoản:</td>
                                        <td><input type="text" name="name" id="name2" style="width: 180%"></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-primary" value="Tìm kiếm tài khoản">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>
<br>
<div class="d-flex justify-content-center">
    <table border="1" class="table table-striped">
        <tr style="background-color: rgb(145,128,85)">
            <th scope="col" style="color: white;width: 5%">Stt</th>
            <th scope="col" style="color: white;width: 20%">Tên tài khoản</th>
            <th scope="col" style="color: white;width: 15%">Mật khẩu</th>
            <th scope="col" style="color: white;width: 15%">Loại tài khoản</th>
            <th scope="col" style="color: white;width: 15%">Tình trạng</th>
            <th scope="col" style="color: white;width: 15%">Sửa</th>
            <th scope="col" style="color: white;width: 15%">Khóa</th>
        </tr>
        <c:forEach items='${requestScope["accounts"]}' var="account" varStatus="loop">
            <tr class="align-middle">
                <td>${loop.count}</td>
                <td>${account.getAccountName()}</td>
                <td>${account.getPassword()}</td>
                <td><c:if test="${account.getIdAccountType() == 3}">
                    <c:out value="${'Admin'}"></c:out>
                </c:if>
                    <c:if test="${account.getIdAccountType() == 2}">
                        <c:out value="${'Nhân viên'}"></c:out>
                    </c:if>
                    <c:if test="${account.getIdAccountType() == 1}">
                        <c:out value="${'Khách hàng'}"></c:out>
                    </c:if>
                </td>
                <td>
                    <c:if test="${account.getIsDeleted() == 0}">
                        <c:out value="${'Đang mở'}"></c:out>
                    </c:if>
                    <c:if test="${account.getIsDeleted() == 1}">
                        <c:out value="${'Đang khóa'}"></c:out>
                    </c:if>
                <td>
                    <button type="button" class="btn btn-custom">
                        <a href="#" style="text-decoration: none" data-bs-toggle="modal"
                           data-bs-target="#exampleModal${account.getId()}">
                            Sửa
                        </a>
                    </button>
                    <div class="modal fade" id="exampleModal${account.getId()}" tabindex="-1"
                         aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/account-admin?action=editAccount&id=${account.getId()}" method="post">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel1">Sửa thông tin tài khoản</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <table>
                                            <tr>
                                                <td>Tên tài khoản:</td>
                                                <td>${account.getAccountName()}</td>
                                            </tr>
                                            <tr>
                                                <td>Mật khẩu</td>
                                                <td><input type="text" name="password" id="password"
                                                           value="${account.getPassword()}" style="width: 350px"></td>
                                            </tr>
                                            <tr>
                                                <td>Loại tài khoản:</td>
                                                <td>
                                                    <label>
                                                        <select name="idAccountType" style="width: 350px">
                                                            <option value="1">Khách hàng</option>
                                                            <option value="2">Nhân viên</option>
                                                        </select>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tình trạng:</td>
                                                <td><c:if test="${account.getIsDeleted() == 0}">
                                                    <c:out value="${'Đang mở'}"></c:out>
                                                </c:if>
                                                    <c:if test="${account.getIsDeleted() == 1}">
                                                        <c:out value="${'Đang khóa'}"></c:out>
                                                    </c:if>
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
                <td>
                    <c:if test="${account.getIsDeleted() == 0}">
                        <button type="button" class="btn custom-btn">
                            <a href="#" style="text-decoration: none" data-bs-toggle="modal"
                               data-bs-target="#exampleModal2${account.getId()}">
                                Khóa
                            </a>
                        </button>
                        <div class="modal fade" id="exampleModal2${account.getId()}" tabindex="-1"
                             aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="/account-admin?action=removeAccount&id=${account.getId()}"
                                          method="post">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel2">Xác nhận muốn xóa tài khoản
                                                này không?</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <table>
                                                <tr>
                                                    <td style="width: 150px">Tên tài khoản:</td>
                                                    <td>${account.getAccountName()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Mật khẩu</td>
                                                    <td>${account.getPassword()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Loại tài khoản:</td>
                                                    <td>
                                                        <c:if test="${account.getIdAccountType() == 3}">
                                                            <c:out value="${'Admin'}"></c:out>
                                                        </c:if>
                                                        <c:if test="${account.getIdAccountType() == 2}">
                                                            <c:out value="${'Staff'}"></c:out>
                                                        </c:if>
                                                        <c:if test="${account.getIdAccountType() == 1}">
                                                            <c:out value="${'Customer'}"></c:out>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Tình trạng:</td>
                                                    <td><c:if test="${account.getIsDeleted() == 0}">
                                                        <c:out value="${'Đang sử dụng'}"></c:out>
                                                    </c:if>
                                                        <c:if test="${account.getIsDeleted() == 1}">
                                                            <c:out value="${'Không sử dụng'}"></c:out>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-primary" value="Khóa tài khoản">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${account.getIsDeleted() == 1}">
                        <a href="#" class="btn btn-outline-success" data-bs-toggle="modal"
                           data-bs-target="#exampleModal3${account.getId()}">
                            Mở
                        </a>
                        <div class="modal fade" id="exampleModal3${account.getId()}" tabindex="-1"
                             aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="/account-admin?action=unblockAccount&id=${account.getId()}"
                                          method="post">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel3">Xác nhận muốn mở tài khoản
                                                này không?</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <table>
                                                <tr>
                                                    <td style="width: 150px">Tên tài khoản:</td>
                                                    <td>${account.getAccountName()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Mật khẩu</td>
                                                    <td>${account.getPassword()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Loại tài khoản:</td>
                                                    <td>
                                                        <c:if test="${account.getIdAccountType() == 3}">
                                                            <c:out value="${'Admin'}"></c:out>
                                                        </c:if>
                                                        <c:if test="${account.getIdAccountType() == 2}">
                                                            <c:out value="${'Nhân viên'}"></c:out>
                                                        </c:if>
                                                        <c:if test="${account.getIdAccountType() == 1}">
                                                            <c:out value="${'Khách hàng'}"></c:out>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Tình trạng:</td>
                                                    <td><c:if test="${account.getIsDeleted() == 0}">
                                                        <c:out value="${'Đang mở'}"></c:out>
                                                    </c:if>
                                                        <c:if test="${account.getIsDeleted() == 1}">
                                                            <c:out value="${'Đang khóa'}"></c:out>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-primary" value="Mở tài khoản">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
