package hkmu.comps380f.dao;

import hkmu.comps380f.model.PhotoUser;
import hkmu.comps380f.model.UserRole;
import jakarta.annotation.Resource;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PhotoUserService implements UserDetailsService {
    @Resource
    PhotoUserRepository photoUserRepo;

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        PhotoUser photoUser = photoUserRepo.findById(username).orElse(null);
        if (photoUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (UserRole role : photoUser.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(role.getRole()));
        }
        return new User(photoUser.getUsername(), photoUser.getPassword(), authorities);
    }

}