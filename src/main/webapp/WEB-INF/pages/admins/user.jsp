<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <%@ include file="/WEB-INF/pages/include/base_css.jsp" %>

    <style>
        .tree li {
            list-style-type: none;
            cursor: pointer;
        }

        table tbody tr:nth-child(odd) {
            background: #F4F4F4;
        }

        table tbody td:nth-child(even) {
            color: #C00;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 用户维护</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">


            <%@ include file="/WEB-INF/pages/include/manager_loginbar.jsp" %>

            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">

                <%@ include file="/WEB-INF/pages/include/manager_menu.jsp" %>

            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form action="${PATH}/admin/index" class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input name="queryCondition" value="${param.queryCondition}" class="form-control has-success" type="text" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询
                        </button>
                    </form>
                    <button id="batchDelete" type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i
                            class=" glyphicon glyphicon-remove"></i> 删除
                    </button>
                    <button type="button" class="btn btn-primary" style="float:right;"
                            onclick="window.location.href='${PATH}/admin/add.html'"><i class="glyphicon glyphicon-plus"></i> 新增
                    </button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr>
                                <th width="30">#</th>
                                <th width="30"><input type="checkbox"></th>
                                <th>账号</th>
                                <th>名称</th>
                                <th>邮箱地址</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach varStatus="vs" items="${requestScope.pageInfo.list}" var="admin">
                                <tr>
                                    <td>${vs.count}</td>
                                    <td><input adminId="${admin.id}" type="checkbox"></td>
                                    <td>${admin.loginacct}</td>
                                    <td>${admin.username}</td>
                                    <td>${admin.email}</td>
                                    <td>
                                        <button type="button" class="btn btn-success btn-xs"><i
                                                class=" glyphicon glyphicon-check"></i></button>
                                        <button id="${admin.id}"  type="button" class="btn btn-primary btn-xs"><i
                                                class=" glyphicon glyphicon-pencil"></i></button>
                                        <button id="${admin.id}" type="button" class="btn btn-danger btn-xs"><i
                                                class=" glyphicon glyphicon-remove"></i></button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="6" align="center">
                                    <%--有没有上一页--%>
                                    <ul class="pagination">
                                        <c:choose>
                                            <c:when test="${requestScope.pageInfo.hasPreviousPage}">
                                                <li><a
                                                        href="${PATH}/admin/index?pageNum=${requestScope.pageInfo.pageNum - 1}&queryCondition=${param.queryCondition}">上一页</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="disabled"><a href="javascript:void(0);">上一页</a></li>
                                            </c:otherwise>
                                        </c:choose>

                                        <%--中间数字--%>
                                        <c:forEach items="${requestScope.pageInfo.navigatepageNums}" var="index">
                                            <c:choose>
                                                <c:when test="${index == requestScope.pageInfo.pageNum}">
                                                    <li class="active"><a href="javascript:void(0);">${index} <span
                                                            class="sr-only">(current)</span></a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li><a href="${PATH}/admin/index?pageNum=${index}&queryCondition=${param.queryCondition}">${index}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                        <%--有没有下一页--%>
                                        <c:choose>
                                            <c:when test="${requestScope.pageInfo.hasNextPage}">
                                                <li><a
                                                        href="${PATH}/admin/index?pageNum=${requestScope.pageInfo.pageNum + 1}&queryCondition=${param.queryCondition}">下一页</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="disabled"><a href="javascript:void(0);">下一页</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </td>
                            </tr>

                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/pages/include/base_js.jsp" %>


<script type="text/javascript">
    //设置菜单栏的下拉和高亮
    $("a:contains('用户维护')").parents("ul :hidden").show();
    $(".list-group-item a:contains('用户维护')").css("color", "red");
    $("a:contains('用户维护')").parents(".list-group-item").removeClass("tree-closed");

    //全选和全不选的复选框:必须使用prop，使用attr只有前两次有效
    $("thead :checkbox").click(function () {
        $("tbody :checkbox").prop("checked",this.checked);
    });
    //其他复选框控制总的复选框
    $("tbody :checkbox").click(function () {
        var total = $("tbody :checkbox").length;
        var checkedTotal = $("tbody :checkbox:checked").length;
        $("thead :checkbox").prop("checked",total == checkedTotal);
    });

    //点击修改跳转到修改页面edit.html
    $("tbody .btn-primary").click(function () {
       location = "${PATH}/admin/edit.html?id=" + this.id;
    });

    //批量删除
    $("#batchDelete").click(function () {
        //如果一个都没有选择，就提示
        if($("tbody :checkbox:checked").length == 0){
            layer.msg("至少选择一个",{time:1000});
            layer.close();
            return;
        }
        var array = new Array();
        //获取选择的id
        $("tbody :checkbox:checked").each(function () {
            //每个选中的id都压入数组
            array.push($(this).attr("adminId"));
        });

        location = "${PATH}/admin/batchDeleteAdmin?ids=" + array.join();

    });


    //点击删除按钮，删除指定的管理员
    $("tbody .btn-danger").click(function () {
        //获取id值
       var id = $(this).prop("id");
       location = "${PATH}/admin/deleteAdmin?id=" + id;
    });

    $(function () {
        $(".list-group-item").click(function () {
            if ($(this).find("ul")) {
                $(this).toggleClass("tree-closed");
                if ($(this).hasClass("tree-closed")) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });
    });
    // $("tbody .btn-success").click(function () {
    //     window.location.href = "assignRole.html";
    // });
    // $("tbody .btn-primary").click(function () {
    //     window.location.href = "edit.html";
    // });
</script>
</body>
</html>
