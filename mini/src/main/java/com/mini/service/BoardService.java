package com.mini.service;

import java.util.HashMap;

public interface BoardService {
    // 게시글 조회
    HashMap<String, Object> searchTbrdListInfo(HashMap<String, Object> map);
}
