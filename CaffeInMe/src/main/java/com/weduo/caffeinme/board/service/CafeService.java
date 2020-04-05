package com.weduo.caffeinme.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.weduo.caffeinme.board.Cafe;
import com.weduo.caffeinme.board.dao.CafeDao;

public class CafeService implements ICafeService {
	
	@Autowired
	CafeDao dao;

	@Override
	public List<Cafe> searchCafeList(String keyword) {
		// TODO Auto-generated method stub
		
		List<Cafe> cafes = dao.searchCafe(keyword);
		
		if(cafes.isEmpty())	return null;
		
		return cafes;
	}

}
