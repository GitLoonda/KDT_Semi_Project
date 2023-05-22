package com.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mini.model.Desc;
import com.mini.model.Main;
import com.mini.model.TbrdList;

@Mapper
public interface MainMapper {
	List<Desc> selectCategoryList(HashMap<String, Object> map);

	List<Main> selectSellList(HashMap<String, Object> map);

	List<Main> selectBuyList(HashMap<String, Object> map);

	List<Main> selectCommList(HashMap<String, Object> map);
	
	List<TbrdList> selectRecentList(HashMap<String, Object> map);
	
	List<TbrdList> selectJjimList(HashMap<String, Object> map);
	
	void deleteJjim(HashMap<String, Object> map);

}



