package org.partnership.controller.employee;

import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.partnership.category.model.Category;
import org.partnership.category.service.CategoryService;
import org.partnership.converter.CategoryConverter;
import org.partnership.converter.LocationConverter;
import org.partnership.employee.model.Employee;
import org.partnership.employee.service.EmployeeService;
import org.partnership.location.model.Location;
import org.partnership.location.service.LocationService;
import org.partnership.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private LocationService locationService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private UserService userService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));
		binder.registerCustomEditor(Category.class, new CategoryConverter());
		binder.registerCustomEditor(Location.class, new LocationConverter());
	}
	
	Employee newEmployee(Principal principal){
		Employee employee = new Employee();
		employee.setUserId(userService.findUserByEmail(principal.getName()).getId());
		return employee;
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	private String register(Model model, Principal principal) {
		model.addAttribute("employee", newEmployee(principal));
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("listLocation", locationService.findAll());
		return "newemployee";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	private String createEmployee(RedirectAttributes redirectAttributes, @ModelAttribute("employee")@Valid Employee employee,
			BindingResult bindingResult, @RequestParam("fileUpload") MultipartFile[] fileUpload, Model model) throws IOException {
		if (bindingResult.hasErrors()) {
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("listLocation", locationService.findAll());
			return "newemployee";
		} else {
			try {
				if (!fileUpload[0].isEmpty())
					employee.setAvatar(fileUpload[0].getBytes());
				if (!fileUpload[1].isEmpty())
					employee.setCv(fileUpload[1].getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", employeeService.newEmployee(employee));
		}
		return "redirect:/";
	}
}
