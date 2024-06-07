package com.example.shop.entity;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	private Long mno;
	@Id
	private String username;
	private String password;
	private String name;
	private String address;
	private String tel;
	private LocalDate regdate;
	private String role;
}
