package com.syj.spring.test.ajax.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.syj.spring.test.ajax.domain.Booking;

@Mapper
public interface BookingRepository {
	
	public List<Booking> selectBookingList();
	
	public int deleteBooking(@Param("id") int id);
	
	public int insertBooking(
			@Param("name") String name
			, @Param("headcount") int headcount
			, @Param("day") int day
			, @Param("date") Date date
			, @Param("phoneNumber") String phoneNumber
			, @Param("state") String state);
	
	public Booking selectBooking(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);
	
}
