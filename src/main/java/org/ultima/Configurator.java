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
    private static String tgToken;
    private static long period;
    private static String moderName;
    private static String moderPassword;
    private static String logPath;

    public static int getBacklog() {
        return backlog;
    }

    public static int getPort() {
        return port;
    }

    public static String getTgToken() {
        return tgToken;
    }

    public static long getPeriod() {
        return period;
    }

    public static String getModerName() {
        return moderName;
    }

    public static String getModerPassword() {
        return moderPassword;
    }

    public static String getLogPath() {
        return logPath;
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
                    properties.containsKey("tg_token") &&
                    properties.containsKey("period") &&
                    properties.containsKey("moder_name") &&
                    properties.containsKey("moder_password") &&
                    properties.containsKey("log_path")) {
                port = Integer.parseInt(properties.getProperty("port"));
                backlog = Integer.parseInt(properties.getProperty("backlog"));
                tgToken = properties.getProperty("tg_token");
                period = Integer.parseInt(properties.getProperty("period"));
                moderName = properties.getProperty("moder_name");
                moderPassword = properties.getProperty("moder_password");
                logPath = properties.getProperty("log_path");
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
            tgToken = "6570058788:AAEb5yL-sm9m1igy_KUEPmB_LWOFg4Cfrbc";
            period = 10000;
            moderName = "admin";
            moderPassword = "admin";
            logPath = "logs.txt";
            //
            properties.put("port", Integer.toString(port));
            properties.put("backlog", Integer.toString(backlog));
            properties.put("tg_token", tgToken);
            properties.put("period", Long.toString(period));
            properties.put("moder_name", moderName);
            properties.put("moder_password", moderPassword);
            properties.put("log_path", logPath);
            try (FileOutputStream fos = new FileOutputStream(configsPath)) {
                properties.store(fos, null);
            } catch (Exception unExc) {
                properties = null;
                port = 0;
                backlog = 0;
                tgToken = null;
                period = 0;
                moderName = null;
                moderPassword = null;
                logPath = null;
                return false;
            }
            return true;
        } catch(Exception unExc){
            return false;
        }
    }
}
