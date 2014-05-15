package com.spring.webapp.lojavirtual.config.app;

import org.springframework.context.annotation.AdviceMode;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@EnableWebMvc
@EnableTransactionManagement(mode=AdviceMode.PROXY, proxyTargetClass=true)
@ComponentScan(value="com.spring.webapp.lojavirtual")
@Configuration
public class WebAppConfig extends WebMvcConfigurerAdapter {
	
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/bootstrap/**").addResourceLocations("/resources/bootstrap/").setCachePeriod(31556926);
        registry.addResourceHandler("/jquery/**").addResourceLocations("/resources/jquery/").setCachePeriod(31556926);
        registry.addResourceHandler("/extras/**").addResourceLocations("/resources/extras/").setCachePeriod(31556926);
    }
	
	@Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
    
}
