package com.hg.p2p_2.biz.base.util;

public class BaseUtils {

    /**
     * request 设置编码格式，防止乱码
     */
    public static final String REQUEST_CHARACTER_ENCODING = "utf-8";

    /**
     * request   header
     */
    public static final String REQUEST_HEADER = "User-Agent";

    /**
     * response 防止乱码
     */
    public static final String RESPONSE_CONTENTTYPE = "text/html;charset=utf-8";

    /**
     * 返回map中属性
     */
    public static final String SYSTEM_MAP_SUCCESS = "success";
    public static final String SYSTEM_MAP_ENTITY = "entity";
    public static final String SYSTEM_MAP_ERROR_MSG = "errorMsg";
    public static final String SYSTEM_MAP_LIST = "list";

    /**
     * dao数据操作出现的常见错误
     */
    public static final String DAO_COUNT_ERROR = "COUNT-ERROR";
    public static final String DAO_SAVE_ERROR = "SAVE-ERROR";
    public static final String DAO_DELETE_ERROR = "DELETE-ERROR";
    public static final String DAO_SELECT_ERROR = "SELECT-ERROR";

    /**
     * service数据操作出现的常见错误
     */
    public static final String SERVICE_COUNT_ERROR = "COUNT-ERROR";
    public static final String SERVICE_SAVE_ERROR = "SAVE-ERROR";
    public static final String SERVICE_DELETE_ERROR = "DELETE-ERROR";
    public static final String SERVICE_SELECT_ERROR = "SELECT-ERROR";
    public static final String SERVICE_CREATE_ID_IS_NULL = "创建人id不能为空！";
    public static final String SERVICE_UUID_IS_NULL = "UUID不能为空！";
    public static final String SERVICE_UPDATE_ID_IS_NULL = "修改人id不能为空！";

    /**
     * 分页每页的默认长度
     */
    public static final Integer PAGE_SIZE = 20;

    /**
     * pc-图片验证码
     */
    public static final String KEY_PICTURE_CHECKCODE = "_picture_checkCode";

    /**
     *
     */
    public static final String KEY_USER = "_loginuser";

    /**
     *
     */
    public static final String KEY_USER_ID = "_loginuser_id";

    /**
     *
     */
    public static final String KEY_LOGIN_NAME = "_loginuser_name";

}
