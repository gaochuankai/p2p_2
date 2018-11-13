package com.hg.p2p_2.suijishu;

public class Point {
    private Long x;
    private Long y;

    public Point() {
        super();
    }

    public Point(Long x, Long y) {
        super();
        this.x = x;
        this.y = y;
    }

    public Long getX() {
        return x;
    }

    public void setX(Long x) {
        this.x = x;
    }

    public Long getY() {
        return y;
    }

    public void setY(Long y) {
        this.y = y;
    }

    @Override
    public String toString() {
        return "Point{" +
                "x=" + x +
                ", y=" + y +
                '}';
    }
}
