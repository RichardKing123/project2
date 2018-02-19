package com.spring.project2.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LoginCheckInterceptor implements HandlerInterceptor {
	
	//로그인상태가 아니면 자동으로 로그인폼으로 보내버리는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception {
		
		// 세션에 isLogin란 이름의 데이터가 없으면 로그인 상태가 아님
		if(request.getSession().getAttribute("isLogin") == null) {
			response.sendRedirect("loginForm");
			return false;
		}
		return true;
	}

	/* postHandle() 메서드는 클라이언트 요청이 들어오고 컨트롤러가 정상적으로
	 * 실행된 이후에 공통적으로 적용할 추가 기능이 있을 때 주로 사용한다.
	 * 만약 컨트롤러 실행 중에 예외가 발생하게 되면 postHandle() 메서드는 
	 * 호출되지 않는다. 
	 **/
	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	
	/* afterCompletion() 메서드는 클라이언트의 요청을 처리하고 뷰를 생성해
	 * 클라이언트로 전송한 후에 호출된다. 클라이언트 실행 중에 예외가 발생하게 되면
	 * 이 메서드 4번째 파라미터로 예외 정보를 받을 수 있다. 예외가 발생하지 않으면
	 * 4번째 파라미터는 null을 받게 된다.
	 **/
	@Override
	public void afterCompletion(HttpServletRequest request, 
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
