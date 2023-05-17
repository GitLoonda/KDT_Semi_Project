package com.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mini.model.Desc;
import com.mini.model.User;

@Mapper
public interface LoginMapper {
	
	User selectUserInfo(HashMap<String, Object> map);
	
	int selectCntUser(HashMap<String, Object> map);
	
	int selectCntQuiz(HashMap<String, Object> map);
	
	List<Desc> selectQuizList(HashMap<String, Object> map);
	
	void insertAccount(HashMap<String, Object> map);
	
	User selectId(HashMap<String, Object> map);

	User selectQuiz(HashMap<String, Object> map);
	
	void updatePwd(HashMap<String, Object> map);
}


