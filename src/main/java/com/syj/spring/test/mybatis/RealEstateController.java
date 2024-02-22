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
	
	@RequestMapping("/insert/1")
	@ResponseBody
	public String createRealEstateByObject() {
		
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int count = realEstateService.addRealEstateByObject(realEstate);
		return "입력 성공 : " + count;
	}
	
	@RequestMapping("/insert/2")
	@ResponseBody
	public String createRealEstate(@RequestParam("realtorId") int realtorId) {
		
		int count = realEstateService.addRealEstate(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		return "입력 성공 : " + count;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public String updateRealEstateById(
			@RequestParam("id") int id
			, @RequestParam("type") String type
			, @RequestParam("price") int price
			) {
		int count = realEstateService.updateRealEstate(22, "전세", 70000);
		return "업데이트 : " + count;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteRealEstate(@RequestParam("id") int id) {
		
		int count = realEstateService.deleteRealEstate(id);
		return "삭제 : " + count;
	}
	
}
