package com.weduo.caffeinme.member.service;

import com.weduo.caffeinme.member.Member;

public interface IMemberService {
	void memberRegister(Member member);
	Member memberSearch(Member member);
	Member memberModify(Member member);
	int memberRemove(Member member);
	Member idCheck(String MID);

}
