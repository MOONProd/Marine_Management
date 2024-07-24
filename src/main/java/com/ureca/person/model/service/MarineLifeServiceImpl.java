package com.ureca.person.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ureca.person.dto.MarineLife;
import com.ureca.person.model.dao.PersonDAO;

@Service
public class MarineLifeServiceImpl implements PersonService {

	@Autowired
	PersonDAO dao;
	
	@Override
	public int add(MarineLife person) throws SQLException {
		return dao.insert(person);
	}

	@Override
	public int edit(MarineLife person) throws SQLException {
		return dao.update(person);
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

}
