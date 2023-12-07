import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:dockmasterclient000/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 2047;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // frame3RFS (54:1125)
        width: double.infinity,
        height: 952*fem,
        decoration: BoxDecoration (
          color: Color(0xff225fd6),
        ),
        child: Stack(
          children: [
            Positioned(
              // unionjmv (54:1130)
              left: 262*fem,
              top: 278*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(20*fem, 20*fem, 20.48*fem, 86*fem),
                width: 63*fem,
                height: 292*fem,
                decoration: BoxDecoration (
                  border: Border.all(color: Color(0xff9747ff)),
                  borderRadius: BorderRadius.circular(5*fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // property1defaultQ7N (54:1129)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom (
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: 22.52*fem,
                          height: 27*fem,
                          child: Image.asset(
                            'assets/page-1/images/property-1default-f4g.png',
                            width: 22.52*fem,
                            height: 27*fem,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // property1variant2gqa (54:1160)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 63*fem),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom (
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: 22.52*fem,
                          height: 27*fem,
                          child: Image.asset(
                            'assets/page-1/images/property-1variant2-69z.png',
                            width: 22.52*fem,
                            height: 27*fem,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // property1variant4yJt (54:1212)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom (
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: 22.52*fem,
                          height: 27*fem,
                          child: Image.asset(
                            'assets/page-1/images/property-1variant4.png',
                            width: 22.52*fem,
                            height: 27*fem,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      // property1variant5fhW (54:1216)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 22.52*fem,
                        height: 27*fem,
                        child: Image.asset(
                          'assets/page-1/images/property-1variant5-XmW.png',
                          width: 22.52*fem,
                          height: 27*fem,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // unionnn8 (54:1208)
              left: 393*fem,
              top: 328*fem,
              child: Align(
                child: SizedBox(
                  width: 22.52*fem,
                  height: 27*fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Image.asset(
                      'assets/page-1/images/union-XPr.png',
                      width: 22.52*fem,
                      height: 27*fem,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // unionVRe (54:1204)
              left: 393*fem,
              top: 363*fem,
              child: Align(
                child: SizedBox(
                  width: 22.52*fem,
                  height: 27*fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Image.asset(
                      'assets/page-1/images/union-Nmi.png',
                      width: 22.52*fem,
                      height: 27*fem,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // autogroupfzrpZwJ (WeUGpDMAP2AXazrwEYfzrp)
              left: 198*fem,
              top: 296*fem,
              child: Container(
                width: 217.52*fem,
                height: 27*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // uniongm2 (54:1187)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 172.48*fem, 0*fem),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom (
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: 22.52*fem,
                          height: 27*fem,
                          child: Image.asset(
                            'assets/page-1/images/union-jtY.png',
                            width: 22.52*fem,
                            height: 27*fem,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      // unionarQ (54:1191)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 22.52*fem,
                        height: 27*fem,
                        child: Image.asset(
                          'assets/page-1/images/union.png',
                          width: 22.52*fem,
                          height: 27*fem,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // 7LY (54:1259)
              left: 274*fem,
              top: 301*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(813*fem, 23*fem, 292*fem, 185*fem),
                width: 1139*fem,
                height: 462*fem,
                decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(5*fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      // property1defaultBrC (54:1258)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 34*fem,
                        height: 34*fem,
                        child: Image.asset(
                          'assets/page-1/images/property-1default-4FE.png',
                          width: 34*fem,
                          height: 34*fem,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21*fem,
                    ),
                    TextButton(
                      // property1variant2UaQ (54:1260)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 34*fem,
                        height: 34*fem,
                        child: Image.asset(
                          'assets/page-1/images/property-1variant2-1zU.png',
                          width: 34*fem,
                          height: 34*fem,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21*fem,
                    ),
                    TextButton(
                      // property1variant3NQt (54:1302)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 34*fem,
                        height: 34*fem,
                        child: Image.asset(
                          'assets/page-1/images/property-1variant3-Pj2.png',
                          width: 34*fem,
                          height: 34*fem,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21*fem,
                    ),
                    TextButton(
                      // property1variant4gRa (54:1305)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 34*fem,
                        height: 34*fem,
                        child: Image.asset(
                          'assets/page-1/images/property-1variant4-XuW.png',
                          width: 34*fem,
                          height: 34*fem,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21*fem,
                    ),
                    Container(
                      // property1variant5BdE (54:1308)
                      width: 34*fem,
                      height: 34*fem,
                      child: Image.asset(
                        'assets/page-1/images/property-1variant5.png',
                        width: 34*fem,
                        height: 34*fem,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // idA (54:1293)
              left: 123*fem,
              top: 262*fem,
              child: Align(
                child: SizedBox(
                  width: 34*fem,
                  height: 34*fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Image.asset(
                      'assets/page-1/images/-Toa.png',
                      width: 34*fem,
                      height: 34*fem,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // component1nsv (54:1388)
              left: 609*fem,
              top: 137*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(20*fem, 20*fem, 20*fem, 20*fem),
                width: 74*fem,
                height: 239*fem,
                decoration: BoxDecoration (
                  border: Border.all(color: Color(0xff9747ff)),
                  borderRadius: BorderRadius.circular(5*fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      // property1defaultpZi (54:1386)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 34*fem,
                        height: 34*fem,
                        child: Image.asset(
                          'assets/page-1/images/property-1default-1gG.png',
                          width: 34*fem,
                          height: 34*fem,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21*fem,
                    ),
                    TextButton(
                      // property1variant2ur4 (54:1389)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 34*fem,
                        height: 34*fem,
                        child: Image.asset(
                          'assets/page-1/images/property-1variant2.png',
                          width: 34*fem,
                          height: 34*fem,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21*fem,
                    ),
                    TextButton(
                      // property1variant31PJ (54:1409)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 34*fem,
                        height: 34*fem,
                        child: Image.asset(
                          'assets/page-1/images/property-1variant3.png',
                          width: 34*fem,
                          height: 34*fem,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21*fem,
                    ),
                    Container(
                      // property1variant4K96 (54:1416)
                      width: double.infinity,
                      height: 34*fem,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // component2GKE (54:1426)
              left: 609*fem,
              top: 137*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(20*fem, 20*fem, 20*fem, 20*fem),
                width: 74*fem,
                height: 239*fem,
                decoration: BoxDecoration (
                  border: Border.all(color: Color(0xff9747ff)),
                  borderRadius: BorderRadius.circular(5*fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      // property1defaultA9i (54:1427)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 34*fem,
                        height: 34*fem,
                        child: Image.asset(
                          'assets/page-1/images/property-1default.png',
                          width: 34*fem,
                          height: 34*fem,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21*fem,
                    ),
                    TextButton(
                      // property1variant24F6 (54:1431)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 34*fem,
                        height: 34*fem,
                        child: Image.asset(
                          'assets/page-1/images/property-1variant2-Wfn.png',
                          width: 34*fem,
                          height: 34*fem,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21*fem,
                    ),
                    TextButton(
                      // property1variant39GY (54:1438)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 34*fem,
                        height: 34*fem,
                        child: Image.asset(
                          'assets/page-1/images/property-1variant3-Ti4.png',
                          width: 34*fem,
                          height: 34*fem,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21*fem,
                    ),
                    Container(
                      // property1variant43Mv (54:1442)
                      width: double.infinity,
                      height: 34*fem,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}