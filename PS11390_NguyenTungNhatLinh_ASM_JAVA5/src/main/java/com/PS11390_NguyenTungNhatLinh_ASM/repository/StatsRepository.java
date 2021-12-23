package com.PS11390_NguyenTungNhatLinh_ASM.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.PS11390_NguyenTungNhatLinh_ASM.entity.OrderEntity;

@Repository
public interface StatsRepository extends JpaRepository<OrderEntity, Long> {
	
	@Query(value = "{CALL sp_getTotalPriceOneMonth(:month, :year)}", nativeQuery = true)
	String getTotalPriceOneMonth(@Param("month") String month, 
			@Param("year") String year);
}
