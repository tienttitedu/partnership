package org.partnership.controller.home;

import java.security.Principal;

import javax.validation.Valid;

import org.partnership.company.service.CompanyService;
import org.partnership.employee.service.EmployeeService;
import org.partnership.user.model.User;
import org.partnership.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private CompanyService companyService;

	@RequestMapping(value = "/")
	private String home() {
		return "home";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registration(@Valid User user, BindingResult bindingResult, Model model,
			@RequestParam("role") String role, RedirectAttributes redirectAttributes) {
		return userService.save(user, bindingResult, role, redirectAttributes);
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("ERROR_MESSAGE", "Your email and password is invalid.");
		if (logout != null)
			model.addAttribute("SUCCESS_MESSAGE", "You have been logged out successfully.");
		return "home";
	}

	@RequestMapping(value = "/employeeprofile")
	public String profileEmployee(Principal principal, Model model) {
		User user = userService.findUserByEmail(principal.getName());
		return employeeService.findProfile(user, model);
	}

	@RequestMapping(value = "/employeeprofile/{id}")
	public String profileEmployee(@PathVariable("id") long id, Model model, RedirectAttributes redirectAttributes) {
		return employeeService.showProfile(id, model, redirectAttributes);
	}
	
	@RequestMapping(value = "/companyprofile")
	public String profileCompany(Principal principal, Model model) {
		User user = userService.findUserByEmail(principal.getName());
		return companyService.findProfile(user, model);
	}

	@RequestMapping(value = "/companyprofile/{id}")
	public String profileCompany(@PathVariable("id") long id, Model model, RedirectAttributes redirectAttributes) {
		return companyService.showProfile(id, model, redirectAttributes);
	}
}
