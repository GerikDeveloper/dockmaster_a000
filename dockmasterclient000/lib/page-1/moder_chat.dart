import 'dart:convert';
import 'dart:html' show AnchorElement;

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:dockmasterclient000/utils.dart';
import 'package:http/http.dart' as http;

import '../codes.dart';
import '../main.dart';

int accept = 0;

class Notice extends StatelessWidget {
  final int cid;
  final int nid;
  final String companyName;
  final String type;

  void _failed(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ошибка')));
  }

  Future<void> _accept(context, int cid, int nid) async {
    try {
      http.Response respdata = await http.post(
          rest_uri, headers: {'exe': 'snt', 'cid': '$cid', 'nid': '$nid', 'type': 'accepted_company_doc'});
      if (respdata.statusCode == ok) {
        accept = 2;
      } else {
        accept = 1;
      }
    } catch (_) {
      accept = 1;
    }
    page.upd();
  }

  Future<void> _decline(context, int cid, int nid) async {
    try {
      http.Response respdata = await http.post(
          rest_uri, headers: {'exe': 'snt', 'cid': '$cid', 'nid': '$nid', 'type': 'declined_company_doc'});
      if (respdata.statusCode == ok) {
        accept = 3;
      } else {
        accept = 1;
      }
    } catch (_) {
      accept = 1;
    }
    page.upd();
  }

  Future<void> _download(context, int cid, int nid) async {
    try {
      http.Response respdata = await http.get(
          rest_uri, headers: {'exe': 'gnd', 'cid': '$cid', 'nid': '$nid'});
      if (respdata.statusCode == ok) {
        var time = DateTime
            .now()
            .millisecondsSinceEpoch;
        String ext;
        if (type.split('text')[0] == type) {
          if (type.split('doc')[0] == type) {
            ext = 'data';
          } else {
            ext = 'pdf';
          }
        } else if (type.split('doc')[0] == type) {
          if (type.split('text')[0] == type) {
            ext = 'data';
          } else {
            ext = 'txt';
          }
        } else {
          ext = 'data';
        }
        var path = 'file_$time.$ext';
        var based = base64Encode(respdata.bodyBytes);
        AnchorElement anchorElement = AnchorElement(href: 'data:application/octet-stream;charset=utf-16le;base64,$based');
        anchorElement.download = path;
        anchorElement.click();
      } else {
        _failed(context);
      }
    } catch (_) {}
  }

