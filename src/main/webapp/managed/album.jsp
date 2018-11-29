<%@page pageEncoding="UTF-8" isELIgnored="false" contentType="text/html; UTF-8" %>

<script type="text/javascript">
    var toolbar = [{
        iconCls: 'icon-tip',
        text: "专辑详情",
        handler: function () {
            var row = $("#album_tg").treegrid("getSelected");
            if (row == null) {
                $.messager.show({
                    title: '警告',
                    msg: '请选择要查看的专辑',
                    showType: 'show',
                    style: {
                        right: '',
                        top: document.body.scrollTop + document.documentElement.scrollTop,
                        bottom: ''
                    }
                })
            } else {
                if (row.albumScore != null) {
                    $("#album").dialog("open");
                    $("#album_ff").form("load", row);
                    $("#album_img").prop("src", "${pageContext.request.contextPath}" + row.albumCoverimg)
                } else {
                    $.messager.show({
                        title: '警告',
                        msg: '请先选择要查看的专辑',
                        showType: 'show',
                    })
                }
            }
        }
    }, '-', {
        iconCls: 'icon-add',
        text: "添加专辑",
        handler: function () {
            $("#album_add").dialog("open");
        }
    }, '-', {
        iconCls: 'icon-add',
        text: "添加章节",
        handler: function () {
            var row = $("#album_tg").treegrid("getSelected");
            if (row == null) {
                $.messager.show({
                    title: '警告',
                    msg: '请选择章节所属的专辑',
                    showType: 'show',
                    style: {
                        right: '',
                        top: document.body.scrollTop + document.documentElement.scrollTop,
                        bottom: ''
                    }
                })
            } else {
                if (row.albumScore != null) {
                    $("#chapter_add").dialog("open")
                } else {
                    $.messager.show({
                        title: '警告',
                        msg: '请选择章节所属的专辑',
                        showType: 'show',
                        style: {
                            right: '',
                            top: document.body.scrollTop + document.documentElement.scrollTop,
                            bottom: ''
                        }
                    })
                }
            }
        }
    }, '-', {
        iconCls: 'icon-save',
        text: "下载音频",
        handler: function () {
            var row = $("#chapter_tg").treegrid("getSelected");
            if (row != null) {
                if (row.size != null) {
                    location.href = "${pageContext.request.contextPath}/chapter/download?url=" + row.chapterDownPath + "&title=" + row.title
                }
            }
        }
    }]

    $(function () {
        $("#album_tg").treegrid({
            toolbar: toolbar,
            url: "${pageContext.request.contextPath}/album/queryAll",
            idField: 'id',
            treeField: 'title',
            columns: [[
                {field: 'title', title: '名字', width: 60},
                {field: 'chapterSize', title: '大小', width: 80},
                {field: 'chapterDuration', title: '时长', width: 80},
                {field: 'chapterUploadDate', title: '发布时间', width: 60},
            ]],
            fit: true,
            fitColumns: true,
            pagination: true,
            pageSize: 8,
            pageList: [8, 10, 12, 16],
            onDblClickRow: function (row) {
                $("#audio").dialog("open")
                $("#audio_id").prop("src", "${pageContext.request.contextPath}/" + row.chapterDownPath)
            },
        });

        $('#album').dialog({
            title: '专辑详情',
            width: 400,
            height: 200,
            closed: true,
        });

        $('#audio').dialog({
            title: '播放',
            width: 400,
            height: 200,
            closed: true,
        });

        $('#chapter_add').dialog({
            title: '添加章节',
            width: 400,
            height: 200,
            closed: true,
            buttons: [{
                text: '保存',
                handler: function () {
                    addChapter();
                }
            }, {
                text: '关闭',
                handler: function () {
                    $("#chapter_add").dialog("close")
                }
            }],
        });
    });

    //添加function
    //提交添加专辑，发ajax请求
    function toaddAlbum() {
        $("#album_adf").form("submit", {
            url: "${pageContext.request.contextPath}/album/addAlbum",
            // dataType:"JSON",
            success: function (data) {
//                var result=JSON.parse(data);
//                alert(result);
//                alert(result==true);
                if (data == "true") {
                    $(":text").val("");
                    $("#album_add").dialog("close");
                    $("#album_tg").edatagrid("load");
                } else {
                    alert("添加失败!");
                }
            }
        });
    };

    //提交添加，发ajax请求==end==
    function guaddAlbum() {
        $(":text").val("");
        $("#album_add").dialog("close");
    };
    //添加专辑function==END==

    //提交添加章节function，发ajax请求
    function addChapter() {
        $('#chapter_ff').form('submit', {
            url: "${pageContext.request.contextPath}/chapter/addChapter",
            success: function (data) {
                //              var result=JSON.parse(data);
//                alert(result);
//                alert(result==true);
                if (data == true) {
                    $(":text").val("");
                    $("#chapter_add").dialog("close");
                    $("#album_tg").edatagrid("load");
                } else {
                    alert("添加失败!");
                }
            },
            dataType: "json"
        })
    }

    //提交添加章节function==END==
