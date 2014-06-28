package spring.board.service;

import java.util.List;
import java.util.Map;

import spring.board.dao.MainDao;

public class MainServiceImpl implements MainService {
	

	private MainDao mainDao;


	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}


	public String getToday() {
		return mainDao.getToday();
	}
	
	public int writeProc(Map<String, Object> paramMap){
		return mainDao.writeProc(paramMap);
	}
	
	public int updateProc(Map<String, Object> paramMap){
		return mainDao.updateProc(paramMap);
	}
	
	public List getList(Map<String, Object> paramMap){
		return mainDao.getList(paramMap);
	}
	
	public int delNote(String id){
		return mainDao.delNote(id);
	}
	public int updateList(Map<String, Object> paramMap){
		return mainDao.updateList(paramMap);
	}
	
	public List getNote(String id){
		return mainDao.getNote(id);
	}

}
