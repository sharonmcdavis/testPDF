/**
 * 
 */
package com.att.hr.execcomp.eq.dataaccess;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.jsp.jstl.sql.Result;

import com.att.hr.execcomp.common.DBConnection;
import com.att.hr.execcomp.common.ECSLogger;

/**
 * @author hv462t
 *
 */
public class EQStmtRSDistribution {
	
	private Connection connection;
	private CallableStatement cStmt;
	private Result result;
	
	public Result getEquity_RS_Distribution(String ECSID) {

		DBConnection dbConnectionUtil = new  DBConnection();

		try {
			
			connection = dbConnectionUtil.getECSDBConnection();
			cStmt = connection.prepareCall("{call spEQU_RPT_RS_DistributionList (?)}");
			cStmt.setString(1, ECSID);
			
			result = dbConnectionUtil.execQuery(cStmt);
			
		} catch (SQLException e) {
			ECSLogger.log("error","Exception while connecting to DB at "+ this.getClass()+ "\n Exception:"+e.getMessage());
		}
		
		return result;
	}
	
}
