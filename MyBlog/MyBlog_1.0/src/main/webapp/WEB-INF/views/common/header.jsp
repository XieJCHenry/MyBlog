<%--
  Created by IntelliJ IDEA.
  User: a1098
  Date: 2019/08/23
  Time: 21:56
  To change this template use File | Settings | File Templates.

  作为复用的组件
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/headerStyle.css">
<div class="header col-lg-12">
    <div class="header_nav col-lg-10 col-lg-offset-1">
        <div class="header_title">
            <a href="<%=request.getContextPath()%>" style="color:#0a001f" class="header_home_label">JC-Henry |
                个人博客</a>
        </div>
        <div class="header_bar">
            <ul class="header_bar_list">
                <li><a href="<%=request.getContextPath()%>">首页</a></li>
                <li><a href="<%=request.getContextPath()%>/categories/">分类</a></li>
                <li><a href="<%=request.getContextPath()%>/archives">归档</a></li>
                <li><a href="">关于我</a></li>
                <li><a href="">网站日志</a></li>
            </ul>
        </div>
        <div class="col-lg-2 col-lg-offset-5">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="请输入要搜索的内容" disabled>
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" disabled>搜索</button>
      </span>
            </div>
        </div>
    </div>
</div>
