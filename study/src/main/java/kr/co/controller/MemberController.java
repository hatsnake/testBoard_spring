package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.MemberService;
import kr.co.vo.MemberVO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	// 회원가입 화면
	@GetMapping("/member/register")
	public String getRegister() throws Exception {
		logger.info("get register");
		
		return "member/register";
	}
	
	// 회원가입
	@PostMapping("/member/register")
	public String postRegister(MemberVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("post register");
		
		int result = memberService.idChk(vo);
		
		try {
			if(result == 1) {
				rttr.addFlashAttribute("msg", false);
				return "redirect:/member/register";
			} else if(result == 0) {
				String inputPass = vo.getUserPass();
				String pwd = pwdEncoder.encode(inputPass);
				vo.setUserPass(pwd);
				
				memberService.register(vo);
			}
		} catch(Exception e) {
			throw new RuntimeException();
		}
		
		return "redirect:/";
	}
	
	// 로그인
	@PostMapping("/member/login")
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("login");
		// HttpServletRequest req
		
		//HttpSession session = req.getSession();
		session.getAttribute("member");
		
		MemberVO login = memberService.login(vo);
		
		boolean pwdMatch = false;
		
		if(login != null) {
			pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		} else {
			pwdMatch = false;
		}
		
		
		if(login != null && pwdMatch == true) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
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
		
		/*
		MemberVO login = memberService.login(vo);
		
		boolean pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		if(pwdMatch) {
			memberService.memberUpdate(vo);
			session.invalidate();
		} else {
			return "member/memberUpdateView";
		}
		*/
		
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
		/*
		MemberVO member = (MemberVO) session.getAttribute("member");
		String sessionPass = member.getUserPass();
		String voPass = vo.getUserPass();
		
		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberDeleteView";
		}
		*/
		
		memberService.memberDelete(vo);
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원탈퇴용 비밀번호 체크
	@ResponseBody
	@PostMapping("/member/passChk")
	public boolean passChk(MemberVO vo) throws Exception {
		MemberVO login = memberService.login(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		return pwdChk;
	}
	
	@ResponseBody
	@PostMapping("/member/idChk")
	public int idChk(MemberVO vo) throws Exception {
		return memberService.idChk(vo);
	}
}
