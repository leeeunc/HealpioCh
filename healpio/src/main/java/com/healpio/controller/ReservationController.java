package com.healpio.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.healpio.mapper.ClassMapper;
import com.healpio.mapper.ReservationMapper;
import com.healpio.service.ReservationService;
import com.healpio.vo.ClassVO;
import com.healpio.vo.ReservationVO;

import lombok.extern.log4j.Log4j;

@RequestMapping("/reservation/*")
@Controller
@Log4j
public class ReservationController {

    private final ReservationService reservationService;
//    private final List<String> activeDays = new ArrayList<>(); // 강의의 활동 가능한 요일을 저장할 리스트
    
    @Autowired
    public ReservationController(ReservationService reservationService) {
        this.reservationService = reservationService;
    }
    
    @Autowired
    ClassMapper classMapper;
    
    @Autowired
    ReservationMapper reservationMapper;
    
    
    // 예약 정보를 받아 예약을 처리하는 메소드
    @PostMapping("/reservation")
    public String reservation(@ModelAttribute("reservation") ReservationVO reservation) {
        // reservationService를 통해 예약 정보를 저장합니다.
        reservationService.insertReservation(reservation);
        // 로그를 출력하여 예약 정보를 확인합니다.
        log.info("=====reservation=======" + reservation);
        // 예약 처리가 완료되면, 예약 확인 페이지로 리다이렉트합니다.
        return "redirect:/reservation/confirm";
    }
    
    @GetMapping("/confirm")
    public String showConfirmPage(Model model, 
                                  @RequestParam("date") String date, 
                                  @RequestParam("time") String time, 
                                  @RequestParam("class_no") String class_no, 
                                  @RequestParam("member_no") String member_no) {


        // TODO: 예약 정보를 활용하여 필요한 처리를 수행
        // 예를 들어, 강의 정보를 가져와서 모델에 추가하거나, 예약한 정보를 화면에 표시하는 등의 작업을 수행합니다.
        ClassVO classInfo = reservationMapper.getClassDetailsByClassNo(class_no, member_no);
        
        // 모델에 예약 정보와 강의 정보 추가
        model.addAttribute("date", date);
        model.addAttribute("time", time);
        model.addAttribute("class_no", class_no);
        model.addAttribute("member_no", member_no);
        model.addAttribute("classInfo", classInfo);

        return "reservation/confirm";
    }

    
 // 예약 확인을 위한 POST 요청을 처리하는 메소드
    @PostMapping("/confirm")
    public String reservationForm(@RequestParam("date") String date, @RequestParam("time") String time, 
                                    @RequestParam("class_no") String class_no, @RequestParam("member_no") String member_no
                                    , RedirectAttributes redirectAttributes, Model model) {

        // ReservationMapper를 통해 class_no를 기반으로 강의 정보를 가져옵니다.
        ClassVO classInfo = reservationMapper.getClassDetailsByClassNo(class_no, member_no);

        // 예약 객체를 생성하고 필요한 값들을 설정합니다.
        ReservationVO reservation = new ReservationVO();
        
        List<Integer> activeDays = reservationService.getActiveDays(class_no);
        model.addAttribute("activeDays", activeDays);
        
        reservation.setClassNo(class_no);
        reservation.setMemberNo(classInfo.getMember_no()); // ClassVO에서 member_no를 가져와 설정
        reservation.setReservation_date(date);
        reservation.setReservation_time(time);
        reservation.setReservation_maxcount(classInfo.getClass_maxcount()); // 예약 최대 수량을 ClassVO에서 가져온다면
        
        // TODO: 여기에서 reservation_regdate를 현재 시간으로 설정해주셔야 합니다.
        // 예: reservation.setReservation_regdate(new Date());

        redirectAttributes.addAttribute("date", date);
        redirectAttributes.addAttribute("time", time);
        redirectAttributes.addAttribute("class_no", class_no);
        redirectAttributes.addAttribute("member_no", member_no);
        redirectAttributes.addAttribute("maxcount", classInfo.getClass_maxcount());
        
        // reservationService를 통해 예약 정보를 저장합니다.
//        reservationService.insertReservation(reservation);
//        reservationService.increaseReservationCountIfNotMax(reservation);
        
        // 먼저 해당 예약이 이미 있는지 확인
        ReservationVO existingReservation = reservationMapper.getReservationByDetails(reservation.getClassNo(), reservation.getReservation_date(), reservation.getReservation_time());

        if (existingReservation != null) {
        	reservation.setReservation_count(1);  // 처음 예약이므로 카운트를 1로 설정
            // 이미 예약이 있다면, 카운트를 업데이트
            reservationMapper.increaseReservationCountIfNotMax(reservation);
        } else {
            // 예약이 없다면, 새로운 예약을 추가
            reservationMapper.insertReservation(reservation);
        }
        
        // 로그를 출력하여 예약 정보를 확인합니다.
        log.info(reservation);

        // Model에 예약 정보를 추가합니다.
        model.addAttribute("reservation", reservation);

        // 예약 확인 페이지로 리다이렉트합니다.
        return "redirect:/reservation/confirm";
    }
    
