import 'package:class_f_story/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/pages/auth/join_page/join_page.dart';
import 'ui/pages/auth/login_page/login_page.dart';
import 'ui/pages/post/list_page/post_list_page.dart';
import 'ui/pages/post/write_page/post_write_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

// 사전 기반 --> Navigator(화면전환을 관리하는 객체) -- stack 구조로 화면을 관리
GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
// 고유 키 생성 (글로벌 키) -> 모든 위젯은 고유값을 식별하기 위해 키를 가질 수 있다.
// 전역 변수로 navigator선언 -> Navigaror관리 상태에 접근이 가능
// 현재 가장 위의 context를 알아낼 수 있다.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // context가 없는 곳에서 context를 사용할 수 있게 하는 방법
      navigatorKey: navigatorkey,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: {
        "/login": (context) => LoginPage(),
        '/join': (context) => JoinPage(),
        '/post/list': (context) => PostListPage(),
        '/post/wrtie': (context) => PostWritePage(),
      },
    );
  }
}
