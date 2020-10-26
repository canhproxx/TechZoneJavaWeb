package com.techzone.springmvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.techzone.springmvc.entity.BillConfirm;

@Repository("billConfirmRepository")
public interface BillConfirmRepository extends JpaRepository<BillConfirm,Integer> {

	
}
