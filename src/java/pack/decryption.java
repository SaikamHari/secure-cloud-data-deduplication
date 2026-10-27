
package pack;

import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class decryption {

    public String decrypt(String txt, String skey) {
        String decryptedtext = null;

        try {
            // Decode the Base64-encoded AES key
            byte[] bs = Base64.getDecoder().decode(skey);

            // Create the AES secret key
            SecretKey sec = new SecretKeySpec(bs, "AES");

            // Initialize AES decryption
            Cipher aesCipher = Cipher.getInstance("AES");
            aesCipher.init(Cipher.DECRYPT_MODE, sec);

            // Decode the encrypted text from Base64
            byte[] byteCipherText = Base64.getDecoder().decode(txt);

            // Decrypt the encrypted bytes
            byte[] byteDecryptedText = aesCipher.doFinal(byteCipherText);

            // Convert decrypted bytes to text
            decryptedtext = new String(
                    byteDecryptedText,
                    java.nio.charset.StandardCharsets.UTF_8
            );

// Disabled for security:             System.out.println("Decrypted Text: " + decryptedtext);

        } catch (Exception e) {
// Disabled for security:             System.out.println("Decryption failed: " + e.getMessage());
// Disabled for security:             e.printStackTrace();
        }

        return decryptedtext;
    }
}
