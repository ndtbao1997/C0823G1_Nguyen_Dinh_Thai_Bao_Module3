<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculator" method="get" style="width: 320px">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>First operand</td>
                <td><input type="text" name="firstOperand" id="firstOperand"></td>
            </tr>
            <tr>
                <td>Operator</td>
                <td><select name="operator">
                    <option value="+">Addition</option>
                    <option value="-">Subtraction</option>
                    <option value="*">Multiplication</option>
                    <option value="/">Division</option>
                </select></td>
            </tr>
            <tr>
                <td>Second operand</td>
                <td><input type="text" name="secondOperand" id="secondOperand"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Calculator"></td>
            </tr>
        </table>
    </fieldset>
</form>
<c:if test="${message != null}">
    <p>Exception : ${message}</p>
</c:if>
<c:if test="${message == null}">
    <p>Result:</p>
    <p>${result}</p>
</c:if>
</body>
</html>