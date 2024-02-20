package com.syj.spring.test.db.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syj.spring.test.db.domain.Store;
import com.syj.spring.test.db.repository.StoreRepository;

@Service
public class StoreService {
	
	@Autowired
	private StoreRepository storeRepository;
	
	// 가게 정보 리스트를 리턴하는 기능
	public List<Store> getStoreList() {
		
		List<Store> storeList = storeRepository.selectStoreList();
		return storeList;
		
	}

}
