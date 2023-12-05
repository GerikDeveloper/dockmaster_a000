package org.ultima;

import java.io.File;
import java.sql.*;
import java.util.Base64;
import java.util.Date;

import org.ultima.Logger.Note;

public class DBExecutor {

    private static final String cmpsDBPath = "data/companies.db";

    public static boolean loadDB() {
        Logger.log(new Note("Loading companies db..."));
        if (new File(cmpsDBPath).exists()) {
            try {
                Connection companiesDB = DriverManager.getConnection("jdbc:sqlite:" + cmpsDBPath);
                Statement LoadingStatement = companiesDB.createStatement();
                LoadingStatement.execute("CREATE TABLE IF NOT EXISTS companies(" +
                        "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                        "name TEXT NOT NULL UNIQUE, " +
                        "password TEXT NOT NULL, " +
                        "email TEXT NOT NULL UNIQUE, " +
                        "path TEXT NOT NULL UNIQUE, " +
                        "last_date TEXT NOT NULL)");
                LoadingStatement.close();
                Logger.log(new Note("DB has been loaded"));
                return true;
            } catch (Exception unkExc) {
                Logger.log(new Note("Unknown file or sql error"));
            }
        }
        return false;
    }

    public static boolean createDB() {
        Logger.log(new Note("Creating database..."));
        try {
            if (new File("data").exists()) {
                Logger.log(new Note("DBDirectory was found"));
            } else {
                Logger.log(new Note("DBDirectory was not found, \nCreating DBDirectory"));
                if (new File("data").mkdirs()) {
                    Logger.log(new Note("DBDirectory was made"));
                } else {
                    Logger.log(new Note("Failed to create DBDirectory, please restart"));
                    return false;
                }
            }
            if (new File(cmpsDBPath).exists()) {
                Logger.log(new Note("DBFile was found"));
            } else {
                Logger.log(new Note("DBFile was not found, \nCreating DBFile"));
                if (new File(cmpsDBPath).createNewFile()) {
                    Logger.log(new Note("DBFile was made"));
                } else {
                    Logger.log(new Note("Failed to create DBFile, please restart"));
                    return false;
                }
            }
            Connection companiesDB = DriverManager.getConnection("jdbc:sqlite:" + cmpsDBPath);
            Statement CreatingStatement = companiesDB.createStatement();
            CreatingStatement.execute("CREATE TABLE IF NOT EXISTS companies(" +
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "name TEXT NOT NULL UNIQUE, " +
                    "password TEXT NOT NULL, " +
                    "email TEXT NOT NULL UNIQUE, " +
                    "path TEXT NOT NULL UNIQUE, " +
                    "last_date TEXT NOT NULL)");
            CreatingStatement.close();
            Logger.log(new Note("DB has been created"));
            return true;
        } catch (Exception unkExc) {
            Logger.log(new Note("Unknown file or sqlite error"));
            return false;
        }
    }

