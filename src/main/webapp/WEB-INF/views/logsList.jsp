<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="a" uri="http://www.springframework.org/tags/form" %>
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
</body>
</html>
