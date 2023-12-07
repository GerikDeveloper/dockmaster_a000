package org.ultima;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayDeque;
import java.util.Date;
public class Logger {

    private static volatile ArrayDeque<Note> notes = new ArrayDeque<Note>();

    public static class Note {
        private static final DateFormat dateform = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss");

        private final InetAddress address;
        private final String data;
        private final Date timestamp;

        public Note(String data) {
            this.data = data;
            this.timestamp = new Date();
            this.address = null;
        }

        public Note(String data, InetAddress address) {
            this.data = data;
            this.timestamp = new Date();
            this.address = address;
        }

        public boolean hasAddress() {
            return this.address != null;
        }

        public InetAddress getAddress() {
            return this.address;
        }

        public String getData() {
            return this.data;
        }

        public Date getTimestamp() {
            return this.timestamp;
        }

        @Override
        public String toString() {
            StringBuilder strb = new StringBuilder();
            strb.append("[(");
            if (this.address != null) strb.append(this.address);
            else strb.append("server");
            strb.append("): ");
            strb.append(dateform.format(this.timestamp));
            strb.append("]: {");
            strb.append(this.data);
            strb.append("}");
            return strb.toString();
        }
    }

    public static void start() {
        class LogExecutor extends Thread {
            private static void printNote(Note note) {
                if (Configurator.getLogPath() != null) {
                    try {
                        if (!(new File(Configurator.getLogPath()).exists())) {
                            try {
                                if (!new File(Configurator.getLogPath()).createNewFile()) {
                                    return;
                                }
                            } catch (Exception unExc) {
                                return;
                            }
                        }
                        try (FileOutputStream out = new FileOutputStream(Configurator.getLogPath(), true)) {
                            out.write(ByteOperations.getStringBytes(note.toString()));
                            out.write('\n');
                            out.flush();
                        } catch (Exception unExc) {
                            return;
                        }
                    } catch (Exception unExc) {
                        return;
                    }
                }
                System.out.println(note.toString());
            }

            @Override
            public void run() {
                super.run();
                while (Server.isWorking()) {
                    Note note = notes.poll();
                    if (note != null) {
                        printNote(note);
                    }
                }
            }
        }
        new LogExecutor().start();
    }

    public static void log(Note note) {
        notes.add(note);
    }
}
