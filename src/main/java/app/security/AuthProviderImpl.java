package app.security;

import app.models.User;
import app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

@Component
public class AuthProviderImpl implements AuthenticationProvider {



    @Autowired
    UserRepository userRepository;


    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        String login = authentication.getName();
        User persons = userRepository.getLogin(login);
        String password = authentication.getCredentials().toString();
        PasswordCoder passwordCoder = null;
        try {
            passwordCoder = new PasswordCoder(password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }


        if (persons == null) {
            throw new UsernameNotFoundException("User not found");
        }

        Object x = persons.getPassword();
        Object y = passwordCoder.getHashtext();

        if (x.equals(y)) {
            System.out.println("login");

        }


        List<GrantedAuthority> authorities = new ArrayList<>();

        return new UsernamePasswordAuthenticationToken(persons, null, authorities);
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.equals(UsernamePasswordAuthenticationToken.class);
    }

}
