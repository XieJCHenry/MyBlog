<%--
  Created by IntelliJ IDEA.
  User: a1098
  Date: 2019/08/22
  Time: 14:09
  To change this template use File | Settings | File Templates.

  按照时间线或特定方式排列文章，查找文章

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JC-Henry | 文章分类</title>
    <link rel="icon" href="<%=request.getContextPath()%>/resource/image/avatar.jpg" type="image/x-icon"/>
    <%-- jquery --%>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <%-- bootstrap --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/articleListStyle.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/articleCategories.css">
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
<div class="container col-lg-12">
    <div class="row" id="content-panel">
        <div class="row col-lg-8 col-lg-offset-2" id="left-list">
            <h1>文章分类</h1>
        </div>
        <br/>
        <div class="row col-lg-8 col-lg-offset-3" id="articles-group">
            <ul id="articles-ul"></ul>
        </div>
        <jsp:include page="/WEB-INF/views/common/backToTopButton.jsp"/>
    </div>

    <%--<div class="row content-top">
        <h1>文章分类</h1>
    </div>
    <br/>
    <div class="row col-lg-4 content-left">
        <ul><li>hahahhahahha</li></ul>
    </div>
    <div class="row col-lg-8 col-lg-offset-3 content-main">
        <ul id="articles-ul"></ul>
    </div>--%>
</div>
</body>
<script type="text/javascript">
    // 保存列表信息
    var categories;
    $.ajax({
        url: "<%=request.getContextPath()%>/categories/all",
        type: "GET",
        success: function (data) {
            console.log(data);
            // 渲染到前端页面，暂时完成
            categories = data.extend.categories;
            var list = data.extend.categories;
            $.each(list, function (index, item) {
                console.log(item.typeId);
                var articleHref =
                    $("<a></a>").attr("href", "<%=request.getContextPath()%>/categories/" + item.typeId)
                        .attr("id","type-"+item.typeId+"-href")
                        .append(item.typeName, "&nbsp;|&nbsp;",
                            item.articleNum);
                <%--.attr("href", "<%=request.getContextPath()%>/article/" + item.articleTitle);--%>
                var articleTitleLi = $("<li></li>").append(articleHref);
                articleTitleLi.appendTo("#articles-group ul");
            });
        }
    });


    function show_article_in_category(typeId) {
        $.ajax({
            url: "<%=request.getContextPath()%>/categories/" + typeId,
            type: "GET",
            success: function (data) {
                console.log(data);
            }
        });
    }
</script>
</html>
