package com.weduo.caffeinme.board.service;

import java.util.List;

import com.weduo.caffeinme.board.Bean;
import com.weduo.caffeinme.board.BeanReview;
import com.weduo.caffeinme.board.BeanReviewDTO;
import com.weduo.caffeinme.board.BeanReviewList;

public interface IBeanService {
	Bean beanSearch(int bno);
	List<Bean> beanList();
	List<BeanReviewList> beanReviewList(int bno);
	BeanReview getBeanReview(int rno);
	int writeBeanReview(String mid, int bno, BeanReviewDTO beanReviewDTO);
}
