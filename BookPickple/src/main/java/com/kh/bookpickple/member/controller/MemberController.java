package com.kh.bookpickple.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bookpickple.common.exception.MemberException;
import com.kh.bookpickple.member.model.service.MemberService;
import com.kh.bookpickple.member.model.vo.Member;

@SessionAttributes(value= { "isLogin", "member" })
@Controller
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/member/memberJoinView.do")
	public String memberJoinView() {
		return "common/join";
	}
	
	@RequestMapping("/member/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate(@RequestParam String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable = memberService.checkIdDuplicate(userId) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	@RequestMapping("/member/checkEmailDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkEmailDuplicate(@RequestParam String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable = memberService.checkEmailDuplicate(email) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	@RequestMapping("/member/memberJoinEnd.do")
	public String memberJoin(Member member, Model model) {
		
		String plainPassword = member.getPassword();
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		member.setPassword(encryptPassword);
		
		try {
			int result = memberService.insertMember(member);
			
			String loc = "/";
			String msg = "";
			
			if(result > 0) msg = "회원가입이 되었습니다. 로그인 후 이용하세요.";
			else msg = "회원가입이 되지 않았습니다. 관리자에게 문의하세요.";
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			System.out.println("회원 가입 에러 발생");
			throw new MemberException(e.getMessage());
		}
		
		return "common/msg";
	}
	
	@RequestMapping("/member/memberLoginView.do")
	public String memberLoginView() {
		return "common/login";
	}
	
	@RequestMapping("/member/memberLoginEnd.do")
	public ModelAndView memberLogin(@RequestParam String userId, @RequestParam String password) {
		
		ModelAndView mv = new ModelAndView();
		
		String loc = "";
		String msg = "";
		
		Member m = memberService.loginMember(userId);
		
		if ( m == null ) {
			loc = "/member/memberLoginView.do";
			msg = "존재하지 않는 아이디입니다.";
		} else {
			if( m.getStatus().equals("N")) {
				loc = "/member/memberLoginView.do";
				msg = "탈퇴한 회원입니다. 다시 회원가입을 진행해주세요.";
			} else {
				if( bcryptPasswordEncoder.matches(password, m.getPassword()) ) {
					loc = "/";
					msg = "로그인에 성공하였습니다";
					// 회원가입 시 자동으로 MEMBER가 세션에 들어가서 isLogin으로 세션 유무 구분
					mv.addObject("isLogin", true);
					mv.addObject("member", m);
				} else {
					loc = "/member/memberLoginView.do";
					msg = "비밀번호가 일치하지 않습니다.";
				}
			}
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/member/memberLogout.do")
	public ModelAndView memberLogout(SessionStatus sessionStatus, HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(false);

		String loc = "";
		String msg = "";
		
		if(!sessionStatus.isComplete()) {
			loc = "/";
			msg = "로그아웃 되었습니다.";
			mv.addObject("isLogin", false);
			sessionStatus.setComplete();
			
			// 다른 controller에서 session으로 연결한 부분들도 끊기
			// ex) 최근 본 도서.. 이게 없으면 로그아웃해도 계속 최근 본 도서가 유지되고있음.
			if( session != null) {
				session.invalidate();  
			}
			
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/member/memberProfileView.do")
	public String memberProfileView(@RequestParam int userNo, Model model) {
		
		Member m = memberService.selectOneMember(userNo);
		model.addAttribute("member", m);
		
		return "mypage/member/profile";
	}
	
	@RequestMapping("/member/confirmPwdView.do") 
	public String memberConfirmPwdView() {
		return "mypage/member/confirmPwd";
	}

	@RequestMapping("/member/confirmPwd.do")
	public String confirmPwd(@RequestParam int userNo, @RequestParam String password, Model model) {
		
		String loc="";
		String msg = "";
		
		Member m = memberService.selectOneMember(userNo);
		
		if ( password == "" || password == null ) {
			loc = "/member/confirmPwdView.do";
			msg = "비밀번호를 입력하지 않으셨습니다.";
		} else {
			if( bcryptPasswordEncoder.matches(password, m.getPassword())) {
				loc = "/member/memberUpdateView.do?userNo=" + userNo;
				msg = "비밀번호 확인이 되었습니다.";
			} else {
				loc = "/member/confirmPwdView.do";
				msg = "비밀번호가 일치하지 않습니다.";
			}
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/memberUpdateView.do")
	public String memberUpdateView(@RequestParam int userNo, Model model) {
		
		Member m = memberService.selectOneMember(userNo);
		model.addAttribute("member", m);
		
		return "mypage/member/updateProfile";
	}
	
	@RequestMapping("/member/memberUpdateEnd.do") 
	public String memberUpdate(@RequestParam int userNo, Member member, Model model) {
		
		String plainPassword = member.getPassword();
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		member.setPassword(encryptPassword);
		
		try {
			int result = memberService.updateMember(member);
			
			String loc="";
			String msg = "";
			
			if( result > 0 ) {
				loc = "/member/memberProfileView.do?userNo=" + userNo;
				msg = "회원 정보 수정이 되었습니다.";
				model.addAttribute("member", member);
			} else {
				loc = "/member/memberUpdateView.do?userNo=" + userNo;
				msg = "회원 정보 수정에 실패하였습니다. 관리자에게 문의해주세요.";
			}
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			System.out.println("회원 정보 수정 에러 발생");
			throw new MemberException(e.getMessage());
		}
		
		return "common/msg";
	}
	
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(SessionStatus sessionStatus, Model model, Member member) {
		
		int result = memberService.deleteMember(member.getUserNo());
		
		if( result > 0 ) sessionStatus.setComplete();
		
		String loc = "/";
		String msg = "";
		
		if( result > 0 ) msg = "회원 탈퇴가 되었습니다.";
		else msg = "회원 탈퇴에 실패하였습니다. 관리자에게 문의헤주세요.";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/findIdPwdView.do")
	public String findIdPwdView() {
		return "common/findIdPwd";
	}
	
	@RequestMapping("/member/findId.do")
	@ResponseBody 
	public String findId(@RequestParam String findIdByEmail) {
		
		String userId = memberService.findIdByEmail(findIdByEmail);

		if(userId != null) {
			return userId;
		} else {
			return "failFindId";
		}
	};
	
	@RequestMapping("/member/findPwd.do")
	@ResponseBody 
	public String findPwd(@RequestParam String userId, @RequestParam String email, Member member) {
		Member m = memberService.isExistMember(member);
		
		if(m != null) {
			String newPwd = getRandomPwd(7);
			String encryptPassword = bcryptPasswordEncoder.encode(newPwd);
			member.setPassword(encryptPassword);
			
			sendMail(email, newPwd);
			
			int result = memberService.updateNewPwd(member);
			
			if(result > 0) {
				return "successNewPwd";
			} else {
				return "failNewPwd";
			}
		} else {
			return "nonexistent";
		}
	}

	public static String getRandomPwd(int len) {
      char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
            'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
      };
      
      int idx = 0; 
      
      StringBuffer sb = new StringBuffer();
      
      for (int i = 0; i < len; i++) {
         idx = (int)(charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출
         sb.append(charSet[idx]);
      }
      
      return sb.toString();
   }
	
	 private void sendMail(String email, String newPwd) {
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body>");
		sb.append("<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>");
		sb.append("<h3>BookPickple에서 임시 비밀번호를 발급하였습니다.</h3>");
		sb.append("<p>"+ newPwd +"</p>");
		sb.append("</body></html>");
		String body = sb.toString();
		memberService.sendMail(email, "[BookPickple] 임시 비밀번호입니다.", body);
	}
}
