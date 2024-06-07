package com.example.shop.entity;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long pno;
	private String pname;
	private int price;
	private String pitem; //상품품목
	private int stock; //상품수량
	private int sales; //판매수량 
	private LocalDate saleregdate; //판매등록일 
	private String url; //이미지url
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "username")
	@ToString.Exclude
	private Member username;
	
}
