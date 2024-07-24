package com.ureca.person.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ureca.person.dto.Person;

@Mapper
public interface PersonDAO {
	
//	public void insert(String name,int age,String job);
	
	//insert into person (no,name,age,job) values (?,?,?,?)
	//==> DB실행결과 : int executeUpdate()
	
//	public boolean insert(Person person);//실행에 대해 내가 판단하겠어!
//	public String insert(Person person);//실행에 대해 내가 판단하겠어!
//	public int insert(Person person);//나는 sql실행만 전념하겠어!!
	
	//update person set age=?, job=? where no=?
	//==> DB실행결과 : int executeUpdate()
//	public int update(Person person);
	
	//delete from person where no=?
	//==> DB실행결과 : int executeUpdate()
//	public int delete(int no);
	
	//select no,name,age,job from person where no=?
//	public Person select(int no); //특정 Person 한명 조회 => 수정폼/상세페이지
	
	//select no,name,age,job from person
//	public Person[] selectAll();//모든 Person 조회
//	public List<Person> selectAll();//모든 Person 조회
	
	public int insert(Person person)throws SQLException;//나는 sql실행만 전념하겠어!!
	public int update(Person person)throws SQLException;
	public int delete(int no)throws SQLException;
	public Person select(int no)throws SQLException; //특정 Person 한명 조회 => 수정폼/상세페이지
	public List<Person> selectAll()throws SQLException;//모든 Person 조회
	
/*
<DAO작성법>

public int insert(DTO);
public int update(DTO);
public int delete(PK);

public DTO select(PK);//한행에 대한 상세,수정
public List<DTO> selectAll(); //여러행 조회

public List<DTO> selectBy조건(조건을 표현하는 자료형);
	
 */
	

}


















