package com.syj.spring.test.ajax.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syj.spring.test.ajax.domain.Booking;
import com.syj.spring.test.ajax.repository.BookingRepository;

@Service
public class BookingService {
	
	@Autowired
	private BookingRepository bookingrepository;
	
	public List<Booking> getBookingList() {
		
		List<Booking> bookingList = bookingrepository.selectBookingList();
		return bookingList;
	}
	
	public int deleteBooking(int id) {
		
		int count = bookingrepository.deleteBooking(id);
		return count;
	}
	
	public int addBooking(
			String name
			, int headcount
			, int day
			, Date date
			, String phoneNumber) {
		
		int count = bookingrepository.insertBooking(name, headcount, day, date, phoneNumber, "대기중");
		return count;
	}
	
	// 이름과 전화번호를 전달 받고, 일치하는 예약정보를 돌려주는 기능
	public Booking searchBooking(String name, String phoneNumber) {
		
		Booking booking = bookingrepository.selectBooking(name, phoneNumber);
		return booking;
	}

}
