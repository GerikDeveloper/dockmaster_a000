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
            // 5nL (33:565)
            padding: EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 198*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // frame11AC (33:566)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 57*fem),
                  padding: EdgeInsets.fromLTRB(92*fem, 36*fem, 105*fem, 0*fem),
                  width: 1440*fem,
                  height: 125*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        // ownergGL (33:572)
                        margin: EdgeInsets.fromLTRB(0*fem, 23*fem, 18.92*fem, 20*fem),
                        padding: EdgeInsets.fromLTRB(2.18*fem, 0.21*fem, 0.16*fem, 0*fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // b831z28 (33:573)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.8*fem, 0*fem),
                              width: 34.02*fem,
                              height: 46.01*fem,
                              child: Image.asset(
                                'assets/page-1/images/b8-3-1-Bet.png',
                                width: 34.02*fem,
                                height: 46.01*fem,
                              ),
                            ),
                            Container(
                              // xVja (33:667)
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
                              // frfond1Pa4 (33:668)
                              margin: EdgeInsets.fromLTRB(0*fem, 0.05*fem, 0*fem, 0*fem),
                              width: 41.95*fem,
                              height: 41.51*fem,
                              child: Image.asset(
                                'assets/page-1/images/fr-fond-1-UQk.png',
                                width: 41.95*fem,
                                height: 41.51*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // logohKr (33:671)
                        margin: EdgeInsets.fromLTRB(0*fem, 23*fem, 20*fem, 16*fem),
                        width: 38*fem,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle162d2 (33:672)
                              left: 0*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 38*fem,
                                  height: 50*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/rectangle-16-Gax.png',
                                    width: 38*fem,
                                    height: 50*fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // line5wzt (33:673)
                              left: 4*fem,
                              top: 34.3137207031*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 12*fem,
                                  height: 15.69*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/line-5-9oJ.png',
                                    width: 12*fem,
                                    height: 15.69*fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // proG1a (33:674)
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
                        // proMYp (33:571)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 142*fem, 17*fem),
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
                        onPressed: (){
                          Navigator.pushNamed(context, '/moder/', arguments: {'name': name, 'password': password});
                        },
                        child: Container(
                          // EsW (33:567)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 26*fem, 23*fem),
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
                        onPressed: () {
                          Navigator.pushNamed(context, '/moder/chat', arguments: {'name': name, 'password': password});
                        },
                        child: Container(
                          // kax (33:568)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17*fem, 8*fem),
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
                      Container(
                        // autogroupd6fnpap (WeU9CrCFfQ8CZJpaLHd6Fn)
                        margin: EdgeInsets.fromLTRB(0*fem, 12*fem, 8*fem, 23*fem),
                        width: 210*fem,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              // Y12 (33:569)
                              left: 0*fem,
                              top: 13*fem,
                              child: Align(
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, '/moder/send_doc', arguments: {'name': name, 'password': password});
                                  },
                                  child: SizedBox(
                                    width: 204*fem,
                                    height: 41*fem,
                                    child: Text(
                                      'Рассылка',
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
                              // ellipse7doA (33:675)
                              left: 180*fem,
                              top: 0*fem,
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
                              // ellipse8Y9S (33:676)
                              left: 192.5*fem,
                              top: 19*fem,
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
                              // line747n (33:677)
                              left: 194.9999993443*fem,
                              top: 7*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 0*fem,
                                  height: 7.5*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/line-7-2T6.png',
                                    width: 0*fem,
                                    height: 7.5*fem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Container(
                          // ykY (33:570)
                          constraints: BoxConstraints (
                            maxWidth: 111*fem,
                          ),
                          child: Text(
                            'Личный кабинет',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Vollkorn',
                              fontSize: 29*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.3925*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupxifehgY (WeU8r7Hp18wDpWSqToXiFE)
                  margin: EdgeInsets.fromLTRB(92*fem, 0*fem, 209*fem, 0*fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // autogroupirclEAg (WeU8wMe4t3hECWztd5ircL)
                        margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 69*fem, 0*fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // image18y8G (36:6)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                              width: 322*fem,
                              height: 340*fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only (
                                  topLeft: Radius.circular(50*fem),
                                  bottomRight: Radius.circular(50*fem),
                                ),
                                child: Image.asset(
                                  'assets/page-1/images/image-18.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              // 4Qc (36:8)
                              name,
                              style: SafeGoogleFont (
                                'Vollkorn',
                                fontSize: 29*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3925*ffem/fem,
                                color: Color(0xff000000),
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
    );
  }
}