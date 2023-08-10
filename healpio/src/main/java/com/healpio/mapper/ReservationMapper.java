package com.healpio.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.healpio.vo.ClassVO;
import com.healpio.vo.ReservationVO;

@Mapper
public interface ReservationMapper {

	public void insertReservation(ReservationVO reservation);

	public void updateReservation(ReservationVO reservation);

	public void deleteReservation(String reservation_no);

	public List<ReservationVO> getReservation();

	public List<ClassVO> getClasses();
	
	public ClassVO getClassDetailsByClassNo(@Param("class_no") String class_no, @Param("member_no") String member_no);
	
	public ReservationVO getReservationByNo(String reservation_no);
	
	public String getClassDays(String class_no);
	
    public List<String> getClassTimes(String class_no);
    
    public int getMaxReservationCountForClass(String class_no);
    
    public List<ReservationVO> getReservationCountsByDateAndTimes(@Param("class_no") String class_no, @Param("reservation_date") String reservation_date);

    public int increaseReservationCountIfNotMax(ReservationVO reservation);

}
