package kr.co.haedoang.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.haedoang.board.service.UpdateService;
import kr.co.haedoang.db.repository.domain.RegisterStaff;

@Controller
@RequestMapping("/board/update")
public class UpdateController {
	
	@Autowired
	private UpdateService service;
	
	@RequestMapping("/update.do")
	public void list(Integer staffNo, Model model) {
		model.addAttribute("data",service.data(staffNo));
		
	}
	//update ajax
	@RequestMapping("/doUpdate.do")
	@ResponseBody
	public void doUpdate(@RequestBody RegisterStaff registerStaff) {
		service.updateStaffInfo(registerStaff);
	}
	
	@RequestMapping("/doDelete.do")
	@ResponseBody
	public void doDel(int staffNo) {
		System.out.println(staffNo);
		service.deleteStaff(staffNo);
	}
}
