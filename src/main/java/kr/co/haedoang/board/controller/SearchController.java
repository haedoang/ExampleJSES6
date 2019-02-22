package kr.co.haedoang.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.haedoang.board.service.SearchService;
import kr.co.haedoang.db.repository.domain.SearchStaff;

@Controller
@RequestMapping("/board/search")
public class SearchController {
	
	@Autowired
	private SearchService service;
	
	@RequestMapping("/search.do")
	public void home(Model model) {
		model.addAttribute("data",service.data());
	}
	
	@RequestMapping(value="/searchDetail.do")
	@ResponseBody
	public Map<String,Object> search(@RequestBody SearchStaff searchStaff) {
		System.out.println(searchStaff);
		return service.selectStaff(searchStaff);
	}
	
	
}
