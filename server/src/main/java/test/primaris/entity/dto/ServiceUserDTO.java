package test.primaris.entity.dto;

import java.io.Serializable;

/**
 * Nie wrzucalem pola "password" z encji bo nie jestem do konca pewny czy
 * to jest bezpieczne
 * Pawel K.
 */
public class ServiceUserDTO implements Serializable {
    private Integer id;
    private String firstName;
    private String lastName;
    private String login;
    private String role;
    private String password;
    private String email;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
