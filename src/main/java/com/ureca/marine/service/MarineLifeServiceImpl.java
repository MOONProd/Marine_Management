package com.ureca.marine.service;

import java.sql.SQLException;
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
            Date today = new Date();
            long diffInMillies = marine.getRecoveryDate().getTime() - today.getTime();
            long daysUntilRecovery = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
            marine.setDaysUntilRecovery((int) daysUntilRecovery);
        } else {
            marine.setDaysUntilRecovery(-1); // 회복 날짜가 없는 경우
        }
    }

    private void calculateDaysSinceAdmission(MarineLife marine) {
        if (marine.getAdmissionDate() != null) {
            Date currentDate = new Date();
            long diffInMillies = Math.abs(currentDate.getTime() - marine.getAdmissionDate().getTime());
            marine.setDaysSinceAdmission((int) TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS));
        } else {
            marine.setDaysSinceAdmission(0);
        }
    }

    private void calculateAge(MarineLife marine) {
        if (marine.getBirthYear() > 0) {
            int currentYear = new Date().getYear() + 1900; // Date의 getYear()는 1900을 기준으로 하기 때문에 1900을 더해줘야 함
            marine.setAge(currentYear - marine.getBirthYear());
        } else {
            marine.setAge(0);
        }
    }

}
