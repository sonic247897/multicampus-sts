package test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class IndexController extends AbstractController {

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// Model의 정보를 (매개변수)로 받고 model과 view를 스프링 내부에서 알아서 처리
		return new ModelAndView("test/index");
	}

}
