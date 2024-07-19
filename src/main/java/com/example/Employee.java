package com.example;

public class Employee{
    private String empid;
    private String empfname;
    private String emplname;
    private String emppasswordd;
    private String emppassword_hash;
    private int emprole;

    // Getters and setters
    public String getEmpid() {
        return empid;
    }

    public void setEmpid(String empid) {
        this.empid = empid;
    }

    public String getEmpfname() {
        return empfname;
    }

    public void setEmpfname(String empfname) {
        this.empfname = empfname;
    }

    public String getEmplname() {
        return emplname;
    }

    public void setEmplname(String emplname) {
        this.emplname = emplname;
    }

    public String getEmppasswordd() {
        return emppasswordd;
    }

    public void setEmppasswordd(String emppasswordd) {
        this.emppasswordd = emppasswordd;
    }

    public String getEmppassword_hash() {
        return emppassword_hash;
    }

    public void setEmppassword_hash(String emppassword_hash) {
        this.emppassword_hash = emppassword_hash;
    }

    public int getEmprole() {
        return emprole;
    }

    public void setEmprole(int emprole) {
        this.emprole = emprole;
    }
}
