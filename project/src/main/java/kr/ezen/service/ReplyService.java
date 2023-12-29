package kr.ezen.service;

import java.util.List;

import kr.ezen.project.domain.ReplyDTO;
import kr.ezen.project.domain.ReplyPageDTO;

public interface ReplyService {
	int register(ReplyDTO rDto);
	
	int remove(int rno);

	ReplyDTO read(int rno);

	int modify(ReplyDTO rDto);

//	List<ReplyDTO> getList(int bid);
	ReplyPageDTO getList(int bid, int vp);
	
	int replyCnt(int bid);
}
