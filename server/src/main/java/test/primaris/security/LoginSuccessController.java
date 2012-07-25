package test.primaris.security;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 20.07.12
 * Time: 09:19
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/success.do")
public class LoginSuccessController {

    @RequestMapping(method = RequestMethod.GET)
    public String  redirectAfterLogin(HttpServletRequest httpServletRequest) {
        if (httpServletRequest.isUserInRole("CHIEF")) {
            return "redirect:/flex/chief";
        }
        if (httpServletRequest.isUserInRole("USER")) {
            return "redirect:/flex/user";

        }
        return null;
    }
}
