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
            // 2t4 (17:257)
            padding: EdgeInsets.fromLTRB(94*fem, 35*fem, 99*fem, 104.12*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // frame1WYL (17:258)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 66*fem),
                  width: double.infinity,
                  height: 88*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // ownerzyJ (17:491)
                        margin: EdgeInsets.fromLTRB(0*fem, 23*fem, 24.92*fem, 19*fem),
                        padding: EdgeInsets.fromLTRB(2.18*fem, 0.21*fem, 0.16*fem, 0*fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // b831WAx (17:492)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.8*fem, 0*fem),
                              width: 34.02*fem,
                              height: 46.01*fem,
                              child: Image.asset(
                                'assets/page-1/images/b8-3-1-VY8.png',
                                width: 34.02*fem,
                                height: 46.01*fem,
                              ),
                            ),
                            Container(
                              // xDLG (17:586)
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
                              // frfond1WaG (17:587)
                              margin: EdgeInsets.fromLTRB(0*fem, 0.05*fem, 0*fem, 0*fem),
                              width: 41.95*fem,
                              height: 41.51*fem,
                              child: Image.asset(
                                'assets/page-1/images/fr-fond-1-7Ek.png',
                                width: 41.95*fem,
                                height: 41.51*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // logo22p (26:12)
                        margin: EdgeInsets.fromLTRB(0*fem, 21*fem, 14*fem, 17*fem),
                        width: 38*fem,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle16YWx (26:13)
                              left: 0*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 38*fem,
                                  height: 50*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/rectangle-16.png',
                                    width: 38*fem,
                                    height: 50*fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // line5dHW (26:14)
                              left: 4*fem,
                              top: 34.3137207031*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 12*fem,
                                  height: 15.69*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/line-5-3nL.png',
                                    width: 12*fem,
                                    height: 15.69*fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // projLY (26:15)
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
                        // procfE (17:363)
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
                      TextButton(
                        child: Container(
                          // 7rt (17:359)
                          margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 44*fem, 0*fem),
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
                        onPressed: (){
                          Navigator.pushNamed(context, '/moder/', arguments: {'name': name, 'password': password});
                        },
                      ),
                      Container(
                        // 2yr (17:360)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 31*fem, 7*fem),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/moder/chat', arguments: {'name': name, 'password': password});
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            constraints: BoxConstraints (
                              maxWidth: 173*fem,
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
                        // autogroupuekc5BS (WeTyEoU6GkWet8aKW8uEkC)
                        margin: EdgeInsets.fromLTRB(0*fem, 7*fem, 0*fem, 0*fem),
                        width: 314*fem,
                        height: 81*fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // nrY (17:361)
                              left: 0*fem,
                              top: 18*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 204*fem,
                                  height: 41*fem,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/moder/summary', arguments: {'name': name, 'password': password});
                                    },
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
                              // UzG (17:362)
                              left: 195*fem,
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
                              // group1xPe (31:388)
                              left: 164*fem,
                              top: 9*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 30*fem,
                                  height: 30*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/group-1-sfa.png',
                                    width: 30*fem,
                                    height: 30*fem,
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
                  // autogrouptteqTbJ (WeTxWA2UyoX96kbGqYtteQ)
                  margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 20*fem, 0*fem),
                  width: double.infinity,
                  height: 506.88*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // autogroupvcaqyZe (WeTxdQKQfj3XifqA9tVcaQ)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 113*fem, 0*fem),
                        width: 558*fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroup8mntVH6 (WeTxiZqUGBBrWGSPPd8Mnt)
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
                                // n1J (17:366)
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
                            Container(
                              // autogroupb82xRKA (WeTxn4jeBT2XRc96AUb82x)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.17*fem, 0*fem),
                              width: double.infinity,
                              height: 133.88*fem,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // MCp (17:369)
                                    left: 49.2125244141*fem,
                                    top: 11.8811645508*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 148*fem,
                                        height: 122*fem,
                                        child: Text(
                                          'Отправить документы',
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
                                  Positioned(
                                    // qdn (17:370)
                                    left: 0*fem,
                                    top: 0*fem,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom (
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        width: 557.83*fem,
                                        height: 100*fem,
                                        decoration: BoxDecoration (
                                          color: Color(0xff5c98f2),
                                          borderRadius: BorderRadius.only (
                                            bottomLeft: Radius.circular(20*fem),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Просмотреть документы',
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // fsi (17:373)
                        width: 550*fem,
                        height: 478*fem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only (
                            topRight: Radius.circular(50*fem),
                            bottomLeft: Radius.circular(49.9500007629*fem),
                          ),
                          child: Image.asset(
                            'assets/page-1/images/-eXN.png',
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