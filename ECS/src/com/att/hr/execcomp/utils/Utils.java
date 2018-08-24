package com.att.hr.execcomp.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class Utils {

	private static final String PROP_FILE_PATH = System.getProperty("user.dir") 
							+ File.separator + "properties" + 
							File.separator + "application" + File.separator + 
							"alliance" + File.separator ;
	private static final String ERROR_FILE = "errormsg.properties";

	public Utils() 
	{
	}

	public static Properties loadProps(String file) 
	throws IOException
	{
		Properties props = new Properties();
		String path = PROP_FILE_PATH + file;
		System.out.println("file = " + path);
		File propFile = new File(path);
		props.load(new FileInputStream(propFile));
		return props;
	}

	public static String getErrorMsg(String errorCode) 
	{
		String msg = null;
		try
		{
			Properties props = loadProps(ERROR_FILE);
			msg = props.getProperty(errorCode);
		}
		catch (IOException e)
		{
			System.out.println("caught exception retrieving error message.");
			e.printStackTrace();
		}
		if (msg == null)
			msg = "An error has occurred: Message cannot be found.";
		return msg;
	}

	public static String getProp(String propFile, String propKey) 
	{
		String prop = null;
		try
		{
			Properties props = loadProps(propFile);
			prop = props.getProperty(propKey);
		}
		catch (IOException e)
		{
			System.out.println("caught exception retrieving individual property.");
			e.printStackTrace();
		}
		return prop;
	}
}
