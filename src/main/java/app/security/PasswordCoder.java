package app.security;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import static java.nio.charset.StandardCharsets.UTF_8;

public class PasswordCoder {

    private byte[] hashedPassword;
    private byte[] salt;
    private String hashtext;

   public PasswordCoder(String password) throws NoSuchAlgorithmException {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            byte[] messageDigest = md.digest(password.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            hashtext = no.toString(16);
            hashedPassword = md.digest(password.getBytes(UTF_8));

        }

        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }


    }

    public byte[] getHashedPassword() {
        return hashedPassword;
    }

    public void setHashedPassword(byte[] hashedPassword) {
        this.hashedPassword = hashedPassword;
    }

    public byte[] getSalt() {
        return salt;
    }

    public void setSalt(byte[] salt) {
        this.salt = salt;
    }

    public String getHashtext() {
        return hashtext;
    }

    public void setHashtext(String hashtext) {
        this.hashtext = hashtext;
    }
}
