package com.att.hr.execcomp.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class ECSLogger {
	private static Logger logger = Logger.getLogger("application");

	public ECSLogger() {
		super();
	}

	public static void log(String type, String message) {
		String env = "DEV";
		initLoggerProperties();
		if(env == "DEV"){
			System.out.println("log message:\n"+message);
		}
		else
		{
			if (type == "error")
				logger.error(message);
			else if (type == "info")
				logger.info(message);
		}

	}

	private static void initLoggerProperties() {
		Properties temp = new Properties();
		FileInputStream propertyFile = null;
		
		try {
			propertyFile = new FileInputStream(ECSConstant.PROPERTIES_FILE_PATH);
			temp.load(propertyFile);
		}
		catch (IOException ex) {
			ex.printStackTrace();
		} 
		PropertyConfigurator.configure(temp);
	}

}
