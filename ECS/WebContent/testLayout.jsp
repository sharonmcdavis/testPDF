<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="testLayout.css" rel="stylesheet" type="text/css" />
<link rel="STYLESHEET" type="text/css"	href="/execcompstatic/css/execcomp.css">
		<%
			String pageName = (String) request.getAttribute("pageName");
			String pageTitle = (String) request.getAttribute("pageTitle");
			if (pageName == null) {
				pageName = "default.jsp";
			}
			if (pageTitle == null) {
				pageTitle = "Executive Compensation";
			}
			System.out.println("pageName = " + pageName);
			System.out.println("pageTitle = " + pageTitle);
		%>
		<title><%= pageTitle %></title>
</head>
<body>
<!-- START PAGE SOURCE -->
<div class="main">
  <div class="header">
    <jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>
    <div class="clr"></div>
  </div>
  <div class="content">
    <div class="content_bg">
      <div class="mainbar">
        <div class="article">
          <div class="clr"></div>
          <jsp:include page="<%= pageName %>"></jsp:include>
          <div class="clr"></div>
        </div>
        
      </div>
      <div class="sidebar">
        <div class="gadget">
          <div class="clr"></div>
          <jsp:include page="/WEB-INF/common/menuList.jsp"></jsp:include> 
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <jsp:include page="/WEB-INF/common/ECSIAContentFooter.jsp"></jsp:include> 
      <div class="clr"></div>
    </div>
  </div>
</div>
<!-- END PAGE SOURCE -->
</body>
</html>