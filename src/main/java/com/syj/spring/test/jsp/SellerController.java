package com.syj.spring.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.syj.spring.test.jsp.domain.Seller;
import com.syj.spring.test.jsp.service.SellerService;

@RequestMapping("/jsp/seller")
@Controller
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	
	@PostMapping("/jsp/seller/create")
	@ResponseBody
	public String createSeller(
			@RequestParam("nickname") String nickname
			, @RequestParam("temperature") double temperature
			, @RequestParam("profileImage") String profileImage) {
		 
		int count = sellerService.addSeller(nickname, temperature, profileImage);
		return "삽입 결과 : " + count;
	}
	
	@GetMapping("/input")
	public String InputSeller() {
		
		return "jsp/sellerInput";
	}
	
	@GetMapping
	public String sellerInfo(Model model) {
		
		Seller seller = sellerService.getLastSeller();
		
		model.addAttribute("result", seller);
		model.addAttribute("title", "판매자 정보");
		
		return "jsp/sellerInfo";
	}

}
