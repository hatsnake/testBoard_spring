package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.MemberService;
import kr.co.vo.MemberVO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	// 회원가입 화면
	@GetMapping("/member/register")
	public String getRegister() throws Exception {
		logger.info("get register");
		
		return "member/register";
	}
	
	// 회원가입
	@PostMapping("/member/register")
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");
		
		memberService.register(vo);
		
		return "redirect:/board/list";
	}
	
	// 로그인
	@PostMapping("/member/login")
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("login");
		
		HttpSession session = req.getSession();
		MemberVO login = memberService.login(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}
		
		return "redirect:/";
	}
	
	// 로그아웃
	@GetMapping("/member/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원 수정 화면
	@GetMapping("/member/memberUpdateView")
	public String registerUpdateView() throws Exception {
		return "member/memberUpdateView";
	}
	
	// 회원 수정
	@PostMapping("/member/memberUpdate")
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception {
		memberService.memberUpdate(vo);
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원 탈퇴 화면
	@GetMapping("/member/memberDeleteView")
	public String memberDeleteView() throws Exception {
		return "member/memberDeleteView";
	}
	
	// 회원 탈퇴
	@PostMapping("/member/memberDelete")
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		String sessionPass = member.getUserPass();
		String voPass = vo.getUserPass();
		
		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberDeleteView";
		}
		memberService.memberDelete(vo);
		session.invalidate();
		
		return "redirect:/";
	}
}
