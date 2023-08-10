package com.healpio.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.healpio.mapper.ReservationMapper;
import com.healpio.vo.ClassVO;
import com.healpio.vo.ReservationVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
@Transactional // 트랜잭션 관리를 위한 어노테이션
@Rollback // 테스트가 끝난 후 롤백하여 데이터를 삭제
public class ReservationTest {
	
	@Autowired
	ReservationMapper reservationMapper;
	
	@Test
	public void reservationGetList() {
		// Creating a new ReservationVO object
		ReservationVO reservation = new ReservationVO();

		// Setting the required information in the object
		reservation.setMember_no("M000005");
		reservation.setClass_no("C000004");
		reservation.setReservation_date("2023-07-31");
		reservation.setReservation_time("13:00");
		reservation.setReservation_maxcount(3);
		// reservation.setReservation_regdate("2023-07-31"); - usually, the registration date is set in the database.

		// Call the insert method
		reservationMapper.insertReservation(reservation);
		
		// Get the list
//		List<ReservationVO> list = reservationMapper.getReservation();
//		log.info(list);
	};
	
	@Test
	public void classGetList() {
		// Get the list
		List<ClassVO> classVOs = reservationMapper.getClasses();
		log.info(classVOs);
	};
	
    @Test
    public void testGetAllReservations() {
        List<ReservationVO> reservations = reservationMapper.getReservation();
        for (ReservationVO reservation : reservations) {
            log.info(reservation);
        }
    }
    
    @Test
    public void testGetClassDay() {
        String classNo = "C000007"; // 여기에 실제 테스트할 class_no 값을 제공해주세요.
        String classDay = reservationMapper.getClassDays(classNo);
        
        log.info("Class No: " + classNo + ", Class Day: " + classDay);
    }
	
	
	
}
