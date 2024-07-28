package com.ureca.marine.controller;

import java.util.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ureca.marine.dto.MarineLife;
import com.ureca.marine.service.MarineLifeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller //스프링 컨테이너로 객체 관리 받고 싶어요!!
@RequestMapping("/")
public class MarineLifeController {
    
    @Autowired
    MarineLifeService service; // service = null; 기본값
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping("/")
    public String start(HttpSession session) {
        if (session.getAttribute("adminCode") == null) {
            return "index";
        } else {
            return "indexAuthenticated";
        }
    }
  
    
    @GetMapping("/adminSignUp")
    public String adminSignUp() {
        return "adminSignUp";
    }
    
    @PostMapping("/adminSignUp")
    public String validateAdmin(@RequestParam("adminCode") String adminCode, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        if (adminCode == null || !adminCode.equals("0610")) {
            redirectAttributes.addFlashAttribute("error", "유효하지 않은 관리자 코드입니다.");
            return "redirect:adminSignUp";
        }
        request.getSession().setAttribute("adminCode", adminCode);
        return "redirect:/";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/form")
    public String form(HttpSession session, Model model) {
        if (session.getAttribute("adminCode") == null) {
            return "redirect:adminSignUp";
        }
        MarineLife marine = new MarineLife();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        model.addAttribute("marine", marine);
        model.addAttribute("admissionDateStr", marine.getAdmissionDate() != null ? sdf.format(marine.getAdmissionDate()) : "");
        model.addAttribute("injuryDateStr", marine.getInjuryDate() != null ? sdf.format(marine.getInjuryDate()) : "");
        model.addAttribute("recoveryDateStr", marine.getRecoveryDate() != null ? sdf.format(marine.getRecoveryDate()) : "");
        return "form";
    }

    @PostMapping("/form")
    public String register(@Validated @ModelAttribute("marine") MarineLife marine, BindingResult result, Model model, HttpServletRequest request) {
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);
        Date today = new Date();
        Date admissionDate = marine.getAdmissionDate();
        Date injuryDate = marine.getInjuryDate();
        Date recoveryDate = marine.getRecoveryDate();
        
        boolean hasError = false;
        
        if (marine.getBirthYear() > currentYear || marine.getBirthYear() < 1800) {
            model.addAttribute("error", "올바른 년도를 입력해주세요.");
            marine.setBirthYear(2024); // birthYear를 빈 값으로 설정
            model.addAttribute("marine", marine);
            hasError = true;
        }

        if (admissionDate != null && admissionDate.after(today)) {
        	model.addAttribute("admissionDateError", "입사 날짜는 오늘 날짜를 포함하여 과거여야 합니다.");
        	hasError = true;
        }
        
        if (injuryDate != null && injuryDate.after(today)) {
            model.addAttribute("injuryDateError", "부상 날짜는 오늘 날짜를 포함하여 과거여야 합니다.");
            hasError = true;
        }

        if (recoveryDate != null && recoveryDate.before(today)) {
            model.addAttribute("recoveryDateError", "복귀 날짜는 오늘 날짜를 포함하여 미래여야 합니다.");
            hasError = true;
        }

        if (injuryDate != null && recoveryDate != null && recoveryDate.before(injuryDate)) {
            model.addAttribute("dateError", "복귀 날짜는 부상 날짜 이후여야 합니다.");
            hasError = true;
        }
        
        if ("유".equals(marine.getInjuryType())) {
            if (marine.getInjuryContent() == null || marine.getInjuryContent().isEmpty()) {
                model.addAttribute("injuryContentError", "부상 내용을 입력해주세요.");
                hasError = true;
            }
            if (injuryDate == null) {
                model.addAttribute("injuryDateError", "부상 날짜를 입력해주세요.");
                hasError = true;
            }
            if (recoveryDate == null) {
                model.addAttribute("recoveryDateError", "복귀 날짜를 입력해주세요.");
                hasError = true;
            }
        }
        
        if (hasError) {
        	model.addAttribute("marine", marine);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            model.addAttribute("admissionDateStr", marine.getAdmissionDate() != null ? sdf.format(marine.getAdmissionDate()) : "");
            model.addAttribute("injuryDateStr", marine.getInjuryDate() != null ? sdf.format(marine.getInjuryDate()) : "");
            model.addAttribute("recoveryDateStr", marine.getRecoveryDate() != null ? sdf.format(marine.getRecoveryDate()) : "");
        	
        	return "form";
        }
        
        if ("무".equals(marine.getInjuryType())) {
            marine.setInjuryDate(null);
            marine.setRecoveryDate(null);
            marine.setInjuryContent(null);
        }
        if (request.getSession().getAttribute("adminCode") == null) {
            return "redirect:adminSignUp";
        }

        try {
        	if(marine.getNo()==0) {
        		service.add(marine);        		
        	}
        	else {
        		service.edit(marine);
        	}
        	String injuryType = request.getParameter("injuryType");
        	if ("유".equals(injuryType)) {
                return "redirect:list_protect?registerSuccess=true";
            } else {
                return "redirect:list_all?registerSuccess=true";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            model.addAttribute("error", "데이터베이스 에러 발생: " + e.getMessage());
            model.addAttribute("marine", marine);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            model.addAttribute("admissionDateStr", marine.getAdmissionDate() != null ? sdf.format(marine.getAdmissionDate()) : "");
            model.addAttribute("injuryDateStr", marine.getInjuryDate() != null ? sdf.format(marine.getInjuryDate()) : "");
            model.addAttribute("recoveryDateStr", marine.getRecoveryDate() != null ? sdf.format(marine.getRecoveryDate()) : "");
            
            return "form";
        }

    }

    @GetMapping("/list_all")
    public String listAll(HttpSession session, Model model) {
        if (session.getAttribute("adminCode") == null) {
            return "redirect:adminSignUp";
        }
        try {
            List<MarineLife> list = service.readAll();
            model.addAttribute("list", list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "list_all";
    }

    @GetMapping("/list_protect")
    public String listProtect(HttpSession session, Model model) {
        if (session.getAttribute("adminCode") == null) {
            return "redirect:adminSignUp";
        }
        try {
            List<MarineLife> protectedList = service.readAllProtected();
            model.addAttribute("list_protect", protectedList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "list_protect";
    }


    @GetMapping("/upform")
    public String upform(@RequestParam("no") int no, Model model) { // 수정폼 보이기
        try {
        	MarineLife marine = service.read(no);
            model.addAttribute("marine", marine);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            model.addAttribute("admissionDateStr", marine.getAdmissionDate() != null ? sdf.format(marine.getAdmissionDate()) : "");
            model.addAttribute("injuryDateStr", marine.getInjuryDate() != null ? sdf.format(marine.getInjuryDate()) : "");
            model.addAttribute("recoveryDateStr", marine.getRecoveryDate() != null ? sdf.format(marine.getRecoveryDate()) : "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "upform";
    }
    
    @PostMapping("/upform")
    public String modify(@Validated @ModelAttribute("marine") MarineLife marine, BindingResult result, Model model, HttpServletRequest request) { // DB수정 요청
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);
        Date today = new Date();
        Date admissionDate = marine.getAdmissionDate();
        Date injuryDate = marine.getInjuryDate();
        Date recoveryDate = marine.getRecoveryDate();

        boolean hasError = false;

        if (marine.getBirthYear() > currentYear || marine.getBirthYear() < 1800) {
            model.addAttribute("error", "올바른 년도를 입력해주세요.");
            marine.setBirthYear(2024); // birthYear를 빈 값으로 설정
            model.addAttribute("marine", marine);
            hasError = true;
        }

        if (admissionDate != null && admissionDate.after(today)) {
            model.addAttribute("admissionDateError", "입사 날짜는 오늘 날짜를 포함하여 과거여야 합니다.");
            hasError = true;
        }

        if (injuryDate != null && injuryDate.after(today)) {
            model.addAttribute("injuryDateError", "부상 날짜는 오늘 날짜를 포함하여 과거여야 합니다.");
            hasError = true;
        }

        if (recoveryDate != null && recoveryDate.before(today)) {
            model.addAttribute("recoveryDateError", "복귀 날짜는 오늘 날짜를 포함하여 미래여야 합니다.");
            hasError = true;
        }

        if (injuryDate != null && recoveryDate != null && recoveryDate.before(injuryDate)) {
            model.addAttribute("dateError", "복귀 날짜는 부상 날짜 이후여야 합니다.");
            hasError = true;
        }

        if ("유".equals(marine.getInjuryType())) {
            if (marine.getInjuryContent() == null || marine.getInjuryContent().isEmpty()) {
                model.addAttribute("injuryContentError", "부상 내용을 입력해주세요.");
                hasError = true;
            }
            if (injuryDate == null) {
                model.addAttribute("injuryDateError", "부상 날짜를 입력해주세요.");
                hasError = true;
            }
            if (recoveryDate == null) {
                model.addAttribute("recoveryDateError", "복귀 날짜를 입력해주세요.");
                hasError = true;
            }
        }

        if (hasError) {
            model.addAttribute("marine", marine);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            model.addAttribute("admissionDateStr", marine.getAdmissionDate() != null ? sdf.format(marine.getAdmissionDate()) : "");
            model.addAttribute("injuryDateStr", marine.getInjuryDate() != null ? sdf.format(marine.getInjuryDate()) : "");
            model.addAttribute("recoveryDateStr", marine.getRecoveryDate() != null ? sdf.format(marine.getRecoveryDate()) : "");

            return "upform";
        }

        if ("무".equals(marine.getInjuryType())) {
            marine.setInjuryDate(null);
            marine.setRecoveryDate(null);
            marine.setInjuryContent(null);
        }

        try {
            service.edit(marine);
        } catch (SQLException e) {
            e.printStackTrace();
            model.addAttribute("error", "데이터베이스 에러 발생: " + e.getMessage());
            model.addAttribute("marine", marine);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            model.addAttribute("admissionDateStr", marine.getAdmissionDate() != null ? sdf.format(marine.getAdmissionDate()) : "");
            model.addAttribute("injuryDateStr", marine.getInjuryDate() != null ? sdf.format(marine.getInjuryDate()) : "");
            model.addAttribute("recoveryDateStr", marine.getRecoveryDate() != null ? sdf.format(marine.getRecoveryDate()) : "");

            return "upform";
        }

        if ("유".equals(marine.getInjuryType())) {
            return "redirect:list_protect?updateSuccess=true";
        } else {
            return "redirect:list_all?updateSuccess=true";
        }
    }

    
    @GetMapping("/detail")
    public String detail(@RequestParam("no") int no, Model model) { // 수정폼 보이기
    	try {
    		MarineLife marine = service.read(no);
            model.addAttribute("marine", marine);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            model.addAttribute("admissionDateStr", marine.getAdmissionDate() != null ? sdf.format(marine.getAdmissionDate()) : "");
            model.addAttribute("injuryDateStr", marine.getInjuryDate() != null ? sdf.format(marine.getInjuryDate()) : "");
            model.addAttribute("recoveryDateStr", marine.getRecoveryDate() != null ? sdf.format(marine.getRecoveryDate()) : "");
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	return "detail";
    }
    
//    @PostMapping("/detail")
//    public String edit(@RequestParam("no") int no, Model model) { // 수정폼 보이기
//    	try {
//    		model.addAttribute("marine", service.read(no));
//    	} catch (SQLException e) {
//    		e.printStackTrace();
//    	}
//    	return "redirect:detail";
//    }


    @GetMapping("/delete")
    public String remove(@RequestParam("no") int no, HttpServletRequest request) { // DB삭제 요청
        try {
            service.remove(no);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String referer = request.getHeader("Referer");
        if (referer.contains("list_protect")) {
            return "redirect:list_protect";
        } else {
            return "redirect:list_all";
        }
    }
}