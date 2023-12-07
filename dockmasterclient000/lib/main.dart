import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:dockmasterclient000/utils.dart';
import 'package:dockmasterclient000/page-1/home.dart' as home;
import 'package:dockmasterclient000/page-1/about.dart' as about;
import 'package:dockmasterclient000/page-1/login.dart' as login;
import 'package:dockmasterclient000/page-1/company_home.dart' as company_home;
import 'package:dockmasterclient000/page-1/company_chat.dart' as company_chat;
import 'package:dockmasterclient000/page-1/company_send_doc.dart' as company_send_doc;
import 'package:dockmasterclient000/page-1/company_personal.dart' as company_personal;
import 'package:dockmasterclient000/page-1/moder_home.dart' as moder_home;
import 'package:dockmasterclient000/page-1/moder_chat.dart' as moder_chat;
import 'package:dockmasterclient000/page-1/moder_personal.dart' as moder_personal;
// import 'package:myapp/page-1/company_chat.dart';
// import 'package:myapp/page-1/moder_chat.dart';
// import 'package:myapp/page-1/-qPr.dart';
// import 'package:myapp/page-1/-z7W.dart';
// import 'package:myapp/page-1/-ZJt.dart';
// import 'package:myapp/page-1/-Tr4.dart';
// import 'package:myapp/page-1/moder_personal.dart';
// import 'package:myapp/page-1/company_home.dart';
// import 'package:myapp/page-1/login.dart';
// import 'package:myapp/page-1/about.dart';
// import 'package:myapp/page-1/moodboard.dart';
// import 'package:myapp/page-1/-Qwe.dart';
// import 'package:myapp/page-1/frame-2.dart';
// import 'package:myapp/page-1/frame-3.dart';

void main() => runApp(MyApp());

Uri rest_uri = Uri.http('127.0.0.1:8080', '/rest');

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		title: 'Flutter',
		debugShowCheckedModeBanner: false,
		scrollBehavior: MyCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: Colors.blue,
		),
		initialRoute: '/',
		routes: {
			'/': (context) => const home.Page(title: 'Home'),
			'/about': (context) => const about.Page(title: 'About us'),
			'/login': (context) => const login.Page(title: 'Login'),
			'/company/': (context) => const company_home.Page(title: 'Home'),
			'/company/chat': (context) => const company_chat.Page(title: 'Chat'),
			'/company/send_doc': (context) => const company_send_doc.Page(title: 'Sending'),
			'/company/personal': (context) => const company_personal.Page(title: 'Personal'),
			'/moder/': (context) => const moder_home.Page(title: 'Home'),
			'/moder/chat': (context) => const moder_chat.Page(title: 'Chat'),
			'/moder/personal': (context) => const moder_personal.Page(title: 'Personal'),
		},
	);
	}
}
