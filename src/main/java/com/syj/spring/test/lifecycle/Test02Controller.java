package com.syj.spring.test.lifecycle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lifecycle/test02/")
@RestController
public class Test02Controller {
	
	@RequestMapping("/1")
	public List<Map<String, Object>> mapResponse() {
		
		List<Map<String, Object>> movieList = new ArrayList<>();
		
		Map<String, Object> map = new HashMap<String, Object>() {{ put("rate", 15); put("diretor", "봉준호"); put("time", 131); put("title", "기생충"); }};
	    movieList.add(map);
	    
	    map = new HashMap<String, Object>() {{ put("rate", 0); put("diretor", "로베르토 베니니"); put("time", 116); put("title", "인생은 아름다워"); }};
	    movieList.add(map);
	    
	    map = new HashMap<String, Object>() {{ put("rate", 12); put("diretor", "크리스토퍼 놀란"); put("time", 147); put("title", "인셉션"); }};
	    movieList.add(map);
	    
	    map = new HashMap<String, Object>() {{ put("rate", 19); put("diretor", "윤종빈"); put("time", 133); put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대"); }};
	    movieList.add(map);
	    
	    map = new HashMap<String, Object>() {{ put("rate", 15); put("diretor", "프랜시스 로렌스"); put("time", 137); put("title", "헝거게임"); }};
	    movieList.add(map);
	    
	    return movieList;    
	}
	
	@RequestMapping("/2")
	public List<Board> boardList() {
		
		List<Board> boardList = new ArrayList<>();
		
		Board user = new Board("안녕하세요 가입인사 드립니다", "hagulu", "안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다");
		boardList.add(user);
		
		user = new Board("헐 대박", "bada", "오늘 목요일이구나 금요일인줄");
		boardList.add(user);
		
		user = new Board("오늘 데이트 한 이야기 해드릴게요", "dulumary", "....");
		boardList.add(user);
		
		return boardList;
	}

	@RequestMapping("/3")
	public ResponseEntity<Board> postError() {
		Board user = new Board("안녕하세요 가입인사 드립니다", "hagulu", "안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다");
		ResponseEntity<Board> entity = new ResponseEntity<>(user, HttpStatus.INTERNAL_SERVER_ERROR);
		
		return entity;
	}
	
}
