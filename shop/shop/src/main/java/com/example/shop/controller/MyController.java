package com.example.shop.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.shop.entity.Member;
import com.example.shop.entity.Product;
import com.example.shop.repository.MemberRepository;
import com.example.shop.repository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	ProductRepository productRepository;
	//메인 
	@RequestMapping({"/", "/main"})
	public String main(Model model) {
		List<Product> product = productRepository.findBySalesDESC();
		model.addAttribute("product", product);
		
		List<Product> product2 = productRepository.findBySaleregdate();
		model.addAttribute("product2", product2);
		
		List<Product> products = productRepository.findAll();
		model.addAttribute("products", products);
		return "main"; 
	}
	//제품상세페이지
	@RequestMapping("/productDetail")
	public String productDetail(@RequestParam("pno") Long pno, Model model) {
		Product product = productRepository.findByPno(pno);
		model.addAttribute("product", product);
		
		return "productDetail";
	}
	//로그인
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	@RequestMapping("/login")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Member member = memberRepository.findByUsernameAndPassword(username, password);
		if(member != null) {
			session.setAttribute("username", username);
			System.out.println("로그인 성공");
			return "redirect:main";
		}else {
			System.out.println("로그인 실패");
			return "loginForm";
		}
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:main";
	}
	//회원가입
	@RequestMapping("/registForm")
	public String registForm() {
		return "registForm";
	}
	@RequestMapping("/regist")
	public String regist(HttpServletRequest req) {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String address = req.getParameter("address");
		String tel = req.getParameter("tel");
		String role = req.getParameter("role");
		Member member = new Member();
		member.setUsername(username);
		member.setPassword(password);
		member.setName(name);
		member.setAddress(address);
		member.setTel(tel);
		member.setRole(role);
		member.setRegdate(LocalDate.now());
		memberRepository.save(member);
		return "redirect:loginForm";
	}
	
	//마이페이지(관리자) 상품리스트
	@RequestMapping("/mypage")
	public String mypage(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("username");
		
		List<Product> product = productRepository.findAll();
		System.out.println(product);
		if(username != null && username.equals("admin")) {
			model.addAttribute("product", product);
			return "mypage";
		}else {
	        return "main";
	    }
	}
	// -- 상품 등록 
	@RequestMapping("/productRegistForm")
	public String productRegistForm() {
		return "productRegistForm";
	}
	@RequestMapping("/productRegist")
	public String productRegist(@RequestParam("pname") String pname, @RequestParam("price") int price, @RequestParam("pitem") String pitem,
			@RequestParam("stock") int stock, @RequestParam("sales") int sales,  @RequestParam("url") String url, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Member username = memberRepository.findByUsername((String)session.getAttribute("username"));
		
		Product product = new Product();
		product.setPname(pname);
		product.setPrice(price);
		product.setPitem(pitem);
		product.setStock(stock);
		product.setSales(sales);
		product.setSaleregdate(LocalDate.now());
		product.setUrl(url);
		product.setUsername(username);
		productRepository.save(product);
		return "redirect:mypage";
	}
	// -- 상품 수정 
	@RequestMapping("/productUpdateForm")
	public String productUpdateForm(HttpServletRequest req, Model model) {
		Long pno = Long.parseLong(req.getParameter("pno"));
		Product product = productRepository.findByPno(pno);
		model.addAttribute("product", product);
		return "productUpdateForm";
	}
	@RequestMapping("/productUpdate")
	public String productUpdate(HttpServletRequest req, @RequestParam("url") String url) {
		Long pno = Long.parseLong(req.getParameter("pno"));
		Product product = productRepository.findByPno(pno);
		product.setPno(pno);
		product.setPname(req.getParameter("pname"));
		int price_ = Integer.parseInt(req.getParameter("price"));
		product.setPrice(price_);
		product.setPitem(req.getParameter("pitem"));
		int stock_ = Integer.parseInt(req.getParameter("stock"));
		product.setStock(stock_);
		int sales_ = Integer.parseInt(req.getParameter("sales"));
		product.setSales(sales_);
		
		String url2 = req.getParameter("url2"); // 기존 이미지 URL
	    
	    if (url != null && !url.isEmpty()) { // 이미지 파일이 전송된 경우
	        // 새로운 이미지 파일을 업로드하고, 해당 이미지의 URL을 저장
	        // 파일 업로드와 URL 저장을 위한 추가 로직을 구현
	        // 이후 product.setUrl(newImageUrl)을 통해 새로운 이미지 URL을 설정
	    	product.setUrl(url);
	    }else {
	    	product.setUrl(url2); // 기존 이미지 URL 설정
	    }
		productRepository.save(product);
		return "redirect:mypage";
	}
	// -- 상품 삭제 
	@RequestMapping("/productDelete")
	public String productDelete(@RequestParam("pno") Long pno) {
		productRepository.deleteByPno(pno);
		return "redirect:mypage";
	}
	//장바구니
	@RequestMapping("/cartDo")
	public String cart() {
		return "cartDo";
	}
}
