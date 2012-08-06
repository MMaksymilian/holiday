package test.primaris.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 14:19
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("chief")
public class ChiefController {

    @RequestMapping(method= RequestMethod.GET)
    public String get(ModelMap model) {
        return "chief";
    }
}
