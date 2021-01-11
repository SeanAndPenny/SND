<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<input id="id" name="id" type="hidden" value="${entity.id}"/>
<div class="layui-form-item">
	<label class="layui-form-label label4">DEMONAME</label>
	<div class="layui-input-block input3">
		<input type="text" required lay-verify="required" autocomplete="off" class="layui-input"
			 name="demoname" value="${entity.demoname}" placeholder="请输入DEMONAME"/>
	</div>
</div>
<div class="layui-form-item layui-inline">
	<label class="layui-form-label label4">日期</label>
	<div class="layui-input-inline input3">
		<input type="text" class="layui-input dateinput" readonly="readonly" required lay-verify="required"
			id="demoDate" name="demoDateStr" value="${entity.demoDateStr}" placeholder="yyyy-MM-dd HH:mm:ss"/>
	</div>
</div>