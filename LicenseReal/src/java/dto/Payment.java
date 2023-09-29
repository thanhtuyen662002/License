/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.time.LocalDate;
import org.apache.tomcat.jni.Local;

/**
 *
 * @author Admin
 */
public class Payment {
    private int id;
    private float price;
    private LocalDate create_date;
    private int memberID;
    private int mentorID;

    public Payment() {
    }

    public Payment(int id, float price, LocalDate create_date, int memberID, int mentorID) {
        this.id = id;
        this.price = price;
        this.create_date = create_date;
        this.memberID = memberID;
        this.mentorID = mentorID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public LocalDate getCreate_date() {
        return create_date;
    }

    public void setCreate_date(LocalDate create_date) {
        this.create_date = create_date;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public int getMentorID() {
        return mentorID;
    }

    public void setMentorID(int mentorID) {
        this.mentorID = mentorID;
    }
    
}
