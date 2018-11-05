package com.hg.p2p_2.biz.base.datapermission;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * 业务数据权限<br>
 * <p>
 * 在Service类上增加@DataPermission(code = "xxxx")<br>
 * code内容与资源中的code对应<br>
 * <p>
 * 在Service类查询方法上增加@DataPermission(parameterIndex = ?)<br>
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
public @interface DataPermission {
    /**
     * 业务模块名<br>
     * 写在Service类上
     *
     * @return
     */
    public String code() default "";

    /**
     * 数据权限插入位置<br>
     * 写在方法名上<br>
     * Service类上必须要配置@DataPermission(service="xxx")才能做数据规则引擎
     *
     * @return
     */
    public int parameterIndex() default 0;
}
