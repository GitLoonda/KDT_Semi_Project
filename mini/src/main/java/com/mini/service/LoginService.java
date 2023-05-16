package com.mini.service;

import java.util.HashMap;

public interface LoginService {

	HashMap<String, Object> validateUser(HashMap<String, Object> map);
	HashMap<String, Object> searchId(HashMap<String, Object> map);
	HashMap<String, Object> searchQuizList(HashMap<String, Object> map);
	void addId(HashMap<String, Object> map);
}