    public static boolean createCompany(String name, String password, String email) {
        Connection dbConnection = null;
        PreparedStatement addingStatement = null;
        Connection companyDB = null;
        Statement loadingStatement = null;
        try {
            String path = "data/" + Base64.getEncoder().encodeToString(ByteOperations.getStringBytes(name));
            if (!new File(path).exists()) {
                if (!new File(path).mkdirs()) {
                    throw new Exception();
                }
            }
            if (!new File(path + "/notices.db").exists()) {
                if (!new File(path + "/notices.db").createNewFile()) {
                    throw new Exception();
                }
            }
            companyDB = DriverManager.getConnection("jdbc:sqlite:" + path + "/notices.db");
            loadingStatement = companyDB.createStatement();
            loadingStatement.execute("CREATE TABLE IF NOT EXISTS notices(" +
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "type TEXT NOT NULL, " +
                    "path TEXT NOT NULL UNIQUE)");
            loadingStatement.close();
            companyDB.close();
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + cmpsDBPath);
            addingStatement = dbConnection.prepareStatement("INSERT INTO companies (" +
                    "name, " +
                    "password, " +
                    "email, " +
                    "path, " +
                    "last_date, " +
                    "VALUES (?, ?, ?, ?, ?)");
            addingStatement.setString(1, name);
            addingStatement.setString(2, password);
            addingStatement.setString(3, email);
            addingStatement.setString(4, path);
            addingStatement.setString(5, Server.getDateform().format(new Date()));
            int updated = addingStatement.executeUpdate();
            if (updated == 0) throw new Exception();
            addingStatement.close();
            dbConnection.close();
        } catch (Exception unExc) {
            try {
                if (addingStatement != null) addingStatement.close();
                if (dbConnection != null) dbConnection.close();
                if (loadingStatement != null) loadingStatement.close();
                if (companyDB != null) companyDB.close();
            } catch (Exception immediatelyClosingException) {
                return false;
            }
            return false;
        }
        return true;
    }

    public static String getStringParam(int id, String column, String dbPath, String dbName) {
        Connection dbConnection = null;
        PreparedStatement gettingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            gettingStatement = dbConnection.prepareStatement("SELECT * FROM ? WHERE id = ?");
            gettingStatement.setString(1, dbName);
            gettingStatement.setInt(2, id);
            ResultSet statementResult = gettingStatement.executeQuery();
            String result = null;
            if (statementResult.next()) {
                result = statementResult.getString(column);
            } else {
                statementResult.close();
                throw new Exception();
            }
            statementResult.close();
            gettingStatement.close();
            dbConnection.close();
            return result;
        } catch (Exception dbException) {
            try {
                if (gettingStatement != null) gettingStatement.close();
                if (dbConnection != null) dbConnection.close();
            } catch (Exception immediatelyClosingException) {
                return null;
            }
            return null;
        }
    }

    public static int[] getIntParam(int id, String column, String dbPath, String dbName) {
        Connection dbConnection = null;
        PreparedStatement gettingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            gettingStatement = dbConnection.prepareStatement("SELECT * FROM ? WHERE id = ?");
            gettingStatement.setString(1, dbName);
            gettingStatement.setInt(2, id);
            ResultSet statementResult = gettingStatement.executeQuery();
            int[] result = null;
            if (statementResult.next()) {
                result = new int[] {statementResult.getInt(column)};
            } else {
                statementResult.close();
                throw new Exception();
            }
            statementResult.close();
            gettingStatement.close();
            dbConnection.close();
            return result;
        } catch (Exception dbException) {
            try {
                if (gettingStatement != null) gettingStatement.close();
                if (dbConnection != null) dbConnection.close();
            } catch (Exception immediatelyClosingException) {
                return null;
            }
            return null;
        }
    }

    public static String[] getAllStringParam(String column, String dbPath, String dbName) {
        Connection dbConnection = null;
        PreparedStatement gettingStatement = null;
        PreparedStatement countingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            countingStatement = dbConnection.prepareStatement("SELECT COUNT(?) FROM ?");
            countingStatement.setString(1, column);
            countingStatement.setString(2, dbName);
            ResultSet cntRes = countingStatement.executeQuery();
            int cnt = 0;
            /**XXX Replace counter with while & List **/
            if (cntRes.next()) {
                cnt = cntRes.getInt(1);
                cntRes.close();
                countingStatement.close();
            } else {
                cntRes.close();
                throw new Exception();
            }
            gettingStatement = dbConnection.prepareStatement("SELECT * FROM ?");
            gettingStatement.setString(1, dbName);
            ResultSet statementResult = gettingStatement.executeQuery();
            String[] result = null;
            if (statementResult.next()) {
                result = new String[cnt];
                int pos = 0;
                result[pos] = statementResult.getString(column);
                while(statementResult.next()) {
                    pos++;
                    result[pos] = statementResult.getString(column);
                }
            } else {
                statementResult.close();
                throw new Exception();
            }
            statementResult.close();
            gettingStatement.close();
            dbConnection.close();
            return result;
        } catch (Exception dbException) {
            try {
                if (countingStatement != null) countingStatement.close();
                if (gettingStatement != null) gettingStatement.close();
                if (dbConnection != null) dbConnection.close();
            } catch (Exception immediatelyClosingException) {
                return null;
            }
            return null;
        }
    }

    public static int[] getAllIntParam(String column, String dbPath, String dbName) {
        Connection dbConnection = null;
        PreparedStatement gettingStatement = null;
        PreparedStatement countingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            countingStatement = dbConnection.prepareStatement("SELECT COUNT(?) FROM ?");
            countingStatement.setString(1, column);
            countingStatement.setString(2, dbName);
            ResultSet cntRes = countingStatement.executeQuery();
            int cnt = 0;
            /**XXX Replace counter with while & List **/
            if (cntRes.next()) {
                cnt = cntRes.getInt(1);
                cntRes.close();
                countingStatement.close();
            } else {
                cntRes.close();
                throw new Exception();
            }
            gettingStatement = dbConnection.prepareStatement("SELECT * FROM ?");
            gettingStatement.setString(1, dbName);
            ResultSet statementResult = gettingStatement.executeQuery();
            int[] result = null;
            if (statementResult.next()) {
                result = new int[cnt];
                int pos = 0;
                result[pos] = statementResult.getInt(column);
                while(statementResult.next()) {
                    pos++;
                    result[pos] = statementResult.getInt(column);
                }
            } else {
                statementResult.close();
                throw new Exception();
            }
            statementResult.close();
            gettingStatement.close();
            dbConnection.close();
            return result;
        } catch (Exception dbException) {
            try {
                if (countingStatement != null) countingStatement.close();
                if (gettingStatement != null) gettingStatement.close();
                if (dbConnection != null) dbConnection.close();
            } catch (Exception immediatelyClosingException) {
                return null;
            }
            return null;
        }
    }

    public static boolean setStringParam(int id, String column, String data, String dbPath, String dbName) {
        Connection dbConnection = null;
        PreparedStatement settingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            settingStatement = dbConnection.prepareStatement("UPDATE ? SET ? = ?, WHERE id = ?");
            settingStatement.setString(1, dbName);
            settingStatement.setString(2, column);
            settingStatement.setString(3, data);
            settingStatement.setInt(4, id);
            int updated = settingStatement.executeUpdate();
            if (updated == 0) throw new Exception();
            settingStatement.close();
            dbConnection.close();
        } catch (Exception dbException) {
            try {
                if (settingStatement != null) settingStatement.close();
                if (dbConnection != null) dbConnection.close();
            } catch (Exception immediatelyClosingException) {
                return false;
            }
            return false;
        }
        return true;
    }

    public static boolean setIntParam(int id, String column, int data, String dbPath, String dbName) {
        Connection dbConnection = null;
        PreparedStatement settingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            settingStatement = dbConnection.prepareStatement("UPDATE ? SET ? = ?, WHERE id = ?");
            settingStatement.setString(1, dbName);
            settingStatement.setString(2, column);
            settingStatement.setInt(3, data);
            settingStatement.setInt(4, id);
            int updated = settingStatement.executeUpdate();
            if (updated == 0) throw new Exception();
            settingStatement.close();
            dbConnection.close();
        } catch (Exception dbException) {
            try {
                if (settingStatement != null) settingStatement.close();
                if (dbConnection != null) dbConnection.close();
            } catch (Exception immediatelyClosingException) {
                return false;
            }
            return false;
        }
        return true;
    }

    public static String getCompanyName(int id) {
        return getStringParam(id, "name", cmpsDBPath, "companies");
    }

    public static String getCompanyPassword(int id) {
        return getStringParam(id, "password", cmpsDBPath, "companies");
    }

    public static String getCompanyEmail(int id) {
        return getStringParam(id, "email", cmpsDBPath, "companies");
    }

    public static String getCompanyPath(int id) {
        return getStringParam(id, "path", cmpsDBPath, "companies");
    }

    public static String getCompanyLastDate(int id) {
        return getStringParam(id, "last_date", cmpsDBPath, "companies");
    }

    public static String getCmpNoticeType(int id) {
        String path = getCompanyPath(id);
        if (path != null) {
            path += "/notices.db";
            return getStringParam(id, "type", path, "notices");
        }
        return null;
    }

    public static String getCmpNoticeDataPath(int id) {
        String path = getCompanyPath(id);
        if (path != null) {
            path += "/notices.db";
            return getStringParam(id, "path", path, "notices");
        }
        return null;
    }

    public static int[] getCmpNoticeIds(int id) {
        String path = getCompanyPath(id);
        if (path != null) {
            path += "/notices.db";
            return getAllIntParam("id", path, "notices");
        }
        return null;
    }
}
