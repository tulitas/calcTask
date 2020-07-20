package app.services;

import app.models.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Service
public class CustomLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response,
                                Authentication authentication) throws IOException, ServletException {

        Object principal = authentication.getPrincipal();
        if (principal instanceof User) {
            User user = (User) principal;
            if( user.getName().equals("user") ){
                response.sendRedirect( request.getContextPath() + "/logout/user" );
            }
        }
        response.sendRedirect(  request.getContextPath() + "/" );

    }
}

