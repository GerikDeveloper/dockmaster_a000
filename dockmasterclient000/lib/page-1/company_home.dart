import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:dockmasterclient000/utils.dart';

class Page extends StatefulWidget {
  const Page({super.key, required this.title});
  final String title;
  @override
  State<Page> createState() => PageState();
}

class PageState extends State<Page> {
  late String name;
  late String password;

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
            // YBE (17:374)
            padding: EdgeInsets.fromLTRB(92*fem, 23*fem, 100.5*fem, 133*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // frame1dTa (17:375)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 84*fem),
                  width: double.infinity,
                  height: 82*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // ownerLsn (17:376)
                        margin: EdgeInsets.fromLTRB(0*fem, 17*fem, 18.92*fem, 19*fem),
                        padding: EdgeInsets.fromLTRB(2.18*fem, 0.21*fem, 0.16*fem, 0*fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // b831FUx (17:377)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.8*fem, 0*fem),
                              width: 34.02*fem,
                              height: 46.01*fem,
                              child: Image.asset(
                                'assets/page-1/images/b8-3-1-gbn.png',
                                width: 34.02*fem,
                                height: 46.01*fem,
                              ),
                            ),
                            Container(
                              // xmTJ (17:471)
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
                              // frfond1t28 (17:472)
                              margin: EdgeInsets.fromLTRB(0*fem, 0.05*fem, 0*fem, 0*fem),
                              width: 41.95*fem,
                              height: 41.51*fem,
                              child: Image.asset(
                                'assets/page-1/images/fr-fond-1-TsA.png',
                                width: 41.95*fem,
                                height: 41.51*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // logoB1E (26:16)
                        margin: EdgeInsets.fromLTRB(0*fem, 15*fem, 20*fem, 17*fem),
                        width: 38*fem,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle16tAY (26:17)
                              left: 0*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 38*fem,
                                  height: 50*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/rectangle-16-iaG.png',
                                    width: 38*fem,
                                    height: 50*fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // line5yxg (26:18)
                              left: 4*fem,
                              top: 34.3137207031*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 12*fem,
                                  height: 15.69*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/line-5-Rnc.png',
                                    width: 12*fem,
                                    height: 15.69*fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // proHTa (26:19)
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
                        // proB3A (17:480)
                        margin: EdgeInsets.fromLTRB(0*fem, 9*fem, 135*fem, 0*fem),
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
                        // H6C (17:476)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 42.63*fem, 3*fem),
                        child: Text(
                          'Главная',
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
                        // zmJ (17:477)
                        margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 29.37*fem, 0*fem),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/company/send_doc', arguments: {'name': name, 'password': password});
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            constraints: BoxConstraints (
                              maxWidth: 165*fem,
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
                      ),
                      Container(
                        // autogroupzglc4FN (WeUADjfoHq5q3C8k1yZGLc)
                        margin: EdgeInsets.fromLTRB(0*fem, 8*fem, 2.5*fem, 22*fem),
                        width: 204*fem,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              // nhA (31:329)
                              left: 0*fem,
                              top: 11*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 204*fem,
                                  height: 41*fem,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/company/chat', arguments: {'name': name, 'password': password});
                                    },
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
                              // group148t (31:384)
                              left: 168*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 30*fem,
                                  height: 30*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/group-1.png',
                                    width: 30*fem,
                                    height: 30*fem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // ZrL (17:479)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/company/personal', arguments: {'name': name, 'password': password});
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            constraints: BoxConstraints (
                              maxWidth: 126*fem,
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
                    ],
                  ),
                ),
                Container(
                  // autogroupmxsqS9S (WeU9kLHnvrgEqN8uHxmxSQ)
                  margin: EdgeInsets.fromLTRB(8*fem, 0*fem, 18.5*fem, 0*fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // autogroupehjakfv (WeU9rfSaVjS7vjyhTKEHja)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 113*fem, 0*fem),
                        width: 558*fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroupkeeptXE (WeU9wfJFXGM5XWhGqxkEep)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 38*fem),
                              padding: EdgeInsets.fromLTRB(45*fem, 61*fem, 21*fem, 51*fem),
                              width: double.infinity,
                              height: 335*fem,
                              decoration: BoxDecoration (
                                color: Color(0xff0063ff),
                                borderRadius: BorderRadius.only (
                                  topRight: Radius.circular(30*fem),
                                ),
                              ),
                              child: Center(
                                // n6p (17:483)
                                child: SizedBox(
                                  child: Container(
                                    constraints: BoxConstraints (
                                      maxWidth: 492*fem,
                                    ),
                                    child: Text(
                                      'Новый сайт, который позволит быстро и без проблем отправить или посмотреть файлы',
                                      style: SafeGoogleFont (
                                        'Vollkorn',
                                        fontSize: 40*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.3925*ffem/fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              // dNL (17:484)
                              onPressed: () {
                                Navigator.pushNamed(context, '/company/send_doc', arguments: {'name': name, 'password': password});
                              },
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 100*fem,
                                decoration: BoxDecoration (
                                  color: Color(0xff5c98f2),
                                  borderRadius: BorderRadius.only (
                                    bottomLeft: Radius.circular(20*fem),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Отправить документы',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (
                                      'Vollkorn',
                                      fontSize: 29*ffem,
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
                        // 6Fv (17:490)
                        width: 550*fem,
                        height: 478*fem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only (
                            topRight: Radius.circular(50*fem),
                            bottomLeft: Radius.circular(49.9500007629*fem),
                          ),
                          child: Image.asset(
                            'assets/page-1/images/-RXr.png',
                          ),
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