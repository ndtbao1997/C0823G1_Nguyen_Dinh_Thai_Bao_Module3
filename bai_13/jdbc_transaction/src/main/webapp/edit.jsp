<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 06/12/2023
  Time: 8:38 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<form method="post">
    <fieldset>
        <legend>Form edit user</legend>
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" value="${user.getName()}"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" value="${user.getEmail()}"></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td><input type="text" name="country" value="${user.getCountry()}"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Confirm"></td>
                <td><a href="/user-servlet"> Back </a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