    @GetMapping("/classDetails")
    @ResponseBody
    public ClassDetails getClassDetails(@RequestParam String class_no, @RequestParam(required = false) String reservation_date) {
        List<Integer> activeDays = reservationService.getActiveDays(class_no);
        List<String> availableTimes = reservationService.getClassTimes(class_no);
        int maxCapacity = reservationService.getMaxReservationCountForClass(class_no);
        
        if(reservation_date == null) {
        	LocalDate now = LocalDate.now();
        	reservation_date = now.toString();
        }
        
//        System.out.println(reservation_date);
        
        List<ReservationVO> currentCapacity = reservationService.getReservationCountsByDateAndTimes(class_no, reservation_date, availableTimes);
        
        System.out.println("Returned Reservations: " + currentCapacity);

        
//        Set<String> key = currentCapacity.keySet();
//        System.out.println("key +++++++++++++++" + key);
//        System.out.println("reservation_date"+reservation_date);
//        System.out.println("currentCapacity"+currentCapacity);
        return new ClassDetails(activeDays, availableTimes, maxCapacity, currentCapacity);
    }

    // ClassDetails 클래스는 데이터를 전송하기 위한 DTO(Data Transfer Object)입니다.
    public static class ClassDetails {
        private List<Integer> activeDays;
        private List<String> availableTimes;
        private int maxCapacity;
        private List<ReservationVO> currentCapacity;  // 초기화
        
        // 생성자 추가
        public ClassDetails(List<Integer> activeDays, List<String> availableTimes
        						, int maxCapacity, List<ReservationVO> currentCapacity) {
            this.activeDays = activeDays;
            this.availableTimes = availableTimes;
            this.maxCapacity = maxCapacity;
            this.currentCapacity = currentCapacity;
        }
        
        // activeDays getter and setter
        public List<Integer> getActiveDays() {
            return activeDays;
        }

        public void setActiveDays(List<Integer> activeDays) {
            this.activeDays = activeDays;
        }
        
        // availableTimes getter and setter	
        public List<String> getAvailableTimes() {
            return availableTimes;
        }

        public void setAvailableTimes(List<String> availableTimes) {
            this.availableTimes = availableTimes;
        }
        
        // maxReservation getter and setter
        public int getMaxCapacity() {
            return maxCapacity;
        }

        public void setMaxCapacity(int maxCapacity) {
            this.maxCapacity = maxCapacity;
        }
        
        // currentCapacity getter and setter 추가
        public List<ReservationVO> getCurrentCapacity() {
            return currentCapacity;
        }

        public void setCurrentCapacity(List<ReservationVO> currentCapacity) {
            this.currentCapacity = currentCapacity;
        }
        
    }

}