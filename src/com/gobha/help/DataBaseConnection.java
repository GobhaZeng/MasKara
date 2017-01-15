package com.gobha.help;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 数据库连接
 * 
 * @author jimin
 *
 */
public class DataBaseConnection {

	private static final String DRIVER = "com.mysql.jdbc.Driver";	 
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/cy43";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "920211";

	private Connection connection;

	/**
	 * 创建数据库连接
	 */
	public DataBaseConnection() {
		try {
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取数据库连接
	 * 
	 * @return
	 */
	public Connection getConnection() {
		return this.connection;
	}

	/**
	 * 关闭数据库连接
	 * 
	 * @param connection
	 * @throws SQLException
	 */
	public void close(Connection connection) {
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
