package com.att.hr.execcomp.common;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;
import javax.sql.DataSource;

public class DBConnection {
	private DataSource dataSource = null;
	private Connection connection = null;
	private ResultSet resultSet = null;
	private CallableStatement cStatement = null; 

	public Connection getECSDBConnection() {

		try {
			dataSource = (DataSource) new InitialContext().lookup(ECSConstant.ECS_LOOKUP_NAME);

			this.connection = dataSource.getConnection();

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			ECSLogger.log("error",
					"Exception while connecting to DB at " + this.getClass() + "\n Exception:" + e.getMessage());
		}
		return this.connection;
	}

	public Connection getExecCompDBConnection() throws SQLException {
		try {
			dataSource = (DataSource) new InitialContext().lookup(ECSConstant.EXECCOMP_LOOKUP_NAME);
			this.connection = dataSource.getConnection();

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			ECSLogger.log("error",
					"Exception while connecting to DB at " + this.getClass() + "\n Exception:" + e.getMessage());
		}
		return this.connection;
	}

	
	public Result execQuery(CallableStatement cStmt) throws SQLException {
		Result result = null;
		this.cStatement = cStmt;
		
		if (cStatement != null) {

			try {
				resultSet = cStatement.executeQuery();
				
				result = ResultSupport.toResult(resultSet);
			} catch (SQLException e) {

				ECSLogger.log("error",
						"Exception while connecting to DB at " + this.getClass() + "\n Exception:" + e.getMessage());
			}
		}
		closeConnection();
		
		return result;

	}
	

	public List<Result> execute(CallableStatement cStmt) throws SQLException {
		List<Result> results = new ArrayList<Result>();
		this.cStatement = cStmt;
		
		if (cStatement != null) {

			try {
				
				boolean result = cStatement.execute();
				// Loop through the available result sets.
				while (result) {
					results.add(ResultSupport.toResult(cStatement.getResultSet()));
					result = cStatement.getMoreResults();
				}
			} catch (SQLException e) {

				ECSLogger.log("error",
						"Exception while connecting to DB at " + this.getClass() + "\n Exception:" + e.getMessage());
			}
		}
		closeConnection();
		
		return results;

	}
	
	public void closeConnection() {
		if (this.resultSet != null) {
			try {
				this.resultSet.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
		if (this.cStatement != null) {
			try {
				this.cStatement.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
		if (this.connection != null) {
			try {
				this.connection.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
	}

}

