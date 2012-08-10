package test.primaris.service;

import org.joda.time.DateTime;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 09.08.12
 * Time: 09:55
 * To change this template use File | Settings | File Templates.
 */
public interface EmailSender {
    void sendHolidayStatusChangedByChiefMail(Holiday.HolidayStatus status, DateTime dateFrom, DateTime dateTo, ServiceUser serviceUser, ServiceUser userBy);
    void sendHolidayRequestNotification(DateTime dateFrom, DateTime dateTo, ServiceUser user, List<ServiceUser> sendTo);
}
