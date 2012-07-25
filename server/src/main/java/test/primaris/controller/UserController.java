package test.primaris.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;
import test.primaris.service.HolidayService;
import test.primaris.service.ServiceUserService;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 25.07.12
 * Time: 12:15
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private ServiceUserService serviceUserService;

    @Autowired
    private HolidayService holidayService;

    @RequestMapping(method= RequestMethod.GET)
    public String get(ModelMap model) {
        ServiceUser serviceUser = serviceUserService.getUserById(2l);
        Holiday holiday = holidayService.getHolidayById(2l);
        model.put("first_name", serviceUser.getFirstName());
        model.put("last_name", serviceUser.getLastName());
        model.put("cause", holiday.getCause()) ;
        return "user";
    }
}
