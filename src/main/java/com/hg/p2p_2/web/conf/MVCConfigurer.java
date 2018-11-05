package com.hg.p2p_2.web.conf;

import com.hg.p2p_2.web.interceptor.SessionHandleInterceptor;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * springMVC的配置controller
 */
@Configuration
public class MVCConfigurer implements WebMvcConfigurer {
    private static final String[] CLASSPATH_RESOURCE_LOCATIONS = {
            "classpath:/META-INF/resources/", "classpath:/resources/",
            "classpath:/static/", "classpath:/public/"};

    public void addInterceptors(InterceptorRegistry registry) {
        // 添加拦截器，检查会话，URL以front、admin开头的都使用此拦截器
        registry.addInterceptor(new SessionHandleInterceptor()).addPathPatterns("/front/**");
        registry.addInterceptor(new SessionHandleInterceptor()).addPathPatterns("/admin/**");
    }

    public void addCorsMappings(CorsRegistry registry) {
        // 添加跨域访问
        registry.addMapping("/**");
    }

    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatter(new DateFormatter("yyyy-MM-dd HH:mm:ss"));
    }

    /**
     * 装饰器
     */
//    @Bean
//    public FilterRegistrationBean siteMeshFilter(){
//        FilterRegistrationBean fitler = new FilterRegistrationBean();
//        WebSiteMeshFilter siteMeshFilter = new WebSiteMeshFilter();
//        fitler.setFilter(siteMeshFilter);
//        return fitler;
//    }
    @Bean(name = "sitemesh3")
    WebSiteMeshFilter webSiteMeshFilter() {
        return new WebSiteMeshFilter();
    }

    @Bean
    public FilterRegistrationBean filterRegistrationBean(
            @Qualifier("sitemesh3") WebSiteMeshFilter siteMeshFilter) {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(siteMeshFilter);
        filterRegistrationBean.setEnabled(true);
        filterRegistrationBean.addUrlPatterns("/*");
        return filterRegistrationBean;
    }

    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        if (!registry.hasMappingForPattern("/**")) {
            registry.addResourceHandler("/**").addResourceLocations(
                    "classpath:/META-INF/resources/");
        }
//        if (!registry.hasMappingForPattern("/**")) {
        registry.addResourceHandler("/**").addResourceLocations(
                CLASSPATH_RESOURCE_LOCATIONS);
//        }
//        registry.addResourceHandler("/upload/**").
//                addResourceLocations("classpath:/resources/static/upload/");
    }
}
