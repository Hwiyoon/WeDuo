package com.weduo.caffeinme.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.weduo.caffeinme.board.Cafe;
import com.weduo.caffeinme.board.CafeReviewDTO;
import com.weduo.caffeinme.board.CafeReviewVO;
import com.weduo.caffeinme.board.dao.CafeDao;

public class CafeService implements ICafeService {
	
	@Autowired
	CafeDao dao;

	@Override
	public List<Cafe> searchCafeList(String keyword) {
		// TODO Auto-generated method stub	
		return dao.searchCafe(keyword);
	}
	
	@Override
	public Cafe selectCafe(int cno) {
		// TODO Auto-generated method stub
		return dao.selectCafe(cno);
	}
	
	@Override
	public void writeCafeReview(CafeReviewDTO cReviewDTO) {
		// TODO Auto-generated method stub
		int result = dao.cafeReviewWrite(cReviewDTO);
		
		if(result < 0) {
			System.out.println("카페 리뷰 작성 실패");
		}
		
	}
	
	@Override
	public List<CafeReviewVO> getCafeReviews(int cno) {
		// TODO Auto-generated method stub
		return dao.getCafeReviews(cno);
	}
	
	@Override
	public void deleteCafeReview(int rno) {
		// TODO Auto-generated method stub
		int result = dao.deleteCafeReview(rno);
		
		if(result == 0) {
			System.out.println("Cafe Review Delete Fail!!");
		}else {
			System.out.println("Cafe Review Delete Success!!");
		}
		
	}
	
	@Override
	public void modifyCafeReview(CafeReviewVO cReviewVO) {
		// TODO Auto-generated method stub
		int result = dao.modifyCafeReview(cReviewVO);
		
		if(result == 0) {
			System.out.println("Cafe Review Modify Fail!!");
		}else {
			System.out.println("Cafe Review Modify Success!!");
		}
		
	}

}
