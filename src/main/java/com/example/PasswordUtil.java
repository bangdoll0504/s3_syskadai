package com.example;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtil {

    public static String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

    
    // パスワードの検証メソッド
    public static boolean verifyPassword(String enteredPassword, String storedPasswordHash) throws NoSuchAlgorithmException {
        String hashedEnteredPassword = hashPassword(enteredPassword);

        // ハッシュ化されたパスワードが一致するかどうかを比較する
        return hashedEnteredPassword.equals(storedPasswordHash);
    }

}
