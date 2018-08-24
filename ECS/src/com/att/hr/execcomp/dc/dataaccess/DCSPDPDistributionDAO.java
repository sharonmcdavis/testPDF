/**
 * 
 */
package com.att.hr.execcomp.dc.dataaccess;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.jsp.jstl.sql.Result;

import com.att.hr.execcomp.common.DBConnection;

/**
 * @author hv462t
 *
 */
public class DCSPDPDistributionDAO {

	private Connection connection;
	private CallableStatement cStmt;
	private List<Result> results;

	public List<Result> getSPDPDistributionsList(String ECSID, String PmtDate) {
		DBConnection dbConnectionUtil = new DBConnection();

		try {

			connection = dbConnectionUtil.getECSDBConnection();
			cStmt = connection.prepareCall("{call spDC_SPDP_Distribution (?,?)}");
			cStmt.setString(1, ECSID);
			cStmt.setString(2, PmtDate);

			results= dbConnectionUtil.execute(cStmt);

		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return results;
	}

}
