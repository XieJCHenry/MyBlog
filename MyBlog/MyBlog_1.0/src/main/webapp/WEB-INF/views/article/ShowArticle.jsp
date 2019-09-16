<%--
  Created by IntelliJ IDEA.
  User: a1098
  Date: 2019/08/22
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JC-Henry | ${title}</title>
    <link rel="icon" href="<%=request.getContextPath()%>/resource/image/avatar.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/showArticle.css">
    <%-- jquery --%>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <%-- bootstrap --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.min.js"></script>
    <%-- bootstarp-select --%>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/editormd/css/editormd.preview.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/editormd/css/editormd.css"/>

    <script src="<%=request.getContextPath()%>/resource/editormd/lib/marked.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/editormd/lib/prettify.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/editormd/editormd.min.js"></script>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
<div class="container-fluid col-lg-12">
    <div class="row main-panel col-lg-6  col-lg-offset-3">
        <div class="row col-lg-12" id="article-title-div" align="center">
            <h1>${title}</h1>
        </div>
        <div class="row col-lg-12 content-panel">
            <div id="info-list">
            </div>
            <div id="info-summary">
            </div>
            <div id="content-main">
                <div class="content" id="content"></div>
            </div>
            <div id="content-foot" class="col-lg-12">
            </div>
        </div>
    </div>

    <div class="row col-lg-6">
        <div class="input-group">
            <%--<label>评论：</label>
            <textarea class="form-control" rows="5" id="comment-area"></textarea>
            <button type="submit" onclick="submitComment()">提交</button>--%>
        </div>
    </div>

</div>
<%--<jsp:include page="/WEB-INF/views/common/backToTopButton.jsp"/>--%>
</body>
<script type="text/javascript">
    editormd.markdownToHTML("content");
    $(function () {
        $.ajax({
            url: "info/${title}",
            type: "GET",
            success: function (data) {
                console.log(data);
                var original = (data.extend.originalAuthor == "JC-Henry" ? "原创" : "转载");
                /*var typeHref = $("<a></a>").attr("href","<%=request.getContextPath()%>/categories/"+data.extend.typeStr)
                    .append(data.extend.typeStr);*/
                var infoPanel = $("<p></p>").append(original, " | ", data.extend.typeStr, " | ", data.extend.pubDate);
                infoPanel.appendTo("#info-list");

                var summaryPanel = $("<p></p>").append(data.extend.summary);
                summaryPanel.appendTo("#info-summary");

                if(data.extend.previous!=null){
                    var previous = $("<a></a>").attr("id","previous-article")
                        .attr("href",data.extend.previous)
                        .append("上一篇："+data.extend.previous);
                    $("#content-foot").append(previous);
                }
                if(data.extend.next!=null){
                    var next = $("<a></a>").attr("id","next-article")
                            .attr("href",data.extend.next)
                            .append("下一篇："+data.extend.next);
                    $("#content-foot").append($("<span class='col-lg-12'></span>"),next);
                }

            }
        });

        $.ajax({
            url: "content/${title}",
            type: "GET",
            success: function (data) {
                // console.log(data);
                $("#content").append(data.extend.content);
            }
        });
    });

    /**
     * 获取正文内容，然后渲染到页面中
     *
     */
    function fetchContent() {

    }

    // 获得评论，后端过滤不良字段
    function submitComment() {
        console.log($("#comment-area").val());
    }
</script>
</html>
