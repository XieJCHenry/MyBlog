<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JC-Henry | 博客</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/indexStyle.css">
    <link rel="icon" href="<%=request.getContextPath()%>/resource/image/avatar.jpg" type="image/x-icon"/>
    <%-- jquery --%>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <%-- bootstrap --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.min.js"></script>
    <%--&lt;%&ndash; bootstarp-select &ndash;%&gt;
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>--%>
</head>
<%-- 导航栏 --%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>

<div class="container col-lg-12">

    <div class="box">
        <div class="content">
            <div class="content-left">
                <div class="personal-info">
                    <%--<p>个人信息</p>
                    <p>从数据库中读取博主信息</p>--%>
                    <img class="admin-avatar" src="<%=request.getContextPath()%>/resource/image/avatar.jpg">
                </div>
                <%--<div class="useful-website">
                    <p>常用网站</p>
                    <p>直接写死在页面</p>
                </div>--%>
            </div>

            <%--<div class="content-main">
                <p>博客展示</p>
                <p>从数据库中分页读取</p>
            </div>--%>
            <div class="content-main" id="content-main-id">
                <%--<div class="panel panel-default article-card">
                    <header class="article-header">
                        SpringMVC测试笔记
                    </header>
                    <div class="article-info">
                        <div class="original">原创or转载</div>
                        <div class="publish-date">2019年8月24日</div>
                        <div class="article-categories">Spring</div>
                    </div>
                    <div class="article-summary">
                        文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要
                        文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要
                        文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要文章摘要
                    </div>
                    <br/>
                    <footer class="article-footer">
                        <div class="article-tag"><a href="">文章标签</a></div>
                        <div class="read-all"><a href="">阅读全文</a></div>
                    </footer>
                </div>--%>
            </div>

            <div class="content-right">
                <ul class="articles-list">
                    <li><a href="">最新文章</a></li>
                    <li><a href="<%=request.getContextPath()%>/categories">分类</a></li>
                    <li><a href="<%=request.getContextPath()%>/archives">归档</a></li>
                    <li><a href="">标签云</a></li>
                    <p>网站版权</p>
                </ul>
            </div>
            <%-- 引入回到顶部按钮 --%>
            <jsp:include page="/WEB-INF/views/common/backToTopButton.jsp"/>
        </div>
    </div>
</div>
</body>
<div class="footer">
    <p>导航栏的位置</p>
    <a href="">@JC-Henry</a>
</div>
<script type="text/javascript">

    $(function () {
        to_page(1);
    });


    function to_page(pageNum) {
        $.ajax({
            url: "article/page/" + pageNum,
            type: "GET",
            success: function (data) {
                build_article_cards(data);
                // 2.解析json并显示分页信息
                // build_page_info(result);
                // 3.解析json并显示导航栏
                // build_page_nav(result);
            }
        });
    }

    function build_article_cards(data) {
        var articles = data.extend.pageInfo.list;
        $.each(articles, function (index, item) {
            var card_container = $("<div></div>").addClass("panel panel-default article-card");
            var header = $("<header></header>").addClass("article-header")
                .append($("<a></a>").attr("href", "article/" + item.articleTitle).append(item.articleTitle));
            var infoDiv = $("<div></div>").addClass("article-info");
            var originalDiv = $("<div></div>").addClass("original").append((item.articleAuthor == "JC-Henry") ? "原创" : "转载");
            var publishDataDiv = $("<div></div>").addClass("publish-date").append($("<a></a>").attr("href", "<%=request.getContextPath()%>/archives").append(dateFormat(item.publishDate)));
            var articleCateDiv =
                $("<div></div>").addClass("article-categories").append($("<span class='glyphicon glyphicon-folder-open'></span>"));
            var types = item.articleTypes;
            for (var i = 0; i < types.length; i++) {
                var typeName = types[i].typeName;
                var typeHref =
                    $("<a></a>").attr("href", "<%=request.getContextPath()%>/categories/" + typeName).append(typeName);
                articleCateDiv.append(typeHref, $("<span>&nbsp;</span>"));
            }
            infoDiv.append(originalDiv, $("<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>"), $("<span class='glyphicon glyphicon-calendar'></span>"),
                publishDataDiv, $("<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>"), articleCateDiv);
            var summaryDiv = $("<div></div>").addClass("article-summary").append(item.articleSummary);
            var footer = $("<footer></footer>").addClass("article-footer");

            var articleTagDiv =
                $("<div></div>").addClass("article-tag").append($("<span class='glyphicon glyphicon-tag'></span>"));
            var tags = item.articleTags;
            for (var i = 0; i < tags.length; i++) {
                var tagName = tags[i].tagName;
                /* 暂时不添加标签跳转链接 */
                var tagHref =
                    $("<a></a>").attr("href", "<%=request.getContextPath()%>/tags/"+tagName).append(tagName);
                articleTagDiv.append(tagHref, $("<span>&nbsp;</span>") );
            }

            var readAllDiv = $("<div></div>").addClass("read-all").append($("<a></a>").attr("href", "article/" + item.articleTitle).append("阅读全文"));
            footer.append(articleTagDiv,readAllDiv);
            header.appendTo(card_container);
            infoDiv.appendTo(card_container);
            summaryDiv.appendTo(card_container);
            footer.appendTo(card_container);
            card_container.appendTo("#content-main-id");
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

    /**
     * 构建底部导航栏
     * @param data
     */
    function build_page_nav(data) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi =
            $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));

        var prePageLi =
            $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));

        if (data.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(data.extend.pageInfo.pageNum - 1)
            });
        }
        var nxtPageLi =
            $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPageLi =
            $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));

        if (data.extend.pageInfo.hasNextPage == false) {
            nxtPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nxtPageLi.click(function () {
                to_page(data.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(data.extend.pageInfo.pages);
            });
        }


        ul.append(firstPageLi).append(prePageLi);
        $.each(data.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            if (data.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        ul.append(nxtPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    /**
     * 获取文章简介信息
     */
    function fetch_article_info() {
        $.ajax({
            url: "",
            type: "GET",
            success: function (data) {

            }
        });
    }

    var timer = null;

    function back_to_top(time) {
        cancelAnimationFrame(timer);
        var startTime = +new Date();
        var b = document.body.scrollTop || document.documentElement.scrollTop;
        var d = time;
        var c = b;
        timer = requestAnimationFrame(function func() {
            var t = d - Math.max(0, startTime - (+new Date()) + d);
            document.documentElement.scrollTop = document.body.scrollTop = t * (-c) / d + b;
            timer = requestAnimationFrame(func);
            if (t == d) {
                cancelAnimationFrame(timer);
            }
        });
    }
</script>
</html>