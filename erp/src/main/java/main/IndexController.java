package main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	// @String으로 리턴해도 컨테이너 내부에서 ModelAndView로 변환해서 viewResolver에게 전달한다.
	
	//	/index.do로 요청하면 'index'라는 이름의 뷰를 forward하겠다.
	//	=> index라는 뷰는 내 스프링 설정파일에 등록된
	//		ViewResolver에 따라 다르게 작성된다.
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
	
}