</script>

<table id="album_tg"></table>

<div id="album">
    <form id="album_ff" method="post">
        <div>
            <div>
                <img src="" id="album_img" width="200" height="150"/>
            </div>
            <div>
                <input id="name" class="easyui-validatebox" type="text" name="title" data-options="required:true"/>
            </div>
            <div>
                <input class="easyui-validatebox" type="text" name="albumAuthor" data-options="required:true"/>
            </div>
            <div>
                <input class="easyui-validatebox" type="text" name="albumBrief" data-options="required:true"/>
            </div>
        </div>
    </form>
</div>


<div id="album_add" class="easyui-dialog" data-options="closed:true,title:'添加专辑'">
    <form id="album_adf" style="margin:30px" enctype="multipart/form-data" method="post">
        <table>
            <tr>
                <td>
                    名字：<input class="easyui-validatebox" name="title"
                              data-options="required:true,missingMessage:'请填写专辑标题'"/><br/><br/>
                    封面：<input class="easyui-filebox" name="albumimgFile"
                              data-options="required:true,missingMessage:'请选择图片'"/><br/><br/>
                </td>
                <td>
                    章节数：<input class="easyui-validatebox" name="albumCount" type="text"
                               data-options="required:true,missingMessage:'请输入章节数目'"/> <br/><br/>
                    作者：<input class="easyui-validatebox" name="albumAuthor" type="text"
                              data-options="required:true,missingMessage:'请输入作者信息'"/><br/><br/>
                </td>
            </tr>
            <tr>
                <td>
                    播音：<input class="easyui-validatebox" name="albumBroadCast" type="text"
                              data-options="required:true,missingMessage:'请输入播音人信息'"/> <br/><br/>
                    摘要：<input class="easyui-validatebox" name="albumBrief" type="text"
                              data-options="required:true,missingMessage:'请输入专辑摘要信息'"/><br/><br/>
                </td>
            </tr>
        </table>
        <center>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" onClick="toaddAlbum()">确认</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onClick="guaddAlbum()">取消</a>
        </center>
    </form>
</div>

<div id="chapter_add">
    <form id="chapter_ff" method="post" ENCTYPE="multipart/form-data">
        <div>
            标题:<input class="easyui-validatebox" type="text" name="title" data-options="required:true"/>
        </div>
        <div>
            请选择:<input class="easyui-filebox" name="chapterbgm" data-options="required:true,missingMessage:'请选择图片'"/>
        </div>
        <div>
            <input type="hidden" name="id" id="p_id" value="" style="width:300px">
        </div>
    </form>
</div>

<div id="audio">
    <audio id="audio_id" src="" autoplay="autoplay" controls="controls" loop="loop"></audio>
</div>