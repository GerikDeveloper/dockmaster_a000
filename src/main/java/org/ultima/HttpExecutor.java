package org.ultima;

import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;

import org.ultima.AssetsLoader.Asset;
import org.ultima.Logger.Note;
import org.ultima.TDBExecutor.TData;

import java.io.InputStream;
import java.io.OutputStream;
import java.nio.IntBuffer;

public class HttpExecutor {

    public static class Rsp {
        private int rspCode;
        private byte[] bodyData;
        public Rsp(int rspCode, byte[] bodyData) {
            this.rspCode = rspCode;
            this.bodyData = bodyData;
        }

        public int getRspCode() {
            return rspCode;
        }

        public byte[] getBodyData() {
            return bodyData;
        }

        public void setRspCode(int rspCode) {
            this.rspCode = rspCode;
        }

        public void setBodyData(byte[] data) {
            bodyData = data;
        }
    }

    public static class FunExecutor {
        public static Rsp login(HttpExchange exchange, String rqMethod, String address, Headers headers) {
            Rsp rsp = new Rsp(Codes.Http.ERR_CLIENT, new byte[0]);
            try {
                if (rqMethod.equals("POST") &&
                        headers.containsKey("name") &&
                        headers.containsKey("password") &&
                        headers.containsKey("mode")) {
                    String name = headers.getFirst("name");
                    String password = headers.getFirst("password");
                    String mode = headers.getFirst("mode");
                    if (mode.equals("company")) {
                        if (DBExecutor.isCmpPasswordCorrect(name, password)) {
                            TDBExecutor.getTdbase().put(address,
                                    new TData(TData.AccountMode.COMPANY,
                                            name,
                                            password));
                            rsp.setRspCode(Codes.Http.OK);
                        } else {
                            rsp.setRspCode(Codes.Http.ERR_CLIENT);
                        }
                    } else if (mode.equals("moder")) {
                        if (Configurator.getModerName().equals(name) &&
                                Configurator.getModerPassword().equals(password)) {
                            TDBExecutor.getTdbase().put(address,
                                    new TData(TData.AccountMode.MODER,
                                            name,
                                            password));
                            rsp.setRspCode(Codes.Http.OK);
                        } else {
                            rsp.setRspCode(Codes.Http.ERR_CLIENT);
                        }
                    } else {
                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                    }
                } else {
                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                }
            } catch (Exception unExc) {
                rsp.setRspCode(Codes.Http.ERR_SERVER);
            }
            return rsp;
        }

        public static Rsp gaci(HttpExchange exchange, String rqMethod, String address, Headers headers) {
            Rsp rsp = new Rsp(Codes.Http.ERR_CLIENT, new byte[0]);
            try {
                if (rqMethod.equals("GET")) {
                    if (TDBExecutor.getTdbase().containsKey(address)) {
                        TData tdata = TDBExecutor.getTdbase().get(address);
                        if (tdata.getType() == TData.AccountMode.MODER) {
                            int[] ids = DBExecutor.getCompanyIds();
                            if (ids != null) {
                                StringBuilder sb = new StringBuilder();
                                for (int id : ids) {
                                    sb.append(Integer.toString(id));
                                    sb.append(" ");
                                }
                                if (!sb.isEmpty())   rsp.setBodyData(ByteOperations.getStringBytes(sb.substring(0, (sb.length() - 1))));
                                rsp.setRspCode(Codes.Http.OK);
                            } else {
                                rsp.setRspCode(Codes.Http.ERR_SERVER);
                            }
                        } else {
                            rsp.setRspCode(Codes.Http.ERR_CLIENT);
                        }
                    } else {
                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                    }
                } else {
                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                }
            } catch (Exception unExc) {
                rsp.setRspCode(Codes.Http.ERR_SERVER);
            }
            return rsp;
        }

