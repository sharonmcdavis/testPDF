package com.att.hr.execcomp.common;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.jsp.jstl.sql.Result;

public class SME {
	private Connection connection;
	private CallableStatement cStmt;
	private Result results;
	
	public Result getContactInfo(int MenuID, String environment, int RPTID, int PLANID) {
		DBConnection dbConnectionUtil = new  DBConnection();
		try {
			

		connection = dbConnectionUtil.getECSDBConnection();
		cStmt = connection.prepareCall("{call spEC_GetSMEinfo (?,?,?,?)}");
		cStmt.setInt(1, RPTID);
		cStmt.setInt(2, MenuID);
		cStmt.setString(3, environment);
		cStmt.setInt(4, PLANID);
		results= dbConnectionUtil.execQuery(cStmt);
		
		} catch (SQLException e) {
			ECSLogger.log("error","Exception while connecting to DB at "+ this.getClass()+ "\n Exception:"+e.getMessage());
		}
		
		return results;
	}
		
}
