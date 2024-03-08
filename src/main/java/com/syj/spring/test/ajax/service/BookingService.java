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
	
	public int addBooking(
			String name
			, int headcount
			, int day
			, Date date
			, String phoneNumber) {
		
		int count = bookingrepository.insertBooking(name, headcount, day, date, phoneNumber);
		return count;
	}

}
