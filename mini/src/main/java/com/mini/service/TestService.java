package com.mini.service;

import java.util.HashMap;
import java.util.List;

import com.mini.model.User;

public interface TestService {
    // 사용자 리스트 불러오기
    List<User> searchUserlist(HashMap<String, Object> map) throws Exception;
}
