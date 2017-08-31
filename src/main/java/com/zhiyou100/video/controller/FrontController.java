package com.zhiyou100.video.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.model.Speaker;
import com.zhiyou100.video.model.Subject;
import com.zhiyou100.video.model.User;
import com.zhiyou100.video.model.Video;
import com.zhiyou100.video.service.FrontUserService;
import com.zhiyou100.video.util.MailUtil;

@Controller
@RequestMapping("/front")
public class FrontController {
	@Autowired	
	FrontUserService fu;
	
	
	@RequestMapping(value="/login.action",method=RequestMethod.GET)
	public String login(){
	return "/front/index";
	}
	
	@RequestMapping(value="/login.action",method=RequestMethod.POST)
	@ResponseBody
	public String login(User u ,HttpSession session) throws Exception{
		u.setPassword((DigestUtils.md5DigestAsHex(u.getPassword().getBytes())));
		User us = fu.login(u);	
		if(us == null){
		return	"fail";
		}else {	
			session.setAttribute("user", us);
		return	"success";
		}		
	}
	
	@RequestMapping(value="/regist.action",method=RequestMethod.POST)
	@ResponseBody
	public String regist(User u,HttpServletResponse res,HttpServletRequest req) throws Exception{
		//ad.setLoginPwd( DigestUtils.md5DigestAsHex(ad.getLoginPwd().getBytes()));
	//	req.setCharacterEncoding("UTF-8");
	/*	res.setContentType("text/html; charset=UTF-8");*/
		String email = u.getEmail();
		User us = fu.findUser(email); 
		if(us != null){
			//m.addAttribute("message","用户已注册");
			String str = "fail";
			return str;

		}else {	
			u.setPassword((DigestUtils.md5DigestAsHex(u.getPassword().getBytes())));
			fu.regist(u);
			//m.addAttribute("success",true);
			String str = "success";
			return str;
		}		
	}
	
