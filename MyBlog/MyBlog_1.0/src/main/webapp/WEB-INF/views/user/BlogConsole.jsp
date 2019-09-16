<%--
  Created by IntelliJ IDEA.
  User: a1098
  Date: 2019/08/27
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>JC-Henry | 博客后台</title>
    <link rel="icon" href="<%=request.getContextPath()%>/resource/image/avatar.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/blogConsole.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/headerStyle.css">
    <%-- jquery --%>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <%-- bootstrap --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.min.js"></script>
    <%-- bootstrap-select --%>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
    <%-- bootstrap-timepicker --%>
    <link href="<%=request.getContextPath()%>/static/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css"
          rel="stylesheet" media="screen">
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/static/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"
            charset="UTF-8"
    ></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/static/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js">
    </script>

</head>
<div class="header col-lg-12">
    <div class="header_nav col-lg-10 col-lg-offset-1">
        <div class="header_title">
            <a href="<%=request.getContextPath()%>" style="color:#0a001f" class="header_home_label">JC-Henry |
                博客管理后台</a>
        </div>
        <div class="header_bar col-lg-offset-9">
            <ul class="header_bar_list">
                <li>博主：${sessionScope.user.username}</li>

            </ul>
        </div>
    </div>
</div>
<body>
<%-- 文章编辑模态框 --%>
<div class="modal fade" id="articleEditModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="articleModalLabel"><b>文章信息编辑</b></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="article_edit_form">
                    <%--<div class="form-group">
                        <label class="col-sm-2 control-label">文章标题</label>
                        <div class="col-sm-8">
                            <input name="articleTitle" class="form-control"
                                   id="title_edit_input" ="此处填入文章标题">
                            <span class="help-block"></span>
                        </div>
                    </div>--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">原作者</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control"
                                   id="original_edit_input" placeholder="填入原作者名">
                            <%-- 模态框加载时执行ajax请求获得文章 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">发表日期</label>
                        <div class="col-sm-8">
                            <%-- 日期选择器 --%>
                            <div class="form-group">
                                <div class="input-group date form_datetime col-sm-8 col-sm-offset-1"
                                     data-date="1979-09-16T05:25:07Z"
                                     data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                                    <input class="form-control" size="16" type="text" value="" readonly>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-remove"></span></span>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                </div>
                                <input type="hidden" id="dtp_pubDate" value=""/><br/>
                            </div>
                            <%-- 提供“现在”的选项，以点击保存按钮为时间点 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">更新日期</label>
                        <div class="col-sm-8">
                            <%--<input type="text" class="form-control"
                                   id="update_edit_input" placeholder="填入更新日期">--%>
                            <%-- 日期选择器 --%>
                            <div class="form-group">
                                <div class="input-group date form_datetime col-sm-8 col-sm-offset-1"
                                     data-date="1979-09-16T05:25:07Z"
                                     data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                                    <input class="form-control" size="16" type="text" value="" readonly>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-remove"></span></span>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                </div>
                                <input type="hidden" id="dtp_upDate" value=""/><br/>
                            </div>
                            <%-- 提供“现在”的选项，以点击保存按钮为时间点 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">喜欢数</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control"
                                   id="update_edit_input" placeholder="只能重置为 0 或者设置不超过现有大小的值">
                            <%-- 模态框加载时执行ajax请求获得文章 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">正文内容</label>
                        <div class="col-sm-8">
                            <a class="btn btn-success" href="<%=request.getContextPath()%>/article/edit"
                               target="_blank">点击此处编辑正文</a>
                            <%-- 模态框加载时执行ajax请求获得文章 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
            </div>
        </div>
    </div>
</div>
<%-- 文章删除模态框 --%>
<div class="modal fade" id="articleDelModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <%--                <h4 class="modal-title"><b>文章删除</b></h4>--%>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger" role="alert">是否删除该文章？</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">删除</button>
            </div>
        </div>
    </div>
</div>

