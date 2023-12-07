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
            // g7e (1:2)
            padding: EdgeInsets.fromLTRB(94*fem, 44*fem, 119*fem, 104.12*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // frame1hwr (3:3)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 73.41*fem, 95*fem),
                  height: 50*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // ownerzvx (17:689)
                        margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 29.92*fem, 3*fem),
                        padding: EdgeInsets.fromLTRB(2.18*fem, 0.21*fem, 0.16*fem, 0*fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // b831gYt (17:690)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.8*fem, 0*fem),
                              width: 34.02*fem,
                              height: 46.01*fem,
                              child: Image.asset(
                                'assets/page-1/images/b8-3-1-zEg.png',
                                width: 34.02*fem,
                                height: 46.01*fem,
                              ),
                            ),
                            Container(
                              // xr5z (17:784)
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
                              // frfond1j9n (17:785)
                              margin: EdgeInsets.fromLTRB(0*fem, 0.05*fem, 0*fem, 0*fem),
                              width: 41.95*fem,
                              height: 41.51*fem,
                              child: Image.asset(
                                'assets/page-1/images/fr-fond-1-y4Q.png',
                                width: 41.95*fem,
                                height: 41.51*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // logocjN (26:3)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                        width: 38*fem,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle16YN8 (26:4)
                              left: 0*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 38*fem,
                                  height: 50*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/rectangle-16-6E8.png',
                                    width: 38*fem,
                                    height: 50*fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // line5EVr (26:5)
                              left: 4*fem,
                              top: 34.3136901855*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 12*fem,
                                  height: 15.69*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/line-5.png',
                                    width: 12*fem,
                                    height: 15.69*fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // proLYt (26:6)
                              left: 7*fem,
                              top: 13.7254943848*fem,
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
                        // proXNU (6:258)
                        margin: EdgeInsets.fromLTRB(0*fem, 9*fem, 130*fem, 0*fem),
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
                        // topbtnsp6g (6:260)
                        margin: EdgeInsets.fromLTRB(0*fem, 2.79*fem, 0*fem, 6.21*fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vfW (6:249)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 40.63*fem, 0*fem),
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
                                    fontWeight: FontWeight.w700,
                                    height: 1.3925*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // Qqa (6:250)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 50.97*fem, 0*fem),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/about');
                                },
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  'О нас',
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
                              // unL (6:253)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 29*fem, 0*fem),
                              child: TextButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Авторизуйтесь для просмотра')));
                                  Navigator.pushNamed(context, '/login');
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
                            TextButton(
                              // cRr (6:248)
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                'Вход',
                                style: SafeGoogleFont (
                                  'Vollkorn',
                                  fontSize: 29*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3925*ffem/fem,
                                  color: Color(0xff000000),
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
                  // autogroupjtrcwDE (WeTvbsruGEyKY93JZ9JTrc)
                  margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 0*fem, 0*fem),
                  width: double.infinity,
                  height: 506.88*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // autogroupmx2gFUp (WeTvnd3zsSLP5PyteLMx2g)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 113*fem, 0*fem),
                        width: 558*fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroupuvhwmCG (WeTvtNPRT6nV1tCuLsuVHW)
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
                                // pgL (6:255)
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
                              // autogroupw8dz4qa (WeTwUX5BoF2NH9mfqxw8Dz)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.17*fem, 0*fem),
                              width: double.infinity,
                              height: 133.88*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // b4p (11:439)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37*fem, 0*fem),
                                    child: TextButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Авторизуйтесь для отправки')));
                                        Navigator.pushNamed(context, '/login');
                                      },
                                      style: TextButton.styleFrom (
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        width: 250*fem,
                                        height: double.infinity,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // rectangle2gMA (6:261)
                                              left: 0*fem,
                                              top: 0*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 250*fem,
                                                  height: 100*fem,
                                                  child: Container(
                                                    decoration: BoxDecoration (
                                                      color: Color(0xff5c98f2),
                                                      borderRadius: BorderRadius.only (
                                                        bottomLeft: Radius.circular(20*fem),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // z6x (6:407)
                                              left: 49.2125549316*fem,
                                              top: 11.881187439*fem,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    // Emz (11:440)
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Авторизуйтесь для просмотра')));
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    style: TextButton.styleFrom (
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(35.13*fem, 11*fem, 28.7*fem, 8*fem),
                                      width: 270.83*fem,
                                      height: 100*fem,
                                      decoration: BoxDecoration (
                                        color: Color(0xff5c98f2),
                                      ),
                                      child: Center(
                                        // Lq2 (6:408)
                                        child: SizedBox(
                                          child: Container(
                                            constraints: BoxConstraints (
                                              maxWidth: 207*fem,
                                            ),
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // RLg (12:12)
                        width: 550*fem,
                        height: 478*fem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only (
                            topRight: Radius.circular(50*fem),
                            bottomLeft: Radius.circular(49.9500007629*fem),
                          ),
                          child: Image.asset(
                            'assets/page-1/images/-DHN.png',
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