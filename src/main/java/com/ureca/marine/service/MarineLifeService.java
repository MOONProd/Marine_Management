package com.ureca.marine.service;

import java.sql.SQLException;
import java.util.List;

import com.ureca.marine.dto.MarineLife;

public interface MarineLifeService {
//명세 => marine 추가/수정/삭제/조회/모두조회
	
	public int add(MarineLife marine)throws SQLException;
	public int edit(MarineLife marine)throws SQLException;
	public int remove(int no)throws SQLException;
	
	public MarineLife read(int no)throws SQLException;
	public List<MarineLife> readAll()throws SQLException;
	
    public List<MarineLife> readAllProtected() throws SQLException; // 부상 유형이 '유'인 데이터만 조회하는 메서드
	
}
