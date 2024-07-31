package com.example;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.util.regex.Pattern;



public class Validator {
    // 金額フォーマットの正規表現
    private static final Pattern AMOUNT_PATTERN = Pattern.compile("^\\\\?\\d{1,3}(,\\d{3})*|\\d+$");
    // 電話番号フォーマットの正規表現 (例: 123-456-7890, 1234567890, (123) 456-7890)
    private static final Pattern PHONE_PATTERN = Pattern.compile("^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$");

    public static boolean isValidAmount(String amount) {
        return AMOUNT_PATTERN.matcher(amount).matches();
    }

    public static String ConvAmount(String amount) {
        String currencyString = "¥1";
        Number number;
        // 通貨記号を削除
        currencyString = currencyString.replace("¥", "").trim();

        // DecimalFormatを使用してカンマを解析
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setGroupingSeparator(',');
        DecimalFormat decimalFormat = new DecimalFormat("#,##0", symbols);
        decimalFormat.setParseBigDecimal(true);

        try {
            number = decimalFormat.parse(currencyString);
            System.out.println("Numeric value: " + number.toString());
    		return number.toString();
    	} catch (ParseException e) {
            e.printStackTrace();
        }
        return "0";
    }

    
    public static boolean isValidPhoneNumber(String phoneNumber) {
        return PHONE_PATTERN.matcher(phoneNumber).matches();
    }
}
