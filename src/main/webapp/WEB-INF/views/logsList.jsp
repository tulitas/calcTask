<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="a" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <link href="<c:url value="/resources/css/personsList.css"/>" rel="stylesheet">

    <title>Logs List</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
<table id="myTable">
    <tr>
        <th>Name</th>
        <th>Log</th>


    </tr>

    <c:forEach var="logList" items="${findLog}">

        <tr>
            <td width="75">${logList.name}</td>

            <td width="50">${logList.log}</td>
        </tr>
    </c:forEach>
</table>
<div>
    Current Time :<%= new java.util.Date() %><br>
</div>
<button onclick="location.href='/options/personsList'">Users List</button>
<button onclick="location.href='/'">Main page</button>
<button onclick="location.href='/logout'">Logout</button>
<button onclick="location.href='/calculator'">Calculator</button>
</sec:authorize>
</body>
</html>
