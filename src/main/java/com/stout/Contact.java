/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stout;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;

/**
 *
 * @author Thomas Stout
 */
/* We are following the Java Bean implementation by using the 
 * 'Serializable' keyword.
 */
public class Contact implements Serializable, Comparable<Contact> {

    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String address;
    private LocalDate birthday;
    private Instant dateCreated;
    private BigDecimal amtVenmo;

    public Contact() {
    }
    
    public Contact(String firstName, String lastName, String phoneNumber, 
            String address, String birthday, Instant dateCreated, 
            String amtVenmo) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        setBirthday(birthday);
        this.dateCreated = dateCreated;
        this.amtVenmo = new BigDecimal(amtVenmo);
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public Date getNewBirthday() {
        return java.sql.Date.valueOf(birthday);
    }

    public void setBirthday(String birthday) {
        DateTimeFormatter formatterInput = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        try {
            this.birthday = LocalDate.parse(birthday, formatterInput);
        } catch (DateTimeParseException | NullPointerException e) {
            this.birthday = null;
        }
    }

    public Instant getDateCreated() {
        return dateCreated;
    }

    public Date getNewDateCreated() {
        return Date.from(dateCreated);
    }

    public void setDateCreated(Instant dateCreated) {
        this.dateCreated = dateCreated;
    }

    public BigDecimal getAmtVenmo() {
        return amtVenmo;
    }

    public void setAmtVenmo(String amtVenmo) {
        this.amtVenmo = new BigDecimal(amtVenmo);
    }

    @Override
    public int compareTo(Contact other) {
        int last = lastName.compareTo(other.lastName);
        if (last == 0) {
            return firstName.compareTo(other.firstName);
        }
        return last;
    }
}
