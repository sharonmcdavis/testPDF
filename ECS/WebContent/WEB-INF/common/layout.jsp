<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	String pageName = (String) request.getAttribute("pageName");
	String pageTitle = (String) request.getAttribute("pageTitle");
	if (pageName == null) {
		pageName = "";
	}
	if (pageTitle == null) {
		pageTitle = "";
	}
%>

<title><%= pageTitle %></title>
<link rel="STYLESHEET" type="text/css" href="/execcompstatic/css/layout.css" />
</head>

<body>
<div class="wrapper">
  <div class="header">
  	<jsp:include page="../common/header.jsp"></jsp:include> 
  </div>

  <div class="sidebar">
    <jsp:include page="../common/menu.jsp"></jsp:include> 
  </div>
  <div class="content">
    <jsp:include page="<%= pageName %>"></jsp:include> 
  </div>
  
  <div class="footer">
  	<jsp:include page="../common/ECSIAContentFooter.jsp"></jsp:include> 
  </div>

</div>
</body>

</html>