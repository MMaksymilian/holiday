package test.primaris.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 06.08.12
 * Time: 11:49
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("login")
public class LoginController {

    @RequestMapping(method= RequestMethod.GET)
    public String get(ModelMap model) {
        return "login";
    }
}
