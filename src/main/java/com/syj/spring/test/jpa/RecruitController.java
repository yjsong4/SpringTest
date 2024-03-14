package com.syj.spring.test.jpa;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.syj.spring.test.jpa.domain.Recruit;
import com.syj.spring.test.jpa.repository.RecruitRepository;

@RequestMapping("/jpa/recruit")
@Controller
public class RecruitController {
	
	@Autowired
	private RecruitRepository recruitrepository;
	
	@GetMapping("/1")
	@ResponseBody
	public Recruit jpaTest01() {
		
		Optional<Recruit> optionalRecruit = recruitrepository.findById(8);
		Recruit recruit = optionalRecruit.orElse(null);
		return recruit;
	}
	
	@GetMapping("/2")
	@ResponseBody
	public List<Recruit> jpaTest02(@RequestParam("companyId") int companyId) {
		
		List<Recruit> recruitList = recruitrepository.findBycompanyId(companyId);
		return recruitList;
	}
	
	@GetMapping("/3")
	@ResponseBody
	public List<Recruit> jpaTest03() {
		
		List<Recruit> recruitList = null;
//		List<Recruit> recruitList = recruitrepository.findByPositionAndType("웹 back-end 개발자", "정규직");
//		recruitList = recruitrepository.findByTypeOrSalaryGreaterThanEqual("정규직", 9000);
//		recruitList = recruitrepository.findTop3ByTypeOrderBySalaryDesc("계약직");
//		recruitList = recruitrepository.findByRegionAndSalaryBetween("성남시 분당구", 7000, 8500);
		recruitList = recruitrepository.findByNativeQuery("2026-04-10 23:59:59", 8100, "정규직");
		
		return recruitList;
	}
	
}
