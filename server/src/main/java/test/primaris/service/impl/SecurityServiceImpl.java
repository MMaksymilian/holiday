package test.primaris.service.impl;

import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import test.primaris.service.SecurityService;
import java.util.Collection;

@Service("securityService")
@RemotingDestination
public class SecurityServiceImpl implements SecurityService {

    @Override
    public String isUserInRole(String role) {
        Collection<GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();

        String response = "fls";
        for(GrantedAuthority authority: authorities){

            System.out.println(authority.getAuthority());
            if(authority.getAuthority().equals(role)){
                response = "tr";
            }
        }

        return response;
    }
}
