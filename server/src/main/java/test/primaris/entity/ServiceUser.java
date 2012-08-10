package test.primaris.entity;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:40
 * To change this template use File | Settings | File Templates.
 */
@Entity
@SequenceGenerator(allocationSize=1, name="idSequence", sequenceName="service_user_seq")
public class ServiceUser extends BaseEntity {
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "serviceUser")
    @Cascade({CascadeType.ALL})
    private Set<Holiday> holidaySet;

    private String login;

    private String password;

    private String role;

    private String firstName;

    private String lastName;

    private String email;

    public Set<Holiday> getHolidaySet() {
        return holidaySet;
    }

    public void setHolidaySet(Set<Holiday> holidaySet) {
        this.holidaySet = holidaySet;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
