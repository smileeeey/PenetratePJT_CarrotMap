package com.ssafy.carrotmap.user.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.carrotmap.repository.dto.User;
import com.ssafy.carrotmap.user.service.UserService;

@Controller
@RequestMapping("/user")
@CrossOrigin(origins = "*")
public class UserController {

   @Autowired
   UserService userService;

   
   @GetMapping("/emailcheck")
   @ResponseBody
   public int emailCheck(String email,Model model) {
	   System.out.println(email);
	   
	   return userService.emailCheck(email);
   }
   
   @GetMapping("/idcheck")
   @ResponseBody
   public int idCheck(String id,Model model) {
	   System.out.println(id);
	   
	   return userService.idCheck(id);
   }
   
   @GetMapping("/sign_in")
   public void signIn() {
   }

   /**
    * 로그인
    * 
    * @param map     : "id"-String,"pw"-String
    * @param session : 로그인시 아이디 저장
    * @return
    */
   @GetMapping("/login")
   public String login(@RequestParam Map<String, String> map, HttpSession session, Model model) {
      
      try {
         User user = userService.login(map);
         
         if(user != null) {
            if(map.get("pw").equals(user.getPw())) {
               session.setAttribute("userinfo", user);
            }
            else {
               model.addAttribute("islogin", false);
               return "/user/sign_in";
            }
         }else {
            model.addAttribute("islogin", false);
            System.out.println("없다");
            return "/user/sign_in";
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "redirect:/";
      
   }
   
   /**
    * 회원가입
    * 
    * @param user
    */
   @PostMapping("/regist")
   public String regist(User user, Model model) {
      
      System.out.println("user :"+ user);
      try {
         userService.regist(user);
         model.addAttribute("signupMsg", "회원가입 성공!");
      } catch (Exception e) {
         model.addAttribute("signupMsg", "회원가입 실패!");
      }

      return "user/sign_in";

   }

/////  여기까지 완료  ///////////////////////////////////////////////////////

   @GetMapping("/logout")
   public String logout(HttpSession session) {
      session.invalidate();
      return "redirect:/";
   }
   
   @GetMapping("/mypage")
   public void mypage(Model model,HttpSession session) {
      User user = userService.selectById(((User)session.getAttribute("userinfo")).getId());
      model.addAttribute("user", user);
   }

   /**
    * 회원정보 업데이트
    * 
    * @param user
    */
   @PostMapping("/update")
   public String update(User user) {
      System.out.println("도오착");
      userService.update(user);
      
      return "redirect:mypage";
   }

   /**
    * 회원정보 삭제
    * 
    * @param id
    */
   @DeleteMapping("/delete")
   public void delete(String id) {
      userService.delete(id);
   }

}