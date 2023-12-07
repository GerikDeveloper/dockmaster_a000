import 'package:dockmasterclient000/codes.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:dockmasterclient000/utils.dart';
import 'package:http/http.dart' as http;
import 'package:dockmasterclient000/main.dart';

class Page extends StatefulWidget {
  const Page({super.key, required this.title});
  final String title;
  @override
  State<Page> createState() => PageState();
}

class PageState extends State<Page> {
  var loginCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  String name = '_';
  String password = '_';
  Future<void> login(String name, String password) async {
    http.Response resplin = await http.post(rest_uri, headers: {'exe': 'login', 'name': name, 'password': password, 'mode': 'company'});
    if (resplin.statusCode == ok) {
      _toCmpHome(name, password);
      return;
    } else {
      http.Response resplinmod = await http.post(rest_uri, headers: {'exe': 'login', 'name': name, 'password': password, 'mode': 'moder'});
      if (resplinmod.statusCode == ok) {
        _toModHome(name, password);
        return;
      }
    }
    _failed();
  }

  void _failed() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ошибка авторизации')));
  }

  void _toCmpHome(String name, String password) {
    Navigator.pushNamed(context, '/company/', arguments: {'name': name, 'password': password});
  }

  void _toModHome(String name, String password) {
    Navigator.pushNamed(context, '/moder/', arguments: {'name': name, 'password': password});
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
            // 772 (12:13)
            width: double.infinity,
            height: 800*fem,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Stack(
              children: [
                Positioned(
                  // frame1dLG (12:14)
                  left: 93*fem,
                  top: 27*fem,
                  child: Container(
                    width: 1220.83*fem,
                    height: 71*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // ownerju6 (12:15)
                          padding: EdgeInsets.fromLTRB(3.36*fem, 0.32*fem, 0.25*fem, 0*fem),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // b831Ge8 (12:16)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22.92*fem, 0*fem),
                                width: 52.51*fem,
                                height: 71.02*fem,
                                child: Image.asset(
                                  'assets/page-1/images/b8-3-1.png',
                                  width: 52.51*fem,
                                  height: 71.02*fem,
                                ),
                              ),
                              Container(
                                // xNx4 (12:110)
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
                                // frfond1GGk (12:111)
                                margin: EdgeInsets.fromLTRB(0*fem, 3.34*fem, 0*fem, 3.26*fem),
                                padding: EdgeInsets.fromLTRB(0*fem, 12.99*fem, 0*fem, 12.66*fem),
                                width: 64.74*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  image: DecorationImage (
                                    fit: BoxFit.cover,
                                    image: AssetImage (
                                      'assets/page-1/images/vector-zMr.png',
                                    ),
                                  ),
                                ),
                                child: Align(
                                  // vectorZFr (12:113)
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: 39.18*fem,
                                    height: 38.43*fem,
                                    child: Image.asset(
                                      'assets/page-1/images/vector-fJC.png',
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
                          // autogroupust8gbN (WeUBAxanS4yRQurZ5iust8)
                          padding: EdgeInsets.fromLTRB(31*fem, 15*fem, 0*fem, 5*fem),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // logoQ1a (26:7)
                                margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 30*fem, 0*fem),
                                width: 38*fem,
                                height: 50*fem,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle16vkc (26:8)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 38*fem,
                                          height: 50*fem,
                                          child: Image.asset(
                                            'assets/page-1/images/rectangle-16-Nqr.png',
                                            width: 38*fem,
                                            height: 50*fem,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // line5qcg (26:9)
                                      left: 4*fem,
                                      top: 34.3136901855*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 12*fem,
                                          height: 15.69*fem,
                                          child: Image.asset(
                                            'assets/page-1/images/line-5-RPJ.png',
                                            width: 12*fem,
                                            height: 15.69*fem,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // proML8 (26:10)
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
                                // proFRW (12:119)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 97*fem, 0*fem),
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
                                // topbtnskdA (12:114)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // VKr (12:116)
                                      margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 48.32*fem, 0*fem),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/');
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
                                      // vRA (12:117)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 59.98*fem, 3*fem),
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
                                      // MWU (12:118)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 28.53*fem, 3*fem),
                                      child: TextButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Авторизуйтесь для просмотра')));
                                          Navigator.pushNamed(context, '/login');
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
                                    Container(
                                      // TJc (12:115)
                                      margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                                      child: Text(
                                        'Вход',
                                        style: SafeGoogleFont (
                                          'Vollkorn',
                                          fontSize: 29*ffem,
                                          fontWeight: FontWeight.w800,
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
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // autogroupuxvkNgU (WeUAktSZRTB8wbfmHUUXvk)
                  left: 506*fem,
                  top: 281*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(28*fem, 20*fem, 14*fem, 6*fem),
                    width: 428*fem,
                    height: 57*fem,
                    decoration: BoxDecoration (
                      color: Color(0xff0063ff),
                      borderRadius: BorderRadius.circular(10*fem),
                    ),
                    child: TextFormField(
                      controller: loginCtrl,
                      style: SafeGoogleFont (
                        'Vollkorn',
                        fontSize: 29*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3925*ffem/fem,
                        color: Color(0xffa8e7ff),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Login',
                        hintStyle: SafeGoogleFont (
                          'Vollkorn',
                          fontSize: 29*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.3925*ffem/fem,
                          color: Color(0xffa8e7ff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // autogroupvsdvcap (WeUAsDbLzKw22yWZSpvsDv)
                  left: 506*fem,
                  top: 353*fem,
                  child: Container(
                    width: 428*fem,
                    height: 94*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle5w7J (14:133)
                          left: 0*fem,
                          top: 37*fem,
                          child: Align(
                            child: SizedBox(
                              width: 428*fem,
                              height: 57*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(10*fem),
                                  color: Color(0xff0063ff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // textF7z (14:134)
                          left: 14*fem,
                          top: 47*fem,
                          child: Align(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(14*fem, 10*fem, 14*fem, 6*fem),
                              width: 428*fem,
                              height: 57*fem,
                              child: TextFormField(
                                controller: passwordCtrl,
                                style: SafeGoogleFont (
                                  'Vollkorn',
                                  fontSize: 29*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3925*ffem/fem,
                                  color: Color(0xffa8e7ff),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: SafeGoogleFont (
                                    'Vollkorn',
                                    fontSize: 29*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3925*ffem/fem,
                                    color: Color(0xffa8e7ff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // kKe (14:136)
                          left: 9*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 112*fem,
                              height: 41*fem,
                              child: Text(
                                'Пароль',
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
                ),
                Positioned(
                  // 3Ze (14:135)
                  left: 515*fem,
                  top: 234*fem,
                  child: Align(
                    child: SizedBox(
                      width: 93*fem,
                      height: 41*fem,
                      child: Text(
                        'Логин',
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
                Positioned(
                  // YmJ (14:138)
                  left: 437*fem,
                  top: 579.5*fem,
                  child: Center(
                    child: Align(
                      child: SizedBox(
                        width: 570*fem,
                        height: 67*fem,
                        child: Text(
                          'Еще не зарегистрированы? \nСвяжитесь с нами чтобы зарегистрироваться',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Vollkorn',
                            fontSize: 24*ffem,
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
                  // autogroupjbqpnfe (WeUAz3jJFxNzgq2K9SjbQp)
                  left: 613*fem,
                  top: 485*fem,
                  child: TextButton(
                    onPressed: () {
                      login(loginCtrl.text, passwordCtrl.text);
                    },
                    child: Container(
                      width: 214*fem,
                      height: 68*fem,
                      decoration: BoxDecoration (
                        color: Color(0xffdc1e82),
                        borderRadius: BorderRadius.circular(21*fem),
                      ),
                      child: Center(
                        child: Center(
                          child: Text(
                            'Вход',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Vollkorn',
                              fontSize: 40*ffem,
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
        ),
      ),
    );
  }
}