<%-- 分类编辑模态框 --%>
<div class="modal fade" id="typeEditModal" tabindex="-1" role="dialog"
     aria-labelledby="typeModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="typeModalLabel"><b>分类信息编辑</b></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="type_edit_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分类名称</label>
                        <div class="col-sm-8 success">
                            <input id="oldTypeName" hidden/>
                            <input name="typeName" class="form-control"
                                   id="typeName_edit_input" placeholder="输入新的分类名称">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <label class="col-sm-2 control-label">添加文章</label>
                        <div class="col-sm-10">
                            &lt;%&ndash; 模态框加载时执行ajax请求获得文章 &ndash;%&gt;
                            <select id="preSelect-list" class="selectpicker" title="选择要添加到该分类的文章" multiple>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal"
                        onclick="do_update_type()">保存</button>
            </div>
        </div>
    </div>
</div>
<%-- 分类添加模态框 --%>
<div class="modal fade" id="typeAddModal" tabindex="-1" role="dialog"
     aria-labelledby="typeAddModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="typeAddModalLabel"><b>添加分类</b></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="type_add_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分类名称</label>
                        <div class="col-sm-8">
                            <input name="typeName" class="form-control"
                                   id="typeName_add_input" placeholder="输入分类名称">
                            <span class="help-block"></span>
                        </div>
                    </div>
                   <%-- <div class="form-group">
                        <label class="col-sm-2 control-label">添加文章</label>
                        <div class="col-sm-10">
                            &lt;%&ndash; 模态框加载时执行ajax请求获得文章 &ndash;%&gt;
                            <select id="preSelect-list" class="selectpicker" title="选择要添加到该分类的文章" multiple>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
            </div>
        </div>
    </div>
</div>
<%-- 分类删除模态框 --%>
<div class="modal fade" id="typeDelModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <%--                <h4 class="modal-title"><b>分类删除</b></h4>--%>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger" role="alert">是否删除该分类？</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">删除</button>
            </div>
        </div>
    </div>
</div>

<%-- 标签编辑模态框 --%>
<div class="modal fade" id="tagEditModal" tabindex="-1" role="dialog"
     aria-labelledby="tagModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="tagModalLabel"><b>标签信息编辑</b></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="tag_edit_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">标签名称</label>
                        <div class="col-sm-8">
                            <input name="typeName" class="form-control"
                                   id="tagName_edit_input" placeholder="输入新的标签名称">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
            </div>
        </div>
    </div>
</div>
<%-- 标签添加模态框 --%>
<div class="modal fade" id="tagAddModal" tabindex="-1" role="dialog"
     aria-labelledby="tagAddModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="tagAddModalLabel"><b>添加标签</b></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="tag_add_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">标签名称</label>
                        <div class="col-sm-8">
                            <input name="tagName" class="form-control"
                                   id="tag_add_input" placeholder="输入新的标签名称">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">添加文章</label>
                        <div class="col-sm-10">
                            <%--<input type="text" name="email" class="form-control"
                                   id="email_add_input" placeholder="员工邮箱">--%>
                            <%-- 模态框加载时执行ajax请求获得文章 --%>
                            <select id="preSelect-list" class="selectpicker" title="选择要添加到该标签的文章" multiple>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
            </div>
        </div>
    </div>
</div>
<%-- 标签删除模态框 --%>
<div class="modal fade" id="tagDelModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <%--                <h4 class="modal-title"><b>标签删除</b></h4>--%>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger" role="alert">是否删除该标签？</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">删除</button>
            </div>
        </div>
    </div>
</div>

