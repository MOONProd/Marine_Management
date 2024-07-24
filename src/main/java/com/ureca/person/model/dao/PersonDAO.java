package com.ureca.person.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ureca.person.dto.MarineLife;


@Mapper
public interface PersonDAO {
	
	
//	@Insert("insert into person (name,age,job) values (#{name},#{age},#{job})")
//	public int insert(Person person)throws SQLException;//나는 sql실행만 전념하겠어!!
//	
//	@Update("update person set age=#{age}, job=#{job} where no=#{no}")
//	public int update(Person person)throws SQLException;
//	
//	@Delete("delete from person where no=#{no}")
//	public int delete(int no)throws SQLException;
//	
//	@Select("select no,name,age,job from person where no=#{no}")
//	public Person select(int no)throws SQLException; //특정 Person 한명 조회 => 수정폼/상세페이지
//	
//	@Select("select no,name,age,job from person order by no")
//	public List<Person> selectAll()throws SQLException;//모든 Person 조회
	
	@Insert("insert into MarineLife (name,type,admissionDate,birthYear,gender,injuryType,injuryContent,notes) values (#{name},#{type},#{admissionDate},#{birthYear},#{gender},#{injuryType},#{injuryContent},#{notes})")
	public int insert(MarineLife person)throws SQLException;//나는 sql실행만 전념하겠어!!
	
	@Update("update MarineLife set gender=#{gender}, injuryType=#{injuryType}, injuryContent=#{injuryContent}, notes=#{notes} where no=#{no}")
	public int update(MarineLife person)throws SQLException;
	
	@Delete("delete from MarineLife where no=#{no}")
	public int delete(int no)throws SQLException;
	
	@Select("select no,type,name,injuryType from MarineLife")
	public MarineLife select(int no)throws SQLException; //특정 Person 한명 조회 => 수정폼/상세페이지
	
	@Select("select no,name,type,admissionDate,birthYear,gender,injuryType,injuryContent,notes from MarineLife")
	public List<MarineLife> selectAll()throws SQLException;//모든 Person 조회
	
	

}


















