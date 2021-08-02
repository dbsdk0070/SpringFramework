package com.spring.biz.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.biz.member.service.MemberService;
import com.spring.biz.member.service.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberservice;

	//회원가입 ----------------------------------------------------
	// 회원가입 페이지로 이동
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signupView() {
		return "/signup.jsp";
	}
	
	//회원가입 insert
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String signup(MemberVO vo) {
		memberservice.insertMember(vo);
		System.out.println(vo);
		return "/main.jsp";
	}
	
	//로그인 -----------------------------------------------------
	//로그인 페이지로 이동
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginView() {
		return "/login.jsp";
	}

	
	
	
	
	
	
	
	
	/*
	 * // 회원가입 완료 페이지로 이동
	 * 
	 * @RequestMapping(value = "/signup.do", method = RequestMethod.POST) public
	 * String signup(MemberVO vo, Model model) { memberSerivce.insertMember(vo);
	 * return "/member/signupSuccess.jsp"; }
	 * 
	 * // 아이디 중복확인
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/id_check.do", method = RequestMethod.POST) public
	 * String id_check(HttpServletRequest request, Model model) { String id =
	 * request.getParameter("userID"); int result = memberSerivce.idCheck(id);
	 * return String.valueOf(result); }
	 */
	// 로그인 --------------------------------------------------------------

	

	/*
	 * //회원 정보 업데이트 -------------------------------------------------------- //로그인
	 * 유저 정보 상세 조회
	 * 
	 * @RequestMapping(value = "/updateView.do", method = RequestMethod.GET) public
	 * String updateView(MemberVO vo, HttpServletRequest request, Model model){
	 * 
	 * HttpSession session = request.getSession(); String loginId = (String)
	 * session.getAttribute("loginId"); System.out.println(">>" + loginId);
	 * memberSerivce.viewmember(loginId);
	 * 
	 * if(loginId.contains("@")) { System.out.println("카카오 사용자찡");
	 * model.addAttribute("email",session.getAttribute("email"));
	 * model.addAttribute("id",session.getAttribute("email"));
	 * model.addAttribute("name",session.getAttribute("nickname"));
	 * 
	 * return "/myPage/updateView.jsp";
	 * 
	 * } else { model.addAttribute("updateView", memberSerivce.viewmember(loginId));
	 * return "/myPage/updateView.jsp"; } }
	 * 
	 * //회원 정보 업데이트
	 * 
	 * @RequestMapping("/updateMember.do") public String updateMember(MemberVO vo,
	 * Model model, HttpServletRequest request) {
	 * 
	 * memberSerivce.updateMyPage(vo); model.addAttribute("updateView", vo);
	 * System.out.println("update vo : " + vo); //이전 URL 값을 불러온다 String referer =
	 * request.getHeader("Referer"); //이전 URL에 쿠폰키를 같이 보낸다 (즉, 이전페이지로 돌아간다) return
	 * "redirect:"+ referer; }
	 * 
	 * //비밀번호 업데이트
	 * 
	 * @RequestMapping(value = "/updatePwd.do", method = RequestMethod.POST) public
	 * String updatePwd(@RequestParam("password") String password,
	 * HttpServletRequest request, MemberVO vo) { HttpSession session =
	 * request.getSession(); String id = (String) session.getAttribute("loginId");
	 * vo.setId(id); vo.setPassword(password); System.out.println(">>>>>>>>>>>>>" +
	 * vo); memberSerivce.updatePwd(vo);
	 * 
	 * //이전 URL 값을 불러온다 String referer = request.getHeader("Referer"); //이전 URL에
	 * 쿠폰키를 같이 보낸다 (즉, 이전페이지로 돌아간다) return "redirect:"+ referer; }
	 * 
	 * //회원탈퇴
	 * 
	 * @RequestMapping("/deleteMember.do") public String
	 * deleteMember(@RequestParam("password_check") String password) {
	 * memberSerivce.deleteMember(password);
	 * 
	 * return "./member/withDrawalSuccess.jsp"; }
	 * 
	 */
}
