package com.healpio.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.healpio.mapper.ReservationMapper;
import com.healpio.vo.ClassVO;
import com.healpio.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {
    
    private final ReservationMapper reservationMapper;
    
    private int convertDayToNumber(String day) {
        switch (day) {
            case "일": return 0;
            case "월": return 1;
            case "화": return 2;
            case "수": return 3;
            case "목": return 4;
            case "금": return 5;
            case "토": return 6;
            default: throw new IllegalArgumentException("Invalid day: " + day);
        }
    }
    
    private List<Integer> convertDaysToNumbers(String daysString) {
        List<String> daysArray = Arrays.asList(daysString.split(","));
        return daysArray.stream()
                        .map(this::convertDayToNumber)
                        .collect(Collectors.toList());
    }

    @Autowired
    public ReservationServiceImpl(ReservationMapper reservationMapper) {
        this.reservationMapper = reservationMapper;
    }
    
    @Override
    public void insertReservation(ReservationVO reservation) {
        reservationMapper.insertReservation(reservation);
    }
    
    @Override
    public void updateReservation(ReservationVO reservation) {
        reservationMapper.updateReservation(reservation);
    }

    @Override
    public void deleteReservation(String reservation_no) {
        reservationMapper.deleteReservation(reservation_no);
    }

	
	@Override public List<ReservationVO> getAllReservations() {
		List<ReservationVO> reservations = reservationMapper.getReservation();
		return reservations;
	}
	 

	@Override
	public List<ClassVO> getAllClasses() {
        List<ClassVO> classes = reservationMapper.getClasses();
        return classes;
	}

	@Override
	public ClassVO getClassDetailsByClassNo(String class_no, String member_no) {
	    return reservationMapper.getClassDetailsByClassNo(class_no, member_no);
	}

	@Override
	public ReservationVO getReservationByNo(String reservation_no) {
	    // ReservationMapper를 통해 예약 번호를 기반으로 예약 정보를 조회합니다.
	    return reservationMapper.getReservationByNo(reservation_no);
	}
	
	@Override
	public List<Integer> getActiveDays(String class_no) {
	    String classDays = reservationMapper.getClassDays(class_no); // DB에서 class_day 가져오기
	    return convertDaysToNumbers(classDays); // 숫자 배열로 변환
	}
	
    @Override
    public List<String> getClassTimes(String class_no) {
        return reservationMapper.getClassTimes(class_no);
    }
    
    @Override
    public int getMaxReservationCountForClass(String class_no) {
        return reservationMapper.getMaxReservationCountForClass(class_no);
    }
    
    @Override
    @Transactional
    public int increaseReservationCountIfNotMax(ReservationVO reservation) {
        return reservationMapper.increaseReservationCountIfNotMax(reservation);
    }
    
    @Override
    public List<ReservationVO> getReservationCountsByDateAndTimes(String class_no, String reservation_date, List<String> availableTimes) {
    	System.out.println("=====class_no=====" + class_no);
    	System.out.println("=====reservation_date=====" + reservation_date);
    	System.out.println("=====availableTimes=====" + availableTimes);
    	List<ReservationVO> actualReservations = reservationMapper.getReservationCountsByDateAndTimes(class_no, reservation_date, availableTimes);
        System.out.println("actualReservations" + actualReservations);
//    	if(actualReservations != null) {
//    		for(String time : availableTimes) {
//    			actualReservations.putIfAbsent(time, 0);  // 만약 해당 시간에 예약이 없으면 0명으로 설정
//    		}
//    	}
        return actualReservations;
    }



}
