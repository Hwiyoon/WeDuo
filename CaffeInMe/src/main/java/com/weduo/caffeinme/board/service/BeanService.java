package com.weduo.caffeinme.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.weduo.caffeinme.board.Bean;
import com.weduo.caffeinme.board.BeanReview;
import com.weduo.caffeinme.board.BeanReviewDTO;
import com.weduo.caffeinme.board.BeanReviewList;
import com.weduo.caffeinme.board.dao.BeanDao;

public class BeanService implements IBeanService {

	@Autowired
	BeanDao dao;
	
	@Override
	public List<Bean> beanList() {
		// TODO Auto-generated method stub
		List<Bean> beans = dao.beanList();
		return beans;
	}
	
	@Override
	public Bean beanSearch(int bno) {
		// TODO Auto-generated method stub
		Bean searchedBean = dao.beanSelect(bno);
		return searchedBean;
	}
	
	@Override
	public List<BeanReviewList> beanReviewList(int bno) {
		// TODO Auto-generated method stub
		List<BeanReviewList> reviews = dao.beanReviewList(bno);
		return reviews;
	}
	
	@Override
	public BeanReview getBeanReview(int rno) {
		// TODO Auto-generated method stub
		BeanReview selectedReview = dao.getBeanReview(rno);
		return selectedReview;
	}
	
	@Override
	public int writeBeanReview(String mid, int bno, BeanReviewDTO beanReviewDTO) {
		// TODO Auto-generated method stub
		int result = dao.beanReviewWrite(mid, bno, beanReviewDTO);
		
		if (result == 0) {
			System.out.println("Join Fail!!");
		} else {
			System.out.println("Join Success!!");
		}
		
		return result;
	}

}
