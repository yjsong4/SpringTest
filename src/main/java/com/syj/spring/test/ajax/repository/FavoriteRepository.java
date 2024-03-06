package com.syj.spring.test.ajax.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.syj.spring.test.ajax.domain.Favorite;

@Mapper
public interface FavoriteRepository {
	
	public int insertFavorite(
			@Param("name") String name
			, @Param("url") String url);
	
	public List<Favorite> selectFavoriteList();

}
