package com.weduo.caffeinme.board.dao;

import java.util.List;

import com.weduo.caffeinme.board.Cafe;
import com.weduo.caffeinme.board.CafeReviewDTO;
import com.weduo.caffeinme.board.CafeReviewVO;

public interface ICafeDao {
	List<Cafe> searchCafe(String keyword);
	Cafe selectCafe(int cno);
	int cafeReviewWrite(CafeReviewDTO cReviewDTO);
	List<CafeReviewVO> getCafeReviews(int cno);
}
