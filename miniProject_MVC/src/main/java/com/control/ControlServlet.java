package com.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//어노테이션으로 연결가능, web.xml로 하는 방법도 알아야한다 사용하려면 둘중 하나를 사용해야 error안난다 같이쓰면 error난다 
@WebServlet(
		urlPatterns = {"*.do" },
		initParams = {
				@WebInitParam(name="propertyConfig",value="command.properties")
				}
		)
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> map = new HashMap<String, Object>();
	
	@Override 
	public void init(ServletConfig config) throws ServletException {

		String propertyConfig =config.getInitParameter("propertyConfig");//web.xml의 ServletConfig를 읽어오자
		System.out.println("propertyConfig"+propertyConfig);
		
		String realFolder = config.getServletContext().getRealPath("/WEB-INF");
		String realPath = realFolder + "/" +  propertyConfig; //위치와 이름 연결
		System.out.println("realPath"+realPath);
		
		
		
		
		FileInputStream fin = null;
	    Properties properties = new Properties();
	    
	    try {
	         //fin = new FileInputStream(propertyConfig);
	    	fin = new FileInputStream(realPath);
	         properties.load(fin);
	         System.out.println("properties = "+properties);
	         
	      } catch (IOException e) {
	         e.printStackTrace();
	      }finally{
	         try {
	            fin.close();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      System.out.println();
	      
	      Iterator it = properties.keySet().iterator();
	      while(it.hasNext()) {
	         String key = (String)it.next();
	         System.out.println("key = "+key);
	         
	         String className = properties.getProperty(key);
	         System.out.println("className = "+className);
	         
	         try {
	            Class<?> classType = Class.forName(className);
	            Object ob = classType.newInstance();
	            
	            System.out.println("ob = "+ob);
	            
	            map.put(key, ob);
	            
	         } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	         } catch (InstantiationException e) {
	            e.printStackTrace();
	         } catch (IllegalAccessException e) {
	            e.printStackTrace();
	         } catch (IllegalArgumentException e) {
	            e.printStackTrace();
	         } 
	         
	         System.out.println();
	      }//while
		
	}
    
	//get방식으로 요청 들어오는 곳 //excute로 보내자 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		excute(request, response);
	}

	//post 방식으로 요청 들어오는 곳 //excute로 보내자 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		excute(request, response);
	}
	
	//excute라는 이름은 그냥 정한 것 //만든이유 : doGet과 doPost 한번에 다 받으려고
	protected void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println();
		 
		 //한글처리
		 if(request.getMethod().equals("POST")) //POST는 반드시 대문자
			 request.setCharacterEncoding("UTF-8");
		
		 //요청이 들어왔을 때 - http://localhost:8080/mvcmember/member/writeForm.do  -- /member/writeForm.do = getServletPath --
	      String category = request.getServletPath();
	      System.out.println("category = "+category); //member/writeForm.do
	      
	      CommandProcess com = (CommandProcess)map.get(category); //member.service.WriteFormService
	      String view = null;
	      
	      try {
	         view = com.requestPro(request, response); // "/member/writeForm.jsp"
	      } catch (Throwable e) {
	         e.printStackTrace();
	      }
	      
	      //forward
	      RequestDispatcher dispatcher = request.getRequestDispatcher(view);//상대번지
	      dispatcher.forward(request, response);//제어권 넘기기
	      
	}
	
}
