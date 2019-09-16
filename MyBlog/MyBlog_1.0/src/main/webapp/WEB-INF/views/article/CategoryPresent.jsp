<%--
  Created by IntelliJ IDEA.
  User: a1098
  Date: 2019/08/30
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JC-Henry | ${articleType.typeName}</title>
    <link rel="icon" href="<%=request.getContextPath()%>/resource/image/avatar.jpg" type="image/x-icon"/>
    <%-- jquery --%>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <%-- bootstrap --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
<div class="container">
    <h1>${articleType.typeName}</h1>

        <c:forEach var="article" items="${articles}">
            <p><a href="<%=request.getContextPath()%>/article/${article}">${article}</a></p><br/>
        </c:forEach>

</div>
</body>
</html>
