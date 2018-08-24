<%@page import="javax.servlet.jsp.jstl.sql.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Restricted Stock Distribution Statements</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="STYLESHEET" type="text/css"
	href="https://wiwauk4coldda03.itservices.sbc.com/execComp/ECS/ExecutiveView/css/execcomp.css">
</head>

<body>

	<%
		Result rs = (Result) request.getAttribute("equityRSDistributions");
	%>
	<span id="cntntglbl"> Questions regarding this statement can be
		directed to AT&T Equity Administration at <a
		href="mailto:g10934@att.com">g10934@att.com</a> or (866) 533-4390.
	</span>
	<span id="content"> 
		<h3 class="underline">Restricted Stock Distribution Statements</h3>

		<p>
			Please click the link(s) below in order to view your Restricted Stock
			/ Restricted Stock Unit Distribution Statements:<br /> <br />
		</p>

	</span>
	<table width="900px" cellspacing="0" border="">
		<tbody>
			<tr>
				<td class="ca" style="border: none; font-weight: bold">Plan</td>

				<td class="ca" style="border: none; font-weight: bold">Grant
					Date</td>

				<td class="ca" style="border: none; font-weight: bold">Grant
					Type</td>

				<td class="ca" style="border: none; font-weight: bold">Vesting
					Date</td>

			</tr>
			
			<c:forEach items="<%=rs.getRows()%>" var="rsStmt">
				<tr>
					<td class="ca" style="border: none"><c:out
							value="${rsStmt.PlanName}" /></td>
					<td class="ca" style="border: none"><fmt:parseDate
							value="${rsStmt.GrantDate}" var="grantDate" pattern="yyyy-mm-dd" />
						<fmt:formatDate pattern="M/d/yyyy" value="${grantDate}" /></td>
					<td class="ca" style="border: none"><c:out
							value="${rsStmt.GrantType}" /></td>
					<td class="ca" style="border: none"><c:out
							value="${rsStmt.VestingDate}" /></td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>


	<jsp:include page="../common/ECSIAContentFooter.jsp"></jsp:include>
</body>
</html>
