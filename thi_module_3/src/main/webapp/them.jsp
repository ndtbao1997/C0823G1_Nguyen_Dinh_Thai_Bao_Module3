<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
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
<section>
    <div class="container flex" style="width: 50%; height: 100%; padding: 4.5em">
        <form method="post" style="width: 100%; position: relative">
            <h1 style="color: #f44566; text-align: center">00000</h1>
            <div class="form-group">
                <label class="form-label" for="name">000:</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="000"
                       value="" pattern="[^\d]+[\p{L}\s]+">
                <div id="emailHelp3" class="form-text" style="color: red">000</div>
            </div>
            <div class="form-group">
                <label class="form-label" for="dateOfBirth">000:</label>
                <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" placeholder="YYYY/MM/DD"
                       pattern="^\d{4}/(0[1-9]|1[0-2])/(0[1-9]|[12][0-9]|3[01])">
                <span id="ageError" style="color: red;"></span>
                <div id="emailHelp6" class="form-text" style="color: red"></div>
            </div>
            <div class="form-group">
                <label class="form-label" for="gender">000:</label>
                <select name="gender" id="gender">
                    <option value="0">000</option>
                    <option value="0">000</option>
                </select>
            </div>
            <div class="form-group">
                <label class="form-label" for="numberCMND">CCCD:</label>
                <input type="text" class="form-control" id="numberCMND" name="numberCMND" aria-describedby="emailHelp"
                       placeholder="Nhập số CMT/CCCD 9-12 số">
                <div id="emailHelp5" class="form-text" style="color: red"></div>
            </div>
            <div class="form-group">
                <label class="form-label" for="numberPhone">SĐT:</label>
                <input type="text" class="form-control" id="numberPhone" name="numberPhone">
                <div id="emailHelp7" class="form-text" style="color: red"></div>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1" class="form-label">Email:</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                       name="email">
                <div id="emailHelp8" class="form-text" style="color: red"></div>
            </div>
            <div class="form-group">
                <label class="form-label" for="address">000:</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="Nhập địa chỉ"
                       value="000">
                <div id="emailHelp9" class="form-text" style="color: red"></div>
            </div>
            <div class="form-group">
                <label class="form-label" for="idAccount">000:</label>
                <select name="idAccount" id="idAccount">
                </select>
            </div>

            <button type="button" class="btn btn-custom btn-sm">
                <a href="#" style="text-decoration: none"
                   data-bs-target="#exampleModal">
                    0000
                </a>
            </button>
            <br>
            <br>
            <br>
            <br>
            <input type="submit" class="btn btn-custom" value="Thêm khách hàng"
                   style="width: 45%; position: absolute;bottom: 0">

            <a href="#" class="btn custom-btn"
               style="right: 0;width: 45%; position: absolute;bottom: 0;">0000</a>
        </form>
        <div id="emailHelp4" class="form-text" style="font-size: 15px; color: red"></div>
    </div>
</section>
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
</body>
<script>
    <c:if test="${message!=null}">
    displayToast("Đã thêm mới thành công", "orange")
    </c:if>
    <c:if test="${message1!=null}">
    displayToast("Đã xóa thành công", "orange")
    </c:if>
    <c:if test="${message2!=null}">
    displayToast("Đã sửa thành công", "orange")
    </c:if>
</script>
</html>
