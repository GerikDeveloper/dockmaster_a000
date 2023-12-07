package org.ultima;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;
import org.telegram.telegrambots.meta.TelegramBotsApi;
import org.telegram.telegrambots.meta.api.methods.commands.SetMyCommands;
import org.telegram.telegrambots.meta.api.objects.commands.BotCommand;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;
import org.telegram.telegrambots.updatesreceivers.DefaultBotSession;
import org.ultima.Logger.Note;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class Server {

    private static boolean isWorking = true;
    private static HttpServer server;
    private static TGNotifier notifier;
    private static final DateFormat dateform = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss");

    public static TGNotifier getNotifier() {
        return notifier;
    }
    public static DateFormat getDateform() {
        return dateform;
    }

    public static boolean isWorking() {
        return isWorking;
    }

    public static void start() {
        System.out.println("SERVER DOCKMASTER 000 ULTIMA");

        //Logger
        System.out.println("Setting up logger...");
        Logger.start();
        //

        //Configurator
        Logger.log(new Note("Logger has been set up"));
        Logger.log(new Note("Loading configs..."));
        if (!Configurator.loadConfigs()) {
            Logger.log(new Note("Failed to load configs"));
            Logger.log(new Note("Creating default configs..."));
            if (!Configurator.createDefaultConfigs()) {
                Logger.log(new Note("Failed to create default configs"));
                Logger.log(new Note("Please restart"));
                return;
            }
            Logger.log(new Note("Default configs has been created"));
        } else {
            Logger.log(new Note("Configs has been loaded"));
        }
        //

        //TDBExecutor
        Logger.log(new Note("Creating tdb..."));
        if (!TDBExecutor.createTDB()) {
            Logger.log(new Note("Failed to create tdb"));
            Logger.log(new Note("Please restart"));
            return;
        }
        Logger.log(new Note("TDB has been created"));
        //

        //DBExecutor
        Logger.log(new Note("Loading db..."));
        if (!DBExecutor.loadDB()) {
            Logger.log(new Note("Failed to load db"));
            Logger.log(new Note("Creating new db..."));
            if (!DBExecutor.createDB()) {
                Logger.log(new Note("Failed to create new db"));
                Logger.log(new Note("Please restart"));
                return;
            }
            Logger.log(new Note("New db has been created"));
        } else {
            Logger.log(new Note("DB has been loaded"));
        }
        //

        //TgBot
        try {
            Logger.log(new Note("Attaching notifier..."));
            notifier = new TGNotifier();
            ArrayList<BotCommand> commands = new ArrayList<>();
            commands.add(BotCommand.builder().command("/start").description("Restart bot/Перезапустить бота").build());
            commands.add(BotCommand.builder().command("/get_chat_id").description("Get chat id/Получить идентификатор чата").build());
            commands.add(BotCommand.builder().command("/attach_this_chat").description("Attach chat to company/Закрепить чат за компанией(/attach_this_chat (name/название) (password/пароль))").build());
            notifier.execute(SetMyCommands.builder().commands(commands).build());
            new TelegramBotsApi(DefaultBotSession.class).registerBot(notifier);
            Logger.log(new Note("Notifier has been attached"));
        } catch (Exception unExc) {
            Logger.log(new Note("Failed to attach notifier"));
            Logger.log(new Note("Please restart"));
            return;
        }
        //

        //NotifierController
        new NotifierController().start();
        //

        //HttpServer
        try {
            Logger.log(new Note("Starting http server..."));
            server = HttpServer.create(new InetSocketAddress(Configurator.getPort()), Configurator.getBacklog());
            server.createContext("/", new HttpHandler() {
                @Override
                public void handle(HttpExchange exchange) {
                    HttpExecutor.handleAssetRequest(exchange);
                }
            });
            server.createContext("/rest", new HttpHandler() {
                @Override
                public void handle(HttpExchange exchange) {
                    HttpExecutor.handleRestRequest(exchange);
                }
            });
            server.setExecutor(null);
            server.start();
            Logger.log(new Note("Server has been started on port: " + Configurator.getPort()));
        } catch (Exception unExc) {
            Logger.log(new Note("Failed to start http server"));
            Logger.log(new Note("Please restart"));
        }
        //
    }
}
