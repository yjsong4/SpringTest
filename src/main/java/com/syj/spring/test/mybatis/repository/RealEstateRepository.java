package com.syj.spring.test.mybatis.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.syj.spring.test.mybatis.domain.RealEstate;

@Mapper
public interface RealEstateRepository {
	
	public RealEstate selectRealEstate(@Param("id") int id);
	
	public List<RealEstate> selectgetRealEstateByRentPrice(@Param("rentPrice") int rentPrice);
	
	public List<RealEstate> selectRealEstateByAreaAndPrice(
			@Param("area") int area
			, @Param("price")int price);
	
	public int insertRealEstateByObject(RealEstate realEstate);
	
	public int insertRealEstate(
			@Param("realtorId") int realtorId
			, @Param("address") String address
			, @Param("area") int area
			, @Param("type") String type
			, @Param("price") int price
			, @Param("rentPrice") int rentPrice);
	
	public int updateRealEstateById(
			@Param("id") int id
			, @Param("type") String type
			, @Param("price") int price);
	
	public int deleteReviewById(@Param("id") int id);
	
}
