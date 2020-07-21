<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SergejK
  Date: 11-Jul-20
  Time: 09:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        * {
            font-family: Areal;
        }

        .b-container {
            width: 200px;
            height: 150px;
            background-color: #ccc;
            margin: 0px auto;
            padding: 10px;
            font-size: 30px;
            color: #fff;
        }

        .b-popup {
            width: 100%;
            min-height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            overflow: hidden;
            position: fixed;
            top: 0px;
        }

        .b-popup .b-popup-content {
            margin: 40px auto 0px auto;
            width: 400px;
            height: 140px;
            padding: 10px;
            background-color: #c5c5c5;
            border-radius: 5px;
            box-shadow: 0px 0px 10px #000;
        }
    </style>
    <title>hi</title>
</head>
<body>

<div class="b-container">
    Nice!!!
</div>

<div class="b-popup">
    Registration Success
    <div class="b-popup-content">

        <table style="word-wrap: break-word" border="7">
            <tr>
                <th>ID</th>
                <th>Full Name</th>
            </tr>
            <tr>
                <td width="75">${personToPopUp.id}</td>

                <td width="50">${personToPopUp.login}</td>


            </tr>
        </table>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="location.href='/login'">Close
        </button>
    </div>
</div>
<a href="${pageContext.request.contextPath}/">Main Page</a>
</body>
</html>
