package com.ureca.person.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ureca.person.dto.MarineLife;
import com.ureca.person.model.service.PersonService;

import jakarta.servlet.http.HttpServletRequest;

@Controller //스프링 컨테이너로 객체 관리 받고 싶어요!!
@RequestMapping("/")
public class PersonController {
    
    @Autowired
    PersonService service; // service = null; 기본값

    @GetMapping("/")
    public String start() {
        return "index";
    }

    @GetMapping("/form")
    public String form() { // 입력폼 보이기
        System.out.println(">>> GET form");
        return "form"; // "/WEB-INF/views/" + "form" + ".jsp" ==> 5. forward이동    
    }

    @PostMapping("/form")
    public String register(MarineLife person, Model model, HttpServletRequest request) { // DB입력
        System.out.println(">>> POST form");
        System.out.println("person >>>" + person);

        try {
            service.add(person); // 3.
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String injuryType = request.getParameter("injuryType");
        if ("유".equals(injuryType)) {
            return "redirect:list_protect"; // 5.
        } else {
            return "redirect:list_all"; // 5.
        }
    }

    @GetMapping("/list_all")
    public String listAll(Model model) { // DB목록출력
        try {
            List<MarineLife> list = service.readAll(); // 3.
            model.addAttribute("list", list); // 4.영역에 데이터를 저장! => 왜? 데이터를 View와 공유하기 위해
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "list_all"; // 5.
    }

    @GetMapping("/list_protect")
    public String listProtect(Model model) {
        try {
            List<MarineLife> protectedList = service.readAllProtected();
            model.addAttribute("list_protect", protectedList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "list_protect"; // 보호 필요 생물 목록을 보여주는 뷰
    }

    @GetMapping("/upform")
    public String upform(@RequestParam("no") int no, Model model) { // 수정폼 보이기
        try {
            model.addAttribute("person", service.read(no));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "upform";
    }

    @PostMapping("/upform")
    public String modify(MarineLife person) { // DB수정 요청
        try {
            service.edit(person);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "redirect:list"; // 수정 결과를 list페이지로 확인
    }

    @GetMapping("/delete")
    public String remove(@RequestParam("no") int no) { // DB삭제 요청
        try {
            service.remove(no);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "redirect:list"; // 삭제 결과를 list페이지로 확인
    }
}
