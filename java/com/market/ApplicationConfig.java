package com.market;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@WebListener
public class ApplicationConfig implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName("org.mariadb.jdbc.Driver");
		hikariConfig.setJdbcUrl("jdbc:mariadb://127.0.0.1:3306/webmarket");
		hikariConfig.setUsername("root");
		hikariConfig.setPassword("1234");
		
		// 이후 추가옵션
		hikariConfig.setConnectionTestQuery("select now() from dual");
		hikariConfig.setMaximumPoolSize(3);
		hikariConfig.setPoolName("Mariadb-HikariCP");

		// 하나의 CP
		HikariDataSource ds = new HikariDataSource(hikariConfig);
		sce.getServletContext().setAttribute("dataSource", ds);
	}
}