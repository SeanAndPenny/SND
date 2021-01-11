<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/meta.jsp"%>
</head>
<body>
<div class="side-menu sidebar-inverse">
    <nav class="navbar navbar-default" role="navigation">
        <div class="side-menu-container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <div class="icon fa fa-paper-plane"></div>
                    <div class="title">菜单</div>
                </a>
                <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                    <i class="fa fa-times icon"></i>
                </button>
            </div>
            <ul class="nav navbar-nav">
                <li >
                    <a target="iframeContent" href="index.jsp">
                        <span class="icon fa fa-tachometer"></span><span class="title">首页</span>
                    </a>
                </li>
                <li >
                    <a target="iframeContent" href="${ctx}/demo/page/query">
                        <span class="icon fa fa-desktop"></span><span class="title">demo</span>
                    </a>
                </li>
                <li >
                    <a target="iframeContent" href="123.jsp">
                        <span class="icon fa fa-desktop"></span><span class="title">123</span>
                    </a>
                </li>
                <li >
                    <a target="iframeContent" href="456.jsp">
                        <span class="icon fa fa-table"></span><span class="title">456</span>
                    </a>
                </li>
                <li >
                    <a target="iframeContent" href="789.jsp">
                        <span class="icon fa fa-file-text-o"></span><span class="title">789</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</div>
</body>
</html>