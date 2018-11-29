<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>

<script type="text/javascript">

    var toolbar = [{
        iconCls: 'icon-add',
        text: "添加",
        handler: function () {
            $("#addProdia").dialog("open");
        }
    }, '-', {
        iconCls: 'icon-remove',
        text: "删除",
        handler: function () {
            var row = $("#dg").edatagrid("getSelected")
            //               alert(row.id);
            if (row == null) {
                $.messager.show({
                    title: '警告',
                    msg: '请选择要删除的行',
                    showType: 'show',
                    style: {
                        right: '',
                        top: document.body.scrollTop + document.documentElement.scrollTop,
                        bottom: ''
                    }
                })
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/banner/deleteBanner",
                    data: "id=" + row.id,
                    success: function (data) {
//						alert("ded");
                        if (data) {
//								alert(data==true);
                            $("#dg").datagrid("reload");
                        } else {
                            alert("删除失败!");
                        }
                    }
                });
            }

        }
    }, '-', {
        iconCls: 'icon-edit',
        text: "修改",
        handler: function () {
            var row = $("#dg").edatagrid("getSelected")
            if (row == null) {
                $.messager.show({
                    title: '警告',
                    msg: '请选择要修改的行',
                    showType: 'show',
                    style: {
                        right: '',
                        top: document.body.scrollTop + document.documentElement.scrollTop,
                        bottom: ''
                    }
                })
            } else {
                var index = $("#dg").edatagrid("getRowIndex", row);
                $("#dg").edatagrid("editRow", index);
            }
        }
    }, '-', {
        iconCls: 'icon-save',
        text: "保存",
        handler: function () {
            $("#dg").edatagrid("saveRow");
        }
    }]


    $(function () {
        $("#dg").edatagrid({
            updateUrl: "${pageContext.request.contextPath}/banner/updateBanner",
//            deleteUrl:"${pageContext.request.contextPath}/banner/deleteBanner",
            url: "${pageContext.request.contextPath}/banner/queryAll",
            toolbar: toolbar,
            columns: [[
                {field: 'id', title: 'id', hidden: true, width: 100},
                {field: 'title', title: '名字', width: 100},
                {field: 'imgPath', title: '图片', hidden: true, width: 100},
                {
                    field: 'status', title: '状态', width: 100, editor: {
                        type: "text",
                        options: {
                            required: true
                        }
                    }
                },
                {field: 'desc', title: '描述', width: 100},
                {field: 'date', title: '发布日期', width: 100, align: 'right'}
            ]],
            fit: true,
            fitColumns: true,
            pagination: true,
            pageSize: 8,
            pageList: [8, 10, 12, 16],
            view: detailview,
            detailFormatter: function (rowIndex, rowData) {
                //               alert(rowData.imgPath);
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>时间: ' + rowData.date + '</p>' +
                    '<p>:描述:' + rowData.desc + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });
    })

    //添加function
    //调出添加对话框
    function guAdd() {
        $(":text").val("");
        $("#addProdia").dialog("close");
    };
    //调出添加对话框==end==

    //提交添加，发ajax请求
    function toaddBanner() {
//			alert("0123");
        $("#prof1").form("submit", {
            url: "${pageContext.request.contextPath}/banner/addBanner",
            success: function (data) {
                if (data == "true") {
                    $(":text").val("");
                    $("#addProdia").dialog("close");
                    $("#dg").edatagrid("load");
                } else {
                    alert("添加失败!");
                }
            }
        });
    };
    //提交添加，发ajax请求==end==
    //添加function==END==
</script>

<table id="dg"></table>
<div id="addProdia" class="easyui-dialog" data-options="closed:true">
    <form id="prof1" style="margin:30px" enctype="multipart/form-data" method="post">
        <table>
            <tr>
                <td>
                    名字：<input class="easyui-validatebox" name="title"
                              data-options="required:true,missingMessage:'请填写图片名字'"/><br/><br/>
                    图片：<input class="easyui-filebox" name="uploadFile"
                              data-options="required:true,missingMessage:'请选择图片'"/><br/><br/>
                </td>
                <td>
                    状态：<input class="easyui-validatebox" name="status" type="text"
                              data-options="required:true,missingMessage:'请输入图片状态'"/> <br/><br/>
                    描述：<input class="easyui-validatebox" name="desc" type="text"
                              data-options="required:true,missingMessage:'请输入图片描述'"/><br/><br/>
                </td>
            </tr>
        </table>
        <center>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" onClick="toaddBanner()">确认</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onClick="guAdd()">取消</a>
        </center>
    </form>
</div>