<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../css/styleLogin.css">
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
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,700&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>
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

        .card {
            border: none
        }

    </style>
</head>
<body class="sub_page">
<jsp:include page="header.jsp"/>
<section class="contact_section layout_padding">
    <div class="container">
        <div class="heading_container">
            <h2>Đăng nhập tài khoản</h2>
        </div>
        <div class="row">
            <div class="col-md-5 mx-auto">
                <div class="contact-form">
                    <form method="post">
                        <div>
                            <label style="font-size: 1em;margin-bottom: 0.5em" for="useName">Tên đăng nhập:</label>
                            <input type="text" class="form-control" aria-describedby="emailHelp" name="useName"
                                   id="useName" placeholder="Nhập tài khoản">
                        </div>
                        <div>
                            <label style="font-size: 1em;margin-bottom: 0.5em" for="password">Mật khẩu:</label>
                            <input type="password" class="form-control" aria-describedby="emailHelp" name="password"
                                   id="password" placeholder="Nhập mật khẩu">
                        </div>
                        <div id="emailHelp4" class="form-text" style="font-size: 15px; color: red">${message}</div>
                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn_on-hover btn-primary" style="background-color: #0d6efd">
                                Đăng nhập
                            </button>
                        </div>
                        <div class="d-flex justify-content-center">
                            <button class="btn_on-hover btn-primary" style="background-color: #f44566">
                                <a href="/apartment" style="color: white; text-decoration: none">
                                    Quay lại trang chủ
                                </a>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="map_img-box">
            <img src="http://www.yunzhibian.com/images/map-img.png" alt="">
        </div>
    </div>
</section>
</body>
</html>
