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
            <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 角色维护</a></div>
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
                    <form class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input name="condition" class="form-control has-success" type="text"
                                       placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button type="button" id="fuzzyQueryBtn" class="btn btn-warning"><i
                                class="glyphicon glyphicon-search"></i> 查询
                        </button>
                    </form>
                    <button id="batchDelBtn" type="button" class="btn btn-danger" style="float:right;margin-left:10px;">
                        <i
                                class=" glyphicon glyphicon-remove"></i> 删除
                    </button>
                    <button id="addRole" type="button" class="btn btn-primary" style="float:right;"
                    ><i class="glyphicon glyphicon-plus"></i> 新增
                    </button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr>
                                <th width="30">#</th>
                                <th width="30"><input type="checkbox"></th>
                                <th>名称</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>


                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="6" align="center">
                                    <ul class="pagination">


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

<%--添加角色的模态框--%>
<div class="modal fade" id="addRoleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="exampleModalLabel">新增角色</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">角色名:</label>
                        <input name="name" type="text" class="form-control" id="recipient-name">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>


<%--修改角色的模态框--%>
<div class="modal fade" id="updateRoleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="exampleModalLabel2">更新角色</h4>
            </div>
            <div class="modal-body">
                <form>
                    <input type="hidden" name="id"/>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">角色名:</label>
                        <input name="name" type="text" class="form-control" id="recipient-name2">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>


<%--管理权限的模态框--%>
<div class="modal fade" id="updateRolePermissionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="exampleModalLabel2">管理权限</h4>
            </div>
            <div class="modal-body">
                <%--生成ztree的容器--%>
                <ul id="permissionTree" class="ztree"></ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>


<%@ include file="/WEB-INF/pages/include/base_js.jsp" %>

