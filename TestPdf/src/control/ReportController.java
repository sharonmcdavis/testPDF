package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReportController extends HttpServlet {

	public void getDepletionReport(HttpServletRequest req, HttpServletResponse resp)
	throws IOException
	{
		try
		{
			HttpSession session = req.getSession();
			//ReportUtils.getDepletionReport(paramArr, resp, session,	rptBean, req);
			this.forward(req, resp, "/WEB-INF/report1.jsp");
		}
		catch (Exception ex)
		{
			this.errorPage(req, resp, ex.getMessage());
		}
	}
	//end getDepletionReport

	protected void forward(HttpServletRequest req, HttpServletResponse res, String pageName)
	{
	    RequestDispatcher rd = req.getRequestDispatcher(pageName);
	    try
	    {
      		rd.forward(req,res);
    	}
    	catch (IOException ioex)
    	{
      		ioex.printStackTrace();
    		errorPage(req, res,"An Error has occurred: " + ioex.getMessage());
    	}
    	catch(Exception ex)
    	{
			//do nothing for a broken pipe exception
			if (!ex.getMessage().equalsIgnoreCase("Broken pipe") )
			{
      		ex.printStackTrace();
    		errorPage(req, res,"An Error has occurred: " + ex.getMessage());
			}
    	}
	}
	//end forward

	public void errorPage(HttpServletRequest req, HttpServletResponse res, String message)
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
//			session.setAttribute("errorMsg", Utils.getErrorMsg("NullErrorMsg"));
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
