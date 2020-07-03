<%--
  Created by IntelliJ IDEA.
  User: lqshi
  Date: 2020/6/17
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="jquery/jquery-2.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="script/docs.min.js"></script>
<script src="layer/layer.js"></script>
<script src="ztree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript">
    /*点击注销管理员账号*/
    $("#logoutA").click(function () {
        layer.confirm("是否确认注销？", {icon: 3, title: "提示"}, function () {
            layer.close();
            $("#logoutForm").submit();
        });
    });
</script>