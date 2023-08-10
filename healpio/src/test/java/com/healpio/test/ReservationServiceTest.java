package com.healpio.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnit;
import org.mockito.junit.MockitoRule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.util.ReflectionUtils;
import java.lang.reflect.Field;

import com.healpio.mapper.ReservationMapper;
import com.healpio.service.ReservationService;
import com.healpio.service.ReservationServiceImpl;
import com.healpio.vo.ReservationVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
@Transactional // 트랜잭션 관리를 위한 어노테이션
@Rollback // 테스트가 끝난 후 롤백하여 데이터를 삭제
public class ReservationServiceTest {
	
	@Autowired
	ReservationService reservationService;
	
	ReservationServiceImpl reservationServiceImpl;
	
    @Mock
    private ReservationMapper reservationMapper;
    
    @Rule
    public MockitoRule mockitoRule = MockitoJUnit.rule();
    
    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this); 
        Field field = ReflectionUtils.findField(ReservationServiceImpl.class, "reservationMapper");
        ReflectionUtils.makeAccessible(field);
        ReflectionUtils.setField(field, reservationService, reservationMapper);
    }

    @Test
    public void testGetActiveDays() {
        // Mocking the ReservationMapper's getClassDays method
        when(reservationMapper.getClassDays(anyString())).thenReturn("화,수,토");

        List<Integer> activeDays = reservationService.getActiveDays("C000007");

        // Log or print the result
        System.out.println(activeDays);
        
        log.info("activeDays===========" + activeDays);

        // Verifying that getClassDays was called with the provided class_no
        verify(reservationMapper).getClassDays("C000007");

        // Assert the returned days
        assertEquals(List.of(2, 3, 6), activeDays);
    }
    
    
    @Test
    public void testGetClassTimes() {
        // Mock the ReservationMapper's getClassTimes method
        List<String> mockClassTimes = Arrays.asList("09:00,10:00,12:00,13:00,14:00");
        when(reservationMapper.getClassTimes(anyString())).thenReturn(mockClassTimes);

        // Call the method
        List<String> result = reservationService.getClassTimes("C000007");
        
        log.info("mockClassTimes===========" + mockClassTimes);
        log.info("result===========" + result);

        // Assert the result
        assertEquals(mockClassTimes, result);

        // Verify that getClassTimes was called with the provided class_no
        verify(reservationMapper).getClassTimes("C000007");
    }
    
    @Test
    public void testGetReservationCountsByDateAndTimes() {
        // Given
        String classNo = "C000017";
        String reservationDate = "2023-12-30";
        List<String> availableTimes = Arrays.asList("08:00","09:00","10:00","11:00","13:00","18:00");
        
        List<ReservationVO> mockReservations = null;
        // 만약 09:00 예약이 없으면 아래와 같이 추가하지 않습니다. 이것은 테스트를 위한 예시입니다.
        // mockReservations.put("09:00", 0); 

        // Mockito mock 설정
        when(reservationMapper.getReservationCountsByDateAndTimes(classNo, reservationDate)).thenReturn(mockReservations);
        
        // When
        List<ReservationVO> actualReservations = reservationService.getReservationCountsByDateAndTimes(classNo, reservationDate, availableTimes);
        log.info(actualReservations);
        // Then
    }

    
	
    
	
}
