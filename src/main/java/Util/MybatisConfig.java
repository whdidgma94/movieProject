package Util;

import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisConfig {
	   private static SqlSessionFactory sqlSessionFactory;
	   static {
		   try {//resource 경로 지정 다시 해야함
			   String resource = "mybatis/config.xml";
			   InputStream inputStream = Resources.getResourceAsStream(resource);
			   sqlSessionFactory =new SqlSessionFactoryBuilder().build(inputStream); 
		   }catch(Exception e) {
			   e.printStackTrace();
		   }
	   }	   
	   public static SqlSessionFactory getInstance() {
		   return sqlSessionFactory;
	   }
}
