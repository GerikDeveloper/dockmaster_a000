package org.ultima;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.Base64;
import java.util.Date;
import java.util.Random;

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
                        "tgid INTEGER NOT NULL UNIQUE, " +
                        "path TEXT NOT NULL UNIQUE, " +
                        "last_date TEXT NOT NULL, " +
                        "last_noticed TEXT NOT NULL)");
                LoadingStatement.close();
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
                    "tgid INTEGER NOT NULL UNIQUE, " +
                    "path TEXT NOT NULL UNIQUE, " +
                    "last_date TEXT NOT NULL, " +
                    "last_noticed TEXT NOT NULL)");
            CreatingStatement.close();
            Logger.log(new Note("DB has been created"));
            return true;
        } catch (Exception unExc) {
            Logger.log(new Note("Unknown file or sqlite error"));
            return false;
        }
    }

    public static boolean createCompany(String name, String password, int tgId) {
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
                    "tgid, " +
                    "path, " +
                    "last_date," +
                    "last_noticed) " +
                    "VALUES (?, ?, ?, ?, ?, ?)");
            addingStatement.setString(1, name);
            addingStatement.setString(2, password);
            addingStatement.setInt(3, tgId);
            addingStatement.setString(4, path);
            addingStatement.setString(5, Server.getDateform().format(new Date()));
            addingStatement.setString(6, Server.getDateform().format(new Date()));
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
            gettingStatement = dbConnection.prepareStatement("SELECT * FROM " + dbName + " WHERE id = ?");
            gettingStatement.setInt(1, id);
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
            gettingStatement = dbConnection.prepareStatement("SELECT * FROM " + dbName + " WHERE id = ?");
            gettingStatement.setInt(1, id);
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

    public static long[] getLongParam(int id, String column, String dbPath, String dbName) {
        Connection dbConnection = null;
        PreparedStatement gettingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            gettingStatement = dbConnection.prepareStatement("SELECT * FROM " + dbName + " WHERE id = ?");
            gettingStatement.setInt(1, id);
            ResultSet statementResult = gettingStatement.executeQuery();
            long[] result = null;
            if (statementResult.next()) {
                result = new long[] {statementResult.getLong(column)};
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
        Statement countingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            countingStatement = dbConnection.createStatement();
            ResultSet cntRes = countingStatement.executeQuery("SELECT COUNT(" + column + ") FROM " + dbName);
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
            gettingStatement = dbConnection.prepareStatement("SELECT * FROM " + dbName);
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
            } else if (cnt == 0) {
                result = new String[0];
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
        Statement gettingStatement = null;
        Statement countingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            countingStatement = dbConnection.createStatement();
            ResultSet cntRes = countingStatement.executeQuery("SELECT COUNT( " + column + " ) FROM " + dbName);
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
            gettingStatement = dbConnection.createStatement();
            ResultSet statementResult = gettingStatement.executeQuery("SELECT * FROM " + dbName);
            int[] result = null;
            if (statementResult.next()) {
                result = new int[cnt];
                int pos = 0;
                result[pos] = statementResult.getInt(column);
                while(statementResult.next()) {
                    pos++;
                    result[pos] = statementResult.getInt(column);
                }
            } else if (cnt == 0) {
                result = new int[0];
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
            settingStatement = dbConnection.prepareStatement("UPDATE " + dbName + " SET " + column + " = ? WHERE id = ?");
            settingStatement.setString(1, data);
            settingStatement.setInt(2, id);
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
            settingStatement = dbConnection.prepareStatement("UPDATE " + dbName + " SET " + column + " = ? WHERE id = ?");
            settingStatement.setInt(1, data);
            settingStatement.setInt(2, id);
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

    public static boolean setLongParam(int id, String column, long data, String dbPath, String dbName) {
        Connection dbConnection = null;
        PreparedStatement settingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            settingStatement = dbConnection.prepareStatement("UPDATE " + dbName + " SET " + column + " = ? WHERE id = ?");
            settingStatement.setLong(1, data);
            settingStatement.setInt(2, id);
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

    public static int[] getIntsByStringParam(String column, String paramName, String paramData, String dbPath, String dbName) {
        Connection dbConnection = null;
        PreparedStatement gettingStatement = null;
        PreparedStatement countingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            countingStatement = dbConnection.prepareStatement("SELECT COUNT(" + column + ") FROM " + dbName + " WHERE " + paramName + " = ?");
            countingStatement.setString(1, paramData);
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
            gettingStatement = dbConnection.prepareStatement("SELECT * FROM " + dbName + " WHERE " + paramName + " = ?");
            gettingStatement.setString(1, paramData);
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

    public static String[] getStringsByStringParam(String column, String paramName, String paramData, String dbPath, String dbName) {
        Connection dbConnection = null;
        PreparedStatement gettingStatement = null;
        PreparedStatement countingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            countingStatement = dbConnection.prepareStatement("SELECT COUNT(" + column + ") FROM " + dbName + " WHERE " + paramName + " = ?");
            countingStatement.setString(1, paramData);
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
            gettingStatement = dbConnection.prepareStatement("SELECT * FROM " + dbName + " WHERE " + paramName + " = ?");
            gettingStatement.setString(1, paramData);
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

    public static int[] getIntsByIntParam(String column, String paramName, int paramData, String dbPath, String dbName) {
        Connection dbConnection = null;
        PreparedStatement gettingStatement = null;
        PreparedStatement countingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            countingStatement = dbConnection.prepareStatement("SELECT COUNT(" + column + ") FROM " + dbName + " WHERE " + paramName + " = ?");
            countingStatement.setInt(1, paramData);
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
            gettingStatement = dbConnection.prepareStatement("SELECT * FROM " + dbName + " WHERE " + paramName + " = ?");
            gettingStatement.setInt(1, paramData);
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

    public static String[] getStringsByIntParam(String column, String paramName, int paramData, String dbPath, String dbName) {
        Connection dbConnection = null;
        PreparedStatement gettingStatement = null;
        PreparedStatement countingStatement = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
            countingStatement = dbConnection.prepareStatement("SELECT COUNT(" + column + ") FROM " + dbName + " WHERE " + paramName + " = ?");
            countingStatement.setInt(1, paramData);
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
            gettingStatement = dbConnection.prepareStatement("SELECT * FROM " + dbName + " WHERE " + paramName + " = ?");
            gettingStatement.setInt(1, paramData);
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

    public static int[] getCompanyIds() {
        return getAllIntParam("id", cmpsDBPath, "companies");
    }

    public static String getCompanyName(int id) {
        return getStringParam(id, "name", cmpsDBPath, "companies");
    }

    public static int[] getCompanyId(String name) {
        return getIntsByStringParam("id", "name", name, cmpsDBPath, "companies");
    }

    public static String getCompanyPassword(int id) {
        return getStringParam(id, "password", cmpsDBPath, "companies");
    }

    public static String getCompanyTgId(int id) {
        return getStringParam(id, "tgid", cmpsDBPath, "companies");
    }

    public static String getCompanyPath(int id) {
        return getStringParam(id, "path", cmpsDBPath, "companies");
    }

    public static String getCompanyLastDate(int id) {
        return getStringParam(id, "last_date", cmpsDBPath, "companies");
    }

    public static String getCompanyLastNoticed(int id) {
        return getStringParam(id, "last_noticed", cmpsDBPath, "companies");
    }

    public static boolean isCmpPasswordCorrect(String name, String password) {
        int[] id = getIntsByStringParam("id", "name", name, cmpsDBPath, "companies");
        if (id != null) {
            if (id.length != 0) {
                String corPass = getCompanyPassword(id[0]);
                if (corPass != null) {
                    return password.equals(corPass);
                }
            }
        }
        return false;
    }

    public static String getCmpNoticeType(int cmpId, int ntcId) {
        String path = getCompanyPath(cmpId);
        if (path != null) {
            path += "/notices.db";
            return getStringParam(ntcId, "type", path, "notices");
        }
        return null;
    }

    public static boolean setCmpTgId(int cmpId, long tdId) {
        return setLongParam(cmpId, "tgid", tdId, cmpsDBPath, "companies");
    }

    public static long[] getCmpTgId(int cmpId) {
        return getLongParam(cmpId, "tgid", cmpsDBPath, "companies");
    }

    public static boolean setCmpNoticeType(int cmpId, int ntcId, String type) {
        String path = getCompanyPath(cmpId);
        if (path != null) {
            path += "/notices.db";
            return setStringParam(ntcId, "type", type, path, "notices");
        }
        return false;
    }

    public static boolean setCompanyLastNociced(int cmpId, String date) {
        return setStringParam(cmpId, "last_noticed", date, cmpsDBPath, "companies");
    }

    public static String getCmpNoticeDataPath(int cmpId, int ntcId) {
        String path = getCompanyPath(cmpId);
        if (path != null) {
            path += "/notices.db";
            return getStringParam(ntcId, "path", path, "notices");
        }
        return null;
    }

    public static int[] getCmpNoticeIds(int cmpId) {
        String path = getCompanyPath(cmpId);
        if (path != null) {
            path += "/notices.db";
            return getAllIntParam("id", path, "notices");
        }
        return null;
    }

    public static byte[] getCmpNoticeData(int cmpId, int ntcId) {
        String dataPath = getCmpNoticeDataPath(cmpId, ntcId);
        if (dataPath != null) {
            try (FileInputStream fis = new FileInputStream(dataPath)) {
                return fis.readAllBytes();
            } catch (Exception unExc) {
                return null;
            }
        } else {
            return null;
        }
    }

    public static boolean createCmpNotice(int cmpId, String type, byte[] data) {
        String path = getCompanyPath(cmpId);
        if (path != null) {
            Connection companyDB = null;
            PreparedStatement creatingStatement = null;
            try {
                String filePath = (path + "/file_" + Server.getDateform().format(new Date()) + "_" + Long.toString(new Random().nextLong()) + ".data");
                if (!new File(filePath).exists()) {
                    if (!new File(filePath).createNewFile()) {
                        return false;
                    }
                } else {
                    return false;
                }
                try (OutputStream out = new FileOutputStream(filePath)) {
                    out.write(data);
                    out.flush();
                } catch (Exception unExc) {
                    throw new Exception();
                }
                companyDB = DriverManager.getConnection("jdbc:sqlite:" + path + "/notices.db");
                creatingStatement = companyDB.prepareStatement("INSERT INTO notices (" +
                        "type, " +
                        "path) " +
                        "VALUES (?, ?)");
                creatingStatement.setString(1, type);
                creatingStatement.setString(2, filePath);
                int updated = creatingStatement.executeUpdate();
                if (updated == 0) throw new Exception();
                creatingStatement.close();
                companyDB.close();
                return true;
            } catch (Exception unExc) {
                try {
                    if (creatingStatement != null) creatingStatement.close();
                    if (companyDB != null) companyDB.close();
                } catch (Exception immediatelyClosingException) {
                    return false;
                }
                return false;
            }
        }
        return false;
    }
}
