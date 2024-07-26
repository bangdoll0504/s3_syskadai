package com.example;

import java.util.regex.Pattern;

public class Validator {
    // 金額フォーマットの正規表現
    private static final Pattern AMOUNT_PATTERN = Pattern.compile("^\\\\?\\d{1,3}(,\\d{3})*|\\d+$");
    // 電話番号フォーマットの正規表現 (例: 123-456-7890, 1234567890, (123) 456-7890)
    private static final Pattern PHONE_PATTERN = Pattern.compile("^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$");

    public static boolean isValidAmount(String amount) {
        return AMOUNT_PATTERN.matcher(amount).matches();
    }

    public static boolean isValidPhoneNumber(String phoneNumber) {
        return PHONE_PATTERN.matcher(phoneNumber).matches();
    }
}
