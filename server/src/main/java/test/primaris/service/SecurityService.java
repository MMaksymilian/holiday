package test.primaris.service;

import test.primaris.dao.ServiceUserDAO;
import test.primaris.entity.dto.ServiceUserDTO;

public interface SecurityService {
    public String isUserInRole(String role);
    public String getHighestUserRole();
    public ServiceUserDTO getCurrentUser();
}
