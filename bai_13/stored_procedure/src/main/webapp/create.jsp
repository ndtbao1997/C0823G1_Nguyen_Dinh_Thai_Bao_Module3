
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create user</title>
</head>
<body>
<h1>Create User</h1>
<form method="post">
    <fieldset>
        <legend>Form create user</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td>Country: </td>
                <td><input type="text" name="country"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="confirm"></td>
                <td><a href="/user-servlet">Back</a> </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
