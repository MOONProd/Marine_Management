package com.ureca.marine.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ureca.marine.dao.MarineLifeDAO;
import com.ureca.marine.dto.MarineLife;

@Service
public class MarineLifeServiceImpl implements MarineLifeService {

	@Autowired
	MarineLifeDAO dao;
	
	@Override
	public int add(MarineLife marine) throws SQLException {
		return dao.insert(marine);
	}

	@Override
	public int edit(MarineLife marine) throws SQLException {
		return dao.update(marine);
	}

	@Override
	public int remove(int no) throws SQLException {
		return dao.delete(no);
	}

	@Override
	public MarineLife read(int no) throws SQLException {
		return dao.select(no);
	}

	@Override
	public List<MarineLife> readAll() throws SQLException {
		return dao.selectAll();
	}
	
	@Override
	public List<MarineLife> readAllProtected() throws SQLException {
	    return dao.selectProtected();
	}

}
