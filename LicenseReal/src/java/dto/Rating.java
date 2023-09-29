/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Admin
 */
public class Rating {
    private int id;
    private float star;
    private int menterID;
    private int memberID;

    public Rating() {
    }

    public Rating(int id, float star, int menterID, int memberID) {
        this.id = id;
        this.star = star;
        this.menterID = menterID;
        this.memberID = memberID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getStar() {
        return star;
    }

    public void setStar(float star) {
        this.star = star;
    }

    public int getMenterID() {
        return menterID;
    }

    public void setMenterID(int menterID) {
        this.menterID = menterID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }
    
}
