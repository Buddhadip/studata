package com.info.action;

import java.util.*;

public class OTPGenerator {

    public static String generateOTP(int length) {
        String numbers = "0123456789";
        Random random = new Random();
        StringBuilder otp = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(numbers.length());
            otp.append(numbers.charAt(index));
        }

        return otp.toString();
    }
}
