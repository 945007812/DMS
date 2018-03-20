package cn.edu.scu.dms.model;

import java.util.Date;

import cn.edu.scu.dms.tool.CharacTool;

public class Swwj {
    private String sid;

    private Date time1;

    private String department;

    private String number1;

    private String title;

    private Date dotime;

    private String wpishi;

    private String direction;
    private CharacTool tool=new CharacTool();

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
    	sid=tool.encoding(sid);
        this.sid = sid == null ? null : sid.trim();
    }

    public Date getTime1() {
        return time1;
    }

    public void setTime1(Date time1) {
        this.time1 = time1;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
    	department=tool.encoding(department);
        this.department = department == null ? null : department.trim();
    }

    public String getNumber1() {
        return number1;
    }

    public void setNumber1(String number1) {
    	 number1=tool.encoding(number1);
        this.number1 = number1 == null ? null : number1.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
    	title=tool.encoding(title);
        this.title = title == null ? null : title.trim();
    }

    public Date getDotime() {
        return dotime;
    }

    public void setDotime(Date dotime) {
        this.dotime = dotime;
    }

    public String getWpishi() {
        return wpishi;
    }

    public void setWpishi(String wpishi) {
    	wpishi=tool.encoding(wpishi);
        this.wpishi = wpishi == null ? null : wpishi.trim();
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
    	direction=tool.encoding(direction);
        this.direction = direction == null ? null : direction.trim();
    }
}