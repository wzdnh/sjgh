package com.sjgh.services.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/*
 *
 *时间日期工具类
 *
 * */

public final class TimeDateUtil {

    /**
     * 一秒钟
     */
    public static final int ONE_SECOND = 1;
    /**
     * 一分钟
     */
    public static final int ONE_MINUTE = 60;
    /**
     * 一小时
     */
    public static final int ONE_HOUR = 60 * ONE_MINUTE;
    /**
     * 一天
     */
    public static final int ONE_DAY = 24 * ONE_HOUR;

    private TimeDateUtil() {
    }

    /**
     * 默认日期格式
     */
    private static final String DEFAULT_FORMAT = "yyyy-MM-dd HH:mm:ss";
    /**
     * 整型日期格式
     */
    private static final String INTEGER_FORMAT = "yyyyMMdd";
    /**
     * 字符型日期格式
     */
    public static final String TIME_FORMAT = "yyyy-MM-dd";

    public static final SimpleDateFormat TIME_FORMAT_MILLION = new SimpleDateFormat(
            "HH:mm:ss:SSS");

    /**
     * 获取系统当前时间戳
     *
     * @return int
     */
    public static int time() {
        return (int) (System.currentTimeMillis() / 1000);
    }

    /**
     * 根据传进来的系统时间获取时间戳
     *
     * @param timeMillis
     * @return
     */
    public static int getTime(long timeMillis) {
        return (int) (timeMillis / 1000);
    }

    /**
     * 获取系统当前时间
     *
     * @return long
     */
    public static long millisTime() {
        return System.currentTimeMillis();
    }



/*================================================================================*/
    /**
     * 把当前时间格式化成yyyy-MM-dd HH:mm:ss
     *
     * @return String
     */
    public static String date() {
        return new SimpleDateFormat(DEFAULT_FORMAT).format(System.currentTimeMillis());
    }

    /**
     * 把当前时间格式化
     *
     * @param format
     * @return String
     */
    public static String date(String format) {
        return new SimpleDateFormat(format).format(System.currentTimeMillis());
    }

    /**
     * 把时间戳（秒）格式化成yyyy-MM-dd HH:mm:ss
     *
     * @param timestamp
     * @return String
     */
    public static String date(int timestamp) {
        return date(DEFAULT_FORMAT, timestamp);
    }

    /**
     * 把时间戳（毫秒）格式化成yyyy-MM-dd HH:mm:ss
     *
     * @param timestamp
     * @return String
     */
    public static String date(long timestamp) {
        return date(DEFAULT_FORMAT, timestamp);
    }

    /**
     * 把时间戳格式化
     *
     * @param format
     * @param timestamp
     *            秒
     * @return String
     */
    public static String date(String format, int timestamp) {
        long l = (long) timestamp * 1000;
        return date(format, l);
    }

    /**
     * 把时间戳格式化
     *
     * @param format
     * @param timestamp
     *            毫秒
     * @return String
     */
    public static String date(String format, long timestamp) {
        return new SimpleDateFormat(format).format(timestamp);
    }

    /**
     * 时间转化成时间戳
     *
     * @param time
     * @return int
     */
    public static int strToTime(String time) {
        return strToTime(time, DEFAULT_FORMAT);
    }

    /**
     * 时间转化成时间戳
     *
     * @param time
     * @param format
     * @return int
     */
    public static int strToTime(String time, String format) {
        Date date = str2Date(time, format);
        return (int) (date.getTime() / 1000);
    }

