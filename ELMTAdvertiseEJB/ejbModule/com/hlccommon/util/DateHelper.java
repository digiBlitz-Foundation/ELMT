/*
 * DateHelper.java
 *
 * Created on August 24, 2006, 6:03 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.hlccommon.util;
import java.util.*;
import java.text.SimpleDateFormat;

/**
 *
 * @author suresh
 */
public final class DateHelper {
    
    /** Creates a new instance of DateHelper */
    public DateHelper() {
    }
    
     public static final Date getDate(int year, int month, int day, int hour,
        int minute) {
        // returns a Date with the specified time elements
        Calendar cal =
            new GregorianCalendar(year, intToCalendarMonth(month), day, hour,
                minute);

        return cal.getTime();
    }
     // getDate

    public static final Date getDate(int year, int month, int day) {
        Calendar cal =
            new GregorianCalendar(year, intToCalendarMonth(month), day);

        return cal.getTime();
    }
     // getDate

    static public final Date addDays(Date target, int days) {
        long msPerDay = 1000 * 60 * 60 * 24;
        long msTarget = target.getTime();
        long msSum = msTarget + (msPerDay * days);
        Date result = new Date();
        result.setTime(msSum);

        return result;
    }
     // addDays

    static public int dayDiff(Date first, Date second) {
        // returns the difference, in days, between the first
        // and second Date arguments
        long msPerDay = 1000 * 60 * 60 * 24;
        long diff =
            (first.getTime() / msPerDay) - (second.getTime() / msPerDay);
        Long convertLong = new Long(diff);

        return convertLong.intValue();
    }
     // dayDiff

    static public int getYear(Date date) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(date);

        return cal.get(Calendar.YEAR);
    }
     // getYear 

    static public int getMonth(Date date) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(date);

        int calendarMonth = cal.get(Calendar.MONTH);

        return calendarMonthToInt(calendarMonth);
    }
     // getMonth

    static public int getDay(Date date) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(date);

        return cal.get(Calendar.DAY_OF_MONTH);
    }
     // getDay

    static public int getHour(Date date) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(date);

        return cal.get(Calendar.HOUR_OF_DAY);
    }
     // geHour

    static public int getMinute(Date date) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(date);

        return cal.get(Calendar.MINUTE);
    }
     // geMinute

    private static int calendarMonthToInt(int calendarMonth) {
        if (calendarMonth == Calendar.JANUARY) {
            return 1;
        } else if (calendarMonth == Calendar.FEBRUARY) {
            return 2;
        } else if (calendarMonth == Calendar.MARCH) {
            return 3;
        } else if (calendarMonth == Calendar.APRIL) {
            return 4;
        } else if (calendarMonth == Calendar.MAY) {
            return 5;
        } else if (calendarMonth == Calendar.JUNE) {
            return 6;
        } else if (calendarMonth == Calendar.JULY) {
            return 7;
        } else if (calendarMonth == Calendar.AUGUST) {
            return 8;
        } else if (calendarMonth == Calendar.SEPTEMBER) {
            return 9;
        } else if (calendarMonth == Calendar.OCTOBER) {
            return 10;
        } else if (calendarMonth == Calendar.NOVEMBER) {
            return 11;
        } else if (calendarMonth == Calendar.DECEMBER) {
            return 12;
        } else {
            return 1;
        }
    }
     // calendarMonthToInt

    public static String format(Date date, String pattern) {
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(date);
    }
     // format

    private static int intToCalendarMonth(int month) {
        if (month == 1) {
            return Calendar.JANUARY;
        } else if (month == 2) {
            return Calendar.FEBRUARY;
        } else if (month == 3) {
            return Calendar.MARCH;
        } else if (month == 4) {
            return Calendar.APRIL;
        } else if (month == 5) {
            return Calendar.MAY;
        } else if (month == 6) {
            return Calendar.JUNE;
        } else if (month == 7) {
            return Calendar.JULY;
        } else if (month == 8) {
            return Calendar.AUGUST;
        } else if (month == 9) {
            return Calendar.SEPTEMBER;
        } else if (month == 10) {
            return Calendar.OCTOBER;
        } else if (month == 11) {
            return Calendar.NOVEMBER;
        } else if (month == 12) {
            return Calendar.DECEMBER;
        } else {
            return Calendar.JANUARY;
        }
    }
     // intToCalendarMonth
    
}
