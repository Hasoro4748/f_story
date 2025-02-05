import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// API 서버의 기본 URL 설정
// 집 API
// 사무실 API 주소
final baseUrl = 'http://192.168.56.1:8080';
// final baseUrl = 'http://192.168.0.36.1:8080';

final dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    // 요청 데이터 형식을 json 형식으로 지정
    contentType: 'application/json; charset=utf-8',
    // 필수! dio는 200상태코드 아니면 무조건 오류로 분류
    // true 설정 : 다른 상태 값도 허용
    validateStatus: (status) => true,
  ),
);

// 중요 데이터 보관소(금고)
// 민감한 데이터를 보관하는 금고 역할
const secureStorage = FlutterSecureStorage();
