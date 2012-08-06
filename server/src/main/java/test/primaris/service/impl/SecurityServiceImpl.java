package test.primaris.service.impl;

import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import test.primaris.service.SecurityService;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Service("securityService")
@RemotingDestination
public class SecurityServiceImpl implements SecurityService {
    private Map<String, Integer> roleValueMap = new HashMap<String, Integer>();{
        roleValueMap.put("ROLE_USER",3);
        roleValueMap.put("ROLE_CHIEF",5);
    }
    
    @Override
    public String isUserInRole(String role) {
        Collection<GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();

        String response = "false";
        for(GrantedAuthority authority: authorities){
            if(authority.getAuthority().equals(role)){
                response = "true";
            }
        }

        return response;
    }

    @Override
    public String getHighestUserRole() {
        String role = "";

        Collection<GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        Integer roleValue = 0;
        Integer currentRoleValue = 0;
        String currentRole;
        for(GrantedAuthority authority: authorities){
            currentRole = authority.getAuthority();
            currentRoleValue = roleValueMap.get(currentRole);

            if(currentRoleValue>roleValue){
                role = currentRole;
                roleValue = currentRoleValue;
            }
        }

        return role;
    }
}
