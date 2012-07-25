package test.primaris.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import test.primaris.entity.ServiceUser;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class TestAppUserDetails implements UserDetails {
    private ServiceUser serviceUser;
    private boolean accountNonExpried = true;
    private boolean accountNonLocked = true;
    private boolean creditentialsNonExpired = true;
    private boolean enabled = true;


    public TestAppUserDetails(ServiceUser serviceUser){
        this.serviceUser = serviceUser;
    }
    public TestAppUserDetails(ServiceUser serviceUser, boolean accountNonExpired, boolean accountNonLocked, boolean creditentialsNonExpired,
                          boolean enabled, List<GrantedAuthority> list){
        this.serviceUser = serviceUser;
        this.accountNonExpried = accountNonExpired;
        this.accountNonLocked = accountNonLocked;
        this.creditentialsNonExpired = creditentialsNonExpired;
        this.enabled = enabled;
    }

    public Collection<GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> grantedAuth = new LinkedList<GrantedAuthority>();
        String role = serviceUser.getRole();
        grantedAuth.add(new GrantedAuthorityImpl(role));
        return grantedAuth;
    }
    public String getPassword() {
        return serviceUser.getPassword();
    }

    public String getUsername() {
        return serviceUser.getLogin();
    }

    public boolean isAccountNonExpired() {
        return true;
    }

    public boolean isAccountNonLocked() {
        return true;
    }

    public boolean isCredentialsNonExpired() {
        return true;
    }

    public boolean isEnabled() {
        return true;
    }

    public ServiceUser getServiceUser() {
        return serviceUser;
    }
}