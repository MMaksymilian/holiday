package test.primaris.entity;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:40
 * To change this template use File | Settings | File Templates.
 */
@Entity
@SequenceGenerator(allocationSize=1, name="idSequence", sequenceName="holiday_seq")
@org.hibernate.annotations.Entity(
        dynamicUpdate = true
)
public class Holiday extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "service_user_id", nullable = false, updatable = false)
    private ServiceUser serviceUser;

    @Column
    @Type(type="org.joda.time.contrib.hibernate.PersistentDateTime")
    private DateTime dateFrom;

    @Column
    @Type(type="org.joda.time.contrib.hibernate.PersistentDateTime")
    private DateTime dateTo;

    private String cause;

    @Enumerated(EnumType.STRING)
    private HolidayStatus status;

    public ServiceUser getServiceUser() {
        return serviceUser;
    }

    public void setServiceUser(ServiceUser serviceUser) {
        this.serviceUser = serviceUser;
    }

    public DateTime getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(DateTime dateFrom) {
        this.dateFrom = dateFrom;
    }

    public DateTime getDateTo() {
        return dateTo;
    }

    public void setDateTo(DateTime dateTo) {
        this.dateTo = dateTo;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public HolidayStatus getStatus() {
        return status;
    }

    public void setStatus(HolidayStatus status) {
        this.status = status;
    }

    /*enum do wyliczenia jaki może być status urlopu: wniosek, zatwierdzony, odrzucony*/
    public enum HolidayStatus {
       APPLIED, APPROVED, REJECTED
    }
}
