package DAO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author anquan
 */
public class HashDAO {
        private String hashCode ;

        public HashDAO(String password) {
            this.hashCode = hashPassword(password);
        }

        private String hashPassword(String password) {
            try {
                    MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
                    byte[] hashBytes = messageDigest.digest(password.getBytes());

                    StringBuilder stringBuilder = new StringBuilder();
                    for (byte b : hashBytes) {
                        stringBuilder.append(String.format("%02x", b));
                    }
                    return stringBuilder.toString();
            } catch (NoSuchAlgorithmException e) {
                  System.out.println("Error");
            }
             return null;
        }

        public String getHashCode() {
            return hashCode;
        }             
}
