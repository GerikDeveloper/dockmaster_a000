package org.ultima;

import com.sun.net.httpserver.HttpExchange;

import org.ultima.AssetsLoader.Asset;
import org.ultima.Logger.Note;
import org.ultima.TDBExecutor.TData;

import java.io.InputStream;
import java.io.OutputStream;

import static java.nio.file.Files.readAllBytes;

public class HttpExecutor {
    public static void handleAssetRequest(HttpExchange exchange) {
        try {
            String path = exchange.getRequestURI().toString().split("\\?")[0];
            if (exchange.getRequestMethod().equals("GET")) {
                Asset asset = AssetsLoader.getAsset(path);
                if (asset != null) {
                    byte[] data = asset.getData();
                    if (data != null) {
                        try (OutputStream rspbody = exchange.getResponseBody()) {
                            exchange.sendResponseHeaders(Codes.Http.OK, data.length);
                            rspbody.write(data);
                            rspbody.flush();
                        } catch (Exception unExc) {
                            Logger.log(new Note("Failed to load available asset", exchange.getRemoteAddress().getAddress()));
                        }
                    } else {
                        exchange.sendResponseHeaders(Codes.Http.ERR_SERVER, 0);
                    }
                } else {
                    exchange.sendResponseHeaders(Codes.Http.ERR_RES_NOT_EXISTS, 0);
                }
            } else {
                exchange.sendResponseHeaders(Codes.Http.ERR_RES_NOT_EXISTS, 0);
            }
        } catch (Exception unExc) {
            Logger.log(new Note("Something went wrong in requesting asset", exchange.getRemoteAddress().getAddress()));
        }
    }

    public static void handleRestRequest(HttpExchange exchange) {
        String rqMethod = exchange.getRequestMethod();
        String address = exchange.getRemoteAddress().getHostName();
        int resCode;
        byte[] resData = new byte[0];
        if (exchange.getRequestHeaders().containsKey("exe")) {
            String execution = exchange.getRequestHeaders().get("exe").get(0);
            if (execution.equals("tdbld")) {
                if (rqMethod.equals("POST")) {
                    if (exchange.getRequestHeaders().containsKey("name")) {
                        String name = exchange.getRequestHeaders().get("name").get(0);
                        try (InputStream in = exchange.getRequestBody()) {
                            byte[] inData = in.readAllBytes();
                            TData tdata;
                            if (TDBExecutor.getTdbase().containsKey(address)) {
                                tdata = TDBExecutor.getTdbase().get(address);
                                if (tdata != null) {
                                    tdata.tmpld.put(name, inData);
                                } else {
                                    tdata = new TData();
                                    tdata.tmpld.put(name, inData);
                                    TDBExecutor.getTdbase().put(address, tdata);
                                }
                            } else {
                                tdata = new TData();
                                tdata.tmpld.put(name, inData);
                                TDBExecutor.getTdbase().put(address, tdata);
                            }
                            resCode = Codes.Http.OK;
                        } catch (Exception unExc) {
                            resCode = Codes.Http.ERR_SERVER;
                        }
                    } else {
                        resCode = Codes.Http.ERR_CLIENT;
                    }
                } else {
                    resCode = Codes.Http.ERR_CLIENT;
                }
            } else if (execution.equals("tdbget")) {
                if (rqMethod.equals("GET")) {
                    if (exchange.getRequestHeaders().containsKey("name")) {
                        String name = exchange.getRequestHeaders().get("name").get(0);
                        if (TDBExecutor.getTdbase().containsKey(address)) {
                            TData tdata = TDBExecutor.getTdbase().get(address);
                            if (tdata != null) {
                                if (tdata.tmpld.containsKey(name)) {
                                    byte[] data = tdata.tmpld.get(name);
                                    if (data != null) {
                                        resData = data;
                                        resCode = Codes.Http.OK;
                                    } else {
                                        resCode = Codes.Http.ERR_SERVER;
                                    }
                                } else {
                                    resCode = Codes.Http.ERR_CLIENT;
                                }
                            } else {
                                resCode = Codes.Http.ERR_CLIENT;
                            }
                        } else {
                            resCode = Codes.Http.ERR_CLIENT;
                        }
                    } else {
                        resCode = Codes.Http.ERR_CLIENT;
                    }
                } else {
                    resCode = Codes.Http.ERR_CLIENT;
                }
            } else {
                resCode = Codes.Http.ERR_CLIENT;
            }
        } else {
            resCode = Codes.Http.ERR_CLIENT;
        }

        try (OutputStream body = exchange.getResponseBody()){
            exchange.sendResponseHeaders(resCode, resData.length);
            body.write(resData);
            body.flush();
        } catch (Exception unExc) {
            Logger.log(new Note("Failed to response", exchange.getRemoteAddress().getAddress()));
        }
    }
}
