package com.interpixel.webprojsp;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.*;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Julius
 */
public class WebUtil {

    /**
     * Get the MD5 hash from a string
     * 
     * @param input string to hash
     * @return hashed string
     * @author: https://www.geeksforgeeks.org/md5-hash-in-java/
     */
    public static String getMd5(String input) {
        try {

            // Static getInstance method is called with hashing MD5 
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest 
            //  of an input digest() return array of byte 
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value 
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } // For specifying wrong message digest algorithms 
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Validate the form of an email address.
     *
     * @param emailIn email to check
     * @return true if email is valid
     * @author http://www.javapractices.com/topic/TopicAction.do?Id=180
     */
    public static boolean isValidEmailAddress(String emailIn) {
        if (emailIn == null) {
            return false;
        }
        boolean result = true;
        try {
            InternetAddress emailAddr = new InternetAddress(emailIn);
            if (!hasNameAndDomain(emailIn)) {
                result = false;
            }
        } catch (AddressException ex) {
            result = false;
        }
        return result;
    }

    private static boolean hasNameAndDomain(String aEmailAddress) {
        String[] tokens = aEmailAddress.split("@");
        return tokens.length == 2 && textHasContent(tokens[0]) && textHasContent(tokens[1]);
    }

    public static boolean textHasContent(String aText) {
        return (aText != null) && (aText.trim().length() > 0);
    }

}
