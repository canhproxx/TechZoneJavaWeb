package com.techzone.springmvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.techzone.springmvc.entity.Bill;

@Repository("billRepository")
public interface BillRepository extends JpaRepository<Bill,Integer> {
	
	List<Bill> findBillByCustomerId(int theCustomerId);
	
	List<Bill> findBillByEmployeeId(int theEmployeeId);

}
