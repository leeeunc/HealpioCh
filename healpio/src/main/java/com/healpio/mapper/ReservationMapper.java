package com.healpio.mapper;

import com.healpio.vo.ReservationVO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationMapper {
	
    void insert(ReservationVO reservation);
    
    List<ReservationVO> getList();
}
