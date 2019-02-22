package kr.co.haedoang.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.haedoang.board.service.RegisterService;
import kr.co.haedoang.db.repository.domain.RegisterStaff;

@Controller
@RequestMapping("/board/register")
public class RegisterController {
	
	@Autowired
	private RegisterService service;
	
	@RequestMapping("/register.do")
	public void home(Model model) {
		model.addAttribute("data",service.data());
	}
	
	@RequestMapping("/doRegister.do")
	@ResponseBody
	public void doRegister(@RequestBody RegisterStaff registerStaff) {
		
		//staff 등록
		service.insertStaff(registerStaff);
		
		//skill 등록!
		int staffNo = registerStaff.getStaffNo();	
		service.insertStaffSkill(registerStaff);
		
	}
}
