package com.example.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.shop.entity.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, String> {

	Member findByUsernameAndPassword(String username, String password);

	Member findByUsername(String username);

}
