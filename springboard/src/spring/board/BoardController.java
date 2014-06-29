package spring.board;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.board.service.MainService;

@Controller
public class BoardController {

	@Autowired
	private MainService mainService;

	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView home(@RequestParam Map<String, Object> paramMap, ModelMap model)
			throws Throwable {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/writeForm.do");
		return mav;
	}
	
	@RequestMapping("/hello.do")
	public void hello(@RequestParam Map<String, Object> paramMap, ModelMap model)
			throws Throwable {
		model.put("title", "안녕안녕");
	}

	@RequestMapping("/today.do")
	public void today(@RequestParam Map<String, Object> paramMap, ModelMap model)
			throws Throwable {
		model.put("today", mainService.getToday());
	}

	@RequestMapping("/writeForm.do")
	public void writeForm(@RequestParam Map<String, Object> paramMap,ModelMap model) throws Throwable {
		model.put("results", mainService.getList(paramMap));
	}

	@RequestMapping("/delete.do")
	public ModelAndView deleteNote(@RequestParam String id, String action) throws Throwable {
			if (action.equals("del")) {
				// 삭제
				System.out.println(id);
				mainService.delNote(id);
			}
		// 처리 후 redirect
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/writeForm.do");
		return mav;
	}
	
//	@RequestMapping("/modi.do")
//	public ModelAndView modi(@RequestParam String id, String action) throws Throwable {
////			if (action.equals("mod")) {
////				// 수정
////				System.out.println(id);
////				mainService.delNote(id);
////			}
//		// 처리 후 redirect
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("redirect:/modiForm.do");
//		return mav;
//	}
//	
	@RequestMapping("/modiForm.do")
	public void modiForm(@RequestParam String id, String action, ModelMap model) throws Throwable {
//		model.put("results", mainService.updateList(paramMap));
//		model.put("results", mainService.getList(paramMap));
//		System.out.println(id);
		model.put("results", mainService.getNote(id));
	}

	@RequestMapping("/writeProc.do")
	public ModelAndView writeProc(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {

		// Form 에서 넘어 오는 값 찍기 paramMap 안에 Form 에서 넘어 오는 값이 있음
		System.out.println("title = " + paramMap.get("title"));
		System.out.println("content = " + paramMap.get("content"));

		// 저장하기 위하여 paramMap 을 넘긴다.
		int writeCnt = mainService.writeProc(paramMap);

		System.out.println(writeCnt + "건 입력되었습니다/");

		// 처리 후 redirect
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/writeForm.do");
		return mav;
	}
	
	@RequestMapping("/updateProc.do")
	public ModelAndView updateProc(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Throwable {

		// Form 에서 넘어 오는 값 찍기 paramMap 안에 Form 에서 넘어 오는 값이 있음
		System.out.println("title = " + paramMap.get("title"));
		System.out.println("content = " + paramMap.get("content"));

		// 저장하기 위하여 paramMap 을 넘긴다.
		int updateCnt = mainService.updateProc(paramMap);

		System.out.println(updateCnt + "건 업데이트되었습니다/");

		// 처리 후 redirect
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/writeForm.do");
		return mav;
	}
	
}
