package com.healpio.controller;

import com.healpio.service.ReservationService;
import com.healpio.vo.ReservationVO;

import lombok.extern.log4j.Log4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @PostMapping("/reservation/confirm")
    public String reservationConfirm() {
        // check reservation confirmation logic
        return "reservation_confirm";
    }
}