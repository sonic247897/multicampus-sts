package dept;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Test {
	public static void main(String[] args) {
		ApplicationContext factory =
				new GenericXmlApplicationContext("config/erp.xml");
		DeptServiceImpl service = 
				factory.getBean("deptService", DeptServiceImpl.class);
		System.out.println("전체 부서 개수: "+service.count());
		//System.out.println("삽입 성공? "+service.insert("examd01", "framework"));
		System.out.println("수정 성공? "+service.update("examd01", "부서"));
		List<DeptDTO> list = service.selectAll();
		for(int i=0; i<list.size(); ++i) {
			DeptDTO dept = list.get(i);
			System.out.println(dept.getDeptno()+":"+dept.getDeptname());
		}
	}

}
