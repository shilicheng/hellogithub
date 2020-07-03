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
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 许可维护</a></div>
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
                <div class="panel-heading"><i class="glyphicon glyphicon-th-list"></i> 权限菜单列表
                    <div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i
                            class="glyphicon glyphicon-question-sign"></i></div>
                </div>
                <div class="panel-body">
                    <ul id="treeDemo" class="ztree"></ul>
                </div>
            </div>
        </div>
    </div>
</div>

<%--新增菜单的模态框--%>
<div class="modal fade" id="addMenuModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="exampleModalLabel2">添加-菜单框</h4>
            </div>
            <div class="modal-body">
                <form>
                    <input type="hidden" name="pid"/>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">菜单名:</label>
                        <input name="name" type="text" class="form-control" id="recipient-name2">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">菜单图标</label>
                        <input name="icon" type="text" class="form-control" id="recipient-name3">
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



<%--修改菜单的模态框--%>
<div class="modal fade" id="updateMenuModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="exampleModalLabel3">修改-菜单框</h4>
            </div>
            <div class="modal-body">
                <form>
                    <input type="hidden" name="id"/>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">菜单名:</label>
                        <input name="name" type="text" class="form-control" id="recipient-name2">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">菜单图标</label>
                        <input name="icon" type="text" class="form-control" id="recipient-name3">
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


<%@ include file="/WEB-INF/pages/include/base_js.jsp" %>


<script type="text/javascript">

    $("a:contains('菜单维护')").parents("ul :hidden").show();
    $(".list-group-item a:contains('菜单维护')").css("color", "red");
    $("a:contains('菜单维护')").parents(".list-group-item").removeClass("tree-closed");

    //设置菜单的增加、删除、修改的函数
    //菜单的增加函数,点击新增按钮，然后跳出模态框，填写菜单名称以及菜单的图标，点击提交按钮，返回原来页面刷新
    //添加菜单需要父id
    function addMenu(pid) {
        //将pid设置到隐藏域中
        $("#addMenuModal input[name='pid']").val(pid);
        $("#addMenuModal").modal("toggle");
        //当点击提交时，将表单序列化后提交

    }

    $("#addMenuModal .btn-primary").click(function () {
        $.post(
            "${PATH}/menu/addMenu",
            $("#addMenuModal form").serialize(),
            function (data) {
                if (data == "ok") {
                    $("#addMenuModal").modal("toggle");
                    getAllMenusAndShow();
                    layer.msg("添加成功");
                }
            });
    });

    //添加删除按钮的函数
    function delMenu(id) {
        $.get("${PATH}/menu/delMenu", {"id": id}, function (data) {
            if (data == "ok") {
                getAllMenusAndShow();
                layer.msg("删除成功");
            }
        });
    }

    //修改按钮的函数
    function updateMenu(id){
        $.get("${PATH}/menu/getMenu",{"id":id},function(menu){
            //回显到模态框中
            $("#updateMenuModal input[name='id']").val(menu.id);
            $("#updateMenuModal input[name='name']").val(menu.name);
            $("#updateMenuModal input[name='icon']").val(menu.icon);
            //显示模态框
            $("#updateMenuModal").modal("toggle");
        });
    }

    //点击修改模态框的提交按钮
    $("#updateMenuModal .btn-primary").click(function () {
        $.post(
            "${PATH}/menu/updateMenu",
            $("#updateMenuModal form").serialize(),
            function (data) {
                if (data == "ok") {

                    $("#updateMenuModal").modal("toggle");
                    getAllMenusAndShow();
                    layer.msg("更新成功");
                }
            });
    });

    //查询出要遍历的数据,并以zTree的形式显示出来
    function getAllMenusAndShow() {
        $.ajax({
            url: "${PATH}/menu/getMenus",
            type: "get",
            success: function (pMenus) {
                pMenus.push({id: 0, name: "系统权限菜单", icon: "glyphicon glyphicon-globe"});
                var setting = {
                    view: {
                        //设置自定义图标
                        //当ztree树生成时，每创建一个树的节点对象  ztree都会调用一次此方法
                        addDiyDom: function (treeId, treeNode) {//参数1：ztree树容器的id ， 参数2：每次生成的额树节点对象
                            //在方法中可以对节点对象的属性和属性值进行修改[dom操作 ]
                            //删除自动生成的图标：只需要将图标的span标签移除即可
                            $("#" + treeNode.tId + "_ico").remove();
                            //生成自定义图标的span 插入到显示标题的span标签前即可
                            $("#" + treeNode.tId + "_span").before("<span class='" + treeNode.icon + "'></span>");

                        },
                        addHoverDom: function (treeId, treeNode) {
                            var aObj = $("#" + treeNode.tId + "_a"); // tId = permissionTree_1, ==> $("#permissionTree_1_a")
                            if (treeNode.editNameFlag || $("#btnGroup" + treeNode.tId).length > 0) return;
                            var s = '<span id="btnGroup' + treeNode.tId + '">';
                            if (treeNode.level == 0) {
                                s += '<a onclick="addMenu(' + treeNode.id + ')" class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" href="javascript:void(0)" >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
                            } else if (treeNode.level == 1) {
                                s += '<a onclick="updateMenu('+treeNode.id+')" class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  href="javascript:void(0)" title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
                                if (treeNode.children.length == 0) {
                                    s += '<a onclick="delMenu('+treeNode.id+')" class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" href="javascript:void(0)" >&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
                                }
                                s += '<a onclick="addMenu(' + treeNode.id + ')" class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" href="javascript:void(0)" >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
                            } else if (treeNode.level == 2) {
                                s += '<a onclick="updateMenu('+treeNode.id+')" class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  href="javascript:void(0)" title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
                                s += '<a onclick="delMenu('+treeNode.id+')" class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" href="javascript:void(0)">&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
                            }

                            s += '</span>';
                            aObj.after(s);
                        },
                        removeHoverDom: function (treeId, treeNode) {
                            $("#btnGroup" + treeNode.tId).remove();
                        }

                    },
                    data: {
                        simpleData: {
                            enable: true,
                            pIdKey: "pid"
                        },
                        key: {
                            url: "xasdasdasdasdasdas"
                        }
                    }
                };
                var zTree = $.fn.zTree.init($("#treeDemo"), setting, pMenus);
                zTree.expandAll(true);
                //移除原本的菜单图标

            }
        });
    }

    getAllMenusAndShow();


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
</script>
</body>
</html>
