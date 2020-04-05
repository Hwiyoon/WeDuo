package com.weduo.caffeinme.member.dao;

import com.weduo.caffeinme.member.Member;

public interface IMemberDao {
	int memberInsert(Member member);
	Member memberSelect(Member member);
	int memberUpdate(Member member);
	int memberDelete(Member member);
	Member idCheck(String MID);

}
