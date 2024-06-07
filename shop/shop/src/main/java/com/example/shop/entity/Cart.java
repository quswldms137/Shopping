package com.example.shop.entity;

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
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cno;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "pname")
	@ToString.Exclude
	private Product pname; //상품 이름 
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "username")
	@ToString.Exclude
	private Member username; //회원 아이디
	
	private int quantity; //장바구니 수량 
}
