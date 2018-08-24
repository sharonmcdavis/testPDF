<%@page import="java.util.SortedMap"%>
<%@page import="javax.servlet.jsp.jstl.sql.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Stock Purchase and Deferral Plan</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%
Result results = (Result) request.getAttribute("contactInfo");
SortedMap<Object, Object> contactInfoRow = (results.getRows())[0];
%>
<c:set var="contactInfo" value="<%=contactInfoRow%>"/>
<link rel="STYLESHEET" type="text/css"
	href="https://wiwauk4coldda03.itservices.sbc.com/execComp/ECS/ExecutiveView/css/execcomp.css">
</head>
<body>
	<p>
		Every attempt has been made to be as accurate as possible in the
		preparation of this document. Questions regarding its contents should
		be referred to ${contactInfo.contactName} at ${contactInfo.contactPhone}, or by
		email: <a href="mailto:${contactInfo.contactEmail}"> ${contactInfo.contactEmail}</a>

	</p>


</body>
</html>