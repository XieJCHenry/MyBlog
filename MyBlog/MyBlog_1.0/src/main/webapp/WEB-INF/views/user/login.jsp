<%--
  Created by IntelliJ IDEA.
  User: a1098
  Date: 2019/08/27
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JC-Henry博客登录</title>
    <link rel="icon" href="<%=request.getContextPath()%>/resource/image/avatar.jpg" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/loginStyle.css">
    <%-- jquery --%>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <%-- bootstrap --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <form class="form-horizontal" action="<%=request.getContextPath()%>/user/doLogin" method="post">
                <span class="heading">博主登录</span>
                <div class="form-group">
                    <input class="form-control" id="inputUserName3" name="username" placeholder="用户名或电子邮件">
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group help">
                    <input type="password" class="form-control" id="inputPassword3" name="password" placeholder="密　码">
                    <i class="fa fa-lock"></i>
                    <a href="#" class="fa fa-question-circle"></a>
                </div>
                <div class="form-group">
                    <div class="main-checkbox">
                        <input type="checkbox" value="None" id="checkbox1" name="check"/>
                        <label for="checkbox1"></label>
                    </div>
                    <span class="text">记住我</span>
                    <button type="submit" class="btn btn-default" >登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<div class="footer" onclick="return false;">
    <a href="">©JC-Henry</a>
</div>

<script type="text/javascript">
</script>
</html>
