<%--
  Created by IntelliJ IDEA.
  User: a1098
  Date: 2019/08/29
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试页面</title>
    <%-- jquery --%>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/editormd/css/editormd.min.css">
    <script src="<%=request.getContextPath()%>/resource/editormd/editormd.min.js"></script>
</head>
<body>
<div id="my-editormd">
    <textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc" style="display:none;"></textarea>
    <!-- 注意：name属性的值-->
    <textarea id="my-editormd-html-code" name="my-editormd-html-code" style="display:none;"></textarea>
</div>
</body>
<script type="text/javascript">
    var textEditor;
    /*document加载完成后自动顺序执行以下方法*/
    $(function () {
        // emoji 加载路径
        <%--editormd.emoji.path = "<%=request.getContextPath()%>/resource/editormd/plugins/emoji-dialog/emoji/",--%>
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
    });
</script>
</html>
