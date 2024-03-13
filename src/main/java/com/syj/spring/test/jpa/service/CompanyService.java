package com.syj.spring.test.jpa.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syj.spring.test.jpa.domain.Company;
import com.syj.spring.test.jpa.repository.CompanyRepository;

@Service
public class CompanyService {
	
	@Autowired
	private CompanyRepository companyRepository;
	
	public Company addCompany(String name, String business, String scale, int headcount) {
		
		Company company = Company.builder()
									.name(name)
									.business(business)
									.scale(scale)
									.headcount(headcount)
									.build();
		
		company = companyRepository.save(company);
		
		return company;
	}
	
	public Company updateCompany(int id, String scale, int headcount) {
		
		Optional<Company> optionalCompany = companyRepository.findById(id);
		Company company = optionalCompany.orElse(null);
		
		if(company != null) {
			company = company.toBuilder()
								.scale(scale)
								.headcount(headcount)
								.build();
			company = companyRepository.save(company);		
		}

		return company;
	}
	
	public void deleteCompany(int id) {
		
//		companyRepository.deleteById(id);
		Optional<Company> optionalCompany = companyRepository.findById(id);
//		Company company = optionalCompany.orElse(null);
//		
//		if(company != null) {
//			companyRepository.delete(company);			
//		}
		
		// 람다식
		optionalCompany.ifPresent(company -> companyRepository.delete(company));
	}
	
}
