package com.healpio.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.healpio.mapper.ReservationMapper;
import com.healpio.vo.ReservationVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReservationTest {
	
	@Autowired
	ReservationMapper reservationMapper;
	
	@Test
	public void getList() {
		// Creating a new ReservationVO object
		ReservationVO reservation = new ReservationVO();

		// Setting the required information in the object
		reservation.setReservation_no(6);
		reservation.setMember_no(5);
		reservation.setClass_no(5);
		reservation.setReservation_date("2023-07-31");
		reservation.setReservation_time("13:00");
		// reservation.setReservation_regdate("2023-07-31"); - usually, the registration date is set in the database.

		// Call the insert method
		reservationMapper.insert(reservation);
		
		// Get the list
		List<ReservationVO> list = reservationMapper.getList();
		log.info(list);
	};
	
}
