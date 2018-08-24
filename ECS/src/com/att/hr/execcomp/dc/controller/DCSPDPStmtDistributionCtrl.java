package com.att.hr.execcomp.dc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.sql.Result;

import com.att.hr.execcomp.common.SME;
import com.att.hr.execcomp.dc.dataaccess.DCSPDPStmtDistribution;
import com.att.hr.execcomp.utils.Utils;


/**
 * Servlet implementation class DistributionServlet
 */
@WebServlet("/DCSPDPStmtDistributionCtrl")
public class DCSPDPStmtDistributionCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DCSPDPStmtDistributionCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost::begin");
		doGet(request, response);
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet::begin");
		request.setAttribute("pageTitle", "Executive Compensation");
		request.setAttribute("pageName", "../deferral/dcSPDPStmtDistribution.jsp");
		getResults(request, response);
		
		// Redirecting to JSP page
		RequestDispatcher dispatcher;
//		dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/deferral/dcSPDPStmtDistribution.jsp");
//		dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/common/layout3.jsp");
//		dispatcher.forward(request, response);
		
		System.out.println("I'm in doGet");
		String methodName = request.getParameter("methodName");
		if (methodName != null && methodName.equalsIgnoreCase("getReport")) {
			getResults(request, response);
		} else if (methodName != null && methodName.equalsIgnoreCase("exportPdf")) {
			exportPdf (request, response);
		} 
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/common/layout3.jsp");
		rd.forward(request, response);

		
	}

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		System.out.println("doPost::begin");
//		doGet(request, response);
//	}

	private void getResults(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("getResults::begin");
		DCSPDPStmtDistribution spdpDistDAO;
		SME smeDAO;
		// Fetching results from DB and setting to a request attribute
		spdpDistDAO = new DCSPDPStmtDistribution();
		smeDAO = new SME();
		List<Result> rsList = spdpDistDAO.getSPDPDistributionsList("EC10013383", "3/10/2016");
		Result sp2Results = smeDAO.getContactInfo(140, "AdminView", 0, 0);

		request.setAttribute("spdpDistributions", rsList.get(0));
		request.setAttribute("spdptotalDistributions", rsList.get(1));
		request.setAttribute("contactInfo", sp2Results);
		
	}

	private void exportPdf(HttpServletRequest request, HttpServletResponse response)
	{	
		System.out.println("exportPDF::begin");
		RequestDispatcher dispatcher;
		try
		{
//			HttpSession session = request.getSession();
			request.setAttribute("contextType", "image/pdf");
			request.setAttribute("contentDisposition", "attachment; filename=distCtrl.pdf");

			getResults(request, response);
			this.forward(request, response, "/WEB-INF/deferral/export/dcSPDPStmtDistribution.jsp");
//			dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/deferral/eqStmtRSDistribution.jsp");
//			dispatcher.forward(request, response);

		}
		catch (Exception ex)
		{
			this.errorPage(request, response, ex.getMessage());
		}
	}

	private void forward(HttpServletRequest req, HttpServletResponse res, String pageName)
	{
	    RequestDispatcher rd = req.getRequestDispatcher(pageName);
	    try
	    {
      		rd.forward(req,res);
    	}
    	catch (IOException ioex)
    	{
      		ioex.printStackTrace();
    	}
    	catch(Exception ex)
    	{
			//do nothing for a broken pipe exception
			if (!ex.getMessage().equalsIgnoreCase("Broken pipe") )
			{
      		ex.printStackTrace();
			}
    	}
	}
	//end forward

	private void errorPage(HttpServletRequest req, HttpServletResponse res, String message)
	{
   		HttpSession session = req.getSession();	
   		if (message != null)
   		{
			System.out.println("error = " + message);
			session.setAttribute("errorMsg", message);
			session.setAttribute("msgColor", "red");
   		}
   		else
   		{
	   		System.out.println("common error page = message is NULL");
			session.setAttribute("errorMsg", Utils.getErrorMsg("NullErrorMsg"));
			session.setAttribute("msgColor", "red");
   		}
		RequestDispatcher rd = req.getRequestDispatcher("/common/Errors.jsp");
		try
		{
        	rd.forward(req,res);
      	}
      	catch (Exception ex)
      	{
			//do nothing for a broken pipe exception
			if (!ex.getMessage().equalsIgnoreCase("Broken pipe") )
			{
        	System.out.println("caught exception on forward");
        	ex.printStackTrace();
			}
      	}
   	}
	// end errorPage
}
