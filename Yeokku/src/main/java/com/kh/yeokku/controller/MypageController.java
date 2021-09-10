package com.kh.yeokku.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yeokku.model.biz.MypageBiz;
import com.kh.yeokku.model.biz.impl.MypageBizImpl;
import com.kh.yeokku.model.dto.ProfileDto;
import com.kh.yeokku.model.dto.UserDto;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MypageBiz biz;
	
	@RequestMapping(value="/profile_upload.do",produces = "application/text; charset=utf8", method=RequestMethod.POST)
	@ResponseBody
	public String profileUpload(HttpServletRequest request,HttpSession session, String strImg) throws IOException {
		logger.info("page_canvasUpload > ");

		UserDto user_dto = (UserDto)session.getAttribute("user");
		int user_no = user_dto.getUser_no();
				
		String uploadpath="uploadfile\\";
		String folder=request.getServletContext().getRealPath("/") +uploadpath;
		String fullpath="";
		String[] strParts=strImg.split(",");
		String type = ".png";
		String rstStrImg=strParts[1];  //,로 구분하여 뒷 부분 이미지 데이터를 임시저장
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_hhmmss"); 
		String filename=sdf.format(new Date()).toString();
		BufferedImage image=null;
		byte[] byteImg = Base64.decodeBase64(rstStrImg);

		
		ByteArrayInputStream bis= new ByteArrayInputStream(byteImg);
		image= ImageIO.read(bis);   //BufferedImage형식으로 변환후 저장
		bis.close();

		fullpath=folder+filename+type;
		File folderObj= new File(folder);
		if( !folderObj.isDirectory() ) { folderObj.mkdir();}
		File outputFile= new File(fullpath);  //파일객체 생성
		if( outputFile.exists() ) {outputFile.delete();}
		ImageIO.write(image, "png", outputFile); //서버에 파일로 저장
		System.out.println(fullpath);
		System.out.println(folder);//경로
		System.out.println(type);//확장자명
		System.out.println(filename);//파일명
		
	
		boolean pf_chk = biz.profileCheck(user_no);// 프로필 사진이 등록되어 있으면 true 없으면 false
		if(outputFile.exists()) {
			System.out.println("생성됨");
			ProfileDto pfdto = new ProfileDto();
			pfdto.setPf_userno(user_no);
			pfdto.setPf_src(folder);
			pfdto.setPf_type(type);
			pfdto.setPf_name(filename);
			if(pf_chk) {
				int res = biz.profileUpdate(pfdto);
				if(res>0) {
					session.setAttribute("profile", pfdto);
					return "프로필 사진 수정 성공";
				}else {
					return "프로필 사진 수정 실패";
				}
			}else {
				int res = biz.profileUpload(pfdto);
				if(res>0) {
					session.setAttribute("profile", pfdto);
					return "프로필 사진 등록 성공";
				}else {
					return "프로필 사진 등록 실패";
				}
			}
		}else {
			return "사진 업로드 실패";
		}
	}
	
	@RequestMapping("/resign.do")
	public String resign(Model model, HttpSession session) {
		UserDto dto = (UserDto)session.getAttribute("user");
		System.out.println(dto.getUser_no());
		int res = biz.resign(dto.getUser_no());
		if(res>0) {
			session.invalidate();
			return "main/main";
		}else {
			return "mypage/mypage_profile"; 
		}
	}
}
