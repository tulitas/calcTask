<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="a" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html xmlns:th="http://www.thymeleaf.org">
<%--
  Created by IntelliJ IDEA.
  User: SergejK
  Date: 07-Jul-20
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/resources/css/calculator.css"/>" rel="stylesheet">
    <%--<link href="<c:url value="/resources/JS/calculator.js"/>" rel="stylesheet">--%>
    <script>
        function dis(val) {
            document.getElementById("result").value += val
        }


        function clr() {
            document.getElementById("result").value = ""
        }
    </script>
    <!-- for styling -->
    <style>
        .title {
            margin-bottom: 10px;
            text-align: center;
            width: 210px;
            color: #ffddc5;
            border: solid black 2px;
        }

        input[type="button"] {
            background-color: #ffd8aa;
            color: black;
            border: solid black 2px;
            width: 100%
        }

        input[type="text"] {
            background-color: white;
            border: solid black 2px;
            width: 100%
        }

        textarea {
            position: absolute;
            right: 67%;
            top: 1%;
            width: 170px;
            height: 200px;
        }

    </style>
    <title>Wow</title>
</head>
<!-- create table -->
<body>
<sec:authorize access="isAuthenticated()">
<div class=title>Web Calculator</div>
<form action="${pageContext.request.contextPath}/options/calculator" method="get">
    <table border="1">

        <tr>
            <td colspan="3"><input type="text" id="result" name="solve" value="${answer}"/></td>
            <!-- clr() function will call clr to clear all value -->
            <td><input type="button" value="c" onclick="clr()"/></td>
        </tr>

        <tr>
            <!-- create button and assign value to each button -->
            <!-- dis("1") will call function dis to display value -->
            <td><input type="button" value="1" onclick="dis('1')"/></td>
            <td><input type="button" value="2" onclick="dis('2')"/></td>
            <td><input type="button" value="3" onclick="dis('3')"/></td>
            <td><input type="button" value="/" onclick="dis('/')" name="divide"/></td>
        </tr>
        <tr>
            <td><input type="button" value="4" onclick="dis('4')"/></td>
            <td><input type="button" value="5" onclick="dis('5')"/></td>
            <td><input type="button" value="6" onclick="dis('6')"/></td>
            <td><input type="button" value="-" onclick="dis('-')" name="subtract"/></td>
        </tr>
        <tr>
            <td><input type="button" value="7" onclick="dis('7')"/></td>
            <td><input type="button" value="8" onclick="dis('8')"/></td>
            <td><input type="button" value="9" onclick="dis('9')"/></td>
            <td><input type="button" value="+" onclick="dis('+')" name="add"/></td>
        </tr>
        <tr>
            <td><input type="button" value="." onclick="dis('.')"/></td>
            <td><input type="button" value="0" onclick="dis('0')"/></td>
            <!-- solve function call function solve to evaluate value -->
            <td><input type="submit" value="=" onclick="solve()"/></td>
            <td><input type="button" value="*" onclick="dis('*')" name="multiply"/></td>
        </tr>

    </table>
</form>
<%--<form action="${pageContext.request.contextPath}/options/save" method="get">--%>

<label title="log" class="display">
<textarea class="scrollabletextbox" name="note">

    ${list}
</textarea>

</label>
<br>

<a:form action="${pageContext.request.contextPath}/logs/save" method="post">
    <label>
        <input hidden name="log" value="${list}"/>
    </label>
    <label>for save enter name
        <input name="name"/>
    </label> >
<button type="submit">save</button>
</a:form>

<a:form action="${pageContext.request.contextPath}logs/findLog" method="get">

    <label>for find log enter name
        <input name="name"/>
    </label> >
    <button type="submit">find</button>
</a:form>
<button onclick="location.href='/'">Main page</button><br>


</sec:authorize>

</body>
</html>
