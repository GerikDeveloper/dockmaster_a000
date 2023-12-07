package org.ultima;

import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.ultima.Logger.Note;

import java.text.ParseException;
import java.util.Date;

public class NotifierController extends Thread {
    @Override
    public void run() {
        Logger.log(new Note("Setting up NotifierController..."));
        int[] ids = DBExecutor.getCompanyIds();
        if (ids != null) {
            Logger.log(new Note("NotifierController has been set up"));
            while (Server.isWorking()) {
                for (int id : ids) {
                    String date = DBExecutor.getCompanyLastNoticed(id);
                    if (date != null) {
                        try {
                            String now = Server.getDateform().format(new Date());
                            long unixTime = Server.getDateform().parse(date).getTime();
                            if ((Server.getDateform().parse(now).getTime() - unixTime) > Configurator.getPeriod()) {
                                long[] chatId = DBExecutor.getCmpTgId(id);
                                if (chatId != null) {
                                    if (chatId.length != 0) {
                                        if (DBExecutor.setCompanyLastNociced(id, Server.getDateform().format(new Date()))) {
                                            Server.getNotifier().execute(SendMessage.builder().text("NEW DOCUMENT IS WAITING\nCHECK WEBSITE!!!\n/\nОТПРАВЬТЕ НОВЫЙ ДОКУМЕНТ\nПРОСМОТРИТЕ ВЕБ-САЙТ!!!").chatId(chatId[0]).build());
                                        } else {
                                            Logger.log(new Note("NotifierController error while searching"));
                                        }
                                    } else {
                                        Logger.log(new Note("NotifierController error while searching"));
                                    }
                                } else {
                                    Logger.log(new Note("NotifierController error while searching"));
                                }
                            }
                        } catch (Exception unExc) {
                            Logger.log(new Note("NotifierController error while searching"));
                        }
                    } else {
                        Logger.log(new Note("NotifierController error while searching"));
                    }
                }
            }
        } else {
            Logger.log(new Note("Failed to set up NotifierController"));
        }
    }
}