<%-- 网页主体 --%>
<div class="container col-lg-12">
    <div class="row col-lg-12" id="base-container">
        <%-- 左侧菜单栏 --%>
        <div class="col-lg-2">
            <ul id="main-nav" class="nav nav-tabs nav-stacked">
                <li class="active">
                    <a href="">
                        <i class="glyphicon glyphicon-th-large"></i>
                        首页
                    </a>
                </li>
                <li class="active">
                    <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        博客管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="systemSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <%-- 点击链接不跳转，而是执行onclick函数 --%>
                        <li><a href="javascript:void(0);" onclick="to_page_articles(1)">
                            <i class="glyphicon glyphicon-file"></i>文章管理</a></li>
                        <li><a href="javascript:void(0);" onclick="to_page_types(1)">
                            <i class="glyphicon glyphicon-th-list"></i>分类管理</a></li>
                        <li><a href="javascript:void(0);" onclick="to_page_tags(1)">
                            <i class="glyphicon glyphicon-tags"></i>标签管理</a></li>
                    </ul>
                </li>
                <%--<li>
                    <a href="#systemSetting2" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        系统管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="systemSetting2" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href=""><i class="glyphicon glyphicon-user"></i>用户管理</a></li>
                        <li><a href=""><i class="glyphicon glyphicon-th-list"></i>菜单管理</a></li>
                        <li><a href=""><i class="glyphicon glyphicon-asterisk"></i>角色管理</a></li>
                        <li><a href=""><i class="glyphicon glyphicon-edit"></i>修改密码</a></li>
                        <li><a href=""><i class="glyphicon glyphicon-eye-open"></i>日志查看</a></li>
                    </ul>
                </li>--%>
                <li class="active">
                    <a href="" class="nav-header collapsed">
                        <i class="glyphicon glyphicon-log-out"></i>
                        博主退出
                        <%--<span class="pull-right glyphicon glyphicon-chevron-down"></span>--%>
                    </a>
                </li>
            </ul>
        </div>
        <%-- 右侧主界面 --%>
        <div class="col-lg-10" id="main-panel">
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $("<div></div>").addClass("jumbotron").append(
            $("<h1></h1>").append("JC-Henry 博客"),
            $("<h3><b></b></h3>").append("管理后台")
            // $("<div></div>").append($("<button></button>").append("文章管理"))
        ).appendTo("#main-panel");
    });

    var articlePageInfo;

    /* 文章分页 */
    function to_page_articles(pageNum) {
        $.ajax({
            url: "<%=request.getContextPath()%>/article/page/" + pageNum,
            type: "GET",
            success: function (data) {
                articlePageInfo = data;
                /* 构建表格 */
                build_articles_panel(data);
                /* 构建底部导航栏 */
                build_page_nav(data);
            }
        });
    }

    var typePageInfo;

    /* 分类分页 */
    function to_page_types(pageNum) {
        $.ajax({
            url: "<%=request.getContextPath()%>/categories/page/" + pageNum,
            type: "GET",
            success: function (data) {
                // console.log(data);
                typePageInfo = data.extend.pageInfo;
                build_types_panel(data);
                build_page_nav(data);
            }
        });
    }

    var tagsPageInfo;

    /* 标签分页 */
    function to_page_tags(pageNum) {
        $.ajax({
            url: "<%=request.getContextPath()%>/tags/page/" + pageNum,
            type: "GET",
            success: function (data) {
                tagsPageInfo = data.extend.pageInfo;
                build_tags_panel(data);
                build_page_nav(data);
            }
        });
    }

    /* 构建文章表格 */
    function build_articles_panel(data) {
        // console.log(data);
        var articles = data.extend.pageInfo.list;
        // 构建表格
        // 1、构建表头
        $("#main-panel").empty();
        var title = $("<h3 class='col-lg-2'></h3>").append("文章管理");
        var articleAddHref =
            $("<a></a>").addClass("btn btn-success col-lg-offset-8").attr("href", "<%=request.getContextPath()%>/article/edit")
                .attr("target", "_Blank").append("添加文章");
        var titleDiv = $("<div></div>").append(title, articleAddHref).attr("id", "titleDiv");
        var articleTableHead = $("<thead></thead>").append(
            $("<tr></tr>").addClass("info").append(
                $("<th></th>").append($("<input>")
                    .attr("type", "checkbox").attr("id", "check_all")),
                $("<th></th>").append("文章Id"),
                $("<th></th>").append("标题"),
                $("<th></th>").append("原作者"),
                $("<th></th>").append("发表日期"),
                $("<th></th>").append("更新日期"),
                $("<th></th>").append("分类"),
                $("<th></th>").append("标签"),
                $("<th></th>").append("喜欢数"),
                $("<th></th>").append("操作")
            )
        );
        // 2、构建表格主体
        var articleTableBody = $("<tbody></tbody>").attr("id", "article-table-body");
        $.each(articles, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var articleIdTd = $("<td></td>").append(item.articleId);
            var articleTitleTd = $("<td></td>").append(item.articleTitle);
            var articleOriginalTd = $("<td></td>").append(item.originalAuthor);
            var articlePubDateTd = $("<td></td>").append(dateFormat(item.publishDate));
            var articleUpDateTd = $("<td></td>").append(dateFormat(item.updateDate));
            var articleLikeTd = $("<td></td>").append(item.articleLike);

            var articleTypeTd = $("<td></td>");
            var articleTypeList = item.articleTypes;
            for (var i = 0; i < articleTypeList.length; i++) {
                var typeName = articleTypeList[i].typeName;
                var typeHref = $("<a></a>").attr("href", "").append(typeName);
                articleTypeTd.append(typeHref, $("<span>&nbsp;</span>"));
            }

            var articleTagTd = $("<td></td>");
            var articleTagList = item.articleTags;
            for (var i = 0; i < articleTagList.length; i++) {
                var tagName = articleTagList[i].tagName;
                var tagHref = $("<a></a>").attr("href", "").append(tagName);
                articleTagTd.append(tagHref, $("<span>&nbsp;</span>"));
            }

            var editBtn = $("<button></button>")
                .attr("type", "button")
                .attr("data-toggle", "modal")
                .attr("data-target", "#articleEditModal")
                .addClass("btn btn-primary btn-sm edit_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
            editBtn.attr("edit_id", item.articleId);
            var delBtn = $("<button></button>")
                .attr("data-toggle", "modal")
                .attr("data-target", "#articleDelModal")
                .addClass("btn btn-danger btn-sm delete_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
            delBtn.attr("del_id", item.articleId);
            var operationTd = $("<td></td>").append(editBtn, $("<span>&nbsp;</span>"), delBtn);

            $("<tr></tr>").append(
                checkBoxTd,
                articleIdTd,
                articleTitleTd,
                articleOriginalTd,
                articlePubDateTd,
                articleUpDateTd,
                articleTypeTd,
                articleTagTd,
                articleLikeTd,
                operationTd
            ).appendTo(articleTableBody);
        });

        var articleTable = $("<table></table>").addClass("table table-hover table-bordered").attr("id", "articles_table")
            .append(articleTableHead, articleTableBody);

        var pageNavDiv = $("<div></div>").addClass("col-lg-6").attr("id", "page_nav_area");

        titleDiv.appendTo("#main-panel");
        articleTable.appendTo("#main-panel");
        pageNavDiv.appendTo("#main-panel");
    }

    /* 构建文章分类表格 */
    function build_types_panel(data) {
        var types = data.extend.pageInfo.list;
        $("#main-panel").empty();
        // 1、构建表头
        var title = $("<h3 class='col-lg-2'></h3>").append("分类管理");
        var typeAddBtn = $("<button>添加分类</button>").addClass("btn btn-success col-lg-offset-8")
            .attr("data-toggle", "modal")
            .attr("data-target", "#typeAddModal");
        var titleDiv = $("<div></div>").append($("<h3></h3>").append(title, typeAddBtn));
        var typeTableHead = $("<thead></thead>").append(
            $("<tr></tr>").addClass("info").append(
                $("<th></th>").append($("<input>")
                    .attr("type", "checkbox").attr("id", "check_all")),
                $("<th></th>").append("分类Id"),
                $("<th></th>").append("分类名称"),
                $("<th></th>").append("文章数"),
                $("<th></th>").append("操作")
            )
        );
        //2、构建表格主体
        var typeTableBody = $("<tbody></tbody>").attr("id", "article-table-body");
        $.each(types, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var typeIdTd = $("<td></td>").append(item.typeId);
            var typeNameTd = $("<td></td>").append(item.typeName);
            var articlesNumTd = $("<td></td>").append(item.articleNum);

            var editBtn = $("<button></button>")
                .attr("id", "typeEditBtn")
                .attr("type", "button")
                .attr("data-toggle", "modal")
                .attr("data-target", "#typeEditModal")
                .addClass("btn btn-primary btn-sm edit_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
            editBtn.attr("edit_id", item.typeId);
            editBtn.attr("type_name", item.typeName);
            var delBtn = $("<button></button>")
                .attr("data-toggle", "modal")
                .attr("data-target", "#typeDelModal")
                .addClass("btn btn-danger btn-sm delete_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
            delBtn.attr("del_id", item.typeId);
            delBtn.attr("type_name", item.typeName);
            var operationTd = $("<td></td>").append(editBtn, $("<span>&nbsp;</span>"), delBtn);

            $("<tr></tr>").append(
                checkBoxTd,
                typeIdTd,
                typeNameTd,
                articlesNumTd,
                operationTd
            ).appendTo(typeTableBody);
        });
        var typeTable = $("<table></table>").addClass("table table-hover table-bordered").attr("id", "articles_table")
            .append(typeTableHead, typeTableBody);

        var pageNavDiv = $("<div></div>").addClass("col-lg-6").attr("id", "page_nav_area");

        titleDiv.appendTo("#main-panel");
        typeTable.appendTo("#main-panel");
        pageNavDiv.appendTo("#main-panel");
    }

    /* 构建文章标签表格 */
    function build_tags_panel(data) {
        var tags = data.extend.pageInfo.list;
        $("#main-panel").empty();
        var title = $("<h3 class='col-lg-2'></h3>").append("标签管理");
        var tagAddBtn = $("<button>添加标签</button>").addClass("btn btn-success col-lg-offset-8")
            .attr("data-toggle", "modal")
            .attr("data-target", "#tagAddModal");
        var titleDiv = $("<div></div>").append($("<h3></h3>").append(title, tagAddBtn));
        // 1、构建表头
        var tagTableHead = $("<thead></thead>").append(
            $("<tr></tr>").addClass("info").append(
                $("<th></th>").append($("<input>")
                    .attr("type", "checkbox").attr("id", "check_all")),
                $("<th></th>").append("标签Id"),
                $("<th></th>").append("标签名称"),
                $("<th></th>").append("文章数"),
                $("<th></th>").append("操作")
            )
        );
        //2、构建表格主体
        var tagTableBody = $("<tbody></tbody>").attr("id", "article-table-body");
        $.each(tags, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var tagIdTd = $("<td></td>").append(item.tagId);
            var tagNameTd = $("<td></td>").append(item.tagName);
            var articlesNumTd = $("<td></td>").append(item.articleNum);

            var editBtn = $("<button></button>")
                .attr("id", "tagEditBtn")
                .attr("tag", "button")
                .attr("data-toggle", "modal")
                .attr("data-target", "#tagEditModal")
                .addClass("btn btn-primary btn-sm edit_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
            editBtn.attr("edit_id", item.tagId);
            var delBtn = $("<button></button>")
                .attr("data-toggle", "modal")
                .attr("data-target", "#tagDelModal")
                .addClass("btn btn-danger btn-sm delete_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
            delBtn.attr("del_id", item.tagId);
            var operationTd = $("<td></td>").append(editBtn, $("<span>&nbsp;</span>"), delBtn);

            $("<tr></tr>").append(
                checkBoxTd,
                tagIdTd,
                tagNameTd,
                articlesNumTd,
                operationTd
            ).appendTo(tagTableBody);
        });
        var tagTable = $("<table></table>").addClass("table table-hover table-bordered").attr("id", "articles_table")
            .append(tagTableHead, tagTableBody);

        var pageNavDiv = $("<div></div>").addClass("col-lg-6").attr("id", "page_nav_area");

        titleDiv.appendTo("#main-panel");
        tagTable.appendTo("#main-panel");
        pageNavDiv.appendTo("#main-panel");
    }

    /* 构建页码栏 */
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
        var navEle = $("<nav></nav>").append(ul).attr("id", "navBar");
        navEle.appendTo("#page_nav_area");
    }

    /* ************重置分类新建表单************ */
    $('#typeAddModal').on('hide.bs.modal', function () {
        document.getElementById("type_add_form").reset();
        $("#typeAddModal").find("*").removeClass("has-error has-success");
        $("#typeAddModal").find(".help-block").text("");
    });

    $('#typeEditModal').on('show.bs.modal', function () {
        // $("#typeEditModal").find("#type_edit_form").reset();
        document.getElementById("type_edit_form").reset();
        $("#typeEditModal").find("*").removeClass("has-error has-success");
        $("#typeEditModal").find(".help-block").text("");
    });

    /* ************重置分类编辑表单************ */
    $('#typeEditModal').on('hide.bs.modal', function () {
        // $("#typeEditModal").find("#type_edit_form").reset();
        document.getElementById("type_edit_form").reset();
        $("#typeEditModal").find("*").removeClass("has-error has-success");
        $("#typeEditModal").find(".help-block").text("");
    });

    $('#typeEditModal').on('show.bs.modal', function () {
        // $("#typeEditModal").find("#type_edit_form").reset();
        document.getElementById("type_edit_form").reset();
        $("#typeEditModal").find("*").removeClass("has-error has-success");
        $("#typeEditModal").find(".help-block").text("");
    });

    /* ************重置分类新建表单************ */

    /* ************重置标签表单************ */

    /* 检查该分类是否存在 */
    function checkExit_type(typeName) {

    }

    /* 检查该分类是否合法 */
    $("#typeName_edit_input").change(function () {
        var typeName = this.value;
        // checkExit_type(typeName);
        $.ajax({
            url: "<%=request.getContextPath()%>/categories/check",
            type: "POST",
            data: "typeName=" + typeName,
            success: function (data) {
                // console.log(data);
                if (data.code == 200) {
                    // 如果可用，则执行下一步查询，获得所有的文章列表
                    show_validate_msg("#typeName_edit_input", "success", "该分类名可用");
                } else {
                    // 如果不可用，则不查询，直至可用
                    show_validate_msg("#typeName_edit_input", "error", data.message);
                }
            }
        });
    });
    
    function do_update_type() {
        var newTypeName = $("#typeName_add_input").value;
        var oldTypeName = $("#typeEditBtn").value;
        console.log(newTypeName);
        console.log(oldTypeName);
        /*$.ajax({
           url:"<%=request.getContextPath()%>/categories/"+oldTypeName,
            type:"PUT",
            data:""newTypeName="+newTypeName,
            success:function (data) {

            }
        });*/

    }

    /* 模态框显示校验信息 */
    function show_validate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-error has-success");
        $(ele).next("span").text(msg);
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    /*function build_dropDown_articles() {
        $.ajax({
            url: "<%=request.getContextPath()%>/article/all",
            type: "GET",
            success: function (data) {
                console.log(data);
                var dropDown = $("#");
            }
        });
    }*/

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

    /* 日期选择器 */
    $('.form_datetime').datetimepicker({
        weekStart: 0, //一周从哪一天开始
        todayBtn: 1, //
        autoclose: 1,
        todayHighlight: 1,
        format:'yyyy-mm-dd hh:mm:ss',
        startDate:new Date(),
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        language: 'zh-CN'
    });


    // 完成“全选”或“全不选”的功能
    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    $(document).on("click", ".check_item", function () {
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });
</script>
</html>
