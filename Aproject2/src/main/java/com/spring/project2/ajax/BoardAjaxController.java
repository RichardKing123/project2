package com.spring.project2.ajax;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project2.domain.Reply;
import com.spring.project2.service.BoardService;

@Controller
public  class  BoardAjaxController  {
	
@Autowired
BoardService  boardService;

@RequestMapping("/recommend.ajax")
@ResponseBody
public Map<String,  Integer>  recommend(int board_no,  String recommend)  {
	System.out.println(board_no);
	System.out.println(recommend);
	return  boardService.recommend(board_no,  recommend);
}


@RequestMapping("/replyUpdate.ajax")
@ResponseBody
public  List<Reply>  updateReply(Reply  reply)  {

	boardService.updateReply(reply);

	return  boardService.replyList(reply.getBbs_no());
}

@RequestMapping("/replyDelete.ajax")
@ResponseBody
public  List<Reply>  deleteReply(int  reply_no,  int  bbs_no)  {
	boardService.deleteReply(bbs_no);
	return  boardService.replyList(bbs_no);
}

@RequestMapping("/replyWrite.ajax")
@ResponseBody
public  List<Reply>  addReply(Reply reply)  {
	boardService.addReply(reply);
	return  boardService.replyList(reply.getBbs_no());
}
}


