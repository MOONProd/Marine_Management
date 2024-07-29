package com.ureca.marine.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.DateTypeHandler;

import com.ureca.marine.dto.MarineLife;


@Mapper
public interface MarineLifeDAO {
	
	@Insert("insert into MarineLife (name,type,admissionDate,birthYear,gender,injuryType,injuryContent,notes,injuryDate,recoveryDate) values (#{name},#{type},#{admissionDate},#{birthYear},#{gender},#{injuryType},#{injuryContent},#{notes},#{injuryDate},#{recoveryDate})")
	public int insert(MarineLife marine)throws SQLException;
	
	@Update("update MarineLife set gender=#{gender}, injuryType=#{injuryType}, injuryContent=#{injuryContent}, notes=#{notes}, injuryDate=#{injuryDate}, recoveryDate=#{recoveryDate} where no=#{no}")
	public int update(MarineLife marine)throws SQLException;
	
	@Delete("delete from MarineLife where no=#{no}")
	public int delete(int no)throws SQLException;
	
	@Select("select * from MarineLife where no=#{no}")
	public MarineLife select(int no)throws SQLException;
	
	@Select("select * from MarineLife")
	public List<MarineLife> selectAll()throws SQLException;
	
	@Select("select * from MarineLife where injuryType = '유'")
    public List<MarineLife> selectProtected() throws SQLException;

}


















