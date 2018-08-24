package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReportController() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {

		System.out.println("I'm in doPost");
		String methodName = request.getParameter("methodName");
		if (methodName == null) {
			RequestDispatcher rd = request.getRequestDispatcher("/report.jsp");
			rd.forward(request, response);
		} else if (methodName.equalsIgnoreCase("getReport")) {
			getReport(request, response);
		} else {
			writePdf(request, response);
			//downloadPdf (request, response);
		} 
	}

	
	private void getReport(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {

		System.out.println("I'm in getReport");
			RequestDispatcher rd = request.getRequestDispatcher("/report2.jsp");
			rd.forward(request, response);
		}

	private void downloadPdf(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {

		System.out.println("I'm in downloadPdf");
			RequestDispatcher rd = request.getRequestDispatcher("/export.jsp");
			request.setAttribute("contextType", "application/pdf");
			rd.forward(request, response);
	}

	private void writePdf(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

			System.out.println("I'm in writePdf");
			
			String pdfFileName = "pdf-test.pdf";
			String contextPath = getServletContext().getRealPath(File.separator);
			File pdfFile = new File(contextPath + pdfFileName);

			response.setContentType("application/pdf");
			response.addHeader("Content-Disposition", "attachment; filename=" + pdfFileName);
			response.setContentLength((int) pdfFile.length());

			FileInputStream fileInputStream = new FileInputStream(pdfFile);
			OutputStream responseOutputStream = response.getOutputStream();
			int bytes;
			while ((bytes = fileInputStream.read()) != -1) {
				responseOutputStream.write(bytes);
			}
		}
}