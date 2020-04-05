package com.weduo.caffeinme.board.dao;

import java.util.List;

import com.weduo.caffeinme.board.Cafe;

public interface ICafeDao {
	List<Cafe> searchCafe(String keyword);

}
