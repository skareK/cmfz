<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../themes/IconExtension.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        <!--菜单处理-->
        $(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/main/getMenus",
                type: "get",
                dataType: "json",
                success: function (data) {
//                   console.log(data);
                    $.each(data, function (index, first) {
                        var ss = "";
                        $.each(first.menus, function (index1, second) {
                            ss = "<div align='center'><a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" data-options=\"iconCls:'" + second.menuIconCls + "'\" style=\"text-decoration:none\" onclick=\"toAddTabs('" + second.menuTitle + "')\">" + second.menuTitle + "</a></div>"

                        }),
                            $('#aa').accordion('add', {
                                title: first.menuTitle,
                                iconCls: first.menuIconCls,
                                content: ss,
                                selected: false
                            });
                    })
                }
            });
        })

        //添加一个页签
        function toAddTabs(title) {
            alert(title);
            $("#tt").tabs("add", {
                title: title,
                closable: true,
                iconCls: "icon-save",
                content: "<iframe src='${pageContext.request.contextPath}/img/4.gif' width='100%' height='100%'></iframe>"
            });

            /* var isExist=$("#tt").tabs("exists",title);
             if(isExist){
                 //存在
                 $("#tt").tabs("select",title);
             }else{
                 //不存在
                 $("#tt").tabs("add",{
                     title:title,
                     closable:true,
                     iconCls:"icon-save",
                     // content:"<iframe src='book.jsp?id="+node.id+"' width='100%' height='100%'></iframe>"
                 });
             }*/
        };

        /*$('#tt').tabs('add',{
            content:'Tab Body',
            tools:[{
                iconCls:'icon-mini-refresh',
                handler:function(){
                    alert('refresh');
                }
            }]
        });*/
        //添加一个页签==END==
    </script>

</head>
<body class="easyui-layout">
<div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    <div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px">
        持名法州后台管理系统
    </div>
    <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:xxxxx
        &nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="#"
                                                                                                              class="easyui-linkbutton"
                                                                                                              data-options="iconCls:'icon-01'">退出系统</a>
    </div>
</div>
<div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体">&copy;百知教育 htf@zparkhr.com.cn</div>
</div>

<div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    <div id="aa" class="easyui-accordion" data-options="fit:true">
        <%--<c:forEach items="${requestScope.menuList}" var="menu">
            <div title="${menu.menuTitle}" data-options="iconCls:'icon-cut'" style="overflow:auto;padding:10px;">
                <c:forEach items="${menu.menus}" var="men">
                    <div align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="text-decoration:none" onclick="toAddTabs(${men.menuTitle})">${men.menuTitle}</a>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>--%>
    </div>
</div>

<div data-options="region:'center'">
    <div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
        <div title="主页" data-options="iconCls:'icon-neighbourhood',closable:true"
             style="background-image:url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
        <%--<div id="ct" class="easyui-tabs" data-options="closable:true,iconCls:icon-save">
            <div title="欢迎" data-options="closable:true" style="font-size:70px;color:#95B8E7;padding:100px" align="center">
                欢迎来到 桥上枫叶的综合管理系统
                <c:forEach items="${requestScope.menuList}" var="menu">
                    ${menu.menuTitle}
                </c:forEach>
            </div>
        </div>--%>
    </div>
</div>
</body>
</html>