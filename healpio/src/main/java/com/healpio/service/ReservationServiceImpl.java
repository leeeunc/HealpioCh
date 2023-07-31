package com.healpio.service;

import com.healpio.vo.ReservationVO;
import com.healpio.mapper.ReservationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService {
    
    @Autowired
    private ReservationMapper reservationMapper;

    @Override
    public void reserve(ReservationVO reservation) {
        reservationMapper.insert(reservation);
    }
}