	@RequestMapping(value="/user/logout.action",method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{

		session.setAttribute("user","");
		return	"redirect:/front/login.action";
		}		
	
	@RequestMapping(value="/user/index.action",method=RequestMethod.GET)
	public ModelAndView account(@RequestParam(defaultValue="0")Integer id) throws Exception{		
		User us = fu.findUserById(id); 
		ModelAndView mv = new ModelAndView();
		mv.addObject("user",us);
		mv.setViewName("/front/user/index");
		return mv;
	}

	@RequestMapping(value="/user/profile.action",method=RequestMethod.GET)
	public ModelAndView profile(Integer id,HttpSession session){
		User us = fu.findUserById(id);
		//System.out.println(us);
		ModelAndView mv = new ModelAndView();
		mv.addObject("user",us);
		mv.setViewName("/front/user/profile");
		return mv;
	}
	@RequestMapping(value="/user/profile.action",method=RequestMethod.POST)
	public ModelAndView profile(User u,HttpSession session){
		fu.updateUser(u);	
		Integer id = u.getId();
		User us = fu.findUserById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("user",us);
		mv.setViewName("/front/user/index");
		return mv;
	}
	@RequestMapping(value="/forgetpwd.action",method=RequestMethod.GET)
	public String forgetpwd(){
		return "/front/user/forget_pwd";
	}
	@RequestMapping(value="/sendemail.action",method=RequestMethod.POST)
	@ResponseBody
	public String sendemail(String email,HttpSession session) throws Exception{
		Random r = new Random();
		int a =r.nextInt(9000)+1000;
		session.setAttribute("a", ""+a);
	//	System.out.println(email);
		User u =fu.findUserByEmail(email);
		System.out.println(u);
		u.setCaptcha(""+a);
		fu.updateUserByU(u);
		if(u != null){
		MailUtil.send(email, "测试邮件", ""+a);
		return "success";
		}		
		return "fail";
		
	}
	@RequestMapping(value="/forgetpwd.action",method=RequestMethod.POST)
	public ModelAndView forgetpwd1(String captcha,String email){
		//System.out.println(captcha);
		User u =fu.findUserByEmail(email);
		String captcha2 = u.getCaptcha();
		ModelAndView mv = new ModelAndView();	
		if(captcha.equals(captcha2)==false){
			mv.addObject("error","验证码错误");
			mv.setViewName("/front/user/forget_pwd");
			return mv;
		}else{	
			mv.addObject("user",u);
			mv.addObject("email",email);
			mv.addObject("captcha",captcha);
			mv.setViewName("/front/user/reset_pwd");
			return mv;
		}
	}
	@RequestMapping(value="/resetpwd.action",method=RequestMethod.POST)
	public String resetpwd(User u) throws Exception{
		u.setPassword((DigestUtils.md5DigestAsHex(u.getPassword().getBytes())));
		fu.updateUser(u);			
			return "/front/index";
		}
	
	@RequestMapping(value="/user/avatar.action",method=RequestMethod.GET)
	public String avatar(HttpSession session,Model m){	
		User u = (User)session.getAttribute("user");
		m.addAttribute("user", u);		
			return "/front/user/avatar";
		}
	@RequestMapping(value="/user/avatar.action",method=RequestMethod.POST)
	public ModelAndView avatar(User u,MultipartFile pic,HttpSession session) throws IllegalStateException, IOException{
		String str = UUID.randomUUID().toString().replaceAll("-","");
		String ext = FilenameUtils.getExtension(pic.getOriginalFilename());
		String fileName =str+"."+ext;
		//r.setrPic(fileName);
		String path = "D:\\upload";
		pic.transferTo(new File(path+"\\"+fileName));
		u.setHeadUrl(fileName);
		fu.updateUser(u);
		User us = fu.findUserById(u.getId());
		ModelAndView mv = new ModelAndView();
		session.setAttribute("user", us);
		mv.addObject("user",us);
		mv.setViewName("/front/user/index");
		return mv;
	//	return"/front/user/avatar"; 
		}
	
	
		@RequestMapping(value="/user/password.action",method=RequestMethod.GET)
		public String password(HttpSession session){	
		User u = (User)session.getAttribute("user");
		System.out.println(u);
			return "/front/user/password";
		}
		
		@RequestMapping(value="/validate.action",method=RequestMethod.GET)
		@ResponseBody
		public String password(User u){	
			User us = fu.findUserById(u.getId());
			String password = us.getPassword();
			u.setPassword((DigestUtils.md5DigestAsHex(u.getPassword().getBytes())));
			if(u.getPassword().equals(password)){
				return "success";
			}else{				
				return "fail";
			}
		}

		@RequestMapping(value="/user/password.action",method=RequestMethod.POST)
		public String password1(User u){	
			u.setPassword((DigestUtils.md5DigestAsHex(u.getPassword().getBytes())));
			fu.updateUser(u);
			return "redirect:/front/login.action";
		}	
		@RequestMapping(value="/course/index.action	",method=RequestMethod.GET)
		public String course(@RequestParam(defaultValue="1")Integer subjectId,Model m){	
			List<Course> list=fu.findCourseWithVideo(subjectId);
			int temp=0;
		/*	for(int i =0;i<list.size();i++){
				
			for(int b=0;b<list.get(i).getVideoList().size();b++)	;
		*/
			for(Course c: list){
				for(Video v : c.getVideoList()){
					StringBuffer sb=new StringBuffer();					
					int length = v.getVideoLength();
					sb.append(length/3600+":");
					temp=length%3600/60;
					sb.append((temp<10)?"0"+temp+":":""+temp+":");	 
					temp=length%3600%60;
					sb.append((temp<10)?"0"+temp:""+temp);
					v.setVideoLength1(sb.toString());
					System.out.println(sb.toString());				
				}								
			}
			
			
			
			
			/*	StringBuffer sb=new StringBuffer();	
				int length = list.get(i).getVideoList();
				sb.append(length/3600+":");
				temp=length%3600/60;
				sb.append((temp<10)?"0"+temp+":":""+temp+":");	 
				temp=length%3600%60;
				sb.append((temp<10)?"0"+temp:""+temp);
				list.get(i).setVideoLength1(sb.toString());
				System.out.println(sb.toString());
				*/
		
			Subject s =fu.findSubjectById(subjectId);
			m.addAttribute("subject",s);
			m.addAttribute("subjectId",subjectId);
			m.addAttribute("courses",list);
			return "/front/course/index";
		}
		
		
		@RequestMapping(value="/video/index.action",method=RequestMethod.GET)
		public String video(@RequestParam(defaultValue="1")Integer subjectId,Model m,
				@RequestParam(defaultValue="1")Integer videoId,
				@RequestParam(defaultValue="1")Integer speakerId){	
				Subject s = fu.findSubjectById(subjectId);
				List<Video> list =fu.findVideoBySpeakerId(speakerId);
				Speaker sp =fu.findSpeakerBySpeakerId(speakerId);
				//System.out.println(speakerId);
			Video v	=fu.findVideoByVideoId(videoId);
			m.addAttribute("subjectId",subjectId);
			m.addAttribute("subject",s);
			m.addAttribute("videoId",videoId);
			m.addAttribute("speaker",sp);
			m.addAttribute("video",v);
			m.addAttribute("speakerId",speakerId);
			m.addAttribute("videoList",list);
			return "/front/video/index";
		}

		@RequestMapping(value="/video/videoData.action",method=RequestMethod.GET)
		public String videoData(@RequestParam(defaultValue="1")Integer subjectId,Model m,
				@RequestParam(defaultValue="1")Integer videoId,
				@RequestParam(defaultValue="1")Integer speakerId,
				@RequestParam(defaultValue="1")Integer courseId){
				Video v	=fu.findVideoByVideoId(videoId);
				Integer speakerId2 = v.getSpeakerId();
				Subject s = fu.findSubjectById(subjectId);
				List<Video> list =fu.findVideoBySpeakerId(speakerId2);
						int temp=0;
				for(int i =0;i<list.size();i++){						
						StringBuffer sb=new StringBuffer();	
						int length = list.get(i).getVideoLength();
						sb.append(length/3600+":");
						temp=length%3600/60;
						sb.append((temp<10)?"0"+temp+":":""+temp+":");	 
						temp=length%3600%60;
						sb.append((temp<10)?"0"+temp:""+temp);
						list.get(i).setVideoLength1(sb.toString());
						System.out.println(sb.toString());
				}
				//System.out.println(list);
				Speaker sp =fu.findSpeakerBySpeakerId(speakerId2);
				Course c=fu.findCourseByCourseId(courseId);				
			//	System.out.println(sp);
				m.addAttribute("subjectId",subjectId);
				m.addAttribute("course",c);
				m.addAttribute("video",v);
			m.addAttribute("subject",s);
			m.addAttribute("videoId",videoId);
			m.addAttribute("speaker",sp);			
			m.addAttribute("videoList",list);
			return "/front/video/content";
		}
		
		@RequestMapping(value="/video/state.action",method=RequestMethod.GET)
		public String state(){		
			return "/front/video/content";
		}
		/*@RequestMapping(value="/change.action",method=RequestMethod.GET)
		public void change(){	
		 	int temp=0;
		  	int seconds = 8000;
		    StringBuffer sb=new StringBuffer();
		    sb.append(seconds/3600+":");
		 
		    temp=seconds%3600/60;
		    sb.append((temp<10)?"0"+temp+":":""+temp+":");
		 
		    temp=seconds%3600%60;
		    sb.append((temp<10)?"0"+temp:""+temp);
		 System.out.println(sb);					
		}*/
}
	

