﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modify.aspx.cs" Inherits="msite.A1001.modify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,minimum-scale=1,user-scalable=no,maximum-scale=1,initial-scale=1" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    <script src="/js/jquery-1.7.2.min.js"></script>
    <title>修改密码</title>
    <style type="text/css">
        html, body {
            background-color: #590000;
            margin: 0px;
        }

        .title {
            text-align: center;
            color: #ffffff;
            padding-top: 10px;
            margin: 0 auto;
            font-size: 20px;
            font-weight: bold;
        }

        .form {
            text-align: center;
            margin: 0 auto;
        }

            .form input {
                width: 80%;
                height: 35px;
                line-height: 35px;
                border: none;
                border-radius: 5px;
                padding-left: 10px;
            }

        .btn {
            width: 200px;
            text-align: center;
            line-height: 30px;
            border-radius: 5px;
            background-color: #F7AA01;
            font-weight: bold;
            font-size: 20px;
            color: #590000;
            margin: 0 auto;
        }

        .content {
            margin: 50px 10px 0px 10px;
            height: auto;
            color: #ffffff;
            border: 1px dashed #ffffff;
            border-radius: 5px;
        }



            .content ul li span {
                color: #ffffff;
                font-family: cursive;
            }

            .content ul {
                list-style-type: square;
                color: #F7AA01;
                line-height: 25px;
            }

                .content ul li .yellow {
                    color: #F7AA01;
                }


        .content-title2 {
            position: relative;
            width: 160px;
            top: -16px;
            margin: 0 auto;
            line-height: 30px;
            border-radius: 10px;
            text-align: center;
            color: #590000;
            font-weight: bold;
            background-color: #ffffff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img class="gridlazy" src="/images/main-01_01.jpg" style="width: 100%;" />
        </div>
        <div class="title">
            修改密码
        </div>
        <div class="form">
            <p>
                <input type="text" id="loginName" placeholder="请输入账号" />
            </p>
            <p>
                <input type="text" id="oldPwd" placeholder="请输入旧密码" />
            </p>
            <p>
                <input type="text" id="newPwd" placeholder="请输入新密码" />
            </p>
        </div>
        <div class="btn" onclick="login()">
            确认修改
        </div>
        
        <div style="height: 30px;"></div>
    </form>
</body>
</html>
<script src="/js/loading/jquery.loading-0.1.js"></script>
<link href="/js/layer/need/layer.css" rel="stylesheet" />
<script src="/js/layer/layer.js"></script>
<script type="text/javascript">

    //朋友助力
    function login() {
        if ($("#loginName").val().length == 0) {
            layer.open({
                content: '请输入账号',
                time: 2 //2秒后自动关闭
            });
            return false;
        }
        if ($("#oldPwd").val().length == 0) {
            layer.open({
                content: '请输入旧密码',
                time: 2 //2秒后自动关闭
            });
            return false;
        }
        if ($("#newPwd").val().length == 0) {
            layer.open({
                content: '请输入新密码',
                time: 2 //2秒后自动关闭
            });
            return false;
        }
        loading.show();
        $.ajax({
            type: "post",
            url: "/AjaxHandler.aspx",
            data: {
                action: "modifypwd",
                loginName: $("#loginName").val(),
                oldPwd: $("#oldPwd").val(),
                newPwd: $("#newPwd").val(),
                customerid: "<%=this.CurrentCustomerID%>"
            },
            success: function (ret) {
                loading.close();
                if (ret.code == 1) {
                    layer.open({
                        content: '密码修改成功',
                        time: 2 //2秒后自动关闭
                    });
                }
                else {
                    layer.open({
                        content: ret.msg,
                        time: 2 //2秒后自动关闭
                    });
                }
            },
            error: function (err) {
                loading.close();
            }
        });
    }


</script>
