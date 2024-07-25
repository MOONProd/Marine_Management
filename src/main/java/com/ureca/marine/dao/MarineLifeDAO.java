package com.ureca.marine.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ureca.marine.dto.MarineLife;


@Mapper
public interface MarineLifeDAO {
	
	@Insert("insert into MarineLife (name,type,admissionDate,birthYear,gender,injuryType,injuryContent,notes,injuryDate,recoveryDate) values (#{name},#{type},#{admissionDate},#{birthYear},#{gender},#{injuryType},#{injuryContent},#{notes},#{injuryDate},#{recoveryDate})")
	public int insert(MarineLife marine)throws SQLException;//나는 sql실행만 전념하겠어!!
	
	@Update("update MarineLife set gender=#{gender}, injuryType=#{injuryType}, injuryContent=#{injuryContent}, notes=#{notes}, injuryDate=#{injuryDate}, recoveryDate=#{recoveryDate} where no=#{no}")
	public int update(MarineLife marine)throws SQLException;
	
	@Delete("delete from MarineLife where no=#{no}")
	public int delete(int no)throws SQLException;
	
	@Select("select no,type,name,injuryType from MarineLife")
	public MarineLife select(int no)throws SQLException; //특정 marine 한명 조회 => 수정폼/상세페이지
	
	@Select("select no,name,type,admissionDate,birthYear,gender,notes from MarineLife")
	public List<MarineLife> selectAll()throws SQLException;//모든 marine 조회
	
	@Select("SELECT * FROM MarineLife WHERE injuryType = '유'")
    public List<MarineLife> selectProtected() throws SQLException;

}


















