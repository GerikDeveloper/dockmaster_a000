package org.ultima;

import java.util.HashMap;

/***
 Temp Data Executor Version A0.0.1
 ***/
public class TDBExecutor {
    public static class TData {
        public AccountMode getType() {
            return mode;
        }

        public String getName() {
            return name;
        }

        public String getPassword() {
            return password;
        }

        public static enum AccountMode {
            MODER,
            COMPANY;
        }

        private AccountMode mode;
        private String name;
        private String password;

        public TData(AccountMode type, String name, String password) {
            this.mode = type;
            this.name = name;
            this.password = password;
        }
    }

    private static HashMap<String, TData> tdbase;

    public static boolean createTDB() {
        tdbase = new HashMap<>();
        return true;
    }

    public static HashMap<String, TData> getTdbase() {
        return tdbase;
    }
}
