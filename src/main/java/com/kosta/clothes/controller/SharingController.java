package com.kosta.clothes.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.service.SharingService;

@Controller
public class SharingController {
	
	@Autowired
	SharingService sharingService;
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/sharingList")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			List<Sharing> sharingList = sharingService.getSharingList();
			mav.addObject("sharingList", sharingList);
			mav.setViewName("/sharing/sharingList");
		} catch(Exception e){
			e.printStackTrace();
		}
		return mav;
	}
	
	@GetMapping("/sharingRegistForm")
	public String sharingRegistForm() {
		return "/sharing/sharingRegistForm";
	}
	
	@ResponseBody
	@PostMapping("/sharingRegist")
	public ModelAndView registSharing(@ModelAttribute Sharing sharing, Model model,
			@RequestParam("simageFile") MultipartFile[] files) {
		ModelAndView mav = new ModelAndView();
		try {
			Integer sharingid = sharingService.registSharing(sharing, files);
			Sharing sharingview = sharingService.viewSharing(sharingid);
			model.addAttribute("title", sharing.getStitle());
			model.addAttribute("content", sharing.getScontent());
			String[] fidArr = sharingview.getSfileids().split(",");
			
			mav.addObject("files", fidArr);
			mav.setViewName("redirect:/sharingList");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@GetMapping("/sharingView")
	public String sharingView() {
		return "/sharing/sharingView";
	}
	
}
