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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
  <script>
    function displayToast(message, color) {
      document.getElementById("toastContent").innerHTML = message;
      document.getElementById("liveToast").style.background = color;
      let myAlert = document.getElementById('liveToast');//select id of toast
      let bsAlert = new bootstrap.Toast(myAlert);//inizialize it
      bsAlert.show();//show it
    }
  </script>
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
<div class="container" style="margin-top: 50px; margin-left: 200px; margin-right: 30px; width: 75%; height: auto">
  <h1 class="text-center" style="font-weight: bold;color: #f44566">Thêm mới nhân viên</h1>
  <form method="post">
    <div class="form-group">
      <label class="form-label" for="name">Tên nhân viên (*):</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="Nhập họ tên">
      <div id="emailHelp1" class="form-text" style="color: red">${message1}</div>
    </div>
    <div class="form-group">
      <label class="form-label" for="dateOfBirth">Ngày sinh (*):</label>
      <input type="text" class="form-control" id="dateOfBirth" name="dateOfBirth" placeholder="YYYY-MM-DD">
      <div id="emailHelp2" class="form-text" style="color: red">${message2}</div>
    </div>
    <div class="form-group">
      <label class="form-label">Giới tính:</label>
      <label>
        <select name="gender">
          <option value="0">Nam</option>
          <option value="1">Nữ</option>
        </select>
      </label>
    </div>
    <div class="form-group">
      <label class="form-label" for="numberCMND">CCCD (*) :</label>
      <input type="text" class="form-control" id="numberCMND" name="numberCMND" placeholder="Nhập số CMT/CCCD 9-12 số" pattern="^([0-9]{9}|[0-9]{12})+$" minlength="9" maxlength="12">
      <div id="emailHelp3" class="form-text" style="color: red">${message3}</div>
    </div>
    <div class="form-group">
      <label class="form-label" for="wage">Mức lương (*) :</label>
      <input type="text" class="form-control" id="wage" name="wage" placeholder="Nhập lương" pattern="^\d+$">
    </div>
    <div class="form-group">
      <label class="form-label" for="phone">Số điện thoại (*) :</label>
      <input type="text" class="form-control" id="phone" name="phone" placeholder="Nhập số điện thoại" minlength="9">
      <div id="emailHelp4" class="form-text" style="color: red">${message4}</div>
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1" class="form-label">Email (*) :</label>
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" placeholder="name@gmail.com">
      <div id="emailHelp" class="form-text">Chúng tôi sẽ không bao giờ chia sẻ email của bạn với bất kỳ ai khác.
      </div>
      <div id="emailHelp5" class="form-text" style="color: red">${message5}</div>
    </div>
    <div class="form-group">
      <label class="form-label" for="address">Địa chỉ:</label>
      <input type="text" class="form-control" id="address" name="address" placeholder="Nhập địa chỉ">
    </div>
    <br>
    <div class="form-group">
      <label class="form-label">Bộ phận:</label>
      <label>
        <select name="idWorkingPart">
          <option value="1">Nhân viên</option>
          <option value="2">Trưởng phòng</option>
        </select>
      </label>
    </div>
    <div class="form-group">
      <label class="form-label" for="idAccount">Tài khoản (*) :</label>
      <select name="idAccount" id="idAccount">
        <c:forEach items="${account}" var="account" varStatus="loop">
          <option value="${account.id}">${account.accountName}</option>
        </c:forEach>
      </select>
    </div>
    <button type="button" class="btn btn-custom">
      <a href="/account-admin?action=addAccount" style="text-decoration: none"
         data-bs-target="#exampleModal">
        Thêm mới tài khoản
      </a>
    </button>
    <button type="submit" class="btn custom-btn btn-block">Thêm nhân viên</button>
  </form>
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
<div>${message}</div>
<script>
  <c:if test="${message!=null}">
  displayToast("Đã thêm thành công", "orange")
  </c:if>
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</html>
