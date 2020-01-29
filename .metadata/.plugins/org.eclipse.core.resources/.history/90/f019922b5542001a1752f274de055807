package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class SearchController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 이렇게 사용하면 매 컨트롤러마다 인코딩 작업해야 함
		/*req.setCharacterEncoding("euc-kr");*/
		String search = req.getParameter("search");
		System.out.println("검색어: "+search);
		//return new ModelAndView("/WEB-INF/test/index.jsp");
		return new ModelAndView("test/index");
	}

}
