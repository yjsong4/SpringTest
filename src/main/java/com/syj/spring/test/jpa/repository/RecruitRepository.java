package com.syj.spring.test.jpa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.syj.spring.test.jpa.domain.Recruit;

public interface RecruitRepository extends JpaRepository<Recruit, Integer> {
	
	// companyId 가 일치하는 행 조회
	// WHERE `companyId` = #{}
	public List<Recruit> findBycompanyId(int companyId);
	
	// position 값과 type 값이 일치하는 행 조회
	// WHERE `position` = #{} AND `type` = #{}
	public List<Recruit> findByPositionAndType(String positon, String type);
	
	// type 값이 일치하거나 salary 값이 특정 값 이상인 조건에 맞는 행 조회
	// WHERE `type` = #{} OR `salary` >= #{}
	public List<Recruit> findByTypeOrSalaryGreaterThanEqual(String type, int salary);
	
	public List<Recruit> findTop3ByOrderBySalaryDesc(String type);
	
	public List<Recruit> findBySalaryBetween(int start, int end);
	
	@Query(value="SELECT * FROM `recruit` WHERE `type` = :type", nativeQuery=true)
	public List<Recruit> findBySalaryGreaterThanAndDeadlineGreaterThan(int salary, String deadline);
	
}
