package com.school.library.controller;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.school.library.entity.BookUserEntity;
import com.school.library.entity.UserEntity;
import com.school.library.exception.Message;
import com.school.library.service.DashboardService;
import com.school.library.service.UserService;

@Controller
@RequestMapping("/admin")
public class DashboardController {

	public static final Logger logger = LoggerFactory.getLogger(DashboardController.class);

	@Autowired
	private UserService userService;
	
	@Autowired
	private DashboardService dashboardService;

	@GetMapping("/dashboard")
	public String dashboardPage(@RequestParam(value="bookId",required=false) String bookId, Model model) {
		
		if(StringUtils.isNoneBlank(bookId)){
			model.addAttribute("allottedBook", dashboardService.findBookDetails(bookId.trim()));
			model.addAttribute("searchedId", bookId);
		}
		
		model.addAttribute("overduebooks", dashboardService.getAllOverDueBooks());
		model.addAttribute("usernames", dashboardService.getAllRegisteredUserNames());

		model.addAttribute("bookreq", dashboardService.getAllActionRequiredBooks());
		model.addAttribute("bookhistory", dashboardService.getBooksHistory());
		
		model.addAttribute("userreq", dashboardService.getNewRegisteredUsers());
		model.addAttribute("userhistory", dashboardService.getUserHistory());
		
		return "admin-dashboard";
	}
	
	@GetMapping("/assign/book/{bookId}/user/{userId}")
	public String assignBookToUser(@PathVariable("bookId") String bookId, @PathVariable("userId") String userId, 
			RedirectAttributes redirectAttrs) {
		if(StringUtils.isBlank(bookId) || StringUtils.isBlank(userId)) {
			redirectAttrs.addFlashAttribute("message", new Message("danger","Error", "BookId and UserId is mandatory"));
			return "redirect:/admin/dashboard";
		}
		
		BookUserEntity bookUserEntity = dashboardService.assignBookToUser(bookId, userId);
		
		String details = "Book with id: " + bookId + " Assigned to " + userId+ " till Date: "+ bookUserEntity.getDueDate();
		System.out.println(details);
		redirectAttrs.addFlashAttribute("message", new Message("success","Book Assigned", details));
		return "redirect:/admin/dashboard";
	}
	
	@GetMapping("/approve/user/{userId}")
	public String approveUserRequest(@PathVariable("userId") String userId, @RequestParam(value="comment",required=false) String comment, 
			RedirectAttributes redirectAttrs) {
		UserEntity bookUserEntity = userService.approveUserRequest(userId, comment);
		
		String details = "User with id: " + userId + " Approved :" + comment;
		System.out.println(details);
		redirectAttrs.addFlashAttribute("message", new Message("success","User Approved", details));
		return "redirect:/admin/dashboard";
	}
	
	@GetMapping("/decline/user/{userId}")
	public String declineUserRequest(@PathVariable("userId") String userId, @RequestParam(value="comment",required=false) String comment, 
			RedirectAttributes redirectAttrs) {
		UserEntity bookUserEntity = userService.declineUserRequest(userId, comment);
		
		String details = "User with id: " + userId + " Declined"+ comment; //Comment not saved now
		System.out.println(details);
		redirectAttrs.addFlashAttribute("message", new Message("success","User Declined", details));
		return "redirect:/admin/dashboard";
	}
	
	@GetMapping("/approve/bookuser/{bookUserId}")
	public String approveAssignRequest(@PathVariable("bookUserId") Long bookUserId, RedirectAttributes redirectAttrs) {
		BookUserEntity bookUserEntity = dashboardService.approveAssignRequest(bookUserId);
		
		String details = "Book with id: " + bookUserEntity.getBook().getId() + " Assigned to " + bookUserEntity.getUser().getUsername() 
				+ " till Date: "+ bookUserEntity.getDueDate();
		System.out.println(details);
		redirectAttrs.addFlashAttribute("message", new Message("success","Book Assigned", details));
		return "redirect:/admin/dashboard";
	}
	
	@GetMapping("/decline/bookuser/{bookUserId}")
	public String declineAssignRequest(@PathVariable("bookUserId") Long bookUserId,@RequestParam("comment") String comment, RedirectAttributes redirectAttrs) {
		BookUserEntity bookUserEntity = dashboardService.declineAssignRequest(bookUserId, comment);
		
		String details = "Book with id: " + bookUserEntity.getBook().getId() + " Declined for user :" + bookUserEntity.getUser().getUsername();
		System.out.println(details);
		redirectAttrs.addFlashAttribute("message", new Message("success","Book Declined", details));
		return "redirect:/admin/dashboard";
	}
	
	@GetMapping("/renew/approve/bookuser/{bookUserId}")
	public String approveRenewRequest(@PathVariable("bookUserId") Long bookUserId, RedirectAttributes redirectAttrs) {
		BookUserEntity bookUserEntity = dashboardService.approveRenewRequest(bookUserId);
		
		String details = "Book with id: " + bookUserEntity.getBook().getId() + " Renew approved for user " + bookUserEntity.getUser().getUsername() 
				+ " till Date: "+ bookUserEntity.getDueDate();
		System.out.println(details);
		redirectAttrs.addFlashAttribute("message", new Message("success","Renew Approved", details));
		return "redirect:/admin/dashboard";
	}
	
	@GetMapping("/renew/decline/bookuser/{bookUserId}")
	public String declineRenewRequest(@PathVariable("bookUserId") Long bookUserId, @RequestParam("comment") String comment, RedirectAttributes redirectAttrs) {
		BookUserEntity bookUserEntity = dashboardService.declineRenewRequest(bookUserId, comment);
		
		String details = "Book with id: " + bookUserEntity.getBook().getId() + " Renewal Declined for user :" + bookUserEntity.getUser().getUsername();
		System.out.println(details);
		redirectAttrs.addFlashAttribute("message", new Message("success","Renew Declined", details));
		return "redirect:/admin/dashboard";
	}
	
	@GetMapping("/return/bookuser/{bookUserId}")
	public String approveReturnRequest(@PathVariable("bookUserId") Long bookUserId, @RequestParam("comment") String comment, RedirectAttributes redirectAttrs) {
		BookUserEntity bookUserEntity = dashboardService.approveReturnRequest(bookUserId, comment);
		
		String details = "Book with id: " + bookUserEntity.getBook().getId() + " Returned by User :" + bookUserEntity.getUser().getUsername();
		System.out.println(details);
		redirectAttrs.addFlashAttribute("message", new Message("success","Book Returned", details));
		return "redirect:/admin/dashboard";
	}
}
