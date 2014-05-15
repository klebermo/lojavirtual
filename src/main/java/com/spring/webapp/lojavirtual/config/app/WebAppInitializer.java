package com.spring.webapp.lojavirtual.config.app;

import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

import org.springframework.core.annotation.Order;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

@Order(value=1)
public class WebAppInitializer implements WebApplicationInitializer {

	@SuppressWarnings("resource")
	@Override
    public void onStartup(ServletContext container) {
      // Create the 'root' Spring application context
      AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
      rootContext.register(WebAppConfig.class);

      // Create the dispatcher servlet's Spring application context
      AnnotationConfigWebApplicationContext jspContext = new AnnotationConfigWebApplicationContext();
      jspContext.register(JspDispatcherConfig.class);

      // Register and map the dispatcher servlet
      ServletRegistration.Dynamic jsp_dispatcher = container.addServlet("jsp_dispatcher", new DispatcherServlet(jspContext));
      jsp_dispatcher.setLoadOnStartup(1);
      jsp_dispatcher.addMapping("*.htm");
      
      // Create the dispatcher servlet's Spring application context
      AnnotationConfigWebApplicationContext jsonContext = new AnnotationConfigWebApplicationContext();
      jsonContext.register(JsonDispatcherConfig.class);

      // Register and map the dispatcher servlet
      ServletRegistration.Dynamic json_dispatcher = container.addServlet("json_dispatcher", new DispatcherServlet(jsonContext));
      json_dispatcher.setLoadOnStartup(2);
      json_dispatcher.addMapping("*.json");
      
      // Create the dispatcher servlet's Spring application context
      AnnotationConfigWebApplicationContext xmlContext = new AnnotationConfigWebApplicationContext();
      xmlContext.register(XmlDispatcherConfig.class);

      // Register and map the dispatcher servlet
      ServletRegistration.Dynamic xml_dispatcher = container.addServlet("xml_dispatcher", new DispatcherServlet(jspContext));
      xml_dispatcher.setLoadOnStartup(3);
      xml_dispatcher.addMapping("*.xml");
    }

}

