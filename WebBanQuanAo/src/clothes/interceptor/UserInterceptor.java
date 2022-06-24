package clothes.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import clothes.dao.AccountDAO;
import clothes.entity.Account;

public class UserInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	AccountDAO accountDAO;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Account user = (Account) session.getAttribute("account");
		if (user != null) {
			response.sendRedirect(request.getContextPath() + "/home.htm");
			return false;
		}
		return true;
	}
}
