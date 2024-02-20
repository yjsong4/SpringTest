package com.syj.spring.test.db.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.syj.spring.test.db.domain.Store;

@Mapper
public interface StoreRepository {
	
	public List<Store> selectStoreList();

}
