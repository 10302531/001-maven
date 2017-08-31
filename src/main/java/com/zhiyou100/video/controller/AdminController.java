package com.zhiyou100.video.controller;



import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



import com.zhiyou100.video.model.Admin;
import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.model.Speaker;
import com.zhiyou100.video.model.Subject;
import com.zhiyou100.video.model.TotalVO;
import com.zhiyou100.video.model.Video;
import com.zhiyou100.video.service.AdminService;
import com.zhiyou100.video.service.CourseService;
import com.zhiyou100.video.service.SpeakerService;
import com.zhiyou100.video.service.VideoService;
import com.zhiyou100.video.util.Page;

		@Controller
		@RequestMapping("/admin")
		public class AdminController {
			@Autowired
			AdminService as;
			@Autowired
			VideoService vs;
			@Autowired
			SpeakerService ss;
			@Autowired
			CourseService cs;
			
			@RequestMapping(value="/login.action",method=RequestMethod.GET)
			public String login(){
			return "/user/index";
			}
			@RequestMapping(value="/login.action",method=RequestMethod.POST)
			public String login(Admin ad ,HttpSession session) throws Exception{
				//ad.setLoginPwd( DigestUtils.md5DigestAsHex(ad.getLoginPwd().getBytes()));
				Admin a = as.login(ad);	
				if(a == null){
				return	"redirect:/admin/login.action";
				}else {	
					session.setAttribute("admin", a);
				return	"redirect:/admin/videoList.action";
				}		
			}
			@RequestMapping(value="/videoList.action",method=RequestMethod.GET)
			public ModelAndView userList(@RequestParam(defaultValue="")String speecher,
						@RequestParam(defaultValue="")String title,
						@RequestParam(defaultValue="")String course,
						@RequestParam(defaultValue="1")Integer page){
				TotalVO tv = new TotalVO();
				tv.setTitle(title);
				tv.setSpeecher(speecher);
				tv.setCourse(course);
				tv.setPage(page);
				Page page1 =vs.loadPage(tv);
				List<Speaker> list1 = vs.findAllSpeaker();
				List<Course> list2 = vs.findAllCourse();
				ModelAndView mv = new ModelAndView();
				mv.addObject("title",title);
				mv.addObject("speecher",speecher);
				mv.addObject("course",course);
				mv.addObject("page",page1);
				mv.addObject("list1",list1);
				mv.addObject("list2",list2);
				mv.setViewName("/video/videoManage");
				return mv;
			}
			@RequestMapping(value="/updateVideo.action",method=RequestMethod.GET)
			public ModelAndView updateVideo(@RequestParam(defaultValue="1")Integer id){
					Video v =vs.updateVideo(id);
					ModelAndView mv = new ModelAndView();
					List<Speaker> list1 = vs.findAllSpeaker();
					List<Course> list2 = vs.findAllCourse();
					mv.addObject("list1",list1);
					mv.addObject("list2",list2);
					mv.addObject("video",v);
					mv.setViewName("/video/updateVideo");
				return mv;
			}
			@RequestMapping(value="/updateVideo.action",method=RequestMethod.POST)
			public String subUpdateVideo(Video v){
					vs.updateVideo(v);
				
				return "redirect:/admin/videoList.action";
			}
			@RequestMapping(value="/deleteVideo.action",method=RequestMethod.GET)
			public String deleteVideo(@RequestParam(defaultValue="1")Integer id){
				
					vs.deleteVideo(id);
				
				return "redirect:/admin/videoList.action";
			}
			@RequestMapping(value="/addVideo.action",method=RequestMethod.GET)
			public ModelAndView addVideo(){				
				List<Speaker> list1 = vs.findAllSpeaker();
				List<Course> list2 = vs.findAllCourse();	
				ModelAndView mv = new ModelAndView();
				mv.addObject("list1",list1);
				mv.addObject("list2",list2);
				mv.setViewName("/video/addVideo");
				return mv;
			}
			@RequestMapping(value="/addVideo.action",method=RequestMethod.POST)
			public String addVideo(Video v){				
					vs.addVideo(v);				
				return "redirect:/admin/videoList.action";
			}
			@RequestMapping(value="/speakerList.action",method=RequestMethod.GET)
			public ModelAndView speakerList(@RequestParam(defaultValue="")String speakerName,
					@RequestParam(defaultValue="")String speakerJob,
					@RequestParam(defaultValue="1")Integer page){	
				TotalVO tv = new TotalVO();
				tv.setSpeakerName(speakerName);
				tv.setSpeakerJob(speakerJob);
				tv.setPage(page);
				Page<Speaker> page1 =ss.loadPage(tv);			
				ModelAndView mv = new ModelAndView();
				mv.addObject("speakerjob",speakerJob);
				mv.addObject("speakername",speakerName);
				mv.addObject("page",page1);
				mv.setViewName("/speaker/speakerManage");
				return mv;
			}
			@RequestMapping(value="/addSpeaker.action",method=RequestMethod.GET)
			public ModelAndView addSpeaker(){				

				ModelAndView mv = new ModelAndView();
				mv.setViewName("/speaker/addSpeaker");
				return mv;
			}
			@RequestMapping(value="/addSpeaker.action",method=RequestMethod.POST)
			public String addSpeaker(Speaker v){				
					ss.addSpeaker(v);				
				return "redirect:/admin/speakerList.action";
			}
			@RequestMapping(value="/updateSpeaker.action",method=RequestMethod.GET)
			public ModelAndView updateSpeaker(@RequestParam(defaultValue="1")Integer id){
				Speaker s =ss.findSpeaker(id);
					ModelAndView mv = new ModelAndView();
					mv.addObject("speaker",s);
					mv.setViewName("/speaker/updateSpeaker");
				return mv;
			}
			@RequestMapping(value="/updateSpeaker.action",method=RequestMethod.POST)
			public String updateSpeaker(Speaker s){
					ss.updateSpeaker(s);
				
				return "redirect:/admin/speakerList.action";
			}
	
	
			@RequestMapping(value="/courseList.action",method=RequestMethod.GET)
			public ModelAndView courseList(@RequestParam(defaultValue="1")Integer page){
				Page<Course> page1 =cs.loadPage(page);			
				ModelAndView mv = new ModelAndView();
				mv.addObject("page",page1);
				mv.setViewName("/course/courseManage");
				return mv;
			}
			@RequestMapping(value="/addCourse.action",method=RequestMethod.GET)
			public ModelAndView addCourse(){				
				List<Subject> list = cs.findAllSubject();	
				ModelAndView mv = new ModelAndView();
				mv.addObject("list",list);
				mv.setViewName("/course/addCourse");
				return mv;
			}
			@RequestMapping(value="/addCourse.action",method=RequestMethod.POST)
			public String addCourse(Course c){				
					cs.addCourse(c);				
				return "redirect:/admin/courseList.action";
			}
			@RequestMapping(value="/deleteCourse.action",method=RequestMethod.GET)
			public String deleteCourse(@RequestParam(defaultValue="1")Integer id){
				
					cs.deleteCourse(id);
				
				return "redirect:/admin/courseList.action";
			}
			@RequestMapping(value="/aaa.action",method=RequestMethod.GET)
			public String aaaa(Integer[] blankCheckbox){

					List<Integer> list = Arrays.asList(blankCheckbox);
				
				vs.deleteVideoByCondition(list);
				
				return "redirect:/admin/videoList.action";
			}
			@RequestMapping(value="/analyse.action",method=RequestMethod.GET)
			public ModelAndView analyse(){
			List<TotalVO> list1 =vs.analyse();
			System.out.println(list1);
			String courseName =null;
			String playTimes = null;
				for(int i=0;i<list1.size();i++){
					if(i==0){
						courseName =list1.get(i).getCourseName();
						playTimes = list1.get(i).getA();
					}else{

						courseName =courseName+"\",\""+list1.get(i).getCourseName();
						playTimes =playTimes+","+list1.get(i).getA();
					}		
				//playTimes=list1.get(i).getA();
					}	
				System.out.println(courseName);
				System.out.println(playTimes);
			ModelAndView mv = new ModelAndView();
			mv.addObject("courseName",courseName);
			mv.addObject("playTimes",playTimes);
			mv.setViewName("/analyse/analyse");
			return mv;
			}
	}


