package com.kimi.workstm.common.domain;

public class DateVO {
    private int year;					//년
    private int month;					//월
    private int day;					//일
    private String week;				//주
    private boolean istoday = false;	//오늘 날자
    
    public int getYear() {
        return year;
    }
    
    public void setYear(int year) {
        this.year = year;
    }
    
    public int getMonth() {
        return month;
    }
    
    public void setMonth(int month) {
        this.month = month;
    }
    
    public int getDay() {
        return day;
    }
    
    public void setDay(int day) {
        this.day = day;
    }
    
    public String getWeek() {
        return week;
    }
    
    public void setWeek(String week) {
        this.week = week;
    }
    
    public boolean isIstoday() {
        return istoday;
    }
    
    public void setIstoday(boolean istoday) {
        this.istoday = istoday;
    }
   
   
}