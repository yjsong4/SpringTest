package com.syj.spring.test.jsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syj.spring.test.jsp.domain.Realtor;
import com.syj.spring.test.jsp.repository.RealtorRepository;

@Service
public class RealtorService {
	
	@Autowired
	private RealtorRepository realtroRepository;
	public int addRealtor(Realtor realtor) {
		
		int count = realtroRepository.insertRealtor(realtor);
		return count;
	}
}
