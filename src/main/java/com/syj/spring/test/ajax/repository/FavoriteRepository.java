package com.syj.spring.test.ajax.repository;

import java.util.List;

import com.syj.spring.test.ajax.domain.Favorite;

public interface FavoriteRepository {
	
	public List<Favorite> selectFavoriteList();

}
