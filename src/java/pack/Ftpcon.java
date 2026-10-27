
package pack;

import java.io.File;
import java.io.FileInputStream;
import org.apache.commons.net.ftp.FTPClient;

public class Ftpcon {
    private final FTPClient client = new FTPClient();

    public boolean upload(File file) {
        String host = System.getenv("FTP_HOST");
        String username = System.getenv("FTP_USERNAME");
        String password = System.getenv("FTP_PASSWORD");
        String directory = System.getenv("FTP_DIRECTORY");

        if (host == null || username == null || password == null
                || directory == null) {
            System.err.println("FTP environment variables are not configured.");
            return false;
        }

        try (FileInputStream fis = new FileInputStream(file)) {
            client.connect(host);

            if (!client.login(username, password)) {
                System.err.println("FTP login failed.");
                return false;
            }

            client.enterLocalPassiveMode();
            client.setFileType(FTPClient.BINARY_FILE_TYPE);

            String remotePath = directory.endsWith("/")
                    ? directory + file.getName()
                    : directory + "/" + file.getName();

            boolean uploaded = client.storeFile(remotePath, fis);

            if (!uploaded) {
                System.err.println("FTP upload failed.");
            }

            return uploaded;
        } catch (Exception e) {
            System.err.println("FTP operation failed: "
                    + e.getClass().getSimpleName());
            return false;
        } finally {
            try {
                if (client.isConnected()) {
                    client.logout();
                    client.disconnect();
                }
            } catch (Exception ignored) {
                // Best-effort FTP connection cleanup.
            }
        }
    }
}
