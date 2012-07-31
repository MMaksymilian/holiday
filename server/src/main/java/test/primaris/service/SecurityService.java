package test.primaris.service;

public interface SecurityService {
    public String isUserInRole(String role);
    public String getHighestUserRole();
}
