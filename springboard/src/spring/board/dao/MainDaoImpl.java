package spring.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class MainDaoImpl extends SqlSessionDaoSupport implements MainDao {
	
	public String getToday() {
		String today =  (String)getSqlSession().selectOne("main.getToday");
		return today;
	}
	
	public int writeProc(Map<String, Object> paramMap){
		return getSqlSession().insert("main.writeProc",paramMap);
	}
	
	public int updateProc(Map<String, Object> paramMap){
		return getSqlSession().update("main.updateProc",paramMap);
	}
	
	public List getList(Map<String, Object> paramMap){
		return getSqlSession().selectList("main.getList");
	}
	
	public int delNote(String id){
		return getSqlSession().delete("main.delNote", id);
	}
	
	public int updateList(Map<String, Object> paramMap){
		return getSqlSession().update("main.updateList", paramMap);
	}
	
	public List getNote(String id){
		return getSqlSession().selectList("main.getNote", id);
	}
}
