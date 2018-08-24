<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Report 2 </title>


<script src="report.js"></script>
</head>
<body>
<FORM method="post" action="ReportController" name="Report" target="_self">
<INPUT type="hidden" name="methodName" value="getReport">

<%
String contextType = (String)request.getAttribute("contextType");
if (contextType == null)
	contextType = "text/html";
response.setContentType(contextType);

%>

	Welcome 2


	<strong>Download Options:</strong>
	<select name="cbDownload" onchange="download('0')">
	<option value="">Make a Selection...</option>
	<option value="un_sum_excel">Export to Excel with NO Formatting</option>
	<option value="sum_excel">Export to Excel with text Formatting</option>
	<option value="sum_word">Export to Word</option>
 	<option value="sum_pdf">Export to PDF</option>
	</select>
</FORM>
</body>
</html>