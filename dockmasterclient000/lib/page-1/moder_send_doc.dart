import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:dockmasterclient000/utils.dart';
import 'package:drop_zone/drop_zone.dart';
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
  bool loaded = false;

  Future<void> send_file(File file) async {
    try {
      final reader = FileReader();
      reader.readAsArrayBuffer(file);
      await reader.onLoad.first;
      Uint8List data = reader.result as Uint8List;
      http.Response resp = await http.post(rest_uri, headers: {'exe': 'sdd'}, body: data);
      if (resp.statusCode == ok) {
        loaded = true;
        setState(() {});
      }
    } catch (_) {
    }
  }

  @override
  void initState() {
    super.initState();
    Object? map = ModalRoute
        .of(context)
        ?.settings
        .arguments;
    if (map != null) {
      Map<String, String> args = map as Map<String, String>;
      if (args.containsKey('name') && args.containsKey('password')) {
        String? nm = args.remove('name');
        String? ps = args.remove('password');
        if (ps != null && nm != null) {
          name = nm;
          password = ps;
          return;
        }
      }
    }
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 1440;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;
    if (loaded) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Файл отправлен')));
      loaded = false;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child:
          Container(
            width: double.infinity,
            child: Container(
// frame2QyS (17:788)
              padding: EdgeInsets.fromLTRB(
                  0 * fem, 0 * fem, 0 * fem, 113 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
// frame2Ypk (17:789)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 33 * fem),
                    padding: EdgeInsets.fromLTRB(
                        92 * fem, 23 * fem, 100.5 * fem, 0 * fem),
                    width: double.infinity,
                    height: 125 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
// ownerESg (17:790)
                          margin: EdgeInsets.fromLTRB(0 * fem, 17 * fem,
                              18.92 * fem, 39 * fem),
                          padding: EdgeInsets.fromLTRB(2.18 * fem, 0.21 * fem,
                              0.16 * fem, 0 * fem),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
// b831Xgg (17:791)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 9.8 * fem, 0 * fem),
                                width: 34.02 * fem,
                                height: 46.01 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/b8-3-1-SDi.png',
                                  width: 34.02 * fem,
                                  height: 46.01 * fem,
                                ),
                              ),
                              Container(
// xqhN (17:885)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 5.79 * fem, 4.97 * fem, 0 * fem),
                                child: Text(
                                  'X',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 29 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
// frfond1xGC (17:886)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0.05 * fem, 0 * fem, 0 * fem),
                                width: 41.95 * fem,
                                height: 41.51 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/fr-fond-1-wpx.png',
                                  width: 41.95 * fem,
                                  height: 41.51 * fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
// logoG1z (26:20)
                          margin: EdgeInsets.fromLTRB(0 * fem, 15 * fem,
                              20 * fem, 37 * fem),
                          width: 38 * fem,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
// rectangle16ywz (26:21)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 38 * fem,
                                    height: 50 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-16-acU.png',
                                      width: 38 * fem,
                                      height: 50 * fem,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
// line5grQ (26:22)
                                left: 4 * fem,
                                top: 34.3137207031 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 12 * fem,
                                    height: 15.69 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/line-5-sZn.png',
                                      width: 12 * fem,
                                      height: 15.69 * fem,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
// proQGc (26:23)
                                left: 7 * fem,
                                top: 13.7254638672 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 23 * fem,
                                    height: 21 * fem,
                                    child: Text(
                                      'Pro',
                                      style: SafeGoogleFont(
                                        'Vollkorn',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3925 * ffem / fem,
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
// proVor (17:893)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem,
                              135 * fem, 11 * fem),
                          child: Text(
                            'ProДокументы',
                            style: SafeGoogleFont(
                              'Vollkorn',
                              fontSize: 29 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3925 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
// oZe (17:889)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem,
                              50.13 * fem, 23 * fem),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/moder/', arguments: {'name': name, 'password': password});
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              'Главная',
                              style: SafeGoogleFont(
                                'Vollkorn',
                                fontSize: 29 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3925 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/moder/chat', arguments: {'name': name, 'password': password});
                          },
                          child: Container(
                            // JFW (17:890)
                            margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem,
                                28.87 * fem, 0 * fem),
                            constraints: BoxConstraints(
                              maxWidth: 170 * fem,
                            ),
                            child: Text(
                              'Пришедшие файлы',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Vollkorn',
                                fontSize: 29 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3925 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
// autogroupbcc4B4Q (WeUG9jTHH1w9UG9CjAbcC4)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem,
                              0.5 * fem, 32 * fem),
                          width: 204 * fem,
                          height: 50 * fem,
                          child: Stack(
                            children: [
                              Positioned(
// HdE (17:891)
                                left: 0 * fem,
                                top: 9 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 204 * fem,
                                    height: 41 * fem,
                                    child: TextButton(
                                      onPressed: () {

                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Text(
                                        'Рассылка',
                                        style: SafeGoogleFont(
                                          'Vollkorn',
                                          fontSize: 29 * ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.3925 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
// group1iyS (31:383)
                                left: 170 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 30 * fem,
                                    height: 30 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/group-1-78p.png',
                                      width: 30 * fem,
                                      height: 30 * fem,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
// 1xY (17:892)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem,
                              21 * fem),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/moder/personal', arguments: {'name': name, 'password': password});
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 126 * fem,
                              ),
                              child: Text(
                                'Личный кабинет',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Vollkorn',
                                  fontSize: 29 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3925 * ffem / fem,
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
// autogroupgtv2HQG (WeUFNWFeBqsUJ5rYSiGtV2)
                    margin: EdgeInsets.fromLTRB(
                        206 * fem, 0 * fem, 206 * fem, 0 * fem),
                    width: double.infinity,
                    height: 529 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropZone(
                          onDrop: (List<File>? files) {
                            if (files != null) {
                              if (files.isNotEmpty) {
                                send_file(files[0]);
                              }
                            }
                          },
                          child: Container(
// autogroupapggcSY (WeUFXapr7rvsy5tc52APgg)
                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem,
                                59 * fem, 0 * fem),
                            padding: EdgeInsets.fromLTRB(130.5 * fem, 139 * fem,
                                124.5 * fem, 111 * fem),
                            width: 529 * fem,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffe7f2ff),
                              borderRadius: BorderRadius.circular(50 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // J4U (17:901)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 5 * fem, 70 * fem),
                                  width: 130 * fem,
                                  height: 168 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/-jh6.png',
                                    width: 130 * fem,
                                    height: 168 * fem,
                                  ),
                                ),
                                Text(
                                  // pdfzxt (17:902)
                                  'Вставьте pdf файл',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Vollkorn',
                                    fontSize: 29 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3925 * ffem / fem,
                                    color: Color(0xff0063ff),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
// autogroupqiix83W (WeUFeL8c72mB2XTXr6Qiix)
                          width: 440 * fem,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
// image16GQc (17:906)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 15 * fem),
                                width: 440 * fem,
                                height: 404 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/image-16.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
// autogrouph53ibBz (WeUFizfVzjDQFePoYZh53i)
                                width: double.infinity,
                                height: 110 * fem,
                                decoration: BoxDecoration(
                                  color: Color(0xffdc1e82),
                                  borderRadius: BorderRadius.circular(20 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'Отправить документы',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Vollkorn',
                                      fontSize: 40 * ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.3925 * ffem / fem,
                                      color: Color(0xffffffff),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}