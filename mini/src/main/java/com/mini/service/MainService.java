package com.mini.service;

import java.util.HashMap;
import java.util.List;

import com.mini.model.Desc;

public interface MainService {
	
	List<Desc> searchInitialList(HashMap<String, Object> map);
	
	HashMap<String, Object> searchRcmdList(HashMap<String, Object> map);
	
}