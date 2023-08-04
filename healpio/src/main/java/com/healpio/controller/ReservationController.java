package com.healpio.controller;

import com.healpio.service.ReservationService;
import com.healpio.vo.ReservationVO;

import lombok.extern.log4j.Log4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@RequestMapping("/reservation/*")
@Controller
@Log4j
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @PostMapping("/reservation")
    public String reservation(@ModelAttribute("reservation") ReservationVO reservation) {
        reservationService.reserve(reservation);
        log.info(reservation);
        return "redirect:/reservation/confirm";
    }
    
    @GetMapping("/reservation")
    public String reservationForm(Model model) {
        model.addAttribute("reservation", new ReservationVO());
        return "reservation/reservation";
    }
    
    @GetMapping("/confirm")
    public String reservationConfirmForm(Model model) {
        model.addAttribute("reservation", new ReservationVO());
        return "reservation/confirm";
    }
    
    @PostMapping("/confirm")
    public String confirmReservation(@RequestParam("date") String date, @RequestParam("time") String time) {
        // 예약 객체를 생성하고 날짜와 시간을 설정합니다.
        ReservationVO reservation = new ReservationVO();
        reservation.setReservation_date(date);
        reservation.setReservation_time(time);

        // 예약 정보를 저장합니다.
        reservationService.reserve(reservation);
        log.info(reservation);

        return "redirect:/reservation/confirm";  // 예약 확인 페이지로 이동
    }


}