package com.ureca.person.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ureca.person.dto.MarineLife;

public interface PersonService {
//명세 => Person 추가/수정/삭제/조회/모두조회
	
	public int add(MarineLife person)throws SQLException;
	public int edit(MarineLife person)throws SQLException;
	public int remove(int no)throws SQLException;
	
	public MarineLife read(int no)throws SQLException;
	public List<MarineLife> readAll()throws SQLException;
    public List<MarineLife> readAllProtected() throws SQLException; // 부상 유형이 '유'인 데이터만 조회하는 메서드
	
}