    /**
     * 字符串转换成日期 如果转换格式为空，则利用默认格式进行转换操作
     *
     * @param str
     *            字符串
     * @param format
     *            日期格式
     * @return 日期
     */
    public static Date str2Date(String str, String format) {
        if (null == str || "".equals(str)) {
            return new Date();
        }
        // 如果没有指定字符串转换的格式，则用默认格式进行转换
        if (null == format || "".equals(format)) {
            format = DEFAULT_FORMAT;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        Date date = null;
        try {
            date = sdf.parse(str);
            return date;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Date();
    }




    /*=======================================================*/

    /**
     * 获得今天凌晨时间戳
     *
     * @return int
     */
    public static int dayBreak() {
        String nowTime = TimeDateUtil.date("yyyy-MM-dd") + " 00:00:00"; // 获取今天日期时间
        return TimeDateUtil.strToTime(nowTime); // 转化时间戳
    }

    /**
     * 获得当天凌晨 格式:yyyy-MM-dd
     *
     * @param day
     *            : "2011-12-14"
     * @return int
     */
    public static int dayBreak(String day) {
        String nowTime = day + " 00:00:00"; // 获取当天日期时间
        return TimeDateUtil.strToTime(nowTime); // 转化时间戳
    }

    /**
     * 当天凌晨 格式:yyyyMMdd
     *
     * @param ymd
     * @return
     * @author shen 2012-6-9
     */
    public static int dayBreak(int ymd) {
        String nowTime = ymd + " 00:00:00"; // 获取当天日期时间
        return strToTime(nowTime, "yyyyMMdd HH:mm:ss");// 转化时间戳
    }

    /**
     * 今天某个时间点
     *
     * @param clock
     * @return int
     */
    public static int getTimeByClock(String clock) {
        String time = TimeDateUtil.date("yyyy-MM-dd") + " " + clock;
        return TimeDateUtil.strToTime(time);
    }

    /**
     * 获取今天星期几,星期日返回 0
     *
     * @return int
     */
    public static int getDayOfWeek() {
        Calendar calendar = Calendar.getInstance();
        return calendar.get(Calendar.DAY_OF_WEEK) - 1;
    }

    /**
     * 获取今天星期几
     *
     * @param time
     * @return int
     */
    public static int getDayOfWeek(int time) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis((long) time * 1000);
        return calendar.get(Calendar.DAY_OF_WEEK) - 1;
    }

    /**
     * 获取输入的时间戳是当年的第几周 2012-3-13
     *
     * @param timestamp
     *            时间戳
     * @return weekOfYear
     * @author ruan
     */
    public static int getWeekOfYear(int timestamp) {
        int week = Integer.parseInt(date("ww", timestamp));
        int year = Integer.parseInt(date("yyyy", timestamp));
        int tmp = Integer.parseInt(date("MM", timestamp));
        if (week >= 5 && tmp <= 1) {
            year -= 1;
        }
        if (week == 1 && tmp == 12) {
            year += 1;
        }
        return year * 100 + week;
        // return Integer.parseInt(new
        // SimpleDateFormat("yyyyww").format(timestamp));
    }

    /**
     * 获取输入的日期戳是当年的第几周 2012-3-14
     *
     * @param str
     *            日期字符串
     * @return weekOfYear
     * @author ruan
     */
    public static int getWeekOfYear(String str) {
        return getWeekOfYear(strToTime(str));
    }

    /**
     * 获取当前时间是当年的第几周 2012-3-14
     *
     * @return weekOfYear
     * @author ruan
     */
    public static int getWeekOfYear() {
        return getWeekOfYear(time());
    }


    /*=======================================================*/

    /**
     * 将时间戳转为整形日期
     *
     * @param timestamp
     * @return
     */
    public static int timestampToDateInteger(int timestamp) {
        String dateString = TimeDateUtil.date(INTEGER_FORMAT, timestamp);
        int dateInt = Integer.parseInt(dateString); // 将日期字符串转为int
        return dateInt;
    }

    /**
     * 获取当天yyyyMMdd的int类型时间
     *
     * @return
     */
    public static int getTodayYmd() {
        String dateString = date(INTEGER_FORMAT);
        return Integer.parseInt(dateString);
    }

    /**
     * 获取当天yyyyMMdd的int类型时间
     *
     * @return
     */
    public static int getDayYmd(int time) {
        String dateString = date(INTEGER_FORMAT,time);
        return Integer.parseInt(dateString);
    }

    /**
     * 获取昨天yyyyMMdd的int类型时间
     *
     * @return
     */
    public static int getYesterdayInt() {
        String dateString = date(INTEGER_FORMAT,
                System.currentTimeMillis() - 86400000l);
        return Integer.parseInt(dateString);
    }

    /**
     * 获取与今天相差指定天数的yyyyMMdd的int类型时间
     *
     * @param diffDay
     *            相差的天数
     * @return
     */
    public static int getDiffDayInt(int diffDay) {
        String dateString = date(INTEGER_FORMAT, System.currentTimeMillis()
                + 86400000l * diffDay);
        return Integer.parseInt(dateString);
    }

    public static String matchTime(long time) {
        return TIME_FORMAT_MILLION.format(time);
    }

    /**
     * 获取时间元素
     *
     * @return
     */
    public static int getDateElement(long time, int type) {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(time);
        return cal.get(type);
    }

    /**
     * 获取时间元素
     *
     * @return
     */
    public static int getDateElement(int type) {
        return getDateElement(System.currentTimeMillis(),type);
    }
    /**
     * 日期天数计算
     *
     */
    public static Date getDateAdd(int add) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.add(Calendar.DATE, add);
        return cal.getTime();
    }

    /**
     * 计算指定时间日期的开始时间
     *
     * @param date
     * @return
     */
    public static long getDateStartTime(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.set(Calendar.HOUR_OF_DAY, 0);
        c.set(Calendar.MINUTE, 0);
        c.set(Calendar.SECOND, 1);
        c.set(Calendar.MILLISECOND, 0);
        return c.getTimeInMillis();
    }

    /**
     * 获取当前月份
     *
     * @return
     */
    public static int getMonth() {
        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH) + 1;
        return month;
    }

    /**
     * 获取在当前月份的第几天
     *
     * @return
     */
    public static int getDay() {
        Calendar cal = Calendar.getInstance();
        int day = cal.get(Calendar.DAY_OF_MONTH);
        return day;
    }

    /**
     * 获取当前月份最大的天数
     * @return
     */
    public static int getMaxDay() {
        Calendar cal = Calendar.getInstance();
        int Maxday = cal.getActualMaximum(Calendar.DATE);
        return Maxday;
    }

}