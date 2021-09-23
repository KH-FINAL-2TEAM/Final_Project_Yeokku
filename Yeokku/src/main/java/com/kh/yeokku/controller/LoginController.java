package com.kh.yeokku.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.yeokku.model.biz.LoginpageBiz;
import com.kh.yeokku.model.dto.NaverLoginBO;
import com.kh.yeokku.model.dto.ProfileDto;
import com.kh.yeokku.model.dto.UserDto;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	HttpServletResponse response;
	
	@Autowired
	 private JavaMailSender mailSender;

	@Autowired
	private LoginpageBiz biz;

	
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
    
	
	
	@RequestMapping("/test.do")
	public String test() {
		return "login/test";
	}
	@RequestMapping("/signup.do")
	public String signUp() {
		return "login/login_regi";
	}
	@RequestMapping("/idfind.do")
	public String idFindPage() {
		return "login/login_findid";
	}
	@RequestMapping("/pwfind.do")
	public String pwFindPage() {
		return "login/login_findpw";
	}
	@RequestMapping("/redirect.do")
	public String redirectPage() {
		return "login/kakaoRedirectForm";
	}
	
	
	//로그인
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> logIn(HttpSession session, @RequestBody UserDto dto) {
		
		UserDto user = biz.login(dto);
		boolean check = false;
		
		if(user!=null) {
			ProfileDto pfdto = biz.profile(user);
			if(pfdto!=null) {
				session.setAttribute("profile", pfdto);
			}
			session.setAttribute("user", user);
			check = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
	 return map;
	}

	
	
	
	//회원가입 - 아이디 중복확인 
	@RequestMapping("/idchk.do")
	public String idChk(Model model, String user_id) {
		String res = biz.idChk(user_id);
		boolean idnotused;
		
		
		if(res.equals("none")) {
			idnotused = true;
			model.addAttribute("idnotused", idnotused);
		}else {
			idnotused = false;
			model.addAttribute("idnotused", idnotused);
		}
		
		
		return "/login/login_idchk";
	}
	
	
	//이메일 인증 
    @RequestMapping(value="/mailCheck.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호 " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "heyon123@naver.com"; //applicationContext에 넣은 내 이메일 주소 
        String toMail = email; 					 //수신받을 이메일 
        String title = "[Yeokku]회원가입 인증 이메일 입니다.";  //보낼 이메일 제목
        String content = 						//보낼 이메일 내용
                "🏝[Yeokku]🏝를 방문해주셔서 감사합니다." +
        		"<hr>"+
                "인증 번호는 <b style='color:red;'>" + checkNum + "</b>입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
              
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
       
        
        //인증번호 jsp로 전송 
        String num = Integer.toString(checkNum);
        
        return num;
    }
    
    //회원가입 
    @RequestMapping("/insertuser.do")
    public String insertUser(Model model, @ModelAttribute UserDto dto) {
    	int res = biz.insert(dto);
    	
    	if(res>0) {
    		return "login/login";
    	}else {
    		
    		try {
				jsResponse("회원가입 실패.",response);
			} catch (IOException e) {
				e.printStackTrace();
			}
    		return "redirect:signup.do";
    	}
    	
    	
    }
    
    //아이디 찾기
    @RequestMapping("/idFind.do")
    @ResponseBody
    public void idFind(String user_name, String user_email) {
    	
    	UserDto dto = new UserDto();
    	dto.setUser_name(user_name);
    	dto.setUser_email(user_email);
    	
    	UserDto user = biz.findId(dto);
    	
    	
    	//아이디 받아옴 
    	String id = user.getUser_id();
    	
    	//이메일 보내기 
        String setFrom = "heyon123@naver.com"; //applicationContext에 넣은 내 이메일 주소 
        String toMail = dto.getUser_email(); 					 //수신받을 이메일 
        String title = "[Yeokku]회원님의 아이디를 확인하세요.";  //보낼 이메일 제목
        String content = 						//보낼 이메일 내용
                "🏝[Yeokku]🏝" +
        		"<hr>"+
                "회원님의 아이디는  <b style='color:red;'>" +id+ "</b>입니다." + 
                "<br>" + 
                "다시 로그인 부탁드립니다.";
              
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
    	
    }
    
    
    
    //비밀번호 찾기
    @RequestMapping("/pwFind.do")
    @ResponseBody
    public void pwFind(Model model, String user_name, String user_email, String user_id) {
    	
    	UserDto dto = new UserDto();
    	dto.setUser_name(user_name);
    	dto.setUser_email(user_email);
    	dto.setUser_id(user_id);
    	
    	UserDto user = biz.findPw(dto);
    	
    	
    	//비밀번호 받아옴 
    	String pw = user.getUser_pw();
    	
    	model.addAttribute("pw", pw);
    	
    	
    	//이메일 보내기 
        String setFrom = "heyon123@naver.com"; //applicationContext에 넣은 내 이메일 주소 
        String toMail = dto.getUser_email(); 					 //수신받을 이메일 
        String title = "[Yeokku]회원님의 비밀번호를 확인하세요.";  //보낼 이메일 제목
        String content = 						//보낼 이메일 내용
                "🏝[Yeokku]🏝" +
        		"<hr>"+
                "회원님의 비밀번호는  <b style='color:red;'>" +pw+ "</b>입니다." + 
                "<br>" + 
                "다시 로그인 부탁드립니다.";
              
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
    	
        
    }
    
    
    
    //*** 네이버 로그인
    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/login_form.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        //System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
 
        /* 생성한 인증 URL을 View로 전달 */
        return "login/login";
    }
 
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/naverredirect.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        model.addAttribute("result", apiResult);
 
        /* 네이버 로그인 성공 페이지 View 호출 */
        return "login/naverRedirectForm";
    }
    
    
    
    //로그아웃 
    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
    	
    	session.invalidate();
    	return "redirect:login_form.do";
    }
    
    
    
	
    
    
    private void jsResponse(String msg,  HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"
					+ "alert('"+msg+"');"
					+ "</script>";
					
			PrintWriter out = response.getWriter();
			out.print(s);
			
			
	}
    
}
