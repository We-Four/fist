package test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test")
public class Test extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest reque, HttpServletResponse arg1) throws ServletException, IOException {
		String cmd = reque.getParameter("cmd");
				
		if(cmd.equals("one")) {
			one();
		}
	}

	public void one() {
		System.out.println("one");
	}
	
}
