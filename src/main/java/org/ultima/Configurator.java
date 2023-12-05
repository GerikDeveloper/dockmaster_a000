package org.ultima;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Properties;

public class Configurator {

    private static Properties properties;

    private static final String configsDir = "configs";
    private static final String configsPath = (configsDir + "/" + "server.properties");

    private static int port;
    private static int backlog;
    private static String email;
    private static String emailPassword;
    private static int period;
    private static String moderName;
    private static String moderPassword;

    public static int getBacklog() {
        return backlog;
    }

    public static int getPort() {
        return port;
    }

    public static String getEmail() {
        return email;
    }

    public static String getEmailPassword() {
        return emailPassword;
    }

    public static int getPeriod() {
        return period;
    }

    public static String getModerName() {
        return moderName;
    }

    public static String getModerPassword() {
        return moderPassword;
    }

    public static Properties getProperties() {
        return properties;
    }

    public static boolean loadConfigs() {
        if (new File(configsPath).exists()) {
            properties = new Properties();
            try (FileInputStream fis = new FileInputStream(configsPath)) {
                properties.load(fis);
            } catch (Exception unExc) {
                return false;
            }
            if (properties.containsKey("port") &&
                    properties.containsKey("backlog") &&
                    properties.containsKey("email") &&
                    properties.containsKey("email_password") &&
                    properties.containsKey("period") &&
                    properties.containsKey("moder_name") &&
                    properties.containsKey("moder_password")) {
                port = Integer.parseInt(properties.getProperty("port"));
                backlog = Integer.parseInt(properties.getProperty("backlog"));
                email = properties.getProperty("email");
                emailPassword = properties.getProperty("email_password");
                period = Integer.parseInt(properties.getProperty("period"));
                moderName = properties.getProperty("moder_name");
                moderPassword = properties.getProperty("moder_password");
                return true;
            }
        }
        properties = null;
        return false;
    }

    public static boolean createDefaultConfigs() {
        try {
            if(!new File(configsPath).exists()) {
                if (!new File(configsDir).exists()) {
                    if (!new File(configsDir).mkdirs()) {
                        throw new Exception();
                    }
                }
                if (!new File(configsPath).createNewFile()) {
                    throw new Exception();
                }
            }
            properties = new Properties();
            //Default values
            port = 8080;
            backlog = 10;
            email = "example@mail.com";
            emailPassword = "qwerty12345678";
            period = 0;
            moderName = "admin";
            moderPassword = "admin";
            //
            properties.put("port", Integer.toString(port));
            properties.put("backlog", Integer.toString(backlog));
            properties.put("email", email);
            properties.put("email_password", emailPassword);
            properties.put("period", Integer.toString(period));
            properties.put("moder_name", moderName);
            properties.put("moder_password", moderPassword);
            try (FileOutputStream fos = new FileOutputStream(configsPath)) {
                properties.store(fos, null);
            } catch (Exception unExc) {
                properties = null;
                port = 0;
                backlog = 0;
                email = null;
                emailPassword = null;
                period = 0;
                moderName = null;
                moderPassword = null;
                return false;
            }
            return true;
        } catch(Exception unExc){
            return false;
        }
    }
}
