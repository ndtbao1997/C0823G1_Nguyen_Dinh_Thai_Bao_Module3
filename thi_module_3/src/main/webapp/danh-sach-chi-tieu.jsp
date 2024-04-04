<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 03/12/2023
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script>
        function displayToast(message, color) {
            document.getElementById("toastContent").innerHTML = message;
            document.getElementById("liveToast").style.background = color;
            let myAlert = document.getElementById('liveToast');//select id of toast
            let bsAlert = new bootstrap.Toast(myAlert);//inizialize it
            bsAlert.show();//show it
        }
    </script>
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
<h2 style="text-align: center;font-weight: bold;color: #f44566; margin-top: 100px;margin-bottom: 40px">Danh sách chi
    tiêu</h2>
<table>
    <tr>
        <td>
            <button type="button" class="btn btn-custom">
                <a href="/chitieu-servlet?action=themMoi" style="text-decoration: none"
                   data-bs-target="#exampleModal">
                    Thêm mới chi tiêu
                </a>
            </button>
        </td>
    </tr>
</table>
<br>
<div class="d-flex justify-content-center">
    <table border="1" class="table table-striped">
        <tr style="background-color: rgb(145,128,85)">
            <th scope="col" style="color: white">STT</th>
            <th scope="col" style="color: white">Tên chi tiêu/th>
            <th scope="col" style="color: white">Ngày chi</th>
            <th scope="col" style="color: white">Số tiền chi</th>
            <th scope="col" style="color: white">Loại chi</th>
            <th scope="col" style="color: white">Mô tả thêm</th>
            <th scope="col" style="color: white">Xóa</th>
        </tr>
        <c:forEach items="${chiTieuDTOS}" var="chiTieu" varStatus="loop">
            <tr class="align-middle">
                <td>${loop.count}</td>
                <td>${chiTieu.tenChiTieu}</td>
                <td>${chiTieu.ngayChi}</td>
                <td>${chiTieu.soTienChi}</td>
                <td>${chiTieu.loaiChi}</td>
                <td>${chiTieu.moTaThem}</td>
                <td>
                    <button type="button" class="btn btn-custom">
                        <a href="#" style="text-decoration: none" data-bs-toggle="modal"
                           data-bs-target="#exampleModal${chiTieu.maChiTieu}">
                            Xóa
                        </a>
                    </button>
                    <div class="modal fade" id="exampleModal${chiTieu.maChiTieu}" tabindex="-1"
                         aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/chitieu-servlet?action=xoaChiTieu&id=${chiTieu.maChiTieu}" method="post">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel1">Bạn có chắc chắn muốn xóa chi
                                            tiêu này không?</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <table>
                                            <tr>
                                                <td>
                                                    Tên chi tiêu:
                                                </td>
                                                <td>
                                                        ${chiTieu.tenChiTieu}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                   Ngày chi tiêu:
                                                </td>
                                                <td>
                                                        ${chiTieu.ngayChi}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Số tiền chi:
                                                </td>
                                                <td>
                                                        ${chiTieu.soTienChi}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Loại chi:
                                                </td>
                                                <td>
                                                        ${chiTieu.loaiChi}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Mô tả thêm:
                                                </td>
                                                <td>
                                                        ${chiTieu.moTaThem}
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-primary" value="Xóa">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="position-fixed top-0 end-5 p-3" style="z-index: 11;margin-left: 500px">
    <div id="liveToast" style="width: 230px; color: white; background:lightgreen ;border-radius:0%/0%;" class="toast"
         role="dialog" aria-live="assertive" aria-atomic="true">
        <div class="toast-body">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="30px" height="30px">
                <g id="surface1_4_">
                    <path style="fill:#4CAF50;"
                          d="M44,24c0,11.045-8.955,20-20,20S4,35.045,4,24S12.955,4,24,4S44,12.955,44,24z"></path>
                    <path style="fill:#CCFF90;"
                          d="M34.602,14.602L21,28.199l-5.602-5.598l-2.797,2.797L21,33.801l16.398-16.402L34.602,14.602z"></path>
                </g>
            </svg>
            <span id="toastContent">Nội dung hiển thị</span>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>
    <c:if test="${message!=null}">
    displayToast("Đã cập nhật thành công", "orange")
    </c:if>
</script>
</body>
</html>



