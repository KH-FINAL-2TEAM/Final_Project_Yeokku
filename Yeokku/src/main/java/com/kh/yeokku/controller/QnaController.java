package com.kh.yeokku.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.yeokku.model.biz.QnaBiz;
import com.kh.yeokku.model.dto.NoticeDto;
import com.kh.yeokku.model.dto.QaDto;
import com.kh.yeokku.util.pagingVO;

@Controller
public class QnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaBiz biz;
	
	/*qna관련*/
	//공지사항 목록
	@RequestMapping("/qna_notice_form.do")
	public String noticeForm(Model model,pagingVO vo, String nowPage) {
		logger.info("SELECT NOTICE LIST");
		int total = biz.countNotice();
		
		
		int cntPerPage = 10;
		if (nowPage == null) {
			nowPage = "1";
		} 
		
		
		vo = new pagingVO(total, Integer.parseInt(nowPage), cntPerPage);
		model.addAttribute("paging", vo);
		model.addAttribute("list",biz.selectNoticeList(vo));
		return "qna/qna_notice";
	}
	
	
	
	
	
	
	//공지사항 게시글
	@RequestMapping("/qna_notice_detail.do")
	public String noticeDetail(Model model, int notice_no) {
		logger.info("SELECT NOTICE ONE");
		biz.updateViewCnt(notice_no);
		model.addAttribute("noticedto",biz.selectNoticeOne(notice_no));
		return "qna/qna_notice_detail";
	}
	//공지사항 작성페이지
	@RequestMapping("/qna_notice_insert.do")
	public String noticeInsertForm() {
		logger.info("INSERT NOTICE");
		return "qna/qna_notice_insert";
	}
	//공지사항 작성 결과
	@RequestMapping("/insertNotice.do")
	public String insertNotice(NoticeDto dto) {
		logger.info("INSERT RES");
		int res = biz.insertNotice(dto);
		if(res>0) {
			return "redirect:qna_notice_form.do";
		}else {
			return "redirect:qna_notice_insert.do";
		}
	
	}
	//공지사항 수정페이지
	@RequestMapping("/qna_notice_update.do")
	public String noticeUpdateForm(Model model, int notice_no) {
		logger.info("UPDATE NOTICE");
		model.addAttribute("noticedto",biz.selectNoticeOne(notice_no));
		return "qna/qna_notice_update";
	}
	//공지사항 수정 결과
	@RequestMapping("/updateNotice.do")
	public String updateNotice(NoticeDto dto) {
		logger.info("UPDATE RES");
		int res = biz.updateNotice(dto);
		if(res>0) {
			return "redirect:qna_notice_detail.do?notice_no="+dto.getNotice_no();
		}else {
			return "redirect:qna_notice_update.do?notice_no="+dto.getNotice_no();
		}
	
	}
	//공지사항 삭제
	@RequestMapping("/deleteNotice.do")
	public String deleteNotice(int notice_no) {
		logger.info("DELETE RES");
		int res = biz.deleteNotice(notice_no);
		if(res>0) {
			return "redirect:qna_notice_form.do";
		}else {
			return "redirect:qna_notice_detail.do?notice_no="+notice_no;
		}
		
	}
	//메일 문의 게시판
	@RequestMapping("/Qaform.do")
	public String Qaform() {
		logger.info("QA");
		return "qna/qna_mail";
	}
	//메일 문의하기
	@RequestMapping("/insertQa.do")
	public String insertQa(QaDto dto) {
		logger.info("INSERT QA");
		int res = biz.insertQna(dto);
		if(res>0) {
			return "redirect:Qaform.do";
		}else {
			return "redirect:Qaform.do";
		}
	}
	//자주묻는 질문게시판
	@RequestMapping("/Qnaform.do")
	public String Qnaform() {
		logger.info("Q&A");
		return "qna/qna_qna";
	}
	
	//찾아 오시는 길
	@RequestMapping("/traffic.do")
	public String trafficform() {
		logger.info("traffic");
		return "qna/qna_traffic";
	}
	
}
