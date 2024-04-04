<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 12/12/2023
  Time: 9:29 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Sửa thông tin căn hộ</title>
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

    </style>
</head>
<body>
<jsp:include page="header-admin.jsp"/>
<h1 style="text-align: center;font-weight: bold;color: #f44566; margin-top: 100px;margin-bottom: 40px">Sửa thông tin căn hộ</h1>
<c:if test="${message != null}">
    <div class="alert alert-success fade-in" style="width: 30%; text-align: center; position: absolute;left: 35%">
        <strong>${message}</strong>
    </div>
</c:if>

<%--<div style="color:red; text-align: center">--%>
<%--    <p>${message}</p>--%>
<%--</div>--%>
<section>
    <div class="container flex" style="width: 50%; padding: 4.5em; border: #f44566 1px solid">
        <form method="post" style="width: 100%; position: relative">
                <div class="form-group">
                    <label class="form-label" for="name">Tên căn hộ: </label>
                    <input class="form-control" name="name" id="name" value="${apartmentDTO.name}">
                </div>
                <div class="form-group">
                    <label class="form-label" for="acreage">Diện tích: </label>
                    <input class="form-control" name="acreage" id="acreage" value="${apartmentDTO.acreage}">
                </div>
                <div class="form-group">
                    <label class="form-label" for="rentalCosts">Chi phí thuê: </label>
<%--                    <fmt:formatNumber var="rentalCosts" value="${apartmentDTO.getRentalCosts()}" type="currency" currencyCode="VND"/>--%>
<%--                    <fmt:formatNumber var="rentalCosts"  value="${apartmentDTO.getRentalCosts()}" type="number"/>--%>
                    <input class="form-control" name="rentalCosts" id="rentalCosts" value="${apartmentDTO.getRentalCosts()}">
                </div>
                <div class="form-group">
                    <label class="form-label" for="maxPeople">Số người tối đa: </label>
                    <input class="form-control" name="maxPeople" id="maxPeople" value="${apartmentDTO.maxPeople}">
                </div>
                <div class="form-group">
                    <label class="form-label" for="apartmentType">Loại căn hộ: </label>
<%--                    <input class="form-control" name="apartmentType" id="apartmentType" value="${apartmentDTO.apartmentType}">--%>
                    <select class="form-control" id="apartmentType" name="apartmentType">
                        <option name="apartmentType" value="1">Studio</option>
                        <option name="apartmentType" value="2">Officetel</option>
                        <option name="apartmentType" value="3">Family</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label" for="rentalType">Kiểu thuê: </label>
<%--                    <input class="form-control" name="rentalType" id="rentalType" value="${apartmentDTO.rentalType}">--%>
                    <select class="form-control" id="rentalType" name="rentalType">
                        <option name="rentalType" value="1">Ngày</option>
                        <option name="rentalType" value="2">Tháng</option>
                        <option name="rentalType" value="3">Năm</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label" for="floors">Số tầng: </label>
<%--                    <input class="form-control" name="floors" id="floors" value="${apartmentDTO.floors}">--%>
                    <select class="form-control" id="floors" name="floors">
                        <option name="floors" value="1">1</option>
                        <option name="floors" value="2">2</option>
                        <option name="floors" value="3">3</option>
                        <option name="floors" value="1">4</option>
                        <option name="floors" value="2">5</option>
                        <option name="floors" value="3">6</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label" for="status">Trạng thái</label>
<%--                    <input class="form-control" name="status" id="status" value="${apartmentDTO.status}">--%>
                    <select class="form-control"  id="status" name="status">
                        <option name="status" value="Chưa cho thuê">Chưa cho thuê</option>
                        <option name="status" value="Đã cho thuê">Đã cho thuê</option>
                    </select>
                </div>
            <br>
            <div style="text-align: right">
                <input type="submit" value="Lưu thông tin thay đổi" class="btn btn-primary" style="width: 50%" >
            </div>
        </form>
    </div>
</section>
</body>
</html>
