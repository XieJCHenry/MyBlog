<%--
  Created by IntelliJ IDEA.
  User: a1098
  Date: 2019/08/20
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--
        editormd 是用 js 动态生成的，因此不能放在static目录下。
        SpringMVC会自动将static目录静态化，因此会导致无法加载editormd的js和css文件。
        而Bootstrap可以静态加载，因此放在static目录下。
    --%>
    <meta charset="utf-8"/>
    <title>JC-Henry | 博客编辑</title>
    <link rel="icon" href="<%=request.getContextPath()%>/resource/image/avatar.jpg" type="image/x-icon"/>

    <%-- jquery --%>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

    <%-- editormd --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/editormd/css/editormd.min.css">
    <script src="<%=request.getContextPath()%>/resource/editormd/editormd.js"></script>
    <%--<script src="<%=request.getContextPath()%>/resource/editormd/lib/codemirror/codemirror.min.js"></script>
    <script href="<%=request.getContextPath()%>/resource/editormd/lib/marked.min.js"></script>
    <script href="<%=request.getContextPath()%>/resource/editormd/lib/prettify.min.js"></script>
    <script href="<%=request.getContextPath()%>/resource/editormd/lib/raphael.min.js"></script>
    <script href="<%=request.getContextPath()%>/resource/editormd/lib/underscore.min.js"></script>
    <script href="<%=request.getContextPath()%>/resource/editormd/lib/sequence-diagram.min.js"></script>
    <script href="<%=request.getContextPath()%>/resource/editormd/lib/flowchart.min.js"></script>--%>

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/headerStyle.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/editArticle.css"/>

    <%-- bootstrap --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.min.js"></script>
    <%-- bootstarp-select --%>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

</head>
<div class="header col-lg-12">
    <div class="header_nav col-lg-10 col-lg-offset-1">
        <div class="header_title">
            <a class="back-to-home" href="<%=request.getContextPath()%>" onclick="">首页</a>
            <a href="" style="color:#0a001f" class="header_home_label" onclick="return false"><%-- 禁用 --%>
                JC-Henry | 博客编辑
            </a>
        </div>
        <div class="header_bar">
            <ul class="header_bar_list">
                <li>
                    <div class="user-avatar">
                        <a href="">
                            <img src="<%=request.getContextPath()%>/resource/image/avatar.jpg">
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<body>
<div class="container col-lg-12">
    <div class="box">
        <div class="content">
            <div class="content-main">
                <%-- 文章分类、标签、标题 --%>
                <div class="content-info">
                    <div class="article-categories">
                        <label>分类：</label>
                        <select id="category-list" class="selectpicker" title="请选择分类"
                                data-selected-text-format="count > 3" multiple>
                        </select>
                    </div>
                    <span>&nbsp;&nbsp;&nbsp;</span>
                    <div class="article-tag">
                        <label>标签：</label>
                        <select id="tag-list" class="selectpicker" title="请选择标签" multiple>
                        </select>
                    </div>
                    <span>&nbsp;&nbsp;&nbsp;</span>
                    <div class="article-title">
                        <label>标题：</label>
                        <input id="title-input" type="text" class="form-control" placeholder="请输入标题">
                    </div>
                    <div class="save-btn-div row col-lg-offset-4">

                        <button class="btn btn-primary" type="submit" onclick="saveArticle()">保存</button>
                        <button class="btn btn-danger" type="submit">删除并关闭</button>
                        <%--点击时弹出模态框--%>
                    </div>
                </div>
                <div class="content-summary-div">
