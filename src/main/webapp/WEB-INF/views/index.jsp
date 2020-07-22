<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">

    <button onclick="location.href='/options/personsList'">Users List</button>
    <button onclick="location.href='/'">Main page</button>
    <button onclick="location.href='/logout'">Logout</button>
    <button onclick="location.href='/calculator'">Calculator</button>
</sec:authorize>

</body>
</html>