  const Notice({super.key, required this.cid, required this.nid, required this.companyName, required this.type});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 1440;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // autogroupuufnzSG (WeU4Neuo3iXncUu2mtUUFn)
      margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 2*fem, 20*fem),
      padding: EdgeInsets.fromLTRB(19*fem, 7*fem, 63.26*fem, 5*fem),
      width: double.infinity,
      decoration: BoxDecoration (
        color: Color(0xff5c98f2),
      ),
      child: Row(
        children: [
          Container(
            // gpt (21:314)
            child: Text(
              'Company: $companyName  ',
              style: SafeGoogleFont (
                'Vollkorn',
                fontSize: 29*ffem,
                fontWeight: FontWeight.w400,
                height: 1.3925*ffem/fem,
                color: Color(0xffffffff),
              ),
            ),
          ),
          Container(
            // gpt (21:314)
            child: Text(
              type,
              style: SafeGoogleFont (
                'Vollkorn',
                fontSize: 29*ffem,
                fontWeight: FontWeight.w400,
                height: 1.3925*ffem/fem,
                color: Color(0xffffffff),
              ),
            ),
          ),
          TextButton(
            onPressed: (){
              _download(context, cid, nid);
            },
            child: Container(
              // ouW (31:355)
              width: 36*fem,
              height: 46.57*fem,
              child: Image.asset(
                'assets/page-1/images/-Wbv.png',
                width: 36*fem,
                height: 46.57*fem,
              ),
            ),
          ),
          Container(
            // uSk (54:1296)
            child: TextButton(
              onPressed: () {
                _accept(context, cid, nid);
              },
              style: TextButton.styleFrom (
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: 34*fem,
                height: 34*fem,
                child: Image.asset(
                  'assets/page-1/images/-RB2.png',
                  width: 34*fem,
                  height: 34*fem,
                ),
              ),
            ),
          ),
          TextButton(
            // component3QPW (54:1443)
            onPressed: () {
              _decline(context, cid, nid);
            },
            style: TextButton.styleFrom (
              padding: EdgeInsets.zero,
            ),
            child: Container(
              width: 34*fem,
              height: 34*fem,
              child: Image.asset(
                'assets/page-1/images/component-3.png',
                width: 34*fem,
                height: 34*fem,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

late PageState page;

class Page extends StatefulWidget {
  const Page({super.key, required this.title});
  final String title;
  @override
  State<Page> createState() => PageState();
}

class PageState extends State<Page> {
  late String name;
  late String password;
  bool loaded = false;
  late List<int> cids = List<int>.empty(growable: true);
  late List<int> nids = List<int>.empty(growable: true);
  late List<String> companyNames = List<String>.empty(growable: true);
  late List<String> types = List<String>.empty(growable: true);

  void upd() {
    setState(() {});
  }

  Future<void> load() async {
    http.Response respcids = await http.get(rest_uri, headers: {'exe': 'gaci'});
    if (respcids.statusCode == ok) {
      List<int> tcids = respcids.body.split(' ').map(int.parse).toList();
      for (int cid in tcids) {
        http.Response respnids = await http.get(rest_uri, headers: {'exe': 'gani', 'cid': '$cid'});
        if (respnids.statusCode == ok) {
          List<int> tnids = respnids.body.split(' ').map(int.parse).toList();
          for (int nid in tnids) {
            http.Response respcmpname = await http.get(rest_uri, headers: {'exe': 'gcn', 'cid': '$cid'});
            if (respcmpname.statusCode == ok) {
              http.Response respntype = await http.get(rest_uri, headers: {'exe': 'gnt', 'cid': '$cid', 'nid': '$nid'});
              if (respntype.statusCode == ok) {
                cids.add(cid);
                nids.add(nid);
                companyNames.add(respcmpname.body);
                types.add(respntype.body);
              } else {
                _failed();
                return;
              }
            } else {
              _failed();
              return;
            }
          }
        } else {
          _failed();
          return;
        }
      }
      loaded = true;
      setState(() {});
    } else {
      _failed();
    }
  }

  void _failed() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ошибка')));
  }

  @override
  void initState() {
    super.initState();
    page = this;
    Object? map = ModalRoute.of(context)?.settings.arguments;
    if (map != null) {
      Map<String, String> args = map as Map<String, String>;
      if (args.containsKey('name') && args.containsKey('password')) {
        String? nm = args.remove('name');
        String? ps = args.remove('password');
        if (ps != null && nm != null) {
          name = nm;
          password = ps;
          load();
          return;
        }
      }
    }
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    page = this;
    if (accept != 0) {
      if (accept == 1) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ошибка')));
      if (accept == 2) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Успешно принято')));
      if (accept == 3) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Успешно отклонено')));
      accept = 0;
    }
    double baseWidth = 1440;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // FFA (21:200)
            padding: EdgeInsets.fromLTRB(87.26*fem, 36*fem, 0*fem, 220*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // frame1ieY (21:201)
                  margin: EdgeInsets.fromLTRB(4.74*fem, 0*fem, 0*fem, 100*fem),
                  height: 88*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // ownerQXN (21:208)
                        margin: EdgeInsets.fromLTRB(0*fem, 23*fem, 18.92*fem, 19*fem),
                        padding: EdgeInsets.fromLTRB(2.18*fem, 0.21*fem, 0.16*fem, 0*fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // b831uDE (21:209)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.8*fem, 0*fem),
                              width: 34.02*fem,
                              height: 46.01*fem,
                              child: Image.asset(
                                'assets/page-1/images/b8-3-1-jMv.png',
                                width: 34.02*fem,
                                height: 46.01*fem,
                              ),
                            ),
                            Container(
                              // xCy2 (21:303)
                              margin: EdgeInsets.fromLTRB(0*fem, 5.79*fem, 4.97*fem, 0*fem),
                              child: Text(
                                'X',
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 29*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                            Container(
                              // frfond1u6k (21:304)
                              margin: EdgeInsets.fromLTRB(0*fem, 0.05*fem, 0*fem, 0*fem),
                              width: 41.95*fem,
                              height: 41.51*fem,
                              child: Image.asset(
                                'assets/page-1/images/fr-fond-1-SuS.png',
                                width: 41.95*fem,
                                height: 41.51*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // logobVN (26:24)
                        margin: EdgeInsets.fromLTRB(0*fem, 23*fem, 20*fem, 15*fem),
                        width: 38*fem,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle168EQ (26:25)
                              left: 0*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 38*fem,
                                  height: 50*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/rectangle-16-FdN.png',
                                    width: 38*fem,
                                    height: 50*fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // line5RjJ (26:26)
                              left: 4*fem,
                              top: 34.3137207031*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 12*fem,
                                  height: 15.69*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/line-5-8KE.png',
                                    width: 12*fem,
                                    height: 15.69*fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // pro8tc (26:27)
                              left: 7*fem,
                              top: 13.7254638672*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 23*fem,
                                  height: 21*fem,
                                  child: Text(
                                    'Pro',
                                    style: SafeGoogleFont (
                                      'Vollkorn',
                                      fontSize: 15*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3925*ffem/fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // pro2UC (21:206)
                        margin: EdgeInsets.fromLTRB(0*fem, 15*fem, 142*fem, 0*fem),
                        child: Text(
                          'ProДокументы',
                          style: SafeGoogleFont (
                            'Vollkorn',
                            fontSize: 29*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.3925*ffem/fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // 7kY (21:202)
                        margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 29*fem, 0*fem),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Главная',
                            style: SafeGoogleFont (
                              'Vollkorn',
                              fontSize: 29*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3925*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // DHn (21:203)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34*fem, 7*fem),
                        constraints: BoxConstraints (
                          maxWidth: 190*fem,
                        ),
                        child: Text(
                          'Присланные документы',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Vollkorn',
                            fontSize: 29*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3925*ffem/fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupcwdiVFJ (WeU5c32XEymp6J18wCCWdi)
                        margin: EdgeInsets.fromLTRB(0*fem, 7*fem, 0*fem, 0*fem),
                        width: 319*fem,
                        height: 81*fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // QNG (21:204)
                              left: 0*fem,
                              top: 18*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 204*fem,
                                  height: 41*fem,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom (
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Text(
                                      'Уведомления',
                                      style: SafeGoogleFont (
                                        'Vollkorn',
                                        fontSize: 29*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3925*ffem/fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // Hgx (21:205)
                              left: 200*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 119*fem,
                                  height: 81*fem,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom (
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Text(
                                      'Личный кабинет',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Vollkorn',
                                        fontSize: 29*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3925*ffem/fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse7kqS (31:377)
                              left: 166*fem,
                              top: 5*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 30*fem,
                                  height: 30*fem,
                                  child: Container(
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(15*fem),
                                      color: Color(0xffdc1e82),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse8TE4 (31:378)
                              left: 178.5*fem,
                              top: 24*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 5*fem,
                                  height: 5*fem,
                                  child: Container(
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(2.5*fem),
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // line7Znt (31:379)
                              left: 180.9999993443*fem,
                              top: 12*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 0*fem,
                                  height: 7.5*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/line-7-h4g.png',
                                    width: 0*fem,
                                    height: 7.5*fem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroup8r7at4U (WeU3AXFz7LX12ryKTk8R7A)
                  margin: EdgeInsets.fromLTRB(2.74*fem, 0*fem, 0*fem, 11.5*fem),
                  width: 772*fem,
                  height: 43.5*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // oSL (33:1058)
                        left: 376*fem,
                        top: 2.5*fem,
                        child: Align(
                          child: SizedBox(
                            width: 396*fem,
                            height: 41*fem,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                '/Проверенные документы',
                                style: SafeGoogleFont (
                                  'Vollkorn',
                                  fontSize: 29*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3925*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // fDe (33:1059)
                        left: 0*fem,
                        top: 0*fem,
                        child: Align(
                          child: SizedBox(
                            width: 428*fem,
                            height: 41*fem,
                            child: Text(
                              'Не проверенные документы',
                              style: SafeGoogleFont (
                                'Vollkorn',
                                fontSize: 29*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3925*ffem/fem,
                                decoration: TextDecoration.underline,
                                color: Color(0xff000000),
                                decorationColor: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogrouppubewBA (WeU3PgYiwqirn6KsKiPUbE)
                  width: double.infinity,
                  height: 301*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogrouphangUB6 (WeU3sFb7sjMpAkDMtpHang)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18.74*fem, 0*fem),
                        width: 936*fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroupgb1nC76 (WeU4CzXE8VAbnbFBgmgB1n)
                              margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 21*fem),
                              padding: EdgeInsets.fromLTRB(14*fem, 8*fem, 4.26*fem, 9*fem),
                              decoration: BoxDecoration (
                                color: Color(0xff0063ff),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // syv (21:311)
                                    margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 358*fem, 0*fem),
                                    child: Text(
                                      'Отправитель',
                                      style: SafeGoogleFont (
                                        'Vollkorn',
                                        fontSize: 29*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3925*ffem/fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // yGG (21:312)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 70.74*fem, 2*fem),
                                    child: Text(
                                      'Файл',
                                      style: SafeGoogleFont (
                                        'Vollkorn',
                                        fontSize: 29*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3925*ffem/fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // 5aC (21:313)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2*fem),
                                    child: Text(
                                      'Подтвердить',
                                      style: SafeGoogleFont (
                                        'Vollkorn',
                                        fontSize: 29*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3925*ffem/fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(itemCount: nids.length, itemBuilder: (context, index) {
                                return Notice(cid: cids[index], nid: nids[index], companyName: companyNames[index], type: types[index]);
                              }),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // image19aFN (52:1111)
                        width: 436*fem,
                        height: 301*fem,
                        child: Image.asset(
                          'assets/page-1/images/image-19.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}