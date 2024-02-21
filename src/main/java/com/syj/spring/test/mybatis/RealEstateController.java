package com.syj.spring.test.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.syj.spring.test.mybatis.domain.RealEstate;
import com.syj.spring.test.mybatis.service.RealEstateService;

@RequestMapping("/mybatis/real-estate")
@Controller
public class RealEstateController {
	
	@Autowired
	private RealEstateService realEstateService;
	
	@RequestMapping("/select/1")
	@ResponseBody
	public RealEstate realEstate(@RequestParam("id") int id) {
		
		RealEstate realEstate = realEstateService.getRealEstate(id);
		return realEstate;
	}
	
	@RequestMapping("/select/2")
	@ResponseBody
	public List<RealEstate> realEstateByRentPrice(@RequestParam("rent") int rentPrice) {
		
		List<RealEstate> realEstateList = realEstateService.getRealEstateByRentPrice(rentPrice);
		return realEstateList;
	}
	
	@RequestMapping("/select/3")
	@ResponseBody
	public List<RealEstate> realEstateByAreaAndPrice(
			@RequestParam("area") int area
			, @RequestParam("price") int price) {
		
		List<RealEstate> realEstateList = realEstateService.getRealEstateByAreaAndPrice(area, price);
		return realEstateList;
	}
	
}
