package multi.erp.emp;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("empDao")
public class EmpDAOImpl implements EmpDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public MemberVO login(MemberVO loginUser) {
		// 레코드 하나인 경우 selectOne
		return sqlSession.selectOne("multi.erp.emp.login", loginUser);
	}
	
	@Override
	public ArrayList<MemberVO> getTreeEmpList(String deptno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(MemberVO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<MemberVO> getMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO read(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<MemberVO> search(String column, String search, String pass) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(MemberVO user) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public boolean idCheck(String id) {
		boolean result = false;
		MemberVO user=  sqlSession.selectOne("multi.erp.emp.idcheck",id);
		if(user!=null) {
			result = true;
		}
		return result;
	}

	@Override
	public MemberVO findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
