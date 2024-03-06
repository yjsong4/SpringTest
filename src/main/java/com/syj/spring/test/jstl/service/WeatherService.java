package com.syj.spring.test.jstl.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syj.spring.test.jstl.domain.Weather;
import com.syj.spring.test.jstl.repository.WeatherRepository;

@Service
public class WeatherService {
	
	@Autowired
	private WeatherRepository weatherRepository;
	
	// 모든 날씨 정보를 얻어 오는 기능
	public List<Weather> getWeatherHistory() {
		
		List<Weather> weatherHistory = weatherRepository.selectWeatherHistory();
		return weatherHistory;
	}
	
	public int addWeather(
			Date date
			, String weather
			, double temperatures
			, double precipitation
			, String microDust
			, double windSpeed) {
		
		int count = weatherRepository.insertWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
		return count;
	}

}
