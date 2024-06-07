package com.example.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.shop.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
	@Query(value="DELETE FROM product WHERE pno = :pno", nativeQuery = true)
	void deleteByPno(@Param("pno") Long pno);

	Product findByPno(Long pno);
	//판매순위
	@Query(value="SELECT * FROM product ORDER BY sales DESC LIMIT 4", nativeQuery = true)
	List<Product> findBySalesDESC();
	//판매등록일 순
	@Query(value="SELECT * FROM product ORDER BY saleregdate DESC LIMIT 4", nativeQuery = true)
	List<Product> findBySaleregdate();
}
