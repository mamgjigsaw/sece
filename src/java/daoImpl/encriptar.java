/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package daoImpl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author mamg
 */
public class encriptar {
    public static String md5(String s) {
        String r = "";
        try {
            if (s != null) {
                MessageDigest algorithm =MessageDigest.getInstance("MD5");
                algorithm.reset();
                algorithm.update(s.getBytes());
                byte bytes[] = algorithm.digest();
                StringBuffer sb = new StringBuffer();
                for (int i = 0; i < bytes.length; i++) {
                    String hex = Integer.toHexString(0xff & bytes[i]);
                    if (hex.length() == 1)
                        sb.append('0');
                    sb.append(hex);
                }
                
                r = sb.toString();
            }
        } catch (NoSuchAlgorithmException e) { System.out.print(e.getMessage());
        }
        
        return r;

    }

}
