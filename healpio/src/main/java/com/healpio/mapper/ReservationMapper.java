package com.healpio.mapper;

import com.healpio.vo.ReservationVO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationMapper {
	
    public void insert(ReservationVO reservation);
    
    public List<ReservationVO> getReservationList();
}
