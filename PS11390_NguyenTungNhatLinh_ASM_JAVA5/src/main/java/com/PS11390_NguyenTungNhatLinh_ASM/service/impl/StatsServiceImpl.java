package com.PS11390_NguyenTungNhatLinh_ASM.service.impl;

import java.time.YearMonth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.PS11390_NguyenTungNhatLinh_ASM.repository.StatsRepository;
import com.PS11390_NguyenTungNhatLinh_ASM.service.StatsService;

@Service
public class StatsServiceImpl implements StatsService {
	
	@Autowired
	private StatsRepository repo;

	@Override
	public String[][] getTotalPriceLast6Months() {
		String[][] result = new String[2][6];
		YearMonth now = YearMonth.now();
		for (int i = 0; i < 6; i++) {
			String month = now.minusMonths((long)i).getMonthValue() + "";
			String year = now.minusMonths((long)i).getYear() + "";
			result[0][5-i] = "\'"+ month + "-" + year + "\'";
			result[1][5-i] = repo.getTotalPriceOneMonth(month, year);
		}
		return result;
	}
}
