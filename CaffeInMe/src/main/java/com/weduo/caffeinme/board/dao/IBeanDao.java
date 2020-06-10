package com.weduo.caffeinme.board.dao;

import java.util.List;

import com.weduo.caffeinme.board.Bean;
import com.weduo.caffeinme.board.BeanReview;
import com.weduo.caffeinme.board.BeanReviewDTO;
import com.weduo.caffeinme.board.BeanReviewList;

public interface IBeanDao {
	Bean selectBean(int bno);
	List<Bean> beanList();
	List<BeanReviewList> beanReviewList(int bno);
	BeanReview getBeanReview(int rno);
	int writeBeanReview(String MID, int BNO, BeanReviewDTO beanReviewDTO);
	void deleteBeanReview(int rno);

}