        public static Rsp gani(HttpExchange exchange, String rqMethod, String address, Headers headers) {
            Rsp rsp = new Rsp(Codes.Http.ERR_CLIENT, new byte[0]);
            try {
                if (rqMethod.equals("GET")) {
                    if (TDBExecutor.getTdbase().containsKey(address)) {
                        TData tdata = TDBExecutor.getTdbase().get(address);
                        if (tdata.getType() == TData.AccountMode.MODER) {
                            if (headers.containsKey("cid")) {
                                int id = Integer.parseInt(headers.getFirst("cid"));
                                int[] nids = DBExecutor.getCmpNoticeIds(id);
                                if (nids != null) {
                                    StringBuilder sb = new StringBuilder();
                                    for (int nid : nids) {
                                        sb.append(Integer.toString(nid));
                                        sb.append(" ");
                                    }
                                    if (!sb.isEmpty())
                                        rsp.setBodyData(ByteOperations.getStringBytes(sb.substring(0, (sb.length() - 1))));
                                    rsp.setRspCode(Codes.Http.OK);
                                } else {
                                    rsp.setRspCode(Codes.Http.ERR_SERVER);
                                }
                            } else {
                                rsp.setRspCode(Codes.Http.ERR_CLIENT);
                            }
                        } else {
                            int[] ids = DBExecutor.getCompanyId(tdata.getName());
                            if (ids != null) {
                                if (ids.length != 0) {
                                    int id = ids[0];
                                    int[] nids = DBExecutor.getCmpNoticeIds(id);
                                    if (nids != null) {
                                        StringBuilder sb = new StringBuilder();
                                        for (int nid : nids) {
                                            sb.append(Integer.toString(nid));
                                            sb.append(" ");
                                        }
                                        if (!sb.isEmpty())
                                            rsp.setBodyData(ByteOperations.getStringBytes(sb.substring(0, (sb.length() - 1))));
                                        rsp.setRspCode(Codes.Http.OK);
                                    } else {
                                        rsp.setRspCode(Codes.Http.ERR_SERVER);
                                    }
                                } else {
                                    rsp.setRspCode(Codes.Http.ERR_SERVER);
                                }
                            } else {
                                rsp.setRspCode(Codes.Http.ERR_SERVER);
                            }
                        }
                    } else {
                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                    }
                } else {
                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                }
            } catch (Exception unExc) {
                rsp.setRspCode(Codes.Http.ERR_SERVER);
            }
            return rsp;
        }

        public static Rsp gnd(HttpExchange exchange, String rqMethod, String address, Headers headers) {
            Rsp rsp = new Rsp(Codes.Http.ERR_CLIENT, new byte[0]);
            try {
                if (rqMethod.equals("GET")) {
                    if (TDBExecutor.getTdbase().containsKey(address)) {
                        TData tdata = TDBExecutor.getTdbase().get(address);
                        if (tdata.getType() == TData.AccountMode.MODER) {
                            if (headers.containsKey("cid")) {
                                int cid = Integer.parseInt(headers.getFirst("cid"));
                                if (headers.containsKey("nid")) {
                                    int nid = Integer.parseInt(headers.getFirst("nid"));
                                    byte[] data = DBExecutor.getCmpNoticeData(cid, nid);
                                    if (data != null) {
                                        rsp.setBodyData(data);
                                        rsp.setRspCode(Codes.Http.OK);
                                    } else {
                                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                    }
                                } else {
                                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                }
                            } else {
                                rsp.setRspCode(Codes.Http.ERR_CLIENT);
                            }
                        } else {
                            int[] ids = DBExecutor.getCompanyId(tdata.getName());
                            if (ids != null) {
                                if (ids.length != 0) {
                                    int cid = ids[0];
                                    if (headers.containsKey("nid")) {
                                        int nid = Integer.parseInt(headers.getFirst("nid"));
                                        byte[] data = DBExecutor.getCmpNoticeData(cid, nid);
                                        if (data != null) {
                                            rsp.setBodyData(data);
                                            rsp.setRspCode(Codes.Http.OK);
                                        } else {
                                            rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                        }
                                    } else {
                                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                    }
                                } else {
                                    rsp.setRspCode(Codes.Http.ERR_SERVER);
                                }
                            } else {
                                rsp.setRspCode(Codes.Http.ERR_SERVER);
                            }
                        }
                    } else {
                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                    }
                } else {
                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                }
            } catch (Exception unExc) {
                rsp.setRspCode(Codes.Http.ERR_SERVER);
            }
            return rsp;
        }

