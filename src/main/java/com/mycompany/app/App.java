package com.mycompany.app;

import java.util.Random;

public class App {
    public String method1(int num) {
        if (num > 7)
            return "More than 7";

        return "Less than 7";
    }

    public int doInt() {
        return new Random().nextInt(8);
    }

    public static void main(String args[]) {
        System.out.println("hello world");
    }
}
