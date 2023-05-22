package com.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mini.model.Desc;
import com.mini.model.Main;

@Mapper
public interface MainMapper {
	List<Desc> selectCategoryList(HashMap<String, Object> map);

	List<Main> selectSellList(HashMap<String, Object> map);

	List<Main> selectBuyList(HashMap<String, Object> map);

	List<Main> selectCommList(HashMap<String, Object> map);

}