<script type="text/javascript">

    $("a:contains('角色维护')").parents("ul :hidden").show();
    $(".list-group-item a:contains('角色维护')").css("color", "red");
    $("a:contains('角色维护')").parents(".list-group-item").removeClass("tree-closed");

    //提取当前页码的全局变量
    var currentPageNum;
    //提取总页码数的全局变量
    var totalPages;
    //role的id
    var roleId;

    //自定义函数，根据id找到Role信息，然后回显到模态框中
    function getRoleAndshowRoleInModal(id) {
        $.get("${PATH}/role/getRole", {"id": id}, function (role) {
            //回显到模态框
            $("#updateRoleModal [name='name']").val(role.name);
            $("#updateRoleModal [name='id']").val(role.id);
            //显示模态框
            $("#updateRoleModal").modal("toggle");
        });
    }

    //定义一个函数，将pageInfo中的信息转化为html页面
    function transferPageInfo(pageInfo) {
        //提取全局变量
        currentPageNum = pageInfo.pageNum;
        totalPages = pageInfo.pages;
        //先将tbody、tfoot排空
        $("tbody").empty();
        $("tfoot .pagination").empty();
        //将全选框去除选中
        $("thead :checkbox").prop("checked", false);
        //显示数据
        $.each(pageInfo.list, function (index, role) {
            $('<tr>\n' +
                '<td>' + (index + 1) + '</td>\n' +
                '<td><input id="' + role.id + '" type="checkbox"></td>\n' +
                '<td>' + role.name + '</td>\n' +
                '<td>\n' +
                '<button onclick="showRolePermission(' + role.id + ')" type="button" class="btn btn-success btn-xs"><i\n' +
                'class=" glyphicon glyphicon-check"></i></button>\n' +
                '<button type="button" class="btn btn-primary btn-xs" onclick="getRoleAndshowRoleInModal(' + role.id + ')"><i\n' +
                'class=" glyphicon glyphicon-pencil"></i></button>\n' +
                '<button id="' + (role.id) + '" type="button" class="btn btn-danger btn-xs delRoleBtn"><i\n' +
                'class=" glyphicon glyphicon-remove"></i></button>\n' +
                '</td>\n' +
                ' </tr>').appendTo("tbody")
        });
        //显示分页
        //上一页
        if (pageInfo.hasPreviousPage) {
            $('<li><a pageNum="' + (pageInfo.pageNum - 1) + '" href="javascript:void(0)">上一页</a></li>').appendTo("tfoot .pagination");
        } else {
            $('<li class="disabled"><a href="javascript:void(0);">上一页</a></li>').appendTo("tfoot .pagination");
        }
        //中间页
        $.each(pageInfo.navigatepageNums, function () {
            if (this == pageInfo.pageNum) {
                $('<li class="active" ><a href="javascript:void(0)">' + this + '</a></li>').appendTo("tfoot .pagination");
            } else {
                $('<li><a pageNum="' + this + '" href="javascript:void(0)">' + this + '</a></li>').appendTo("tfoot .pagination");
            }
        });
        //下一页
        if (pageInfo.hasNextPage) {
            $('<li><a pageNum="' + (pageInfo.pageNum + 1) + '" href="javascript:void(0);">下一页</a></li>').appendTo("tfoot .pagination");
        } else {
            $('<li class="disabled"><a href="javascript:void(0);">下一页</a></li>').appendTo("tfoot .pagination");
        }
    }

    //写一个函数里包含ajax请求，请求参数时页码和模糊查询条件
    function selectRoles(pageNum, condition) {
        $.get(
            "${PATH}/role/getRoles",
            {"pageNum": pageNum, "condition": condition},
            function (pageInfo) {
                transferPageInfo(pageInfo);
            }
        );
    }


    //点击权限管理的按钮，跳出模态框的函数
    function showRolePermission(id) {
        //获得roleId
        roleId = id;
        //查出数据库中的t_permission表中的数据，显示到模态框中
        //查询出所有权限指定
        $.get("${PATH}/getPermissions", {}, function (permissions) {
            var zNodes = permissions;
            //需要回显数据
            $.get("${PATH}/getPermissionId",{"roleId":id},function (permissionIds) {
                //对每个节点遍历
                $.each(zNodes,function(){

                    if(permissionIds.indexOf(this.id)>=0){
                        this.checked = true;
                    }
                });
                //转化为zTree树
                var setting = {
                    check: {
                        enable: true//显示复选框
                    },
                    view: {
                        addDiyDom: function (treeId, treeNode) {
                            //删除每个元素的自带图标，使用自己的
                            // $("#" + treeNode.tId + "_ico").removeClass();
                            // $("#" + treeNode.tId + "_ico").addClass(treeNode.icon);
                            $("#"+treeNode.tId+"_ico").remove();
                            //创建自定义图标的标签
                            $("#"+treeNode.tId+"_span").before("<span class='"+ treeNode.icon+"'></span>");
                        }
                    },
                    data: {
                        key: {
                            name: "title"
                        },
                        simpleData: {
                            enable: true,
                            pIdKey: "pid"
                        }
                    }
                };
                var init = $.fn.zTree.init($("#permissionTree"), setting, zNodes);
                init.expandAll(true);
            });



        });
        $("#updateRolePermissionModal").modal("show");

    }


    //点击权限管理模态框的提交按钮
    $("#updateRolePermissionModal .btn-primary").click(function(){
        //将选中的节点的id放到数组中，传入到数组中
        var zTreeObj = $.fn.zTree.getZTreeObj("permissionTree");
        var nodes = zTreeObj.getCheckedNodes(true);
        console.log(nodes);
        var permissionIds = new Array();
        $.each(nodes,function () {
            permissionIds.push(this.id);
        });
        //发送ajax请求
        $.post("${PATH}/updateRolePermissions",{"roleId":roleId,"permissionIds":permissionIds.join()},function(msg){
            if(msg == "ok"){
                $("#updateRolePermissionModal").modal("hide");
                layer.msg("修改权限成功！");
            }
        });
    });


    //批量删除
    $("#batchDelBtn").click(function () {
        var ids = new Array();
        $("tbody :checkbox:checked").each(function () {
            ids.push($(this).attr("id"));
        });

        //发送ajax请求
        $.get("${PATH}/role/batchDelRoles", {"ids": ids.join(",")}, function (msg) {
            if(msg == 403){
                layer.msg("权限不足，操作失败");
                return;
            }
            if (msg == "ok") {
                //删除成功就跳到当前页
                var condition = $("input[name='condition']").val();
                selectRoles(currentPageNum, condition);
            }
        });

    });


    //点击全选按钮
    $("thead :checkbox").click(function () {
        $("tbody :checkbox").prop("checked", this.checked);
    });
    //点击选项的选择按钮
    $("tbody").delegate(":checkbox", "click", function () {
        //判断是否全选：根据选择框的数量和选择框选中的数量
        $("thead :checkbox").prop("checked", $("tbody :checkbox:checked").length == $("tbody :checkbox").length);
    });


    // 点击修改模态框中的提交绑定事件
    $("#updateRoleModal .btn-primary").click(function () {
        $.post("${PATH}/role/updateRole", $("#updateRoleModal form").serialize(), function (msg) {
            if (msg == "ok") {
                //如果返回ok，关闭模态框
                $("#updateRoleModal").modal("toggle");
                //ajax刷新当前页
                var condition = $("input[name='condition']").val();
                selectRoles(currentPageNum, condition);
            }
        });
    });


    //当点击添加模态框的提交时
    $("#addRoleModal .btn-primary").click(function () {

        $.post("${PATH}/role/addRole", $("#addRoleModal form").serialize(), function (msg) {
            if (msg == "ok") {
                //关闭模态框
                $("#addRoleModal").modal("toggle");
                //跳到最后一页
                selectRoles(totalPages + 1);
            }
        });
    });


    //点击新增按钮时，调出模态框，
    $("#addRole").click(function () {
        $("#addRoleModal").modal("toggle");
    });


    //点击删除按钮，删除数据
    $("tbody").delegate(".delRoleBtn", "click", function () {
        $.get("${PATH}/role/delRole", {"id": this.id}, function (msg) {
            if (msg == "ok") {
                //删除成功就跳到当前页
                var condition = $("input[name='condition']").val();
                selectRoles(currentPageNum, condition);
            }
        });
    });


    //当点击模糊查询按钮时：
    $("#fuzzyQueryBtn").click(function () {
        var condition = $("input[name='condition']").val();
        selectRoles("1", condition);
    });


    //发送ajax请求
    $.ajax({
        type: "get",
        url: "${PATH}/role/getRoles",
        dataType: "json",
        success: function (pageInfo) {
            //将获得的数据转化成html页面
            //遍历pageInfo.list将list中的数据写入到页面中
            transferPageInfo(pageInfo);
        }
    });


    //当点击上一页、页码、下一页时、发生ajax请求
    $("tfoot").delegate("a", "click", function () {
        //获取当前的pugeNum属性
        var pageNum = $(this).attr("pageNum");
        //还需要传入查询条件的值
        var condition = $("input[name='condition']").val();
        selectRoles(pageNum, condition);
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

    $("tbody .btn-success").click(function () {
        window.location.href = "assignPermission.html";
    });
</script>
</body>
</html>
