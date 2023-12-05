package org.ultima;


import java.nio.charset.StandardCharsets;

/***
 * Bytes Operations Class for Server version Demo_0.0.2
 ***/

public class ByteOperations {
    public static int byteToInt(byte num) {
        return (num < 0) ? 256 + num : num;
    }

    public static byte intToByte(int num) {
        return (byte) ((num < 0) ? 128 + num : num);
    }

    public static byte[] getByteString(String content) {
        byte[] bytes = ("_" + content).getBytes(StandardCharsets.UTF_8);
        bytes[0] = intToByte(bytes.length - 1);
        return bytes;
    }

    public static byte[] getIntString(String content) {
        byte[] bytes = ("____" + content).getBytes(StandardCharsets.UTF_8);
        byte[] bytesLen = getIntBytes(bytes.length - 4);
        bytes[0] = bytesLen[0];
        bytes[1] = bytesLen[1];
        bytes[2] = bytesLen[2];
        bytes[3] = bytesLen[3];
        return bytes;
    }

    public static byte[] getStringBytes(String data) {
        return data.getBytes(StandardCharsets.UTF_8);
    }

    public static String getString(byte[] data) {
        return new String(data, StandardCharsets.UTF_8);
    }

    public static String getIntStringContent(byte[] data) {
        return new String(data, StandardCharsets.UTF_8).substring(4);
    }

    public static String getByteStringContent(byte[] data) {
        String content = new String(data, StandardCharsets.UTF_8);
        return content.substring(1);
    }

    public static String getBytesContent(byte[] data, int length) {
        String content = new String(data, StandardCharsets.UTF_8);
        return content.substring(0, length);
    }

    public static String getBytesContent(byte[] data) {
        return new String(data, StandardCharsets.UTF_8);
    }

    public static int getInt(byte[] data) {
        int[] integers = new int[4];
        integers[0] = byteToInt(data[0]);
        integers[1] = byteToInt(data[1]) << 8;
        integers[2] = byteToInt(data[2]) << 16;
        integers[3] = byteToInt(data[3]) << 24;
        return integers[0] | integers[1] | integers[2] | integers[3];
    }

    public static short getShort(byte[] data) {
        short[] shorts = new short[2];
        shorts[0] = (short) byteToInt(data[0]);
        shorts[1] = (short) (byteToInt(data[1]) << 8);
        return (short) (shorts[0] | shorts[1]);
    }

    public static long getLong(byte[] data) {
        long[] longs = new long[8];
        longs[0] = byteToInt(data[0]);
        longs[1] = ((long) byteToInt(data[1])) << 8;
        longs[2] = ((long) byteToInt(data[1])) << 16;
        longs[3] = ((long) byteToInt(data[1])) << 24;
        longs[4] = ((long) byteToInt(data[1])) << 32;
        longs[5] = ((long) byteToInt(data[1])) << 40;
        longs[6] = ((long) byteToInt(data[1])) << 48;
        longs[7] = ((long) byteToInt(data[1])) << 56;
        return longs[0] | longs[1] | longs[2] | longs[3] | longs[4] | longs[5] | longs[6] | longs[7];
    }

    public static String getIpString(byte[] ip) {
        if (ip.length == 4) {
            return byteToInt(ip[0]) + "." + byteToInt(ip[1]) + "." + byteToInt(ip[2]) + "." + byteToInt(ip[3]);
        } else if (ip.length == 16) {
            StringBuilder result = new StringBuilder();
            for (int wrote = 0; wrote < 4; wrote++) {
                String hexShort =
                        Integer.toHexString(Short.toUnsignedInt(ByteOperations.getShort(
                                new byte[]{ip[wrote * 2], ip[(wrote * 2) + 1]})));
                hexShort = "%s%s".formatted("0".repeat(4 - hexShort.length()), hexShort);
                result.append(hexShort);
                result.append(':');
            }
            return result.substring(0, (result.length() - 1));
        } else {
            StringBuilder resultBuilder = new StringBuilder();
            for (byte ipByte : ip) {
                resultBuilder.append(byteToInt(ipByte)).append(":");
            }
            String result = resultBuilder.toString();
            return result.substring(0, result.length() - 1);
        }
    }

    public static byte[] getIntBytes(int num) {
        int[] integers = new int[4];
        integers[0] = (num << 24) >>> 24;
        integers[1] = (num << 16) >>> 24;
        integers[2] = (num << 8) >>> 24;
        integers[3] = (num >>> 24);
        byte[] result = new byte[4];
        result[0] = intToByte(integers[0]);
        result[1] = intToByte(integers[1]);
        result[2] = intToByte(integers[2]);
        result[3] = intToByte(integers[3]);
        return result;
    }

    public static byte[] getShortBytes(short num) {
        return new byte[]{intToByte((num << 8) >>> 8), intToByte(num >>> 8)};
    }

    public static byte[] getLongBytes(long num) {
        long[] longs = new long[8];
        longs[0] = (num << 56) >>> 56;
        longs[1] = (num << 48) >>> 56;
        longs[2] = (num << 40) >>> 56;
        longs[3] = (num << 32) >>> 56;
        longs[4] = (num << 24) >>> 56;
        longs[5] = (num << 16) >>> 56;
        longs[6] = (num << 8) >>> 56;
        longs[7] = (num >>> 56);
        byte[] result = new byte[8];
        result[0] = intToByte((int) longs[0]);
        result[1] = intToByte((int) longs[1]);
        result[2] = intToByte((int) longs[2]);
        result[3] = intToByte((int) longs[3]);
        result[4] = intToByte((int) longs[4]);
        result[5] = intToByte((int) longs[5]);
        result[6] = intToByte((int) longs[6]);
        result[7] = intToByte((int) longs[7]);
        return result;
    }
}