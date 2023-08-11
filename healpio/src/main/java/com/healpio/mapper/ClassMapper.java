package com.healpio.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.healpio.vo.ClassVO;
import com.healpio.vo.ExerciseVO;
import com.healpio.vo.LocationVO;

public interface ClassMapper {

	public List<ExerciseVO> getExerciseList();
	public int insert(ClassVO classVO);
	public int insertLocation(@Param("class_no") String class_no, @Param("province") String province, @Param("city") String city, @Param("district") String district);
	public ClassVO getOne(String class_no);
	public LocationVO getLocation(String class_no);
	public int update(ClassVO classVO);
	public int updateLocation(LocationVO locationVO);
	public int delete(String class_no);
	public int scrap(@Param("class_no") String class_no, @Param("member_no") String member_no);
	public int cancelScrap(@Param("class_no") String class_no, @Param("member_no") String member_no);
	public int scrapYN(@Param("class_no") String class_no, @Param("member_no") String member_no);
	public int deleteScrap(String class_no);
	public int deleteLocation(String class_no);
	public int getReservation(String class_no);
	
}
