package multi.erp.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@RequestMapping("/menu/board.do")
	public String boardView() {
		return "menu/board";
	}
}
