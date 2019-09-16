<%--
  Created by IntelliJ IDEA.
  User: a1098
  Date: 2019/08/29
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JC-Henry | 文章归档</title>
    <link rel="icon" href="<%=request.getContextPath()%>/resource/image/avatar.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/categoryPresent.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/articleListStyle.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <%-- bootstrap --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
<div class="container col-lg-12">
    <div class="row col-lg-8 col-lg-offset-2" id="main-panel">
        <div class="row content-top">
            <h1>文章归档</h1>
        </div>
        <br/>
        <%--<div class="row col-lg-4 content-left">
            <ul><li>hahahhahahha</li></ul>
        </div>--%>
        <div class="row col-lg-8 col-lg-offset-3 content-main">
            <ul id="article-list"></ul>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        to_page(1);
    });

    function to_page(pageNum) {
        $.ajax({
            url: "<%=request.getContextPath()%>/archives/" + pageNum,
            type: "GET",
            success: function (data) {
                console.log(data);
                var articleList = data.extend.pageInfo.list;
                $.each(articleList, function (index, item) {
                    var itemLi = $("<li></li>").append(
                        $("<span></span>").append(item.originalAuthor=="JC-Henry"?"原创":"转载"),
                        $("<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>"),
                        $("<a></a>").attr("href", "<%=request.getContextPath()%>/article/"+item.articleTitle)
                            .append(dateFormat(item.publishDate), " | ", item.articleTitle, " | ")
                    );
                    itemLi.appendTo("#article-list");
                });
                // console.log(data);
            }
        });
    }

    // Long 转 日期
    function dateFormat(longTypeDate) {
        var dateType = "";
        var date = new Date();
        date.setTime(longTypeDate);
        dateType += date.getFullYear();   //年
        dateType += "-" + getMonth(date); //月
        dateType += "-" + getDay(date);   //日
        return dateType;
    }

    //返回 01-12 的月份值
    function getMonth(date) {
        var month = "";
        month = date.getMonth() + 1; //getMonth()得到的月份是0-11
        if (month < 10) {
            month = "0" + month;
        }
        return month;
    }

    //返回01-30的日期
    function getDay(date) {
        var day = "";
        day = date.getDate();
        if (day < 10) {
            day = "0" + day;
        }
        return day;
    }
</script>
</html>
