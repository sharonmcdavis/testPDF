<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
response.reset();
response.setContentType("application/pdf");
response.setHeader("Content-disposition","attachment; filename=test.pdf");
response.setHeader("Cache-Control","must-revalidate, post-check=0, pre-check=0");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "public"); 
%>

<jsp:include page="pdf_header.jsp"/>

There is some text here.

<jsp:include page="pdf_footer.jsp"/>