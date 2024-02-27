package com.syj.spring.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.syj.spring.test.jsp.domain.Realtor;
import com.syj.spring.test.jsp.service.RealtorService;

@RequestMapping("/jsp/realtor")
public class RealtorController {
	
	@Autowired
	private RealtorService realtorservice;
	
	@GetMapping("/create")
	public String createRealtor(
			@RequestParam("office") String office
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("address") String address
			, @RequestParam("grade") String grade
			, Model model) {
		
		Realtor realtor = new Realtor();
		realtor.setOffice(office);
		realtor.setPhoneNumber(phoneNumber);
		realtor.setAddress(address);
		realtor.setGrade(grade);
		
		int count = realtorservice.addRealtor(realtor);
		
		model.addAttribute("realtor", realtor);
		return "jsp/realtorInfo";
	}
	
	@GetMapping("/input")
	public String inputRealtor() {
		return "jsp/realtorInput";
	}

}
