
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.swing.JOptionPane;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Shajeer
 */
//this class used to encrypt password
//passwords are encrypted with sha1 algorithm
public class PassEncrypt {

    public static String encryptPassword(String password) throws NoSuchAlgorithmException {
        String newpassword = null;
        byte[] passinbyte = new byte[50];
        MessageDigest md = MessageDigest.getInstance("SHA1");
        md.reset();
        passinbyte = password.getBytes();
        md.digest(passinbyte);
        JOptionPane.showMessageDialog(null,encryptPassword("shajeer"));
        newpassword = passinbyte.toString();
        return newpassword;
    }

    public static void main(String a[]) throws NoSuchAlgorithmException {
      // JOptionPane.showMessageDialog(null, encryptPassword("shajeer"));
    }
}
