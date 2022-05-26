package com.jafa.config;

import static org.junit.Assert.*;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class, ServletConfig.class})
@WebAppConfiguration
public class RootConfigTest {
	
	@Autowired //데이터 소스를 가져와서 연결할 때 사용 하는 어노테이션
	private DataSource dataSource;
	
	@Test
	public void dataSourceTest() {
		assertNotNull(dataSource);
	}

}
