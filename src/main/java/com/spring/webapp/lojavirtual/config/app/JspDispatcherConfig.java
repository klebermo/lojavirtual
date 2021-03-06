package com.spring.webapp.lojavirtual.config.app;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@Import(WebAppConfig.class)
public class JspDispatcherConfig {
	
	@Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/view/jsp/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }
	
}
