package com.weduo.caffeinme.board.service;

import java.util.List;

import com.weduo.caffeinme.board.Cafe;

public interface ICafeService {
	List<Cafe> searchCafeList(String keyword);
}
