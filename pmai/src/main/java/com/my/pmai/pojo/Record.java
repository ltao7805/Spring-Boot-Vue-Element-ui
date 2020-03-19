package com.my.pmai.pojo;

import java.sql.Timestamp;

public class Record {
    private Integer raid;

    private Integer pricer;

    private String ruser;

    private Timestamp timer;

    public Integer getRaid() {
        return raid;
    }

    public void setRaid(Integer raid) {
        this.raid = raid;
    }

    public Integer getPricer() {
        return pricer;
    }

    public void setPricer(Integer pricer) {
        this.pricer = pricer;
    }

    public String getRuser() {
        return ruser;
    }

    public void setRuser(String ruser) {
        this.ruser = ruser;
    }

    public Timestamp getTimer() {
        return timer;
    }

    public void setTimer(Timestamp timer) {
        this.timer = timer;
    }
}