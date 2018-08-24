<%@page import="com.att.hr.execcomp.common.ECSConstant"%>
<%@page import="javax.servlet.jsp.jstl.sql.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Stock Purchase and Deferral Plan</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="STYLESHEET" type="text/css"
	href="/execcompstatic/css/execcomp.css">
	
<style type="text/css">
<!--
td {font-size: 8pt}
-->
</style>

<style media="print">
<!--
.printHidden {display:none}
-->
</style>

<script src="report.js">
</script>

</head>
<body>

	<%
	response.setContentType("application/pdf");
	response.setHeader("Content-disposition","inline; filename=test.pdf");

	Result results1 = (Result) request.getAttribute("spdpDistributions");
	Result results2 = (Result) request.getAttribute("spdptotalDistributions");
		// TODO: Need to be completed
		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
		    response.setContentType("application/vnd.ms-excel");
		    response.setHeader("Content-Disposition", "inline; filename=" + "myExportExcel.xls");
		}
		
		String exportToPDF = request.getParameter("exportToPDF");
		if (exportToPDF != null && exportToPDF.toString().equalsIgnoreCase("YES")) {
		    response.setContentType("application/pdf");
		    response.setHeader("content-disposition","attachment; filename=" + "myExportPDF.pdf");
		}

	%>
	<c:set var="firstRecord" value="<%=(results1.getRows())[0]%>"/>
	<c:set var="grossValue" value="${0}"/>
	<c:set var="federalWithholdingValue" value="${0}"/>
	<c:set var="supplementalFedWithholdingValue" value="${0}"/>
	<c:set var="stateWithholdingValue" value="${0}"/>
	<c:set var="localWithholdingValue" value="${0}"/>
	<c:set var="netValue" value="${0}"/>
	
	<span id="cntnttitle">Stock Purchase and Deferral Plan<br />
		Distribution Statement<br />As of 
		<fmt:parseDate value="${firstRecord.Paydate}" var="payDate" pattern="<%=ECSConstant.DB_INPUT_MASK%>" />
						<fmt:formatDate pattern="M/d/yyyy" value="${payDate}" />
		<span id="cntntnum">Report ID: SPDP_D1</span>
	</span>
	<span id="cntnthead"> <font class="fntbld">Name:</font><c:out value="${firstRecord.firstname}"/> 
		<c:out value="${firstRecord.lastname}"/>
	</span>
	<span id="content">
	
	<form name="reportForm" method="post" action="/ECS/dcSPDPStmtDistribution.do" target="_self">
	<input type="hidden" name="methodName" value="exportPDF">
		<strong>Download Options:</strong>
		<select name="cbDownload" onchange="download('0')">
		<option value="">Make a Selection...</option>
		<option value="un_full_excel">Export to Excel with NO Formatting</option>
		<option value="full_excel">Export to Excel with text Formatting</option>
		<option value="full_word">Export to Word</option>
		<option value="full_pdf">Export to PDF</option></select>
	
	
		<p>

			Shown below is information, which explains the distribution of your
			Stock Purchase and Deferral Plan for
			<fmt:formatNumber value="${firstRecord.Net}" pattern="<%=ECSConstant.FINT%>"/>
			shares distributed
			<fmt:parseDate value="${firstRecord.ValuationDate}" var="valuationDate" pattern="<%=ECSConstant.DB_INPUT_MASK%>" />
						<fmt:formatDate pattern="MMMM dd, yyyy" value="${valuationDate}" />
			The Fair Market Value established on
			<fmt:parseDate value="${firstRecord.ValuationDate}" var="valuationDate" pattern="<%=ECSConstant.DB_INPUT_MASK%>" />
						<fmt:formatDate pattern="MMMM dd, yyyy" value="${valuationDate}" />
			was
			<c:out value="${firstRecord.MarketValue}"/>
			per share and represents your tax basis. The distribution of your
			Pre-Tax and Company Match account, when available for distribution,
			is subject to Federal, state and local taxes, as applicable. Any
			fractional share was included in your Federal withholding. Wages and
			taxes related to this distribution will appear in the year-to-date
			totals of your paycheck dated on or about April 6 and on a Form W-2
			issued by AT&T Inc.<br /> <br />
		</p>

		<table width="900" cellspacing="0" border="0">

			<thead>
				<tr>
					<th colspan="3" class="primeheaderright">&nbsp;</th>
					<th colspan="8" class="primeheader">Taxes</th>
					<th colspan="2" class="primeheader noborder">&nbsp;</th>
				</tr>
				<tr>
					<th class="full">&nbsp;</th>
					<th colspan="2">Gross (Wages)</th>
					<th colspan="2">Federal (<c:out value="${firstRecord.WithholdingRate}"/>)
					</th>
					<th colspan="2">Federal (<c:out value="${firstRecord.SupplementalRate}"/>)
					</th>
					<th colspan="2">State (<c:out value="${firstRecord.StateRate}"/> <c:out value="${firstRecord.StateCode}"/>)
					</th>
					<th colspan="2">Local (<c:out value="${firstRecord.LocalRate}"/> <c:out value="${firstRecord.LocalTaxCode}"/>)
					</th>
					<th colspan="2">Net</th>
				</tr>
				<tr>
					<th class="tieredfull">Plan <br />Year
					</th>
					<th class="tiered">Shares</th>
					<th class="tiered">Values</th>
					<th class="tiered">Shares</th>
					<th class="tiered">Values</th>
					<th class="tiered">Shares</th>
					<th class="tiered">Values</th>
					<th class="tiered">Shares</th>
					<th class="tiered">Values</th>
					<th class="tiered">Shares</th>
					<th class="tiered">Values</th>
					<th class="tiered">Shares</th>
					<th class="tiered">Values</th>
				</tr>
			</thead>

			<tbody>
	    	 <c:forEach items="<%=results1.getRows()%>" var="rsStmt">
				<tr>
					<td class="full">${rsStmt.Unityear}</td>
					<td class="full"><fmt:formatNumber value="${rsStmt.Gross}" pattern="<%=ECSConstant.DECIMAL%>"/></td>
					<td class="full">
					<fmt:formatNumber value="${rsStmt.Gross * rsStmt.MarketValue}" pattern="<%=ECSConstant.FMONEY%>"/></td>
					<td class="full">
					<fmt:formatNumber value="${rsStmt.federalWithholding}" pattern="<%=ECSConstant.DECIMAL%>"/></td>
					<td class="full">
					<fmt:formatNumber value="${rsStmt.federalWithholding * rsStmt.MarketValue}" pattern="<%=ECSConstant.FMONEY%>"/></td>
					<td class="full">
					<fmt:formatNumber value="${rsStmt.SupplementalFedWithholding}" pattern="<%=ECSConstant.DECIMAL%>"/></td>
					<td class="full">
					<fmt:formatNumber value="${rsStmt.SupplementalFedWithholding * rsStmt.MarketValue}" pattern="<%=ECSConstant.FMONEY%>"/></td>
					<td class="full">
					<fmt:formatNumber value="${rsStmt.StateWithholding}" pattern="<%=ECSConstant.DECIMAL%>"/></td>
					<td class="full">
					<fmt:formatNumber value="${rsStmt.StateWithholding * rsStmt.MarketValue}" pattern="<%=ECSConstant.FMONEY%>"/></td>
					<td class="full">
					<fmt:formatNumber value="${rsStmt.LocalWithholding}" pattern="<%=ECSConstant.DECIMAL%>"/></td>
					<td class="full">
					<fmt:formatNumber value="${rsStmt.LocalWithholding * rsStmt.MarketValue}" pattern="<%=ECSConstant.FMONEY%>"/></td>
					<td class="full">
					<fmt:formatNumber value="${rsStmt.Net}" pattern="<%=ECSConstant.DECIMAL%>"/></td>
					<td class="full">
					<fmt:formatNumber value="${rsStmt.Net * rsStmt.MarketValue}" pattern="<%=ECSConstant.FMONEY%>"/></td>
				</tr>
				<c:set var="grossValue" value="${grossValue + (rsStmt.Gross * rsStmt.MarketValue)}"/>
				<c:set var="federalWithholdingValue" value="${federalWithholdingValue + (rsStmt.federalWithholding * rsStmt.MarketValue)}"/>
				<c:set var="supplementalFedWithholdingValue" value="${supplementalFedWithholdingValue + (rsStmt.SupplementalFedWithholding * rsStmt.MarketValue)}"/>
				<c:set var="stateWithholdingValue" value="${stateWithholdingValue + (rsStmt.StateWithholding * rsStmt.MarketValue)}"/>
				<c:set var="localWithholdingValue" value="${localWithholdingValue + (rsStmt.LocalWithholding * rsStmt.MarketValue)}"/>
				<c:set var="netValue" value="${netValue + (rsStmt.Net * rsStmt.MarketValue)}"/>
			
			</c:forEach>	
			
			 <c:forEach items="<%=results2.getRows()%>" var="rsStmt">
			 
			 <tfoot>
				<tr>
					<td>W-2 Total:</td>
					<td>
					<fmt:formatNumber value="${rsStmt.Gross}" pattern="<%=ECSConstant.SHARES%>"/></td>
					<td><fmt:formatNumber value="${grossValue}" pattern="<%=ECSConstant.FMONEY%>"/></td>

					<td>
					<fmt:formatNumber value="${rsStmt.federalWithholding}" pattern="<%=ECSConstant.SHARES%>"/></td>
					<td><fmt:formatNumber value="${federalWithholdingValue}" pattern="<%=ECSConstant.FMONEY%>"/></td>

					<td>
					<fmt:formatNumber value="${rsStmt.SupplementalFedWithholding}" pattern="<%=ECSConstant.SHARES%>"/></td>
					<td><fmt:formatNumber value="${supplementalFedWithholdingValue}" pattern="<%=ECSConstant.FMONEY%>"/></td>

					<td>
					<fmt:formatNumber value="${rsStmt.StateWithholding}" pattern="<%=ECSConstant.SHARES%>"/></td>
					<td><fmt:formatNumber value="${stateWithholdingValue}" pattern="<%=ECSConstant.FMONEY%>"/></td>

					<td>
					<fmt:formatNumber value="${rsStmt.LocalWithholding}" pattern="<%=ECSConstant.SHARES%>"/></td>
					<td><fmt:formatNumber value="${localWithholdingValue}" pattern="<%=ECSConstant.FMONEY%>"/></td>

					<td><fmt:formatNumber value="${rsStmt.Net}" pattern="<%=ECSConstant.SHARES%>"/></td>
					<td><fmt:formatNumber value="${netValue}" pattern="<%=ECSConstant.FMONEY%>"/></td>
				</tr>
				<tfoot>
				</c:forEach>
			</tbody>
		</table> 
		
		
		<p>
			Federal withholding rate is
			<c:out value="${firstRecord.WithholdingRate}"/>
			until year-to-date taxable supplemental wages exceed $1 million, at
			which time the rate increases to
			<c:out value="${firstRecord.SupplementalRate}"/>.
		</p> 
	<span class="cntntnotecount blue">NOTES:</span> <br> <span
		class="cntntverbiageblockbody"> <b>State taxes were
				withheld as follows:</b>
	</span> <span class="cntntverbiageblockbody"> <b>Active
				participants:</b> The tax rate is based on your work address if your
			employing company does business in that state; otherwise, it is zero.
	</span> <span class="cntntverbiageblockbody"> <b>Retired or
				terminated participants:</b> The tax rate is based on your residence
			address if your former company does business in that state;
			otherwise, it is zero.
	</span> <span class="cntntverbiageblockbody"> <b>Uncertificated
				shares:</b>
	</span> <span class="cntntverbiageblockbody"> Stock distributed to you
			will be registered in your name and issued in uncertificated form on
			or after the next business day following <fmt:parseDate value="${firstRecord.Paydate}" var="payDate" pattern="<%=ECSConstant.DB_INPUT_MASK%>" />
						<fmt:formatDate pattern="M/d/yyyy" value="${payDate}" />.
			You will receive confirmation of the transaction at your home address
			from our transfer agent, Computershare (<a
			href="http://www.computershare.com/att" target="_blank">www.computershare.com/att</a>).
			You may also contact Computershare at 1-800-351-7221.
	</span> <br> <jsp:include page="../common/ECSIAContactInfo.jsp"></jsp:include>
	</span>
		
		
		 <%-- <jsp:include page="../common/ECSIAContentFooter.jsp"></jsp:include>  --%> 
		 
		 <%--
		  <%
        if (exportToExcel == null) {
    %> <a href="DC_SPDP_Distribution.jsp">Export to Excel</a> <%
        }
    %> <%
        if (exportToPDF == null) {
    %> <a href="DC_SPDP_Distribution.jsp?exportToPDF=YES">Export to
			PDF</a> <%
        }
    %>  
    --%>
</form>	
</body>
</html>
