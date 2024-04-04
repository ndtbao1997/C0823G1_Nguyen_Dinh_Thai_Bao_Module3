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
        .custom-btn a{
            color: #F44566;
        }
        .custom-btn:hover {
            background-color: #F44566;
            border: #F44566;
        }
        .custom-btn:hover a{
            color: white;
        }
    </style>
</head>
<body>
<jsp:include page="header-admin.jsp"/>
<h2 style="text-align: center;font-weight: bold;color: #f44566; margin-top: 100px;margin-bottom: 40px">Danh sách lịch
    xem </h2>
<table>
    <tr>
        <td>
            <button type="button" class="btn btn-custom">
                <a href="/viewing-schedule-admin?action=deleteOldSchedule" style="text-decoration: none"
                   data-bs-target="#exampleModal">
                    Xóa lịch xem cũ
                </a>
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-custom">
                <a href="/viewing-schedule-admin?action=todaySchedule" style="text-decoration: none"
                   data-bs-target="#exampleModal">
                    Lịch xem hôm nay
                </a>
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-custom">
                <a href="/viewing-schedule-admin?action=notRepSchedule" style="text-decoration: none"
                   data-bs-target="#exampleModal">
                    Lịch xem chưa phản hồi
                </a>
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-custom">
                <a href="/viewing-schedule-admin?action=repSchedule" style="text-decoration: none"
                   data-bs-target="#exampleModal">
                    Lịch xem đã phản hồi
                </a>
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-custom">
                <a href="/viewing-schedule-admin?action=listViewSchedule" style="text-decoration: none"
                   data-bs-target="#exampleModal">
                    Toàn bộ lịch xem
                </a>
            </button>
        </td>
    </tr>
</table>
<br>
<div class="d-flex justify-content-center">
    <table border="1" class="table table-striped">
        <tr style="background-color: rgb(145,128,85)">
            <th scope="col" style="color: white;width: 5%">Stt</th>
            <th scope="col" style="color: white;width: 10%">Tên căn hộ</th>
            <th scope="col" style="color: white;width: 16%">Tên khách hàng</th>
            <th scope="col" style="color: white;width: 10.5%">Số điện thoại</th>
            <th scope="col" style="color: white;width: 20.5%">Email</th>
            <th scope="col" style="color: white;width: 11%">Ngày xem căn hộ</th>
            <th scope="col" style="color: white;width: 10%">Tình trạng</th>
            <th scope="col" style="color: white;width: 8%">Sửa</th>
            <th scope="col" style="color: white;width: 12%">Phản hồi</th>
        </tr>
        <c:forEach items='${requestScope["viewingScheduleDTOList"]}' var="schedule" varStatus="loop">
            <tr class="align-middle">
                <td>${loop.count}</td>
                <td>${schedule.getApartmentName()}</td>
                <td>${schedule.getCustomerName()}</td>
                <td>${schedule.getCustomerPhone()}</td>
                <td>${schedule.getEmail()}</td>
                <td>${schedule.getViewDate()}</td>
                <c:if test="${schedule.getStatus() == 'Chờ phản hồi'}">
                    <td style="color: red">
                            ${schedule.getStatus()}
                    </td>
                </c:if>
                <c:if test="${schedule.getStatus() == 'Đã phản hồi'}">
                    <td>
                            ${schedule.getStatus()}
                    </td>
                </c:if>
                <c:if test="${schedule.getStatus() == 'Đã xem'}">
                    <td style="color: blue">
                            ${schedule.getStatus()}
                    </td>
                </c:if>
                <c:if test="${schedule.getStatus() == 'Đã phản hồi'}">
                    <td>
                        <button type="button" class="btn btn-custom">
                            <a href="#" style="text-decoration: none" data-bs-toggle="modal"
                               data-bs-target="#exampleModal${schedule.getId()}">
                                Sửa
                            </a>
                        </button>
                        <div class="modal fade" id="exampleModal${schedule.getId()}" tabindex="-1"
                             aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="/viewing-schedule-admin?action=editSchedule&id=${schedule.getId()}"
                                          method="post">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel3">Sửa thông tin lịch xem</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <table>
                                                <tr>
                                                    <td>Tên căn hộ:</td>
                                                    <td>${schedule.getApartmentName()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Tên khách hàng</td>
                                                    <td>${schedule.getCustomerName()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Số điện thoại:</td>
                                                    <td>
                                                            ${schedule.getCustomerPhone()}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Email:</td>
                                                    <td>${schedule.getEmail()}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Ngày xem:</td>
                                                    <td><input type="text" id="viewDate"
                                                               name="viewDate" placeholder="${schedule.getViewDate()}"
                                                               pattern="^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$"><br>
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
                </c:if>
                <c:if test="${schedule.getStatus() == 'Chờ phản hồi'}">
                    <td>
                        <button type="button" class="btn btn-custom">
                            <a href="#" style="text-decoration: none" data-bs-toggle="modal"
                               data-bs-target="#exampleModal${schedule.getId()}">
                                Sửa
                            </a>
                        </button>
                        <div class="modal fade" id="exampleModal${schedule.getId()}" tabindex="-1"
                             aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="/viewing-schedule-admin?action=editSchedule&id=${schedule.getId()}"
                                          method="post">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel1">Sửa thông tin lịch xem</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <table>
                                                <tr>
                                                    <td>Tên căn hộ:</td>
                                                    <td>${schedule.getApartmentName()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Tên khách hàng</td>
                                                    <td>${schedule.getCustomerName()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Số điện thoại:</td>
                                                    <td>
                                                            ${schedule.getCustomerPhone()}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Email:</td>
                                                    <td>${schedule.getEmail()}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Ngày xem:</td>
                                                    <td><input type="text" id="viewDate1"
                                                               name="viewDate" placeholder="${schedule.getViewDate()}"
                                                               pattern="^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$"><br>
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
                </c:if>
                <c:if test="${schedule.getStatus() == 'Chờ phản hồi'}">
                    <td>
                        <button type="button" class="btn custom-btn">
                        <a href="#" style="text-decoration: none" data-bs-toggle="modal"
                           data-bs-target="#exampleModal1${schedule.getId()}">
                            Phản hồi
                        </a>
                        </button>
                        <div class="modal fade" id="exampleModal1${schedule.getId()}" tabindex="-1"
                             aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="/viewing-schedule-admin?action=feedbackSchedule&id=${schedule.getId()}"
                                          method="post">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel2">Phản hồi lịch xem đến khách
                                                hàng</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <table>
                                                <tr>
                                                    <td>Tên căn hộ:</td>
                                                    <td>${schedule.getApartmentName()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Tên khách hàng</td>
                                                    <td>${schedule.getCustomerName()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Số điện thoại:</td>
                                                    <td>
                                                            ${schedule.getCustomerPhone()}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Email:</td>
                                                    <td>${schedule.getEmail()}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Ngày xem:</td>
                                                    <td>${schedule.getViewDate()}
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-primary" value="Phản hồi">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </td>
                </c:if>
                <c:if test="${schedule.getStatus() == 'Đã phản hồi'}">
                    <td>
                    </td>
                </c:if>
                <c:if test="${schedule.getStatus() == 'Đã xem'}">
                    <td>
                    </td>
                </c:if>
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
<%--<p>--%>
<%--    <c:if test='${requestScope["message"] != null}'>--%>
<%--        <span class="message">${requestScope["message"]}</span>--%>
<%--    </c:if>--%>
<%--</p>--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
