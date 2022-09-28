package Pack01;

import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

// 객체를 생성하는 어노테이션 중 하나
@Controller
public class Tiger {
	@RequestMapping("/t1")
	public String func01() {
		System.out.println("call 1");
		return null;
	}
	
	@RequestMapping("/t2")
	public String func02() {
		System.out.println("call 2");
		return "TigerView";
	}
	
	@RequestMapping("/t3")
	public String func03(@RequestParam(value="name") String nname) {
		System.out.println("call 3 : "+nname);
		return "TigerView";
	}
	
	@RequestMapping("/t4")
	public String func04(
			
			@RequestParam(value="name") String name, 
			@RequestParam(value="age") Integer age
			) {
		System.out.println("call 4 : "+name+age*2);
		return "TigerView";
	}
	@RequestMapping("/t5")
	public String func05(
			HttpServletRequest request) {
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		System.out.println("call 5 : "+name+age);
		return "TigerView";
	}
	@RequestMapping("/t6")
	public String func06(Model model) {
		System.out.println("call 6 ");
		model.addAttribute("name", "호랑이");
		model.addAttribute("age", 200);
		return "TigerView";
	}
	@RequestMapping("/t7")
	public String func07(
			Model model,
			@RequestParam(value="name") String name, 
			@RequestParam(value="age") Integer age
			) {
		System.out.println("call 7 : "+name+age);
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		return "TigerView";
	}
	
	// ModelAndView
	@RequestMapping("/t8")
	public ModelAndView func08() {
		ModelAndView mv = new ModelAndView("TigerView");
		mv.addObject("name", "독수리");
		mv.addObject("age", 200);
		
		return mv;
	}
	
	// ModelAndView
	@RequestMapping("/t9")
	public ModelAndView func09(
			@RequestParam(value="tf") Boolean tf) {
		ModelAndView mv = 
				new ModelAndView( tf ? "TigerView" : "LionView");
		mv.addObject("name", "독수리");
		mv.addObject("age", 200);
		
		return mv;
	}
	@RequestMapping("/t11")
	public String func011() {
		System.out.println("call 11");
		
		return null;
	}
	@RequestMapping("/t13")
	public String func013(Person p) {
		System.out.println("call 13");
		// 커멘드객체 사용
		System.out.println(p.getId()+" "+p.getPw()+" "+p.getSalary());
		return "TigerView";
	}
	@RequestMapping("/t14")
	public String func014(Model model) {
		System.out.println("call 14");
		// 1. 정수 전달
		int num = 100;
		model.addAttribute("num",num);
		// 2. 문자열 전달
		String str = "문자열";
		model.addAttribute("str",str);
		// 3. 배열 전달'
		int[] ar = {10, 11, 12};
		model.addAttribute("ar",ar);
		// 4. 컬렉션(Integer)
		LinkedList<Integer> li = new
				LinkedList<Integer>();
		li.add(13);li.add(14);li.add(15); 
		model.addAttribute("li",li);
		// 5. 컬렉션(String)
		LinkedList<String> st = new
				LinkedList<String>();
		st.add("호랑이");st.add("사자");st.add("코끼리");
		model.addAttribute("st",st);
		// 6. Person 객체
		Person person = new Person("홍길동", 99, 1200);
		model.addAttribute("person", person);
		// 7. 컬렉션(Person)
		LinkedList<Person> plist = new
				LinkedList<Person>();
		plist.add(new Person("소나무", 10, 2000));
		plist.add(new Person("중나무", 20, 3000));
		plist.add(new Person("대나무", 30, 4000));
		model.addAttribute("plist",plist);
		return "MonkeyView";
	}
	@RequestMapping("/t15")
	public String func15(
			@RequestParam(value="name", required = false)
	        String name) {
		System.out.println("call 15" + name);
		return "TigerView";
	}
	@RequestMapping("/t16")
	public String func16(
			@RequestParam(value="name", defaultValue = "고양이")
	        String name) {
		System.out.println("call 16" + name);
		return "TigerView";
	}
	
	@GetMapping("/t17")
	public String func17_1() {
		System.out.println("call 17_1");
		return "TigerView";
	}
	@PostMapping("/t17")
	public String func17_2() {
		System.out.println("call 17_2");
		return "TigerView";
	}
	
	@RequestMapping("register/t19")
	public String func19() {
		System.out.println("call 19");
		return "register/step01";
	}
}

@Controller
@RequestMapping("register")
class Dog {
	@RequestMapping("/t20")
	public String func20() {
		return "register/step02";
	}
	@RequestMapping("/t21")
	public String func21() {
		return "register/step03";
	}
}




@RestController
class Lion{
	@PostMapping("/t12")
	public String func12_1(
			@RequestBody String req
			 ) {
	
		System.out.println("call 12" + req);
		return "sample2";
	}
	@GetMapping("/t12")
	public String func12(
			@RequestParam String id
			 ) {
	
		System.out.println("call 12" + id);
		return "sample1";
	}
}