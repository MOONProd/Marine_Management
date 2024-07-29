package com.ureca.marine.service;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

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
		calculateAdditionalFields(marine);
		return dao.insert(marine);
	}

	@Override
	public int edit(MarineLife marine) throws SQLException {
		calculateAdditionalFields(marine);
		return dao.update(marine);
	}

	@Override
	public int remove(int no) throws SQLException {
		return dao.delete(no);
	}

	@Override
	public MarineLife read(int no) throws SQLException {
		MarineLife marine = dao.select(no);
		calculateAdditionalFields(marine);
		return marine;
	}

	@Override
	public List<MarineLife> readAll() throws SQLException {
		List<MarineLife> marineList = dao.selectAll();
		for (MarineLife marine : marineList) {
			calculateAdditionalFields(marine);
		}
		return marineList;
	}

	@Override
	public List<MarineLife> readAllProtected() throws SQLException {
		List<MarineLife> marineList = dao.selectProtected();
		for (MarineLife marine : marineList) {
			calculateAdditionalFields(marine);
		}
		return marineList;
	}

	private void calculateAdditionalFields(MarineLife marine) {
		calculateDaysUntilRecovery(marine);
		calculateDaysSinceAdmission(marine);
		calculateAge(marine);
	}

	private void calculateDaysUntilRecovery(MarineLife marine) {
	    if (marine.getRecoveryDate() != null) {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        try {
	            Date today = sdf.parse(sdf.format(new Date()));
	            Date recoveryDate = sdf.parse(sdf.format(marine.getRecoveryDate()));

	            long diffInMillies = recoveryDate.getTime() - today.getTime();
	            long daysUntilRecovery = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
	           
	            marine.setDaysUntilRecovery((int) daysUntilRecovery);
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	    }
	}

	private void calculateDaysSinceAdmission(MarineLife marine) {
	    if (marine.getAdmissionDate() != null) {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        try {
	            Date currentDate = sdf.parse(sdf.format(new Date()));
	            Date admissionDate = sdf.parse(sdf.format(marine.getAdmissionDate()));

	            long diffInMillies = currentDate.getTime() - admissionDate.getTime();
	            long daysSinceAdmission = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
	            
	            marine.setDaysSinceAdmission((int) daysSinceAdmission);
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	    } else {
	        marine.setDaysSinceAdmission(0);
	    }
	}

    private void calculateAge(MarineLife marine) {
        if (marine.getBirthYear() > 0) {
            int currentYear = LocalDate.now().getYear();
            int age = currentYear - marine.getBirthYear();
            
            
            marine.setAge(age);
        } else {
            marine.setAge(0);
        }
    }
}


