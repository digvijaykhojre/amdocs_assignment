package com.uxpsystems.assignment.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * Spring security Configuration.
 * @author digvijayk
 *
 */
@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

	    // Creating two users.
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

    	
        auth.inMemoryAuthentication()
                .withUser("user").password("{noop}password").roles("USER")
                .and()
                .withUser("admin").password("{noop}password").roles("USER", "ADMIN");

    }

    // Secure the endpoins with HTTP Basic authentication
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	//No aunthentication for test api client/landing page 
        http
                .httpBasic()
                .and()
                .authorizeRequests()
                .antMatchers(HttpMethod.GET, "/getUser/**").hasAnyRole("USER","ADMIN")
                .antMatchers(HttpMethod.POST, "/saveUser/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.PUT, "/updateUser/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.PATCH, "/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.DELETE, "/deleteUser/**").hasRole("ADMIN")
                .antMatchers("/assignment").permitAll()
                .antMatchers("/").permitAll()
                .and().headers().frameOptions().disable()
                .and()
                .csrf().disable()
                .formLogin().disable();
    }

    /*@Bean
    public UserDetailsService userDetailsService() {
        //ok for demo
        User.UserBuilder users = User.withDefaultPasswordEncoder();

        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
        manager.createUser(users.username("user").password("password").roles("USER").build());
        manager.createUser(users.username("admin").password("password").roles("USER", "ADMIN").build());
        return manager;
    }*/

}
