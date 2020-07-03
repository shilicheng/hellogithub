<%--
  Created by IntelliJ IDEA.
  User: lqshi
  Date: 2020/6/16
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BootStrap练习</title>
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="static/jquery/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/layer/layer.js"></script>
</head>
<body>
<table class="table table-hover">
    <tr class="active">
        <th>hello</th>
        <th>hello1</th>
        <th>hello2</th>
        <th>hello3</th>
    </tr>
    <tr class="success">
        <td>a</td>
        <td>b</td>
        <td>c</td>
        <td>d</td>
    </tr>
    <tr class="warning">
        <td>a</td>
        <td>b</td>
        <td>c</td>
        <td>d</td>
    </tr>
    <tr class="danger">
        <td>a</td>
        <td>b</td>
        <td>c</td>
        <td>d</td>
    </tr>
</table>

<span class="glyphicon glyphicon-tint"></span>
<b class="glyphicon glyphicon-send"></b>


<hr>
<script type="text/javascript">

    // layer.alert("天王盖地虎",{icon:8,time:2000});
    // layer.msg("呵呵" , {icon:2 , time: 500});
    // layer.confirm("确认内容",{title:"确认标题",icon:6},function(index){
    //     layer.close(index);
    // });
    layer.load(4);
</script>
</body>
</html>
