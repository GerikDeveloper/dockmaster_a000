package org.ultima;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class AssetsLoader {
    public static class Asset {
        private final String resPath;

        public Asset(String resPath) {
            this.resPath = resPath;
        }

        public String getResPath() {
            return this.resPath;
        }

        public byte[] getData() {
            try (FileInputStream fis = new FileInputStream(this.resPath)) {
                return fis.readAllBytes();
            } catch (Exception unExc) {
                return null;
            }
        }
    }

    private static String getAssetResPath(String path) {
        String resPath = "web" + path;
        if (resPath.equals("web/")) {
            resPath += "index.html";
        }
        return resPath;
    }

    public static boolean isAssetExists(String path) {
        return (new File(getAssetResPath(path)).exists());
    }

    public static Asset getAsset(String path) {
        if (isAssetExists(path)) {
            return new Asset(getAssetResPath(path));
        } else {
            return null;
        }
    }
}
