package com.syj.spring.test.jpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.syj.spring.test.jpa.domain.Company;

public interface CompanyRepository extends JpaRepository<Company, Integer> {

}
