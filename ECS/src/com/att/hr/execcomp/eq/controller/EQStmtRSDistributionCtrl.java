package com.att.hr.execcomp.eq.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.sql.Result;

import com.att.hr.execcomp.eq.dataaccess.EQStmtRSDistribution;

/**
 * Servlet implementation class DistributionServlet
 */
@WebServlet("/RSDistributionController")
public class EQStmtRSDistributionCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EQStmtRSDistributionCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher;
		// Fetching results from DB and setting to a request attribute
		EQStmtRSDistribution distDAO = new EQStmtRSDistribution();
		Result results = distDAO.getEquity_RS_Distribution("EC10003527");
		request.setAttribute("equityRSDistributions", results);
		
		// Redirecting to JSP page
		dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/equity/eqStmtRSDistributionLanding.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
