package com.hg.p2p_2.suijishu;

/**
 * 平面直线
 */
public class StraightLine {
    private Double k;
    private Double b;

    public StraightLine() {
        super();
    }

    public StraightLine(Double k, Double b) {
        super();
        this.k = k;
        this.b = b;
    }

    public Double getK() {
        return k;
    }

    public void setK(Double k) {
        this.k = k;
    }

    public Double getB() {
        return b;
    }

    public void setB(Double b) {
        this.b = b;
    }

    @Override
    public String toString() {
        return "StraightLine{" +
                "k=" + k +
                ", b=" + b +
                '}';
    }
}
