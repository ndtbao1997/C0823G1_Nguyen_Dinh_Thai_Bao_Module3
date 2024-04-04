<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 10/12/2023
  Time: 2:01 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Gia hạn Hđ</title>
    <meta charset="UTF-8">
    <title>Thêm mới hợp đồng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
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
        /*form{*/
        /*    width: 50%;*/
        /*    display: flex;*/
        /*    justify-content: center;*/
        /*}*/

    </style>
    <script>
        function displayToast(message, color) {
            document.getElementById("toastContent").innerHTML = message;
            document.getElementById("liveToast").style.background = color;
            let myAlert = document.getElementById('liveToast');//select id of toast
            let bsAlert = new bootstrap.Toast(myAlert);//inizialize it
            bsAlert.show();//show it
        }
    </script>
</head>
<body>
<jsp:include page="../admin/header-admin.jsp" />
<h1 style="text-align: center;font-weight: bold;color: #f44566; margin-top: 100px;margin-bottom: 40px">Gia hạn hợp đồng</h1>

<form method="post">
    <div class="d-flex justify-content-center" style="width: 50%; margin-left: 25%">
        <table border="1" class="table table-striped">
            <tr>
                <th>Mã hợp đồng</th>
                <td>${contract.id}</td>
            </tr>
            <tr>
                <th>Ngày làm hợp đồng</th>
                <td>${contract.contractDate}</td>
            </tr>
            <tr>
                <th>Ngày kết thúc</th>
                <td>${contract.contractEndDate}</td>
            </tr>
            <tr>
                <th>Tiền đặt cọc</th>
                <td><fmt:setLocale value="vi_VN" />
                    <fmt:setBundle basename="path_to_your_resource_bundle" />
                    <fmt:formatNumber value="${contract.deposit}" type="currency" currencyCode="VND" /></td>
            </tr>
            <tr>
                <th>Tên khách hàng: </th>
                <td><c:forEach items="${customer}" var="customer" varStatus="loop">
                    <c:if test="${customer.id == contract.idCustomer}">
                        ${customer.name}
                    </c:if>
                </c:forEach></td>
            </tr>
            <tr>
                <th>Tên nhân viên: </th>
                <td><c:forEach items="${staff}" var="staff" varStatus="loop">
                    <c:if test="${staff.id == contract.idStaff}">
                        ${staff.name}
                    </c:if>
                </c:forEach></td>
            </tr>
            <tr>
                <th>Tên căn hộ: </th>
                <td><c:forEach items="${apartments}" var="apartment" varStatus="loop">
                    <c:if test="${apartment.id == contract.idApartment}">
                        ${apartment.name}
                    </c:if>
                </c:forEach></td>
            </tr>
            <tr>
                <th><label for="extension">Thời gian gia hạn thêm</label></th>
                <td>
                    <select name="time" id="extension">
                        <option value="1">1</option>
                        <option value="3">3</option>
                        <option value="6">6</option>
                        <option value="12">12</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Gia hạn" class="btn btn-primary">
                </td>
            </tr>
        </table>
    </div>
</form>
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
<script>
    <c:if test="${message!=null}">
    displayToast("Đã thêm mới thành công", "orange")
    </c:if>
    <c:if test="${message1!=null}">
    displayToast("Đã gia hạn thành công", "orange")
    </c:if>
    <c:if test="${message2!=null}">
    displayToast("Đã sửa thành công", "orange")
    </c:if>
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>
