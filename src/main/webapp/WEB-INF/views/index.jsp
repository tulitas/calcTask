<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
<a href="${pageContext.request.contextPath}/calculator">Calculator</a>
    <a href="<c:url value="/logout"/>">Logout</a>
</sec:authorize>

</body>
</html>