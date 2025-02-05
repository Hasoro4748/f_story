import 'package:class_f_story/_core/utils/exception_handler.dart';
import 'package:class_f_story/_core/utils/my_http.dart';
import 'package:class_f_story/data/gvm/session_gvm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class SplashPage extends ConsumerStatefulWidget {
//   const SplashPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     //한번도 로그인을 안했을시 2초간 gif 보여줌
//     // 로그인 토큰이 있다면 바로 페이지 이동
//     ref.read(sessionProvider.notifier).autoLogin();
//     return Scaffold(
//       body: Center(
//         child: Image.asset(
//           'assets/splash.gif',
//           width: double.infinity,
//           height: double.infinity,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
//
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() {
//     throw UnimplementedError();
//   }
// }

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  // 로근인 상태 확인 후 자동 로그인 시도 또는 로그인 페이지 이동 처리
  // 1. 토큰 추출
  // 2. 토큰 유무 확인( 없다면 --> 로그인 페이지 이동 처리)
  Future<void> _checkLoginStates() async {
    try {
      String? accessToken = await secureStorage.read(key: 'accessToken');
      if (accessToken == null) {
        // 화면 이동 처리
        _navigateToLogin();
        return;
      }
      SessionGVM sessionGVM = ref.read(sessionProvider.notifier);
      await sessionGVM.autoLogin();
    } catch (e, stackTrace) {
      ExceptionHandler.handleException('자동 로그인 중 오류 발생', stackTrace);
      _navigateToLogin();
    }
  }

  // 로그인 페이지 이동하는 메서드
  void _navigateToLogin() {
    Future.delayed(const Duration(seconds: 2), () {
      // mounted --> StatefulWidget이 가지고 있다.
      // 네비게이션 이동시 mounted를 확인하는 이유
      // 1. 사용자가 2초 대기중에 다른 페이지로 이동하면 이 위젯이 dispose 될 수 있다.
      // 2. dispose 된 위젯을 setState()
      if (mounted) {}
      Navigator.popAndPushNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/splash.gif',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
