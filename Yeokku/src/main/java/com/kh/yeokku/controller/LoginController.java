package com.kh.yeokku.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yeokku.model.biz.LoginpageBiz;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	 private JavaMailSender mailSender;

	@Autowired
	private LoginpageBiz biz;
	

	@RequestMapping("/login.do")
	public String adminReport() {
		return "main/main";
	}
	
	@RequestMapping("/signup.do")
	public String signUp() {
		return "login/login_regi";
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
        String title = "회원가입 인증 이메일 입니다.";  //보낼 이메일 제목
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
	
}
