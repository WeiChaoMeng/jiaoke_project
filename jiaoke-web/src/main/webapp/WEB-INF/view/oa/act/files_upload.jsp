<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <title>Title</title>
    <style>
        #btn {
            padding: 5px 10px;
            background: #00b0f0;
            color: #FFF;
            border: none;
            border-radius: 5px;
        }

        label {
            position: relative;
        }

        #fileinp {
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
            width: 100%;
        }

        li {
            list-style: none;
        }

        .file-select {
            float: left;
            width: 100%;
            padding: 0;
            margin: 0;
            height: 100%;
        }

        .file-select li {
            height: 28px;
            line-height: 28px;
            float: left;
            white-space: nowrap;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<%--<form action="${pageContext.request.contextPath}/servlet/UploadHandleServlet" enctype="multipart/form-data"
      method="post">
    上传文件1：<input type="file" name="file11" id="file11"><br/>
    上传文件1：<input type="file" name="file12" id="file12"><br/>
    <input type="submit" value="提交">
</form>--%>

<div style="margin: 20px;">
    插入：<input type="file" name="file" id="file"><br/>
    <input type="button" onclick="com()" value="上传">
</div>

<%--<form id="fileList">


    <div style="margin: 50px;height: 32px;">
        <div style="width: 200px;height: 30px;float: left;border: 1px #a5a4a4 solid;font-size: 13px;margin-right: 10px;"
             id="flag">

            <ul class="file-select" id="fileSelect">

            </ul>
        </div>

        <div style="float: left;line-height: 32px;">
            <label for="fileinp">
                <input type="button" id="btn" value="点我上传">
                <input type="file" id="fileinp" onchange="selectFile(this)">
            </label>
        </div>
    </div>
</form>
<button type="button" onclick="com()">提交</button>--%>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    function com() {
        var formData = new FormData();
        var f = $('#file')[0].files[0];
        formData.append("file",f);
        // formData.append("file", document.getElementById("file1").files[0]);
        // formData.append("file", document.getElementById("accc").value);
        // $('#fileSelect').find('input').each(function () {
        //     formData.append("file", $(this).val());
        // });

        console.log("结果————" + formData.get("file"));
        $.ajax({
            type: "POST",
            url: '${path}/fileUploadHandle/upload',
            data: formData,
            async: true,
            cache: false,
            contentType: false,    //不可缺
            processData: false,    //不可缺
            success: function (ret) {
                console.log(ret);
                if (ret.message === "success") {
                    alert("成功：：" + ret.filePaths);
                } else {
                    alert("失败");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("上传失败，请检查网络后重试");
            }
        });
    }

    function selectFile(own) {
        var abc = '';
        abc += '<li>';
        abc += '<span>' + own.files[0].name + '</span>';
        abc += '<input type="hidden" id="accc" value="' + own.files[0] + '">';
        abc += '<em onclick="del(this)">×</em>';
        abc += '</li>';

        $('#fileSelect').append(abc);
    }

    function del(own) {
        $(own).parent().remove();
    }
</script>
</html>
