package org.partnership.controller.admin;

import org.partnership.company.service.CompanyService;
import org.partnership.post.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private CompanyService companyService;
	@Autowired
	private PostService postServices;
	
	@RequestMapping(value="/companies")
	private String companies(Model model){
		model.addAttribute("companies", companyService.findAll());
		return "admincompanies";
	}
	
	@RequestMapping(value="/companies/delete/{id}")
	private String deleteCompany(@PathVariable long id, RedirectAttributes redirectAttributes){
		redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", companyService.delete(id));
		return "redirect:/admin/companies";
	}
	
	@RequestMapping(value="/posts")
	private String managePost(Model model, @RequestParam(defaultValue="1")int page){
		return postServices.getAdminPost(model, page);
	}
}
