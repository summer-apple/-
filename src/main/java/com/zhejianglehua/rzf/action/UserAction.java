package com.zhejianglehua.rzf.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zhejianglehua.rzf.service.util.FuckService;
import com.zhejianglehua.rzf.service.util.MailService;

@Namespace("/")
@Controller
//@Results({  
//	  @Result(name="index", location="/WEB-INF/content/gmc/index.jsp"),
//	  @Result(name="login", location="/WEB-INF/content/member/login.jsp")
//	})  
public class UserAction extends ActionSupport{

	private MailService mailService;
	
	
	@Autowired
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	@Action("/user/fuck")
	public void fuck() {
		
		mailService.registerMail();

	}
	
	@Action("/user/login")
	public String login() {
		
		System.out.println("lalalal");

	return SUCCESS;
		
	}//login end
}	
//	
//	
//	
//	@Action("/member/logout")
//	public String logout() {
//
//		request = ServletActionContext. getRequest();
//		
//		request.getSession().invalidate();
//		
//		return "index";
//	}//logout end
//	
//	
//	@Action("/member/check-user-name")
//	public void checkUserName() throws IOException {
//
//		request = ServletActionContext. getRequest();
//		String user_name = request.getParameter("user_name");
//		
//		
//		boolean flag = userServiceImpl.checkUserName(user_name);
//		
//	
//			
//			if (flag) {
//				ServletActionContext.getResponse().getWriter().print("true");
//			}else {
//				ServletActionContext.getResponse().getWriter().print("false");
//			}
//			
//			
//	}//checkUserName end
//	
//	
//	
//	@Action("/member/check-user-email")
//	public void checkUserEmail() throws IOException {
//
//		request = ServletActionContext. getRequest();
//		String email = request.getParameter("email");
//		
//		
//		boolean flag = userServiceImpl.checkUserEmail(email);
//		
//	
//			
//			if (flag) {
//				ServletActionContext.getResponse().getWriter().print("true");
//			}else {
//				ServletActionContext.getResponse().getWriter().print("false");
//			}
//			
//			
//	}//checkUserEmail end
//	
//	
//	@Action("/member/register")
//	public String register() throws IOException {
//		request = ServletActionContext.getRequest();
//		String userName = request.getParameter("user_name");
//		String password = request.getParameter("password");
//		String email = request.getParameter("email");
//		
//		if (userName==null||password==null||email==null) {
//			
//			return INPUT;
//			
//		}else {
//			User user = new User(userName, password, email);
//			userServiceImpl.register(user);
//			tip="Registion email has been sent to your mail box,please go to check it!";
//			request.setAttribute("tip", tip);
//			return "index";
//		
//		}
//	}//register end
//	
//	@Action("/member/register-activation")
//	public String registerActivation() throws Exception {
//		request = ServletActionContext.getRequest();
//		
//		String code = request.getParameter("code");
//		
//		String user_name = new String(request.getParameter("user_name").getBytes("iso8859-1"), "utf-8");
//		System.out.println("RegisterActivationServlet user_name:"+user_name);
//		
//		
//		
//		
//		boolean flag = userServiceImpl.registerActivation(user_name,code);
//		
//		if (flag) {
//			User user = userServiceImpl.getUserByName(user_name);
//			if (user.getType()!=0) {
//				request.getSession().setAttribute("user", user);
//				tip="Registe success !";
//			}
//		}else {
//			tip="Registe failure !";
//		}
//		
//		request.setAttribute("tip", tip);
//		
//		return "login";
//		
//
//		
//	}//register-activation end
//	
//	@Action("/member/update-pass")
//	public String updatePass() throws Exception {
//		request = ServletActionContext.getRequest();
//		User user = (User) request.getSession().getAttribute("user");
//		int id = user.getId();
//		String old_pass = request.getParameter("old_pass");
//		String new_pass = request.getParameter("new_pass");
//		
//		if (old_pass.equals(new_pass)) {
//			tip = "New Password Can Not Be Same !";
//			request.setAttribute("tip", tip);
//			return "input";
//		}else  {
//			
//		}
//		
//		
//		boolean flag = userServiceImpl.updatePass(id,old_pass, new_pass);
//		if (flag) {
//			tip = "Update Password Success !";
//			
//		}else {
//			tip = "Update Password Failure !";
//		}
//			request.setAttribute("tip", tip);
//			return "login";
//
//		
//	}//update-pass end
//	
//	
//	
//	@Action("/member/forget-pass")
//	public String forgetPass() throws MessagingException{
//	
//		request = ServletActionContext.getRequest();
//		String email = request.getParameter("email"); 
//		
//		if (email==null) {
//			return INPUT;
//		}else if (userServiceImpl.getUserByEmail(email)==null) {
//			tip = "This email address is not registed!";
//			request.setAttribute("tip", tip);
//			return INPUT;
//		}else{
//			userServiceImpl.forgetPass(email);
//			tip = "Find password mail has been sent to your mail box!";
//			request.setAttribute("tip", tip);
//			return "index";
//		}
//		
//		
//	}
//	
//	@Action("/member/reset-pass")
//	public String resetPass(){
//		request = ServletActionContext.getRequest();
//		request.removeAttribute("tip");
//		
//		String password = request.getParameter("password"); 
//		
//		if (password==null) {
//			return INPUT;
//		}else {
//			String email = request.getParameter("email"); 
//			String code = request.getParameter("code"); 
//			boolean flag = userServiceImpl.resetPass(email, password, code);
//			if (flag) {
//				tip = "Reset password success,use new password to login!";
//				request.setAttribute("tip", tip);
//				return "login";
//			}else {
//				tip = "Reset password failure,please try again!";
//				request.setAttribute("tip", tip);
//				return INPUT;
//			}
//			
//			
//			
//		}
//		
//		
//		
//		
//	}
//	
//}
