package com.weduo.caffeinme.board.service;

import java.util.List;

import com.weduo.caffeinme.board.Cafe;
import com.weduo.caffeinme.board.CafeReviewDTO;
import com.weduo.caffeinme.board.CafeReviewVO;

public interface ICafeService {
	List<Cafe> searchCafeList(String keyword);
	Cafe selectCafe(int cno);
	void writeCafeReview(CafeReviewDTO cReviewDTO);
	List<CafeReviewVO> getCafeReviews(int cno);
}
