package com.mini.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.TestMapper;
import com.mini.model.User;

@Service
public class TestServicelmpl implements TestService{

    @Autowired
    TestMapper testMapper;

    @Override
    public List<User> searchUserlist(HashMap<String, Object> map) throws Exception {

		return testMapper.selectUserlist(map);
    }

}
