package com.hg.p2p_2;

import com.hg.p2p_2.suijishu.Point;
import com.hg.p2p_2.suijishu.StraightLine;
import org.junit.Test;

import java.lang.annotation.Documented;
import java.util.*;

/**
 * try-return
 */
public class ReturnTest {

    public Integer tryreturn1() {
        Integer i = 1;
        try {
            System.out.println("try:" + i);
            return i;
        } finally {
            i++;
            System.out.println("finally:" + i);
        }
    }

    public int tryreturn2() {
        int i = 1;
        try {
            System.out.println("try:" + i);
            return i;
        } finally {
            i++;
            System.out.println("finally:" + i);
            return i;
        }
    }

    @Test
    public void jjjj() {
//        Integer a = tryreturn1();
//        System.out.println(a);
//
//        a = tryreturn2();
//        System.out.println(a);
        suiji(9);
    }

    public Set<Point> digui(int suijigeshu, Set<Point> set) {
        if (set == null || set.size() < 9) {
            Random random = new Random();
            Point t = new Point(
                    Long.parseLong(random.nextInt(100) + ""),
                    Long.parseLong(random.nextInt(100) + ""));
            set.add(t);
            digui(suijigeshu, set);
        } else {
            return set;
        }
        return set;
    }

    public Point[] suijiPoints(int suijigeshu) {
        Point[] points = new Point[suijigeshu];
        Set<Point> set = digui(suijigeshu, new HashSet<>());
        if (set != null && set.size() > 0) {
            int i = 0;
            for (Point t : set) {
                points[i] = t;
                i++;
            }
        }
        System.out.println(set.size());
        System.out.println(Arrays.toString(points));
        return points;
    }

    public void suiji(int suijigeshu) {
        int max_num = (suijigeshu * (suijigeshu - 1) * (suijigeshu - 2)) / 6;
        Set<StraightLine> ks = new HashSet<>();
        int count = 0;
        boolean flag = false;
        Point[] points = suijiPoints(suijigeshu);
        for (int i = 0; i < suijigeshu; i++) {
            for (int j = 1; j < suijigeshu; j++) {
                Point points1 = points[i];
                Point points2 = points[j];
                if (points1.getX() == points2.getX()) {
                    if (!flag) {
                        flag = true;
                    } else {
                        // 说明存在共线
                        count++;
                    }
                } else {
                    Double k = Double.valueOf(
                            (points1.getY() - points2.getY()) /
                                    (points1.getX() - points2.getX()));
                    Double b = Double.valueOf(points1.getY() - k * points1.getX());
                    StraightLine straightLine = new StraightLine(k, b);
                    if (ks.contains(straightLine)) {
                        count++;
                    } else {
                        ks.add(straightLine);
                    }
                }
            }
        }

        System.out.println(max_num);
        System.out.println(max_num - count);
    }
}