<%--                    <label>文章简介：</label>--%>
                    <textarea id="content-summary-input" style="height: 60px;width: 80%;margin: 5px 0px 10px 20px;
                                    left: 10px;resize: none;border-radius: 5px;"
                              cols="50" rows="5" id="textarea" onKeyDown="textdown(event)"
                              onKeyUp="textup()" onfocus="if(value=='请输入文章简介，不超过200字'){value=''}"
                              onblur="if (value ==''){value='请输入文章简介，不超过200字'}">请输入文章简介，不超过200字</textarea>
                    <%--<textarea id="content-summary-input"
                              style="height: 60px;width: 80%;margin: 5px 0px 10px 20px;
                                    left: 10px;resize: none;border-radius: 5px;"
                    >请输入文章简介，不能为空，字数限制为200</textarea>--%>
                </div>
                <%--<div class="article-upload">
                    &lt;%&ndash;<form action="upload" method="post" enctype="multipart/form-data">&ndash;%&gt;
                    选择文件：<input type="file" name="file" id="fileId">
                    <button type="submit" class="btn btn-default" onclick="readUpload()" id="uploadBtnId">保存
                    </button>
                    &lt;%&ndash;                        </form>&ndash;%&gt;
                    <div id="uploadContent" hidden="hidden"></div>
                </div>--%>
                <%-- markdown编辑器 --%>
                <div class="content-markdown">
                    <div class="row col-lg-12 col-lg-offset-0">
                        <div id="my-editormd">
                            <textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc"
                                      style="display:none;"></textarea>
                            <!-- 注意：name属性的值-->
                            <textarea id="my-editormd-html-code" name="my-editormd-html-code"
                                      style="display:none;"></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-footer">
                ©JC-Henry
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    var textEditor;
    /*document加载完成后自动顺序执行以下方法*/
    $(function () {
        // emoji 加载路径
        editormd.emoji.path = "<%=request.getContextPath()%>/resource/editormd/plugins/emoji-dialog/emoji/",
            // 初始化markdown编辑框
            textEditor = editormd("my-editormd", {
                placeholder: '本编辑器支持Markdown编辑，左边编写，右边预览',  //默认显示的文字，这里就不解释了
                width: "100%",
                height: 760,
                syncScrolling: "single",
                path: "<%=request.getContextPath()%>/resource/editormd/lib/",   //你的path路径（原资源文件中lib包在我们项目中所放的位置）
                theme: "gray",//工具栏主题
                // previewTheme: "dark",//预览主题
                // editorTheme: "pastel-on-dark",//编辑主题
                saveHTMLToTextarea: true,
                emoji: true,
                taskList: true,
                tocm: true,         // Using [TOCM]
                //tex: true,                   // 开启科学公式TeX语言支持，默认关闭
                flowChart: true,             // 开启流程图支持，默认关闭
                sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,

                /* 上传图片支持 */
                imageUpload: true,
                imageFormats: ["jpg", "jpeg", "png", "bmp", "webp"],
                imageUploadURL: "image/upload"// 后端上传图片的地址
            });
        $.ajax({
            url: "<%=request.getContextPath()%>/tags/all",
            type: "GET",
            success: function (data) {
                // console.log(data);
                build_tag_list(data);
            }
        });
        $.ajax({
            url: "<%=request.getContextPath()%>/categories/all",
            type: "GET",
            success: function (data) {
                // console.log(data);
                build_category_list(data);
            }
        });
    });

    /*初始化编辑器*/
    function init_editor() {

    }


    /* 获取所有标签 */
    function init_tag_list() {

    }

    /* 获取所有分类 */
    function init_type_list() {

    }

    /**
     * 读取上传的文件内容
     */
    function readUpload() {
        var objFile = document.getElementById("fileId");
        if (objFile.value == "") {
            alert("文件不能为空");
            return false;
        }
        console.log(objFile.files[0].size);
        var files = objFile.files;
        var reader = new FileReader();
        reader.readAsText(files[0], "UTF-8");
        reader.onload = function (e) {
            var fileStr = e.target.result;
            /*以上代码用来读取文件*/
            var title = $("#title-input").val();
            var types = $("#category-list").val();
            var tags = $("#tag-list").val();
            var summary = $("#content-summary-input").val();
            $.param(types, true);
            $.param(tags, true);
            // console.log(fileStr);
            console.log(title);
            console.log(types);
            console.log(tags);
            $.ajax({
                url: "upload",
                type: "POST",
                traditional: true,
                data: {
                    "upload": fileStr,
                    "articleTitle": title,
                    "articleTypes": types,
                    "articleTags": tags,
                    "articleSummary": summary
                },
                success: function (data) {
                    console.log(data);
                    alert("后台保存成功");
                }
            });
        }
    }

    /**
     * 发送文章到后台保存
     *
     * 解决显示问题后，就可以保存html代码了。
     */
    function saveArticle() {
        var content = textEditor.getMarkdown();
        var htmlContent = textEditor.getHTML();
        console.log(htmlContent);
        // console.log(content);
        var title = $("#title-input").val();
        var types = $("#category-list").val();
        var tags = $("#tag-list").val();
        var summary = $("#content-summary-input").val();
        console.log(title);
        console.log(types);
        console.log(tags);
        // console.log(summary);
        $.param(types, true);
        $.param(tags, true);
        $.ajax({
            url: "<%=request.getContextPath()%>/article/lasting",
            type: "POST",
            dataType: "json",
            traditional: true,
            // contentType: "application/json;charset=utf-8",
            data: {
                "articleContent": content,
                "htmlContent":htmlContent,
                "articleTitle": title,
                "articleTypes": types,
                "articleTags": tags,
                "articleSummary": summary
            },
            success: function (result) {
                // console.log(result);
                var msg = result.message;

                console.log(result);
                if (msg == "success") {
                    alert("保存成功");
                    window.location.href = "<%=request.getContextPath()%>";// 页面跳转
                } else {
                    alert(result.message.extend);
                }
            },
            error: function (result) {
                console.log(result);
            }
        });
    }

    /**
     * 构建标签下拉列表
     * @param data
     */
    function build_tag_list(data) {
        // $("#tag-list").empty();
        var tags = data.extend.tags;
        $.each(tags, function (index, item) {
            var tagOption = $("<option></option>").append(item.tagName);
            tagOption.attr("value", item.tagId);
            tagOption.appendTo("#tag-list");
        });
    }

    /**
     * 构建分类下拉列表
     * @param data
     */
    function build_category_list(data) {
        // $("category-list").empty();
        var categories = data.extend.categories;
        $.each(categories, function (index, item) {
            var catesOption = $("<option></option>").append(item.typeName);
            catesOption.attr("value", item.typeId);
            catesOption.appendTo("#category-list");
        });
    }

    /**
     * 确认用户是否退出
     */
    function checkExit() {

    }
</script>
</html>
