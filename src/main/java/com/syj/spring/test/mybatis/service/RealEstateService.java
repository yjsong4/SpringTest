package com.syj.spring.test.mybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syj.spring.test.mybatis.domain.RealEstate;
import com.syj.spring.test.mybatis.repository.RealEstateRepository;

@Service
public class RealEstateService {

	@Autowired
	private RealEstateRepository realEstateRepository;
	
	public RealEstate getRealEstate(int id) {
		
		RealEstate realEstate = realEstateRepository.selectRealEstate(id);
		return realEstate;
	}
	
	public List<RealEstate> getRealEstateByRentPrice(int rentPrice) {
		
		List<RealEstate> realEstateList = realEstateRepository.selectgetRealEstateByRentPrice(rentPrice);
		return realEstateList;
	}
	
	public List<RealEstate> getRealEstateByAreaAndPrice(int area, int price) {
		
		List<RealEstate> realEstateList = realEstateRepository.selectRealEstateByAreaAndPrice(area, price);
		return realEstateList;
	}
	
	public int addRealEstateByObject(RealEstate realEstate) {
		
		int count = realEstateRepository.insertRealEstateByObject(realEstate);
		return count;
	}
	
	public int addRealEstate(
			int realtorId
			, String address
			, int area
			, String type
			, int price
			, int rentPrice) {
		
		int count = realEstateRepository.insertRealEstate(realtorId, address, area, type, price, rentPrice);
		return count;
	}
	
	public int updateRealEstate(
			int id
			, String type
			, int price) {
		
		int count = realEstateRepository.updateRealEstate(id, type, price);
		return count;
	}
	
	public int deleteRealEstate(int id) {
		
		int count = realEstateRepository.deleteRealEstate(id);
		return count;
	}
	
}
