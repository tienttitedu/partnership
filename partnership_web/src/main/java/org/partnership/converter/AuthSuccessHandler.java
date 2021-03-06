package org.partnership.converter;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

public class AuthSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, 
      Authentication authentication) 
      throws ServletException, IOException {
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().print(isAdminPage(authentication));
        response.getWriter().flush();
    }
    
    protected String isAdminPage(Authentication authentication) {
        Collection<? extends GrantedAuthority> authorities
         = authentication.getAuthorities();
        for (GrantedAuthority grantedAuthority : authorities) {
            if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
                return "isAdmin";
            }
        }
        return "isUser";
    }
    
}
