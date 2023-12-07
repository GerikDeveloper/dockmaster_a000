import 'dart:convert';
import 'dart:html' show AnchorElement;

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:dockmasterclient000/utils.dart';
import 'package:http/http.dart' as http;

import '../codes.dart';
import '../main.dart';

class Notice extends StatelessWidget {
  final int nid;
  final String type;
  
  void _failed(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ошибка')));
  }

  Future<void> _download(context, int nid) async {
    try {
      http.Response respdata = await http.get(
          rest_uri, headers: {'exe': 'gnd', 'nid': '$nid'});
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

  const Notice({super.key, required this.nid, required this.type});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 1440;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // autogroupgvtqVRv (WeU15v4HCsgXu4CthsGVtQ)
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff5c98f2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // BJk (19:125)
            child: Text(
              type,
              style: SafeGoogleFont(
                'Vollkorn',
                fontSize: 29 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.3925 * ffem / fem,
                color: Color(0xffffffff),
              ),
            ),
          ),
          Container(
            // h2C (31:330)
            width: 36 * fem,
            height: 46.57 * fem,
            child: Image.asset(
              'assets/page-1/images/-zPE.png',
              width: 36 * fem,
              height: 46.57 * fem,
            ),
          ),
          Container(
            // unionPvc (54:1249)
            child: TextButton(
              onPressed: () {
                _download(context, nid);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: 22.52 * fem,
                height: 27 * fem,
                child: Image.asset(
                  'assets/page-1/images/union-krG.png',
                  width: 22.52 * fem,
                  height: 27 * fem,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
  late List<int> nids = [];
  late List<String> types = List<String>.empty(growable: true);

  Future<void> gani() async {
    http.Response respids = await http.get(rest_uri, headers: {'exe': 'gani'});
    if (respids.statusCode == ok) {
      nids = respids.body.split(' ').map(int.parse).toList();
      for (int nid in nids) {
        http.Response resptype = await http.get(rest_uri, headers: {'exe': 'gnt', 'nid': '$nid'});
        if (resptype.statusCode == ok) {
          types.add(resptype.body);
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
    Object? map = ModalRoute.of(context)?.settings.arguments;
    if (map != null) {
      Map<String, String> args = map as Map<String, String>;
      if (args.containsKey('name') && args.containsKey('password')) {
        String? nm = args.remove('name');
        String? ps = args.remove('password');
        if (ps != null && nm != null) {
          name = nm;
          password = ps;
          gani();
          return;
        }
      }
    }
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 1440;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // WrG (19:2)
            padding: EdgeInsets.fromLTRB(87.26*fem, 36*fem, 0*fem, 220*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // frame2Cj6 (31:111)
                  margin: EdgeInsets.fromLTRB(4.74*fem, 0*fem, 0*fem, 100*fem),
                  height: 88*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // ownerhvk (31:117)
                        margin: EdgeInsets.fromLTRB(0*fem, 23*fem, 18.92*fem, 19*fem),
                        padding: EdgeInsets.fromLTRB(2.18*fem, 0.21*fem, 0.16*fem, 0*fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // b831oyn (31:118)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.8*fem, 0*fem),
                              width: 34.02*fem,
                              height: 46.01*fem,
                              child: Image.asset(
                                'assets/page-1/images/b8-3-1-fF2.png',
                                width: 34.02*fem,
                                height: 46.01*fem,
                              ),
                            ),
                            Container(
                              // xJQk (31:212)
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
                              // frfond1bue (31:213)
                              margin: EdgeInsets.fromLTRB(0*fem, 0.05*fem, 0*fem, 0*fem),
                              width: 41.95*fem,
                              height: 41.51*fem,
                              child: Image.asset(
                                'assets/page-1/images/fr-fond-1-QCc.png',
                                width: 41.95*fem,
                                height: 41.51*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // logou9e (31:216)
                        margin: EdgeInsets.fromLTRB(0*fem, 23*fem, 20*fem, 15*fem),
                        width: 38*fem,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle162VA (31:217)
                              left: 0*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 38*fem,
                                  height: 50*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/rectangle-16-UDr.png',
                                    width: 38*fem,
                                    height: 50*fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // line5LVr (31:218)
                              left: 4*fem,
                              top: 34.3137207031*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 12*fem,
                                  height: 15.69*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/line-5-zMi.png',
                                    width: 12*fem,
                                    height: 15.69*fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // proemS (31:219)
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
                        // projnt (31:116)
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
                        // dtG (31:112)
                        margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 29*fem, 0*fem),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/company/', arguments: {'name': name, 'password': password});
                          },
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
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/company/send_doc', arguments: {'name': name, 'password': password});
                        },
                        child: Container(
                          // vcU (31:113)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34*fem, 7*fem),
                          constraints: BoxConstraints (
                            maxWidth: 190*fem,
                          ),
                          child: Text(
                            'Отправить документы',
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
                      Container(
                        // autogroupesswQGk (WeU2U3RSCKXEgDZkoJeSsW)
                        margin: EdgeInsets.fromLTRB(0*fem, 7*fem, 0*fem, 0*fem),
                        width: 319*fem,
                        height: 81*fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // Wqa (31:114)
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
                                        fontWeight: FontWeight.w700,
                                        height: 1.3925*ffem/fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // PuN (31:115)
                              left: 200*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 119*fem,
                                  height: 81*fem,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/company/personal', arguments: {'name': name, 'password': password});
                                    },
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
                              // ellipse5GiG (31:370)
                              left: 168*fem,
                              top: 6*fem,
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
                              // ellipse6ycg (31:371)
                              left: 180.5*fem,
                              top: 25*fem,
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
                              // line6gmz (31:372)
                              left: 182.9999993443*fem,
                              top: 13*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 0*fem,
                                  height: 7.5*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/line-6.png',
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
                  // autogroupxafnoLp (WeTz12hPxRC8wMX4i4XAfn)
                  margin: EdgeInsets.fromLTRB(2.74*fem, 0*fem, 0*fem, 11.5*fem),
                  width: 772*fem,
                  height: 43.5*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // Kpx (21:141)
                        left: 376*fem,
                        top: 2.5*fem,
                        child: Align(
                          child: SizedBox(
                            width: 396*fem,
                            height: 41*fem,
                            child: RichText(
                              text: TextSpan(
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
                        // jGQ (33:1055)
                        left: 0*fem,
                        top: 0*fem,
                        child: Align(
                          child: SizedBox(
                            width: 428*fem,
                            height: 41*fem,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                'Все документы',
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
                    ],
                  ),
                ),
                Container(
                  // autogroupqqmvzy2 (WeTzCrh2FaZ5BykPoKqqmv)
                  width: double.infinity,
                  height: 301*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroupvnqawdN (WeTzcRr5ZSfG6pGE4Jvnqa)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22.74*fem, 0*fem),
                        width: 936*fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroupd1il4T6 (WeTzuAsBbgKUMoGJcgD1iL)
                              margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 21*fem),
                              padding: EdgeInsets.fromLTRB(14*fem, 8*fem, 42*fem, 9*fem),
                              decoration: BoxDecoration (
                                color: Color(0xff0063ff),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // MSC (19:121)
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
                                    // egC (19:122)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 111*fem, 2*fem),
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
                                    // NMJ (19:124)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2*fem),
                                    child: Text(
                                      'Скачать',
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
                              child: ListView.builder(itemCount: nids.length, padding: EdgeInsets.all(8.0), itemBuilder: (context, index) {
                                return Notice(nid: nids[index], type: types[index]);
                              }),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // image19uT2 (52:1110)
                        width: 436*fem,
                        height: 301*fem,
                        child: Image.asset(
                          'assets/page-1/images/image-19-tpC.png',
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