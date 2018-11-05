package com.hg.p2p_2.web.conf;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.sitemesh.content.tagrules.html.DivExtractingTagRuleBundle;

/**
 * 前台页面的装饰器
 */
public class WebSiteMeshFilter extends ConfigurableSiteMeshFilter {

    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        //除了/admin/index和/admin/login页面外，其他所有/admin/下的页面都被/admin/index页面所装饰
//        builder.addDecoratorPath("/page/*", "/decorators/main")
//                .addExcludedPath("/page/login");
        //.addExcludedPath("/plugin/*");
        // /Users/gaochuankai/Desktop/jetBrains/ebuy/src/main/resources/static/decorators/decorators.jsp

        // Map decorators to path patterns.
        // .addDecoratorPath("/strategy/**", "/WEB-INF/decorators/decorator.jsp")
        // Exclude path from decoration.
//                .addExcludedPath("/login/**")
//                .addExcludedPath("/main/**")
//                .addExcludedPath("/popup/**");
        builder.addDecoratorPath("/*", "/WEB-INF/decorators/decorators.jsp");
        builder.addDecoratorPath("/front/*","/WEB-INF/decorators/front_main.jsp");
        builder.addDecoratorPath("/admin/*", "/WEB-INF/decorators/admin_main.jsp");
        builder.addExcludedPath("/login/toAdminPage");
        builder.addTagRuleBundles(new DivExtractingTagRuleBundle());
    }

}
