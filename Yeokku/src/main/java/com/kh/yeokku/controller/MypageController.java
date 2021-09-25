package com.kh.yeokku.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

import com.google.gson.Gson;
import com.kh.yeokku.model.biz.MypageBiz;
import com.kh.yeokku.model.biz.impl.MypageBizImpl;
import com.kh.yeokku.model.dto.LikeTourCourseDto;
import com.kh.yeokku.model.dto.LikeTourDto;
import com.kh.yeokku.model.dto.ProfileDto;
import com.kh.yeokku.model.dto.QaDto;
import com.kh.yeokku.model.dto.RoomDto;
import com.kh.yeokku.model.dto.TourCourseReviewDto;
import com.kh.yeokku.model.dto.TourReviewDto;
import com.kh.yeokku.model.dto.UserDto;
import com.kh.yeokku.util.pagingVO;

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
	
	@RequestMapping(value="/user_info_update.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String userInfoUpdate(Model model, UserDto dto, HttpSession session) {
		int res = biz.userInfoUpdate(dto);
		if(res>0) {
			UserDto user_dto = (UserDto) session.getAttribute("user");
			dto.setUser_id(user_dto.getUser_id());
			dto.setUser_name(user_dto.getUser_name());
			dto.setUser_email(user_dto.getUser_email());
			dto.setUser_able(user_dto.getUser_able());
			dto.setUser_role(user_dto.getUser_role());
			
			session.setAttribute("user", dto);
			return "수정 완료";
		}else {
			return "수정 실패";
		}
		
	}
	
	@RequestMapping(value="/qna_list.do", method = RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String qnaList(Model model,QaDto dto) {
		
		if(dto.getQa_confirm() == null) {
			List<QaDto> list = biz.userQnaAllList(dto);
			Gson gson = new Gson();
			String json = gson.toJson(list);
			return json;
		}else {
			List<QaDto> list = biz.userQnaList(dto);
			Gson gson = new Gson();
			String json = gson.toJson(list);
			return json;
		}
	}
	
	@RequestMapping(value="/mypage_travel_form.do")
	public String mypageTravel(Model model,HttpSession session) {
		UserDto user = (UserDto) session.getAttribute("user");
		int no = user.getUser_no();
		
		List<LikeTourDto> list = biz.mypageTravel(no);
		model.addAttribute("list",list);
		return "mypage/mypage_travel";
	}
	
	@RequestMapping(value="/tour_review_list.do", method = RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String tourReviewList(Model model,int tr_userno) {
		
		
			List<TourReviewDto> list = biz.tourReviewList(tr_userno);
			Gson gson = new Gson();
			String json = gson.toJson(list);
			return json;
	}
	
	@RequestMapping(value="/course_review_list.do", method = RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String courseReviewList(Model model,int tcr_userno) {
		
		
			List<TourCourseReviewDto> list = biz.courseReviewList(tcr_userno);
			Gson gson = new Gson();
			String json = gson.toJson(list);
			return json;
	}
	
	@RequestMapping("/mycourseform.do")
	public String mypageCourse(Model model,pagingVO vo, String nowPage, HttpSession session) {
		UserDto user = (UserDto) session.getAttribute("user");
		String search = user.getUser_id();
		
		int total = biz.countCourse(search);
		
		int cntPerPage = 5;
		if (nowPage == null) {
			nowPage = "1";
		}
		
		vo = new pagingVO(total, Integer.parseInt(nowPage), cntPerPage, search);
		System.out.println(vo.getSearch());
		model.addAttribute("paging", vo);
		model.addAttribute("list",biz.myCourse(vo));
		
		List<RoomDto> clist = new ArrayList<RoomDto>();
		RoomDto ltcdto = new RoomDto();
		int user_no = user.getUser_no();
		/*user_no가 좋아하는 tc_no 가져오기*/
		List<LikeTourCourseDto> like = biz.likecourse(user_no);
		//System.out.println("과연 like에는 담겨 있는가 dto가"+like.get(0).getLtc_tcno());
		
		if(like != null) {
			for(int i=0; i<like.size(); i++) {
				LikeTourCourseDto dto = like.get(i);
				int ltc_no = dto.getLtc_tcno();
				/*해당 유저가 좋아하는 코스의 dto 하나씩 꺼내는중*/
				ltcdto = biz.selectLikeCourse(ltc_no);
				/*꺼낸 dto를  roomdto list에 담기*/
				clist.add(ltcdto);				
			}
			/*clist에는 좋아하는 코스 dto들이 담긴 상태*/
			System.out.println(clist.size());
		}
		
		if(clist != null) {
			for(int i=0; i<clist.size(); i++) {
				RoomDto dto = new RoomDto();
				dto = clist.get(i);
				String temp_content = dto.getTc_content();
				temp_content = temp_content.replace( "<img class=\"OF\" src=\"resources/img/Course/Minus.png\">", "");
				temp_content = substringBetween(temp_content, "<img class=", ">");
				temp_content = substringBetween(temp_content, "src=\"", "\"");
				dto.setTc_content( temp_content );	
				clist.set(i, dto);
			}
			model.addAttribute("clist", clist);			
		}
		
		
		return "mypage/mypage_course";
	}
	
	
	
	
	private String substringBetween(String str, String open, String close) {
	    if (str == null || open == null || close == null) {
	       return null;
	    }
	    int start = str.indexOf(open);
	    if (start != -1) {
	       int end = str.indexOf(close, start + open.length());
	       if (end != -1) {
	          return str.substring(start + open.length(), end);
	       }
	    }
	    return null;
	}
	
	
}
