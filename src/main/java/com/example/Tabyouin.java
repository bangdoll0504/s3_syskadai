package com.example;

public class Tabyouin {
    private String tabyouinid;
    private String tabyouinmei;
    private String tabyouinaddress;
    private String tabyouintel;
    private int tabyouinshihonkin;
    private int kyukyu;

    public Tabyouin(String tabyouinid, String tabyouinmei, String tabyouinaddress, String tabyouintel,
                    int tabyouinshihonkin, int kyukyu) {
        this.tabyouinid = tabyouinid;
        this.tabyouinmei = tabyouinmei;
        this.tabyouinaddress = tabyouinaddress;
        this.tabyouintel = tabyouintel;
        this.tabyouinshihonkin = tabyouinshihonkin;
        this.kyukyu = kyukyu;
    }

    public String getTabyouinid() {
        return tabyouinid;
    }

    public void setTabyouinid(String tabyouinid) {
        this.tabyouinid = tabyouinid;
    }

    public String getTabyouinmei() {
        return tabyouinmei;
    }

    public void setTabyouinmei(String tabyouinmei) {
        this.tabyouinmei = tabyouinmei;
    }

    public String getTabyouinaddress() {
        return tabyouinaddress;
    }

    public void setTabyouinaddress(String tabyouinaddress) {
        this.tabyouinaddress = tabyouinaddress;
    }

    public String getTabyouintel() {
        return tabyouintel;
    }

    public void setTabyouintel(String tabyouintel) {
        this.tabyouintel = tabyouintel;
    }

    public int getTabyouinshihonkin() {
        return tabyouinshihonkin;
    }

    public void setTabyouinshihonkin(int tabyouinshihonkin) {
        this.tabyouinshihonkin = tabyouinshihonkin;
    }

    public int getKyukyu() {
        return kyukyu;
    }

    public void setKyukyu(int kyukyu) {
        this.kyukyu = kyukyu;
    }
}
