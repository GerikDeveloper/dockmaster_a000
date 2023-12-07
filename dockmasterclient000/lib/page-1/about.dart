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
            // UPv (26:32)
            padding: EdgeInsets.fromLTRB(28*fem, 27*fem, 51*fem, 54*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // frame1UoE (26:33)
                  margin: EdgeInsets.fromLTRB(65*fem, 0*fem, 101*fem, 41*fem),
                  width: double.infinity,
                  height: 71*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // ownerPfJ (26:34)
                        padding: EdgeInsets.fromLTRB(3.36*fem, 0.32*fem, 0.25*fem, 0*fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // b831K3A (26:35)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22.92*fem, 0*fem),
                              width: 52.51*fem,
                              height: 71.02*fem,
                              child: Image.asset(
                                'assets/page-1/images/b8-3-1-J4L.png',
                                width: 52.51*fem,
                                height: 71.02*fem,
                              ),
                            ),
                            Container(
                              // xd3r (26:129)
                              margin: EdgeInsets.fromLTRB(0*fem, 16.53*fem, 10.21*fem, 0*fem),
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
                              // frfond1Xf2 (26:130)
                              margin: EdgeInsets.fromLTRB(0*fem, 3.34*fem, 0*fem, 3.26*fem),
                              padding: EdgeInsets.fromLTRB(0*fem, 12.99*fem, 0*fem, 12.66*fem),
                              width: 64.74*fem,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                image: DecorationImage (
                                  fit: BoxFit.cover,
                                  image: AssetImage (
                                    'assets/page-1/images/vector-9yn.png',
                                  ),
                                ),
                              ),
                              child: Align(
                                // vectorE3e (26:132)
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: 39.18*fem,
                                  height: 38.43*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/vector.png',
                                    width: 39.18*fem,
                                    height: 38.43*fem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupdvg4Z5v (WeUCQLhWdLDStixfF2dvG4)
                        padding: EdgeInsets.fromLTRB(31*fem, 16*fem, 0*fem, 5*fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // logogAY (26:139)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 30*fem, 0*fem),
                              width: 38*fem,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // rectangle164B6 (26:140)
                                    left: 0*fem,
                                    top: 0*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 38*fem,
                                        height: 50*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/rectangle-16-Ktg.png',
                                          width: 38*fem,
                                          height: 50*fem,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // line59iL (26:141)
                                    left: 4*fem,
                                    top: 34.3136901855*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 12*fem,
                                        height: 15.69*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/line-5-E6Q.png',
                                          width: 12*fem,
                                          height: 15.69*fem,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // proFFa (26:142)
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
                              // proLXv (26:138)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 94*fem, 1*fem),
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
                              // topbtnsphz (26:133)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: (){
                                          Navigator.pushNamed(context, '/');
                                        },
                                        child: Container(
                                          // Kue (26:135)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 46*fem, 0*fem),
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
                                          Navigator.pushNamed(context, '/about');
                                        },
                                        child: Container(
                                          // FHW (26:136)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 42*fem, 0*fem),
                                          child: Text(
                                            'О нас',
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
                                        // BBA (26:137)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 30*fem, 0*fem),
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
                                        // tLU (26:134)
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupyycqpE8 (WeUBzmYTKU7FytSpz3YyCQ)
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // image17NFe (36:3)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 36*fem, 0*fem),
                        width: 575*fem,
                        height: 607*fem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only (
                            topLeft: Radius.circular(50*fem),
                            bottomRight: Radius.circular(50*fem),
                          ),
                          child: Image.asset(
                            'assets/page-1/images/image-17.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        // autogroup6wtefkY (WeUC6Wssu8ZMvNfqgb6WTE)
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // procfn (36:4)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 14*fem),
                              child: Text(
                                'ProДокументы',
                                style: SafeGoogleFont (
                                  'Vollkorn',
                                  fontSize: 76*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3925*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                            Container(
                              // ttC (26:151)
                              constraints: BoxConstraints (
                                maxWidth: 750*fem,
                              ),
                              child: Text(
                                'Наш веб-сервис предлагает эффективное и безопасное решение для сбора, модерации и сортировки документов, а также напоминания клиентов в заданную дату. Мы обеспечиваем высокую степень автоматизации процессов, что позволяет сэкономить время и снизить риски ошибок при работе с большими объемами документации. Наша технология гарантирует надежную защиту конфиденциальности и безопасность хранения данных, а также обеспечивает удобный доступ к документам в любое время и из любой точки мира. ',
                                style: SafeGoogleFont (
                                  'Vollkorn',
                                  fontSize: 28*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5*ffem/fem,
                                  letterSpacing: -0.6160000134*fem,
                                  color: Color(0xff1e1e1e),
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
    );
  }
}