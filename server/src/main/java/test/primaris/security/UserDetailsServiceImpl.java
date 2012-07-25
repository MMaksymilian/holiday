package test.primaris.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import test.primaris.dao.ServiceUserDAO;
import test.primaris.entity.ServiceUser;

/**
 * Created with IntelliJ IDEA.
 * AppUser: Maksymilian Małek
 * Date: 25.06.12
 * Time: 16:44
 * To change this template use File | Settings | File Templates.
 */
@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private ServiceUserDAO serviceUserDAO;

    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException, DataAccessException {
        ServiceUser databaseAppUser = serviceUserDAO.getByLogin(username);
        if (databaseAppUser == null) {
            throw new UsernameNotFoundException(username);
        }
        return new TestAppUserDetails(databaseAppUser);
    }
}
