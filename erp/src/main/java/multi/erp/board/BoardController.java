package multi.erp.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@RequestMapping("/board/list.do")
	public ModelAndView boardList(String category) {
		System.out.println("category=> "+category);
		ModelAndView mav = new ModelAndView();
		// 서블릿 작업 = 스프링 내부에서 작업하기 때문에 포멧만 바뀐것
		// 1. 요청정보 추출
		// 2. 비지니스메소드 호출
		List<BoardVO> list = service.boardList(category);
		System.out.println(list);
		
		// 3. 데이터 공유 - jsp페이지에서 응답뷰 만들 때 사용
		//		=>기본값: request에 저장
		//		(기본이 request scope에 저장- request.setAttribute와 같음)
		mav.addObject("boardlist", list);
		mav.addObject("category", category);
		// 4. 뷰의 이름을 등록
		mav.setViewName("board/list"); //tiles에 등록하는 이름과 일치해야 함
		
		// 5. 요청재지정(기본작업이 forward로 리턴)
		return mav;
	}
	
	//게시글을 작성하기 위한 뷰를 response할 메소드
	// 같은 path - get방식
	@RequestMapping(value="/board/write.do", method=RequestMethod.GET)
	public String insertView() {
		return "board/write"; //tiles에 등록한 뷰 이름
	}
	
	//입력한 글을 실제 db에 저장하는 메소드
	// 같은 path - post방식
	@RequestMapping(value="board/write.do", method=RequestMethod.POST)
	public String insert(BoardVO board) {
		// 뷰의 요소들의 name과, DB테이블 컬럼들의 이름이 같으면
		// DTO로 자동으로 변환하는 작업을 DispatcherServlet내부에서 해준다.
		System.out.println("******************"+board);
		int result = service.insert(board);
		System.out.println("##################"+board);
		// board.list로 리다이렉트
		return "redirect:/board/list.do?category=all";
	}
	@RequestMapping(value="/board/search.do")
	public ModelAndView search(String tag, String search) {
		ModelAndView mav = new ModelAndView();
		// searchList와 뷰가 바뀌지 않으므로 위에서 쓰던거 그대로 사용하고 맞춰준다.
		List<BoardVO> list = service.searchList(tag, search);
		mav.addObject("boardlist", list);
		mav.setViewName("board/list");
		return mav;
	}
	
	// Ajax로 카테고리별 게시판 데이터를 요청하는 메소드
	//	=> 컨트롤러 메소드처럼 ModelAndView를 리턴하지 않고 일반 메소드처럼
	//	  조회한 데이터를 ArrayList로 리턴하면 jackson라이브러리가 자동으로
	//	 ArrayList<BoardVO>를 json으로 변환해서 리턴해준다.
	
	// ModelAndView를 리턴하면 DispatcherServlet이 페이지 위에서 아래부터 로딩
	// ResponseBody를 명시한 ArrayList를 json형식으로 일부만 로딩해줌
	// (나머지는 같고 '컨트롤러 단'과 '뷰의 요청, 출력 부분'만 바꿔주면 된다)
	@RequestMapping(value="/board/ajax_boardlist.do",
				method=RequestMethod.GET,
				produces="application/json;charset=utf-8") //json으로 변환해달라
	public @ResponseBody ArrayList<BoardVO> 
					categoryList(String category) {
		ArrayList<BoardVO> boardlist =
					(ArrayList<BoardVO>)service.boardList(category);
		System.out.println("ajax통신: "+boardlist.size());
		return boardlist;
	}
	
}
