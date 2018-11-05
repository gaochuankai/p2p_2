package com.hg.p2p_2.web.base.verify;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateTransformUtil {

    public static Date sToD(String str) {
        //String str = "2018-08-14 16:00:18";
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = sdf2.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(date);
        return date;
    }

    /**
     * @param str        时间字符串
     * @param dateFormat 时间格式："yyyy-MM-dd HH:mm:ss"
     * @return date
     */
    public static Date sToD(String str, String dateFormat) {
        //String str = "2018-08-14 16:00:18";
        SimpleDateFormat sdf2 = new SimpleDateFormat(dateFormat);
        Date date = null;
        try {
            date = sdf2.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(date);
        return date;
    }

    public static String getyyyyMMdd() {
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 1;
        int date = calendar.get(Calendar.DATE);
        return "" + year + month + date;
    }

}
