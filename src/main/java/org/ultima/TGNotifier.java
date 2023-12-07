package org.ultima;

import org.ultima.Logger.Note;

import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;

import java.util.Scanner;

public class TGNotifier extends TelegramLongPollingBot {

    @Override
    public String getBotUsername() {
        return "Ultima DockMaster";
    }

    @Override
    public String getBotToken() {
        return Configurator.getTgToken();
    }

    @Override
    public void onUpdateReceived(Update update) {
        if(update.hasMessage()) {
            if (update.getMessage().hasText()) {
                String command = update.getMessage().getText();
                try {
                    if ("/start".equals(command)) {
                        Server.getNotifier().execute(SendMessage.builder().chatId(update.getMessage().getChatId()).text("Welcome,\nYou can use commands\n/\nДобро пожаловать,\nМожешь использовать эти команды").build());
                    } else if ("/get_chat_id".equals(command)) {
                        Server.getNotifier().execute(SendMessage.builder().chatId(update.getMessage().getChatId()).text("Your chat id: " + update.getMessage().getChatId().toString() + "\nТвой идентификатор чата: " + update.getMessage().getChatId().toString()).build());
                    } else if ("/attach_this_chat".equals(command.substring(0, 17))) {
                        String argsstr = command.substring(17);
                        String[] args = command.split(" ");
                        if (args.length == 3) {
                            if (DBExecutor.isCmpPasswordCorrect(args[1], args[2])) {
                                int[] cmpId = DBExecutor.getCompanyId(args[1]);
                                if (cmpId != null) {
                                    DBExecutor.setCmpTgId(cmpId[0], update.getMessage().getChatId());
                                    Server.getNotifier().execute(SendMessage.builder().chatId(update.getMessage().getChatId()).text("Attached successfully\n/\nУспешно закреплено").build());
                                } else {
                                    Server.getNotifier().execute(SendMessage.builder().chatId(update.getMessage().getChatId()).text("Server error\n/\nОшибка на сервере" + update.getMessage().getChatId().toString()).build());
                                }
                            } else {
                                Server.getNotifier().execute(SendMessage.builder().chatId(update.getMessage().getChatId()).text("Error, incorrect password correct\n/\nОшибка, не верный пароль" + update.getMessage().getChatId().toString()).build());
                            }
                        } else {
                            Server.getNotifier().execute(SendMessage.builder().chatId(update.getMessage().getChatId()).text("Error, fill form correct\n/\nОшибка, заполните форму правильно" + update.getMessage().getChatId().toString()).build());
                        }
                    }
                } catch (Exception unExc) {
                    unExc.printStackTrace();
                    Logger.log(new Note("Failed to response in tg_bot"));
                }
            }
        }
    }
}
