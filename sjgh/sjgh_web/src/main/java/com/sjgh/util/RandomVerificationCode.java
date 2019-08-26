package com.sjgh.util;

public class RandomVerificationCode {

    public static  String getCode(){
        String A, B, C, D, E, F;
        A = String.valueOf((int)(Math.random() * 10));
        B = String.valueOf((int)(Math.random() * 10));
        C = String.valueOf((int)(Math.random() * 10));
        D = String.valueOf((int)(Math.random() * 10));
        E = String.valueOf((int)(Math.random() * 10));
        F = String.valueOf((int)(Math.random() * 10));
        return A + B + C + D + E + F;
    }
}
