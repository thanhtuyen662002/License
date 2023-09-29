/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class Schedule {
    private int id;
    private int type;
    private Date day;
    private Time time;
    private int mentorID;
    private int memberID;

    public Schedule() {
    }

    public Schedule(int id, int type, Date day, Time time, int mentorID, int memberID) {
        this.id = id;
        this.type = type;
        this.day = day;
        this.time = time;
        this.mentorID = mentorID;
        this.memberID = memberID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public int getMentorID() {
        return mentorID;
    }

    public void setMentorID(int mentorID) {
        this.mentorID = mentorID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }
    
}