        public static Rsp gnt(HttpExchange exchange, String rqMethod, String address, Headers headers) {
            Rsp rsp = new Rsp(Codes.Http.ERR_CLIENT, new byte[0]);
            try {
                if (rqMethod.equals("GET")) {
                    if (TDBExecutor.getTdbase().containsKey(address)) {
                        TData tdata = TDBExecutor.getTdbase().get(address);
                        if (tdata.getType() == TData.AccountMode.MODER) {
                            if (headers.containsKey("cid")) {
                                int cid = Integer.parseInt(headers.getFirst("cid"));
                                if (headers.containsKey("nid")) {
                                    int nid = Integer.parseInt(headers.getFirst("nid"));
                                    String type = DBExecutor.getCmpNoticeType(cid, nid);
                                    if (type != null) {
                                        rsp.setBodyData(ByteOperations.getStringBytes(type));
                                        rsp.setRspCode(Codes.Http.OK);
                                    } else {
                                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                    }
                                } else {
                                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                }
                            } else {
                                rsp.setRspCode(Codes.Http.ERR_CLIENT);
                            }
                        } else {
                            int[] ids = DBExecutor.getCompanyId(tdata.getName());
                            if (ids != null) {
                                if (ids.length != 0) {
                                    int cid = ids[0];
                                    if (headers.containsKey("nid")) {
                                        int nid = Integer.parseInt(headers.getFirst("nid"));
                                        String type = DBExecutor.getCmpNoticeType(cid, nid);
                                        if (type != null) {
                                            rsp.setBodyData(ByteOperations.getStringBytes(type));
                                            rsp.setRspCode(Codes.Http.OK);
                                        } else {
                                            rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                        }
                                    } else {
                                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                    }
                                } else {
                                    rsp.setRspCode(Codes.Http.ERR_SERVER);
                                }
                            } else {
                                rsp.setRspCode(Codes.Http.ERR_SERVER);
                            }
                        }
                    } else {
                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                    }
                } else {
                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                }
            } catch (Exception unExc) {
                rsp.setRspCode(Codes.Http.ERR_SERVER);
            }
            return rsp;
        }


        public static Rsp snt(HttpExchange exchange, String rqMethod, String address, Headers headers) {
            Rsp rsp = new Rsp(Codes.Http.ERR_CLIENT, new byte[0]);
            try {
                if (rqMethod.equals("POST")) {
                    if (TDBExecutor.getTdbase().containsKey(address)) {
                        TData tdata = TDBExecutor.getTdbase().get(address);
                        if (tdata.getType() == TData.AccountMode.MODER) {
                            if (headers.containsKey("cid") &&
                                    headers.containsKey("nid") &&
                                    headers.containsKey("type")) {
                                int cid = Integer.parseInt(headers.getFirst("cid"));
                                int nid = Integer.parseInt(headers.getFirst("nid"));
                                String type = headers.getFirst("type");
                                if (type.equals("accepted_company_doc") || type.equals("declined_company_doc")) {
                                    //TODO UPD LASTDATE
                                    if (DBExecutor.setCmpNoticeType(cid, nid, type)) {
                                        rsp.setRspCode(Codes.Http.OK);
                                    } else {
                                        rsp.setRspCode(Codes.Http.ERR_SERVER);
                                    }
                                } else {
                                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                }
                            } else {
                                rsp.setRspCode(Codes.Http.ERR_CLIENT);
                            }
                        } else {
                            rsp.setRspCode(Codes.Http.ERR_CLIENT);
                        }
                    } else {
                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                    }
                } else {
                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                }
            } catch (Exception unExc) {
                rsp.setRspCode(Codes.Http.ERR_SERVER);
            }
            return rsp;
        }

        public static Rsp sn(HttpExchange exchange, String rqMethod, String address, Headers headers) {
            Rsp rsp = new Rsp(Codes.Http.ERR_CLIENT, new byte[0]);
            try {
                if (rqMethod.equals("POST")) {
                    if (TDBExecutor.getTdbase().containsKey(address)) {
                        TData tdata = TDBExecutor.getTdbase().get(address);
                        if (tdata.getType() == TData.AccountMode.MODER) {
                            if (headers.containsKey("cid") &&
                                headers.containsKey("type")) {
                                String type = headers.getFirst("type");
                                if (type.equals("moder_text") ||
                                    type.equals("moder_doc")) {
                                    int cid = Integer.parseInt(headers.getFirst("cid"));
                                    try (InputStream body = exchange.getRequestBody()) {
                                        byte[] data = body.readAllBytes();
                                        if (data != null) {
                                            if (DBExecutor.createCmpNotice(cid, type, data)) {
                                                rsp.setRspCode(Codes.Http.OK);
                                            } else {
                                                rsp.setRspCode(Codes.Http.ERR_SERVER);
                                            }
                                        } else {
                                            rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                        }
                                    } catch (Exception unExc) {
                                        rsp.setRspCode(Codes.Http.ERR_SERVER);
                                    }
                                } else {
                                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                }
                            } else {
                                rsp.setRspCode(Codes.Http.ERR_CLIENT);
                            }
                        } else {
                            int[] ids = DBExecutor.getCompanyId(tdata.getName());
                            if (ids != null) {
                                if (ids.length != 0) {
                                    int cid = ids[0];
                                    String type = headers.getFirst("type");
                                    if (type.equals("company_doc") ||
                                        type.equals("company_text")) {
                                        try (InputStream body = exchange.getRequestBody()) {
                                            byte[] data = body.readAllBytes();
                                            if (data != null) {
                                                if (DBExecutor.createCmpNotice(cid, type, data)) {
                                                    rsp.setRspCode(Codes.Http.OK);
                                                } else {
                                                    rsp.setRspCode(Codes.Http.ERR_SERVER);
                                                }
                                            } else {
                                                rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                            }
                                        } catch (Exception unExc) {
                                            rsp.setRspCode(Codes.Http.ERR_SERVER);
                                        }
                                    } else {
                                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                    }
                                } else {
                                    rsp.setRspCode(Codes.Http.ERR_SERVER);
                                }
                            } else {
                                rsp.setRspCode(Codes.Http.ERR_SERVER);
                            }
                        }
                    } else {
                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                    }
                } else {
                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                }
            } catch (Exception unExc) {
                rsp.setRspCode(Codes.Http.ERR_SERVER);
            }
            return rsp;
        }

