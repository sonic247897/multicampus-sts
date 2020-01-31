package multi.erp.board;

import java.util.List;

public interface BoardService {
	List<BoardVO> boardList();
	int txinsert(BoardVO board);
	int insert(BoardVO board);
	List<BoardVO> searchList(String search);
	List<BoardVO> searchList(String tag,String search);
	List<BoardVO> pageList();
	BoardVO read(String board_no);
	int update(BoardVO board);
	int delete(String board_no);
	
	
	List<BoardVO> findByCategory(String category);
	
}









