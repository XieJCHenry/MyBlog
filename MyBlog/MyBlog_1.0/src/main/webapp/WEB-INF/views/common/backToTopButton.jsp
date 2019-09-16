<%--
  Created by IntelliJ IDEA.
  User: a1098
  Date: 2019/08/24
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/indexStyle.css">
<div class="back-to-top">
    <button id="to-top-btn" onclick="back_to_top(400)" hidden="true"><%-- 按钮默认隐藏 --%>
        <img width="50px" height="50px" src="<%=request.getContextPath()%>/resource/image/upper.png">
    </button>
</div>


<script type="text/javascript">

    /* 回到顶部按钮自动显示和消失 */
    //$("#to-top-btn").hide();// 不使用js隐藏，因为页面刚加载的一瞬间按钮还是不隐藏的。
    $(function () {
        //绑定滚动条事件
        $(window).bind("scroll", function () {
            var sTop = $(window).scrollTop();
            var sTop = parseInt(sTop);
            if (sTop >= 1200) {
                if (!$("#to-top-btn").is(":visible")) {
                    try {
                        $("#to-top-btn").fadeIn(200);
                    } catch (e) {
                        $("#to-top-btn").show();
                    }
                }
            } else {
                if ($("#to-top-btn").is(":visible")) {
                    try {
                        $("#to-top-btn").fadeOut(200);
                    } catch (e) {
                        $("#to-top-btn").hide();
                    }
                }
            }
        });
    });
</script>