        public static Rsp gcn(HttpExchange exchange, String rqMethod, String address, Headers headers) {
            Rsp rsp = new Rsp(Codes.Http.ERR_CLIENT, new byte[0]);
            try {
                if (rqMethod.equals("GET")) {
                    if (TDBExecutor.getTdbase().containsKey(address)) {
                        TData tdata = TDBExecutor.getTdbase().get(address);
                        if (tdata.getType() == TData.AccountMode.MODER) {
                            if (headers.containsKey("cid")) {
                                int cid = Integer.parseInt(headers.getFirst("cid"));
                                String type = DBExecutor.getCompanyName(cid);
                                if (type != null) {
                                    rsp.setBodyData(ByteOperations.getStringBytes(type));
                                    rsp.setRspCode(Codes.Http.OK);
                                } else {
                                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                                }
                            } else {
                                rsp.setRspCode(Codes.Http.ERR_CLIENT);
                            }
                        } else {
                            rsp.setRspCode(Codes.Http.ERR_CLIENT);
                        }
                    } else {
                        rsp.setRspCode(Codes.Http.ERR_CLIENT);
                    }
                } else {
                    rsp.setRspCode(Codes.Http.ERR_CLIENT);
                }
            } catch (Exception unExc) {
                rsp.setRspCode(Codes.Http.ERR_SERVER);
            }
            return rsp;
        }

        public static void handleRsp(HttpExchange exchange, Rsp rsp) {
            try (OutputStream body = exchange.getResponseBody()){
                if (rsp != null) {
                    exchange.sendResponseHeaders(rsp.getRspCode(), rsp.getBodyData().length);
                    body.write(rsp.getBodyData());
                } else {
                    exchange.sendResponseHeaders(Codes.Http.ERR_SERVER, 0);
                    body.write(new byte[0]);
                }
                body.flush();
            } catch (Exception unExc) {
                Logger.log(new Note("Failed to response", exchange.getRemoteAddress().getAddress()));
            }
        }
    }

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
        Headers headers = exchange.getRequestHeaders();
        Rsp rsp = null;
        if (headers.containsKey("exe")) {
            String execution = headers.getFirst("exe");
            if (execution.equals("login")) {
                rsp = FunExecutor.login(exchange, rqMethod, address, headers);
            } else if (execution.equals("gaci")) { //Get all Company ids
                rsp = FunExecutor.gaci(exchange, rqMethod, address, headers);
            } else if (execution.equals("gani")) { //Get all notice ids
                rsp = FunExecutor.gani(exchange, rqMethod, address, headers);
            } else if (execution.equals("gnd")) { //Get notice data
                rsp = FunExecutor.gnd(exchange, rqMethod, address, headers);
            } else if (execution.equals("gnt")) { //Get notice type
                rsp = FunExecutor.gnt(exchange, rqMethod, address, headers);
            } else if (execution.equals("snt")) { //Set notice type
                rsp = FunExecutor.snt(exchange, rqMethod, address, headers);
            } else if (execution.equals("sn")) { //Send notice
                rsp = FunExecutor.sn(exchange, rqMethod, address, headers);
            } else if(execution.equals("gcn")) {
                rsp = FunExecutor.gcn(exchange, rqMethod, address, headers);
            } else {
                rsp = new Rsp(Codes.Http.ERR_CLIENT, new byte[0]);
            }
        } else {
            rsp = new Rsp(Codes.Http.ERR_CLIENT, new byte[0]);
        }
        FunExecutor.handleRsp(exchange, rsp);
    }
}
