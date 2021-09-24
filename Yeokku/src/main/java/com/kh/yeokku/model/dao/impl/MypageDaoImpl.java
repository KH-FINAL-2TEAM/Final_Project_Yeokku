package com.kh.yeokku.model.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yeokku.model.dao.MypageDao;
import com.kh.yeokku.model.dto.LikeTourDto;
import com.kh.yeokku.model.dto.ProfileDto;
import com.kh.yeokku.model.dto.QaDto;
import com.kh.yeokku.model.dto.TourCourseDto;
import com.kh.yeokku.model.dto.TourCourseReviewDto;
import com.kh.yeokku.model.dto.TourReviewDto;
import com.kh.yeokku.model.dto.UserDto;
import com.kh.yeokku.util.pagingVO;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int profileUpload(ProfileDto pfdto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"profile_upload",pfdto);
			
		} catch (Exception e) {
			System.out.println("[error] : profile upload error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public boolean profileCheck(int user_no) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"profile_check",user_no);
			System.out.println("개수 : " +res);
			
		} catch (Exception e) {
			System.out.println("[error] : profile check error");
			e.printStackTrace();
		}
		
		if(res>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public int profileUpdate(ProfileDto pfdto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"profile_update",pfdto);
			
		} catch (Exception e) {
			System.out.println("[error] : profile update error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int resign(int user_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"resign",user_no);
			
		} catch (Exception e) {
			System.out.println("[error] : resign error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int userInfoUpdate(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"user_info_update",dto);
			
		} catch (Exception e) {
			System.out.println("[error] : user info update error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<QaDto> userQnaAllList(QaDto dto) {
		List<QaDto> list = new ArrayList<QaDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"user_qna_list_all",dto);
		} catch (Exception e) {
			System.out.println("[error] : user qna all list error");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<QaDto> userQnaList(QaDto dto) {
		List<QaDto> list = new ArrayList<QaDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"user_qna_list",dto);
		} catch (Exception e) {
			System.out.println("[error] : user qna list error");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<LikeTourDto> mypageTravel(int no) {
		List<LikeTourDto> list = new ArrayList<LikeTourDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"mypage_travel",no);
		} catch (Exception e) {
			System.out.println("[error] : mypage travel");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<TourReviewDto> tourReviewList(int tr_userno) {
		List<TourReviewDto> list = new ArrayList<TourReviewDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"tour_review_list",tr_userno);
		} catch (Exception e) {
			System.out.println("[error] : user tour review list error");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<TourCourseReviewDto> courseReviewList(int tcr_userno) {
		List<TourCourseReviewDto> list = new ArrayList<TourCourseReviewDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"course_review_list",tcr_userno);
		} catch (Exception e) {
			System.out.println("[error] : user course review list error");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int countCourse() {
		int cnt = 0;
		
		try {
			cnt = sqlSession.selectOne(NAMESPACE+"countBoard");
		} catch (Exception e) {
			System.out.println("[error] : count course list");
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	@Override
	public List<TourCourseDto> myCourse(pagingVO vo) {
		List<TourCourseDto> list = new ArrayList<TourCourseDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectBoard",vo);
		} catch (Exception e) {
			System.out.println("[error] : select course list");
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
}
