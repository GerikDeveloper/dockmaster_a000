import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:dockmasterclient000/utils.dart';
import 'package:http/http.dart' as http;

import '../codes.dart';
import '../main.dart';

class Page extends StatefulWidget {
  const Page({super.key, required this.title});
  final String title;
  @override
  State<Page> createState() => PageState();
}

class PageState extends State<Page> {
  late String name;
  late String password;
  String cntRes = '_';

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
          load();
          return;
        }
      }
    }
    Navigator.pushNamed(context, '/');
  }

  Future<void> load() async {
    int cnt = 0;
    http.Response respcids = await http.get(rest_uri, headers: {'exe': 'gaci'});
    if (respcids.statusCode == ok) {
      List<int> tcids = respcids.body.split(' ').map(int.parse).toList();
      for (int cid in tcids) {
        http.Response respnids = await http.get(rest_uri, headers: {'exe': 'gani', 'cid': '$cid'});
        if (respnids.statusCode == ok) {
          List<int> tnids = respnids.body.split(' ').map(int.parse).toList();
          for (int nid in tnids) {
            http.Response respntype = await http.get(rest_uri, headers: {'exe': 'gnt', 'cid': '$cid', 'nid': '$nid'});
            if (respntype.statusCode == ok) {
              if (respntype.body.split('declined').length == 1 && respntype.body.split('accepted').length == 1) {
                cnt++;
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
      cntRes = '$cnt';
      setState(() {});
    } else {
      _failed();
    }
  }

  void upd() {
    setState(() {});
  }

  void _failed() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ошибка')));
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
              // zvY (31:392)
              padding: EdgeInsets.fromLTRB(94*fem, 36*fem, 99*fem, 276*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // frame1HPr (31:393)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 111*fem),
                    width: double.infinity,
                    height: 88*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // ownerbQY (31:399)
                          margin: EdgeInsets.fromLTRB(0*fem, 23*fem, 18.92*fem, 19*fem),
                          padding: EdgeInsets.fromLTRB(2.18*fem, 0.21*fem, 0.16*fem, 0*fem),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // b831ssr (31:400)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.8*fem, 0*fem),
                                width: 34.02*fem,
                                height: 46.01*fem,
                                child: Image.asset(
                                  'assets/page-1/images/b8-3-1-SzY.png',
                                  width: 34.02*fem,
                                  height: 46.01*fem,
                                ),
                              ),
                              Container(
                                // xBNk (31:494)
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
                                // frfond1UMr (31:495)
                                margin: EdgeInsets.fromLTRB(0*fem, 0.05*fem, 0*fem, 0*fem),
                                width: 41.95*fem,
                                height: 41.51*fem,
                                child: Image.asset(
                                  'assets/page-1/images/fr-fond-1-4Pe.png',
                                  width: 41.95*fem,
                                  height: 41.51*fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // logon7e (31:498)
                          margin: EdgeInsets.fromLTRB(0*fem, 23*fem, 20*fem, 15*fem),
                          width: 38*fem,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle16Jrg (31:499)
                                left: 0*fem,
                                top: 0*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 38*fem,
                                    height: 50*fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-16-Yr8.png',
                                      width: 38*fem,
                                      height: 50*fem,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // line52Gt (31:500)
                                left: 4*fem,
                                top: 34.3137207031*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 12*fem,
                                    height: 15.69*fem,
                                    child: Image.asset(
                                      'assets/page-1/images/line-5-Kye.png',
                                      width: 12*fem,
                                      height: 15.69*fem,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // projh6 (31:501)
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
                          // proYeY (31:398)
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
                          // dR6 (31:394)
                          margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 26*fem, 0*fem),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/moder/', arguments: {'name': name, 'password': password});
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
                        Container(
                          // XmN (31:395)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17*fem, 7*fem),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/moder/chat', arguments: {'name': name, 'password': password});
                            },
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              constraints: BoxConstraints (
                                maxWidth: 196*fem,
                              ),
                              child: Text(
                                'Пришедшие документы',
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
                        Container(
                          // autogroup7ppkaUk (WeU6ib1JAcZrvFbVPt7ppk)
                          margin: EdgeInsets.fromLTRB(0*fem, 7*fem, 0*fem, 0*fem),
                          width: 333*fem,
                          height: 81*fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // Htx (31:396)
                                left: 0*fem,
                                top: 18*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 228*fem,
                                    height: 41*fem,
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
                              Positioned(
                                // nap (31:397)
                                left: 214*fem,
                                top: 0*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 119*fem,
                                    height: 81*fem,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/moder/personal', arguments: {'name': name, 'password': password});
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
                                // ellipse7rqa (31:502)
                                left: 180*fem,
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
                                // ellipse8MnL (31:503)
                                left: 192.5*fem,
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
                                // line7t1a (31:504)
                                left: 194.9999993443*fem,
                                top: 12*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 0*fem,
                                    height: 7.5*fem,
                                    child: Image.asset(
                                      'assets/page-1/images/line-7-JNQ.png',
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
                    // autogroupoafwzqJ (WeU6Tvm4DrHiVbE4v7oafW)
                    margin: EdgeInsets.fromLTRB(253*fem, 0*fem, 258*fem, 36*fem),
                    width: double.infinity,
                    height: 177*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle188Ap (31:556)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 714*fem,
                              height: 177*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  color: Color(0xff0063ff),
                                  borderRadius: BorderRadius.only (
                                    topRight: Radius.circular(50*fem),
                                    bottomLeft: Radius.circular(50*fem),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // nDi4 (31:555)
                          left: 59*fem,
                          top: 45*fem,
                          child: Align(
                            child: SizedBox(
                              width: 677*fem,
                              height: 90*fem,
                              child: Text(
                                'Вам пришло $cntRes писем',
                                style: SafeGoogleFont (
                                  'Vollkorn',
                                  fontSize: 64*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3925*ffem/fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group3hdE (36:5)
                    margin: EdgeInsets.fromLTRB(518*fem, 0*fem, 280*fem, 0*fem),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/moder/chat', arguments: {'name': name, 'password': password});
                      },
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(80*fem, 8*fem, 36*fem, 1*fem),
                        width: double.infinity,
                        decoration: BoxDecoration (
                          color: Color(0xffdc1e82),
                          borderRadius: BorderRadius.only (
                            topLeft: Radius.circular(20*fem),
                            bottomRight: Radius.circular(20*fem),
                          ),
                        ),
                        child: Text(
                          'Просмотреть',
                          style: SafeGoogleFont (
                            'Vollkorn',
                            fontSize: 48*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.3925*ffem/fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
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