package multi.erp.board;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//Mybatis를 이용해서 DB연동을 하기 위한 DAO클래스
// 1. 내가 직접 만드는 DAO클래스
// 2. 스프링 제공 DAO클래스
// 3. mybatis의 핵심클래스를 이용해서 작성

@Repository("boardDao")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BoardVO> boardList() {
		// select문의 실행결과가 여러 개의 레코드를 반환하는 경우 사용
		// sqlSession.selectList("mapper에 등록한 sql문 id (namespace포함)");
		return sqlSession.selectList("multi.erp.board.listall");
	}

	@Override
	public int insert(BoardVO board) {
		System.out.println(board);
		return sqlSession.insert("multi.erp.board.insert", board);
	}

	@Override
	public List<BoardVO> searchList(String search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> searchList(String tag, String search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> pageList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO read(String board_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(BoardVO board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String board_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
