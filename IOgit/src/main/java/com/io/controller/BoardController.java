package com.io.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.io.model.BoardDTO;
import com.io.model.TboardDTO;
import com.io.service.BoardService;
import com.io.service.TboardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
@Log4j
public class BoardController {

	private BoardService bs;
	private TboardService ts;

	@GetMapping("/list")
	public String list(HttpSession session, Model model) {
		 String logoutMessage = (String) session.getAttribute("logoutMessage");
		    if (logoutMessage != null) {
		        model.addAttribute("logoutMessage", logoutMessage);
		        session.removeAttribute("logoutMessage");
		    }
		Map<String, List<BoardDTO>> boardMap = bs.listGetBoard();
		log.info("boardMap" + boardMap);
		model.addAttribute("boardMap", boardMap);

		log.info("cateList" + bs.selectCateAll());
		model.addAttribute("cateList", bs.selectCateAll());
		return "board/list";
	}

	@GetMapping("/list/{caid}")
	public String lists(Model model, @PathVariable String caid) {
		BoardDTO dto = new BoardDTO();

		if (caid.equals("all")) {
			dto.setCaid(null);
		} else {
			dto.setCaid(caid);
		}

		log.info("dto value + " + dto);
		log.info("해당 list 값들" + bs.selectAllBoardOfCaid(dto));

		model.addAttribute("boardList", bs.selectAllBoardOfCaid(dto));
		model.addAttribute("cateList", bs.selectCateAll());

		return "/board/listView";

	}

	@GetMapping("/read")
	public void readBoard(@RequestParam("bno") long bno, Model model) {
		// 게시글 정보를 조회
		BoardDTO boardDTO = bs.readBoard(bno);
		log.info("기사정보조회");
		model.addAttribute("board", boardDTO);

	}

	// 이용자 글작성
	@GetMapping("/post")
	public void postForm() {
		log.info("기사작성폼실행");
		// 게시글 작성 폼
	}

	// 로그인 구현시 풀기
	/*
	 * @PostMapping("/post") public String post(@ModelAttribute TboardDTO TDTO,
	 * HttpSession session) { // 로그인 세션에서 사용자 이메일을 가져옵니다 String uemail = (String)
	 * session.getAttribute("userEmail");
	 * 
	 * if (uemail == null) { // 로그인 상태가 아니면 로그인 페이지로 리다이렉트 return
	 * "redirect:/user/login"; }
	 * 
	 * // TboardDTO에 이메일을 설정 TDTO.setUemail(uemail);
	 * 
	 * int postResult = ts.postTboard(TDTO); if (postResult > 0) { return
	 * "redirect:/board/list"; } else { return "redirect:/board/post"; } }
	 */
	@PostMapping("/post")
	public String post(@ModelAttribute TboardDTO TDTO, HttpSession session) {
		// 임시 로그인 상태 설정
		String uemail = (String) session.getAttribute("userEmail");
		if (uemail == null) {
			// 임시로 사용자 이메일 설정 (테스트 용)
			uemail = "user1@ex.com";
		}

		TDTO.setUemail(uemail);

		int postResult = ts.postTboard(TDTO);
		if (postResult > 0) {
			log.info("기사작성완료");
			return "redirect:/board/list";
		} else {
			log.info("기사작성실패");
			return "redirect:/board/post";
		}
	}

	// 게시글 수정 폼
	@GetMapping("/edit/{tno}")
	public String editForm(@PathVariable Long tno, Model model) {
		log.info("기존 게시글 " + tno + " 수정");
		TboardDTO tboardDTO = ts.getTboard(tno);

		// 게시글 정보
		model.addAttribute("tboard", tboardDTO);

		// 카테고리 목록을 추가로 가져오기 (필요한 경우)
		model.addAttribute("cateList", bs.selectCateAll());
		log.info("기사수정페이지");
		return "/board/edit";
	}

	// 게시글 수정 처리
	@PostMapping("/edit")
	public String editTboard(@ModelAttribute TboardDTO tboardDTO) {
		log.info("수정 완료 " + tboardDTO);
		ts.updateTboard(tboardDTO);
		return "redirect:/board/list";
	}

	// 게시글 삭제
	@PostMapping("/delete")
	public String deleteTboard(@RequestParam("bno") Long bno, HttpSession session) {
		log.info("삭제 요청된 게시글 ID: " + bno);

		try {
			// 게시글 삭제 처리
			ts.deleteTboard(bno);

			// 성공적으로 삭제된 경우
			log.info("게시글 삭제 완료: " + bno);
		} catch (Exception e) {
			// 삭제 작업 중 오류 발생 시 로깅 및 예외 처리
			log.error("게시글 삭제 실패: " + bno, e);
			// 사용자에게 오류 메시지를 전달하거나, 에러 페이지로 리다이렉트할 수 있음
			return "redirect:/board/error"; // 또는 에러 처리 페이지로 리다이렉트
		}

		return "redirect:/board/list";
	}

}
