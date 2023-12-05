package org.ultima;

import java.util.HashMap;

/***
 Temp Data Executor Version A0.0.1
 ***/
public class TDBExecutor {
    public static class TData {
        public AccountType getType() {
            return type;
        }

        public String getName() {
            return name;
        }

        public String getPassword() {
            return password;
        }

        public static enum AccountType {
            MODER,
            COMPANY;
        }

        private AccountType type;
        private String name;
        private String password;

        public TData(AccountType type, String name, String password) {
            this.type = type;
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
