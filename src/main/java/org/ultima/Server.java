package org.ultima;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;
import org.ultima.Logger.Note;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Server {

    private static boolean isWorking = true;
    private static HttpServer server;
    private static final DateFormat dateform = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss");

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
