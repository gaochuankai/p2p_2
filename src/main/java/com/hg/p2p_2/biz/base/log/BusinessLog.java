package com.hg.p2p_2.biz.base.log;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * 业务方法日志注解<br>
 * <p>
 * 在Service类上增加@BusinessLog(service = "xxxx")<br>
 * <p>
 * 在Service类方法上增加@BusinessLog(operation = "xxxx")<br>
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
public @interface BusinessLog {

    /**
     * 业务模块名<br>
     * 写在Service类上
     *
     * @return
     */
    public String service() default "未填写";

    /**
     * 业务操作名称<br>
     * 写在方法名上<br>
     * Service类上必须要配置@BusinessLog(service="xxx")才能记录日志
     *
     * @return
     */
    public String operation() default "未填写";

}
