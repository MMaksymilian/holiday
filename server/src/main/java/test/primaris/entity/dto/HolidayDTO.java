package test.primaris.entity.dto;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;
import test.primaris.entity.ServiceUser;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 30.07.12
 * Time: 10:08
 * To change this template use File | Settings | File Templates.
 */
public class HolidayDTO implements Serializable, Comparable<HolidayDTO> {
    private Integer id;
    private Date dateFrom;
    private Date dateTo;
    private String cause;
    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }

    public Date getDateTo() {
        return dateTo;
    }

    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public int compareTo(HolidayDTO o) {
        return this.dateFrom.compareTo(o.dateFrom);
    }
}
