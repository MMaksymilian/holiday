package test.primaris.service;

import test.primaris.entity.dto.ServiceUserDTO;

public interface AdminDataService {

    void createNewUser(ServiceUserDTO serviceUserDTO);
}
