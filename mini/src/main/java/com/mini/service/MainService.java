package com.mini.service;

import java.util.HashMap;
import java.util.List;

import com.mini.model.Desc;
import com.mini.model.TbrdList;

public interface MainService {
	
	List<Desc> searchInitialList(HashMap<String, Object> map);
	
	HashMap<String, Object> searchRcmdList(HashMap<String, Object> map);
	
	List<TbrdList> searchRecentList(HashMap<String, Object> map);
	
	List<TbrdList> searchJjimList(HashMap<String, Object> map);
	
	void removeJjim(HashMap<String, Object> map);
	
}