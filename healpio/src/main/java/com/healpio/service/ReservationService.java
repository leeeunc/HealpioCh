package com.healpio.service;

import org.springframework.stereotype.Service;

import com.healpio.vo.ReservationVO;

@Service
public interface ReservationService {
    void reserve(ReservationVO reservation);
}
