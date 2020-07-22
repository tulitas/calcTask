package app.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/")
public class SiteController {
    @RequestMapping("/")
    public ModelAndView index() {
        return new ModelAndView("index");
    }

    @RequestMapping("/login")
    public ModelAndView login() {
        return new ModelAndView("login");
    }

    @RequestMapping("/registration")
    public ModelAndView registration() {
        return new ModelAndView("registration");

    }
    @RequestMapping("/personsList")
    public ModelAndView personsList() {
        return new ModelAndView("personsList");
    }

    @RequestMapping("/edit")
    public ModelAndView edit() {
        return new ModelAndView("save");
    }

    @RequestMapping("/welcome")
    public ModelAndView welcome() {
        return new ModelAndView("welcome");
    }

    @RequestMapping(value = "/palindrom")
    public ModelAndView Palindrom() {
        return new ModelAndView("palindrom");
    }
    @RequestMapping(value = "/result")
    public ModelAndView result() {
        return new ModelAndView("result");
    }
    @RequestMapping(value = "/numberToStringX")
    public ModelAndView numberToStringX() {
        return new ModelAndView("numberToStringX");
    }

    public ModelAndView result2() {
        return new ModelAndView("result2");
    }

    @RequestMapping(value = "/calculator")
    public ModelAndView calculator() {
        return new ModelAndView("calculator");
    }

    @RequestMapping(value = "/logsList")
    public ModelAndView logsList() {
        return new ModelAndView("LogsList");
    }
}

