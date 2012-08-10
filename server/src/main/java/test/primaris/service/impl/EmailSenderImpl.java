package test.primaris.service.impl;

import org.apache.velocity.exception.VelocityException;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;
import test.primaris.service.EmailSender;

import javax.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 09.08.12
 * Time: 09:57
 * To change this template use File | Settings | File Templates.
 */
@Component
public class EmailSenderImpl implements EmailSender {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private VelocityEngineFactoryBean velocityEngineFactoryBean;

    @Override
    public void sendHolidayStatusChangedByChiefMail(final Holiday.HolidayStatus status, final DateTime dateFrom, final DateTime dateTo, final ServiceUser targetUser, final ServiceUser userBy) {
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
                message.setTo(targetUser.getEmail());
                message.setFrom(userBy.getEmail());
                message.setSubject("Decyzja o urlopie: " + dateFrom.toString("dd MM yyyy") + " do " + dateTo.toString("dd MM yyyy"));
                Map model = new HashMap();
                model.put("targetUser", targetUser);
                model.put("userBy", userBy);
                model.put("holidayStatus", status.name());
                try {
                    String text = VelocityEngineUtils.mergeTemplateIntoString(
                            velocityEngineFactoryBean.createVelocityEngine(), "holidayStatusChange.ft", model);
                    message.setText(text, true);
                } catch (VelocityException exception) {
                    exception.printStackTrace();
                }
            }
        };
        mailSender.send(preparator);
    }

    @Override
    public void sendHolidayRequestNotification(final DateTime dateFrom, final DateTime dateTo, final ServiceUser user, final List<ServiceUser> sendTo) {
        for (final ServiceUser chief : sendTo) {
            MimeMessagePreparator preparator = new MimeMessagePreparator() {
                public void prepare(MimeMessage mimeMessage) throws Exception {
                    MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
                    message.setTo(chief.getEmail());
                    message.setFrom(user.getEmail());
                    message.setSubject("Prośba o urlop w dniach " + dateFrom.toString("dd MM yyyy") + " do " + dateTo.toString("dd MM yyyy"));
                    Map model = new HashMap();
                    model.put("user", user);
                    model.put("chief", chief);
                    try {
                        String text = VelocityEngineUtils.mergeTemplateIntoString(
                                velocityEngineFactoryBean.createVelocityEngine(), "holidayRequest.ft", model);
                        message.setText(text, true);
                    } catch (VelocityException exception) {
                        exception.printStackTrace();
                    }
                }
            };
            mailSender.send(preparator);
        }
    }
}
