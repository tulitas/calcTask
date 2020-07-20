<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
<a href="${pageContext.request.contextPath}/calculator">Calculator</a>
</sec:authorize>

</body>
</html>