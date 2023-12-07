<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
</head>
<body>

<a class="list-group-item list-group-item-action list-group-item-primary" style="text-align: center">User Management</a>
<br/>
<div style="text-align: center">
    <form method="post" action="/user-servlet?action=search">
    <input type="text" name="search" placeholder="enter name product">
    <input type="submit" value="search">
    </form>
    <button type="button" class="btn btn-outline-dark">
        <a href="/user-servlet?action=create" style="text-decoration: none">Create</a></button>
    <form>
    <a type="submit" class="btn btn-outline-warning" href="/user-servlet?action=sort" >Sort</a>
    </form>
</div>
<hr/>
<form>
    <table class="table table-hover">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach items="${user}" var="u">
            <tr>
                <td><c:out value="${u.id}"/></td>
                <td><c:out value="${u.name}"/></td>
                <td><c:out value="${u.email}"/></td>
                <td><c:out value="${u.country}"/></td>
                <td><a href="/user-servlet?action=edit&id=${u.id}"> Edit</a></td>
                <td><a href="/user-servlet?action=delete&id=${u.id}"> Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <br/>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</html>
