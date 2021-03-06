package spring.board.dao;

import java.util.List;
import java.util.Map;

public interface MainDao  {
	public String getToday();
	
	public int writeProc(Map<String, Object> paramMap);
	
	public int updateProc(Map<String, Object> paramMap);
	
	public List getList(Map<String, Object> paramMap);
	
	public int delNote(String id);
	
	public int updateList(Map<String, Object> paramMap);
	
	public List getNote(String id);
}
