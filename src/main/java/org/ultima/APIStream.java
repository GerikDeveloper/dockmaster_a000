package org.ultima;


import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

public class APIStream {
    private OutputStream out;
    private InputStream in;

    private long lastTime;
    private long timeout;

    private synchronized long getTimeLeft() {
        return (lastTime - (new Date().getTime() / 1000));
    }

    public synchronized void resetTime() {
        lastTime = ((new Date().getTime() / 1000) + timeout);
    }

    public synchronized boolean isWorking() {
        return ((getTimeLeft() > 0) && Server.isWorking());
    }

    public void close() {
        if (in != null) {
            try {
                in.close();
                in = null;
            } catch (Exception unknownException) {
                in = null;
            }
        }
        if (out != null) {
            try {
                out.close();
                out = null;
            } catch (Exception unknownException) {
                out = null;
            }
        }
        timeout = 0;
    }

    public OutputStream getOutput() {
        return out;
    }

    public InputStream getInput() {
        return in;
    }

    public Integer getAvailable() {
        try {
            return in.available();
        } catch (Exception unknownException) {
            return null;
        }
    }

    public byte[] readBytes(int length) {
        try {
            int available = 0;
            while (available < length) {
                if (!isWorking()) return null;
                if (in.available() > available) {
                    available = in.available();
                    resetTime();
                }
            }
            byte[] result = new byte[length];
            if (in.read(result) == length) {
                resetTime();
                return result;
            } else {
                return null;
            }
        } catch (Exception unknownException) {
            return null;
        }
    }

    public boolean writeBytes(byte[] data) {
        try {
            if (isWorking()) {
                out.write(data);
                resetTime();
                return true;
            } else return false;
        } catch (Exception unknownException) {
            return false;
        }
    }

    public byte[] readByte() {
        return readBytes(1);
    }

    public boolean writeByte(byte data) {
        try {
            if (isWorking()) {
                out.write(new byte[]{data});
                resetTime();
                return true;
            } else return false;
        } catch (Exception unknownException) {
            return false;
        }
    }

    public byte[] readShort() {
        return readBytes(2);
    }

    public boolean writeShort(short data) {
        try {
            if (isWorking()) {
                out.write(ByteOperations.getShortBytes(data));
                resetTime();
                return true;
            } else return false;
        } catch (Exception unknownException) {
            return false;
        }
    }

    public byte[] readInt() {
        return readBytes(4);
    }

    public boolean writeInt(int data) {
        try {
            if (isWorking()) {
                out.write(ByteOperations.getIntBytes(data));
                resetTime();
                return true;
            } else return false;
        } catch (Exception unknownException) {
            return false;
        }
    }

    public byte[] readLong() {
        return readBytes(8);
    }

    public boolean writeLong(long data) {
        try {
            if (isWorking()) {
                out.write(ByteOperations.getLongBytes(data));
                resetTime();
                return true;
            } else return false;
        } catch (Exception unknownException) {
            return false;
        }
    }

    public byte[] readIntString() {
        byte[] length = readInt();
        if (length == null) return null;
        return readBytes(ByteOperations.getInt(length));
    }

    public boolean writeIntString(byte[] data) {
        try {
            if (isWorking()) {
                out.write(ByteOperations.getIntBytes(data.length));
                out.write(data);
                resetTime();
                return true;
            } else return false;
        } catch (Exception unknownException) {
            return false;
        }
    }

    public APIStream(InputStream input, OutputStream output, int timeout) {
        in = input;
        out = output;
        this.timeout = timeout;
        resetTime();
    }
}