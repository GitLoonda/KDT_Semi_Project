package com.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mini.model.Desc;
import com.mini.model.User;

@Mapper
public interface LoginMapper {
	
	User selectUserId(HashMap<String, Object> map);
	int selectCntUser(HashMap<String, Object> map);
	List<Desc> selectQuizList(HashMap<String, Object> map);
}


