package com.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandProcess {
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable; //앞으로 request와 response는 servlet파일꺼다?

}